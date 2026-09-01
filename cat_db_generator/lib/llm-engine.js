/**
 * LLM Generation & Anti-Hallucination Execution Engine (Facade & Orchestrator)
 * Coordinates dynamic model discovery, dual RAG context assembly,
 * API calls with automatic retry/backoff, JSON sanitization, and 8-layer medical validation.
 */

require('dotenv').config();
const { searchLocalPDFs } = require('./pdf-extractor');
const { validateCAT, isAdministrativeCAT } = require('./medical-validator');
const { buildSearchQueries } = require('./medical-sources');
const { fetchAndCacheWebSources, getCachedWebSources, extractSmartKeywords } = require('./web-fetcher');
const { queryClinicalLibrary } = require('./knowledge-library');
const { searchSemanticPDFs } = require('./semantic-rag');
const debugEmitter = require('./debug-emitter');

// Modular sub-services
const { FALLBACK_GEMINI_MODELS, applyModelBlocklist, discoverDynamicModels } = require('./model-registry');
const { safeParseLLMJson } = require('./json-sanitizer');
const { callLLMApi } = require('./gemini-client');
const { MASTER_CAT_SCHEMA, SUB_CAT_SCHEMA } = require('./gemini-schemas');
const {
  getHumanEditMemory,
  composeMasterCATSystemPrompt,
  composeMasterCATUserPrompt
} = require('./prompt-composer');

/**
 * Automated Markdown Sanitizer (Strips dangling **, unclosed tags, cleans headers)
 */
function sanitizeMarkdownText(text) {
  if (!text || typeof text !== 'string') return text;
  let clean = text;
  clean = clean.replace(/(?:^|\n)\s*\*\*\s*(?:\n|$)/g, '\n');
  clean = clean.replace(/\*\*\s*\*\*/g, '');
  clean = clean.replace(/\*\*([^*\n]+):\*(?!\*)/g, '**$1:**');
  clean = clean.replace(/:\*\*\s*:/g, ':**');
  clean = clean.replace(/(?:^|\n)(?:\*\*|#{2,4}\s*)([0-9]+(?:bis|ter)?\.\s*[^:\n*]+)(?:\*\*)?\s*:?\s*(?:\*\*)?\s*:?\s*(?:\n|$)/gi, (m, title) => {
    return '\n\n**' + title.trim() + ' :**\n';
  });
  clean = clean.replace(/\n{3,}/g, '\n\n');
  return clean.trim();
}

/**
 * Generate a complete CAT object using real LLM API synthesis (Dual RAG + Active Learning)
 */
async function generateCATWithLLM(title, category, options = {}) {
  const cleanTitle = title.startsWith('CAT') ? title : `CAT devant ${title}`;
  const catObjPlaceholder = { title: cleanTitle, category: category || 'Gastro-entérologie' };
  const isAdmin = isAdministrativeCAT(catObjPlaceholder);

  // 1. Tier 1: Core Curated Reference Documents (Semantic Vector RAG with Lexical Fallback)
  let pdfMatches = [];
  let ragSnippets = '';
  let pdfKeywords = [];

  try {
    const semanticMatches = await searchSemanticPDFs(cleanTitle, { maxResults: 4, apiKey: options.apiKey });
    if (semanticMatches.length > 0) {
      console.log(`🤖 [Semantic Vector RAG] Found ${semanticMatches.length} high-similarity passages via text-embedding-004!`);
      ragSnippets = semanticMatches.map(m => `[Core Reference (Semantic Score: ${m.score}%): ${m.pdfFile} p.${m.page}]\n${m.snippet}`).join('\n\n');
      pdfKeywords = semanticMatches.map(m => m.pdfFile.replace(/\.pdf$/i, '')).slice(0, 4);
    }
  } catch (_) {}

  if (!ragSnippets) {
    console.log(`🔍 [Tier 1 Core References] Searching pdf_index.json for "${cleanTitle}" (category: ${category})...`);
    pdfMatches = await searchLocalPDFs(cleanTitle, { maxMatchesPerFile: 3, category });
    ragSnippets = pdfMatches.flatMap(p => p.matches.map(m => `[Core Reference: ${p.pdfFile}] ${m.snippet}`)).join('\n');
    pdfKeywords = pdfMatches.map(p => p.pdfFile.replace(/\.pdf$/i, '')).slice(0, 4);
  }

  // 1bis. Tier 2: Standard Clinical Guidelines Library (MSF, HAS, SFMU, Colleges)
  const libraryMatches = queryClinicalLibrary(cleanTitle, options.search_keywords);
  const librarySnippets = libraryMatches.map(l => `[Standard Clinical Library: ${l.source} (${l.file})]\n${l.snippet}`).join('\n\n');

  // 2. Online RAG Web Cache Fetching
  let webSources = options.offlineOnly ? [] : getCachedWebSources(cleanTitle);
  if (!options.offlineOnly && webSources.length === 0 && options.autoFetchWeb !== false) {
    console.log(`🌐 [Online RAG] Step 1: Web cache missing for "${cleanTitle}". Fetching live web sources...`);
    try {
      webSources = await fetchAndCacheWebSources(cleanTitle, { maxSources: 3, customUrls: options.customUrls });
    } catch (e) {
      console.warn(`⚠️ Web fetch fallback error: ${e.message}`);
    }
  }
  const webSnippets = webSources.map(w => `[Web Source: ${w.sourceName} (${w.domain})] ${w.content.substring(0, 1200)}`).join('\n\n');

  // 3. Human Active Learning Memory
  const humanMemory = getHumanEditMemory(cleanTitle);
  debugEmitter.emitEvent('active_learning_checked', {
    title: cleanTitle,
    found: !!humanMemory,
    doctorEdited: humanMemory ? humanMemory._human_edited : false
  });
  const activeLearningText = humanMemory ? `
🧠 MÉMOIRE ET APPRENTISSAGE DES ÉDITIONS MANUELLES DE L'UTILISATEUR (ACTIVE LEARNING) :
L'utilisateur médecin a manuellement validé et édité cette fiche précédemment :
- Titre: ${humanMemory.title}
- Conduite à tenir validée: ${humanMemory.summary}
- Drapeaux rouges validés: ${humanMemory.red_flags}
- Ordonnance validée: ${humanMemory.ordonnance}
DIRECTIVE ABSOLUE : Conserve impérativement les préférences de prescription, la terminologie et les corrections apportées par l'utilisateur, tout en consolidant la fiche avec le Web RAG et le PDF Index.
` : '';

  // 4. Build System & User Prompts
  const systemPrompt = composeMasterCATSystemPrompt(cleanTitle, category, isAdmin, options);
  const userPrompt = composeMasterCATUserPrompt(cleanTitle, category, activeLearningText, webSnippets, ragSnippets, librarySnippets);

  // 4bis. RAG Context Volume Overload Monitor
  const totalRagChars = (ragSnippets || '').length + (librarySnippets || '').length + (webSnippets || '').length;
  const estimatedRagTokens = Math.ceil(totalRagChars / 4);

  if (totalRagChars > 10000) {
    console.warn(`⚠️ [RAG Context Alert] High RAG volume: ${totalRagChars} chars (~${estimatedRagTokens} tokens). Multiple source channels active.`);
    debugEmitter.emitEvent('rag_overload_warning', {
      title: cleanTitle,
      totalRagChars,
      estimatedRagTokens,
      warning: `Volume RAG élevé (${totalRagChars} caractères, ~${estimatedRagTokens} tokens). Vérifier la granularité des slices si la génération est surchargée.`
    });
  }

  // 5. Execution & Automated Anti-Hallucination Validation Checksum Loop (Up to 3 Attempts)
  let attempts = 0;
  const maxAttempts = 3;
  let catResult = null;
  let executionMetrics = null;
  let previousValidationErrors = [];

  debugEmitter.emitEvent('llm_prompt_built', {
    title: cleanTitle,
    category: category || 'Gastro-entérologie',
    systemPromptChars: systemPrompt.length,
    userPromptChars: userPrompt.length,
    estimatedTokens: Math.ceil((systemPrompt.length + userPrompt.length) / 4),
    ragWebCount: webSources.length,
    ragPdfCount: pdfMatches.length,
    totalRagChars: totalRagChars,
    isOverloaded: totalRagChars > 10000
  });

  while (attempts < maxAttempts) {
    attempts++;
    console.log(`🤖 LLM Generation Attempt ${attempts}/${maxAttempts} for "${cleanTitle}"...`);
    
    let currentPrompt = userPrompt;
    if (previousValidationErrors.length > 0) {
      currentPrompt += `\n\n🚨 ATTENTION — TENTATIVE PRÉCÉDENTE REJETÉE PAR LE VALIDATEUR CLINIQUE :\n` +
        previousValidationErrors.map(e => `- ${e}`).join('\n') +
        `\n👉 INSTRUCTION DE CORRECTION : Corrige STRICTEMENT ces erreurs médicales/structurelles dans ta nouvelle réponse JSON !`;
    }

    const apiResult = await callLLMApi(systemPrompt, currentPrompt, {
      ...options,
      responseSchema: options.responseSchema || MASTER_CAT_SCHEMA
    });
    executionMetrics = apiResult.metrics;

    try {
      catResult = safeParseLLMJson(apiResult.text);
      catResult._raw_llm_response = apiResult.text;
      catResult._raw_prompts = { systemPrompt, userPrompt: currentPrompt };

      if (catResult.summary) catResult.summary = sanitizeMarkdownText(catResult.summary);
      if (catResult.ordonnance) catResult.ordonnance = sanitizeMarkdownText(catResult.ordonnance);
      if (catResult.red_flags) catResult.red_flags = sanitizeMarkdownText(catResult.red_flags);
      if (Array.isArray(catResult.sub_cats)) {
        catResult.sub_cats.forEach(sub => {
          if (sub.summary) sub.summary = sanitizeMarkdownText(sub.summary);
          if (sub.ordonnance) sub.ordonnance = sanitizeMarkdownText(sub.ordonnance);
          if (sub.red_flags) sub.red_flags = sanitizeMarkdownText(sub.red_flags);
        });
      }

      debugEmitter.emitEvent('llm_parse_success', {
        attempt: attempts,
        keysParsed: Object.keys(catResult),
        hasSummary: !!catResult.summary,
        hasOrdonnance: !!catResult.ordonnance
      });

      // Enforce search_keywords array
      if (!Array.isArray(catResult.search_keywords) || catResult.search_keywords.length === 0) {
        catResult.search_keywords = extractSmartKeywords(cleanTitle, options.search_keywords);
      }

      if (options.id !== undefined && options.id !== null) {
        catResult.id = Number(options.id);
      } else if (!catResult.id || typeof catResult.id !== 'number') {
        catResult.id = 999; // Transient integer for standalone generation & validation pass
      }
      catResult.category = category || catResult.category || 'Gastro-entérologie';
      if (options.originalTitle) {
        catResult.title = options.originalTitle;
      }
      catResult.pdf_keywords = pdfKeywords;
      catResult.online_verification_queries = buildSearchQueries(cleanTitle).map(q => q.queryUrl).slice(0, 3);

      // Attach structured source attribution list
      catResult.sources = [];
      for (const m of (pdfMatches || [])) {
        catResult.sources.push({ type: 'pdf', name: m.pdfFile, page: m.page, specialty: m.specialty, score: m.score });
      }
      for (const lib of (libraryMatches || [])) {
        catResult.sources.push({ type: 'clinical_library', name: `${lib.source} (${lib.file})`, category: lib.category, score: lib.score });
      }
      for (const web of (webSources || [])) {
        catResult.sources.push({ type: web.source === 'Doctor Provided' ? 'doctor_custom_url' : 'web_cache', name: web.domain || web.source, category: web.source });
      }

      // Validate using Medical Validator
      const validation = validateCAT(catResult);
      debugEmitter.emitEvent('validation_result', {
        attempt: attempts,
        valid: validation.valid,
        errors: validation.errors,
        warnings: validation.warnings
      });

      if (validation.valid) {
        console.log(`✅ Medical Checksum PASSED on Attempt ${attempts}!`);
        catResult._execution_metrics = executionMetrics;
        debugEmitter.emitEvent('generation_done', {
          title: cleanTitle,
          status: 'success',
          attempt: attempts,
          latencyMs: executionMetrics.latencyMs,
          totalTokens: executionMetrics.totalTokens,
          model: executionMetrics.model
        });
        return { cat: catResult, validation, metrics: executionMetrics };
      } else {
        console.warn(`❌ Medical Validation Checksum Failed (Attempt ${attempts}):`, validation.errors);
        previousValidationErrors = validation.errors;
      }
    } catch (parseErr) {
      console.warn(`⚠️ JSON parse error on attempt ${attempts}: ${parseErr.message}`);
      debugEmitter.emitEvent('llm_parse_fail', {
        attempt: attempts,
        error: parseErr.message
      });
    }
  }

  // If all attempts failed to produce a valid CAT:
  const failureReason = previousValidationErrors.length > 0
    ? `Règles de sécurité clinique non résolues après ${maxAttempts} tentatives :\n` + previousValidationErrors.map(e => `• ${e}`).join('\n')
    : `Échec de réponse API / Quota dépassé après ${maxAttempts} tentatives (vérifiez vos quotas Google AI Studio ou réessayez ultérieurement).`;

  debugEmitter.emitEvent('generation_failed', {
    title: cleanTitle,
    attempts: maxAttempts,
    reason: failureReason
  });

  throw new Error(failureReason);
}

/**
 * Targeted Sub-CAT Generation Engine (Human-in-the-Loop Clinical Modifiers)
 * Generates a laser-focused, 4-step specialized sub-profile without repeating generalities or contradicting the master CAT.
 */
async function generateSubCATWithLLM(parentCat, subProfileDescription, options = {}) {
  if (!parentCat || !parentCat.title) {
    throw new Error('Parent CAT object is required to generate a targeted sub-CAT.');
  }
  if (!subProfileDescription || typeof subProfileDescription !== 'string') {
    throw new Error('Sub-profile description/type is required.');
  }

  const systemPrompt = `Tu es le moteur d'intelligence médicale de Dr. CAT (Doctor Clinical Action Protocol) alimenté par Gemini 3.6 Flash.
Ta mission est de générer UNE SOUS-FICHE CLINIQUE CIBLÉE ET ADAPTÉE (Sub-CAT) pour une pathologie donnée et un terrain/profil clinique spécifique.

RÈGLES D'OR DE RÉDACTION DE LA SOUS-FICHE :
1. COMPLÉMENTARITÉ STRICTE & NON-RÉPÉTITION :
   - Cette sous-fiche est un zoom chirurgical pour le médecin praticien.
   - Ne JAMAIS répéter la physiopathologie générale, les définitions ou les généralités déjà présentes dans la fiche principale.
   - Concentre-toi EXCLUSIVEMENT sur ce qui change pour ce profil : adaptations posologiques, molécules autorisées de choix, contre-indications formelles et pièges à éviter.

2. NON-CONTRADICTION :
   - Ne contredis jamais la ligne thérapeutique de la fiche principale, sauf pour substituer formellement une molécule contre-indiquée sur ce terrain (ex: remplacer un AINS ou un IEC contre-indiqué lors de la grossesse par une molécule autorisée au CRAT).

3. RÈGLES DE SÉCURITÉ CLINIQUE PAR TERRAIN :
   - Grossesse / Allaitement : Respect strict des données du CRAT (Centre de Référence sur les Agents Tératogènes).
   - Sujet Âgé / Gériatrie : Adapter les posologies selon le DFG (Cockcroft), règle « start low, go slow ».
   - Pédiatrie / Nourrisson : Posologies obligatoires en mg/kg/j ou cuillère-mesure selon le poids.
   - Insuffisance Rénale / Hépatique : Ajustement posologique précis selon la clairance.
   - Formes Aiguës / Urgences : Conduite de réanimation immédiate, posologies de charge, transfert SMUR.
   - Volet Psychiatrique & Médico-Légal (Algérie) : Utiliser exclusivement « Hospitalisation Libre » ou « Hospitalisation Sans Consentement / Placement d'Office » (Loi sanitaire n° 18-11).

4. FORMAT DU SUMMARY (STRICTEMENT 4 ÉTAPES NUMÉROTÉES EN MARKDOWN) :
   **0. Spécificités & Urgence du Profil :** (Mesures réflexes, détresse, seuils d'alerte vitale)
   **1. Diagnostic & Particularités Cliniques :** (Formes atypiques, examens spécifiques à ce profil)
   **2. Prise en Charge & Adaptation Thérapeutique :** (Molécules de choix autorisées, posologies adaptées)
   **3. Surveillance, Hospitalisation & Suivi :** (Critères d'admission, délai de contrôle)

5. FORMAT DE L'ORDONNANCE (RÉPLIQUE EXACTE EN 4 SECTIONS EN MARKDOWN) :
   **TRAITEMENT NON MÉDICAMENTEUX & RHD :**
   **1ère INTENTION (Traitement médicamenteux de choix) :**
   **ALTERNATIVES [OU] :**
   **TRAITEMENT SYMPTOMATIQUE / ADJUVANT :**

FORMAT DE RÉPONSE ATTENDU (EXCLUSIVEMENT DU JSON VALIDE) :
{
  "label": "Emoji + Titre clair du profil (ex: 🤰 Grossesse & Allaitement)",
  "summary": "**0. Spécificités & Urgence du Profil :** ...\\n\\n**1. Diagnostic & Particularités Cliniques :** ...\\n\\n**2. Prise en Charge & Adaptation Thérapeutique :** ...\\n\\n**3. Surveillance, Hospitalisation & Suivi :** ...",
  "red_flags": "Drapeaux rouges et signaux d'alerte spécifiques à ce terrain (liste à puces)...",
  "ordonnance": "**TRAITEMENT NON MÉDICAMENTEUX & RHD :**\\n...\\n\\n**1ère INTENTION (Traitement médicamenteux de choix) :**\\n...\\n\\n**ALTERNATIVES [OU] :**\\n...\\n\\n**TRAITEMENT SYMPTOMATIQUE / ADJUVANT :**\\n..."
}`;

  // RAG: Query local PDFs and Clinical Library for this specific sub-profile
  const searchQuery = `${parentCat.title} ${subProfileDescription}`;
  const pdfMatches = await searchLocalPDFs(searchQuery, { maxMatchesPerFile: 2, category: parentCat.category });
  const ragSnippets = pdfMatches.flatMap(p => p.matches.map(m => `[Core Reference: ${p.pdfFile}] ${m.snippet}`)).join('\n');
  const libraryMatches = queryClinicalLibrary(searchQuery);
  const librarySnippets = libraryMatches.map(l => `[Standard Clinical Library: ${l.source} (${l.file})]\n${l.snippet}`).join('\n\n');

  let sourcesContext = '';
  if (ragSnippets) sourcesContext += `\n\n--- EXTRAITS PERTINENTS DU CORPUS MÉDICAL LOCAL (PDFs) ---\n${ragSnippets}`;
  if (librarySnippets) sourcesContext += `\n\n--- RECOMMANDATIONS CLINIQUES SPÉCIALISÉES ---\n${librarySnippets}`;

  const userPrompt = `GÉNÈRE UNE SOUS-FICHE CLINIQUE CIBLÉE POUR :
PATHOLOGIE : "${parentCat.title}"
CATÉGORIE : "${parentCat.category || 'Gastro-entérologie'}"
PROFIL CLINIQUE REQUIS : "${subProfileDescription}"

--- CONTEXTE DE LA FICHE PRINCIPALE DÉJÀ VALIDÉE ---
[Summary Principal] :
${parentCat.summary || 'Non spécifié'}

[Ordonnance Principale] :
${parentCat.ordonnance || 'Non spécifiée'}

[Drapeaux Rouges Principaux] :
${parentCat.red_flags || 'Non spécifié'}${sourcesContext}

RAPPEL : Génère un objet JSON unique avec "label", "summary" (4 étapes), "red_flags", et "ordonnance" (4 sections).`;

  debugEmitter.emitEvent('llm_prompt_built', {
    title: `[Sub-CAT] ${parentCat.title} -> ${subProfileDescription}`,
    category: parentCat.category || 'Gastro-entérologie',
    systemPromptChars: systemPrompt.length,
    userPromptChars: userPrompt.length,
    estimatedTokens: Math.ceil((systemPrompt.length + userPrompt.length) / 4)
  });

  let attempts = 0;
  const maxAttempts = 3;
  let previousValidationErrors = [];
  let subResult = null;

  while (attempts < maxAttempts) {
    attempts++;
    console.log(`🤖 Sub-CAT Generation Attempt ${attempts}/${maxAttempts} for "${parentCat.title}" -> "${subProfileDescription}"...`);

    let currentPrompt = userPrompt;
    if (previousValidationErrors.length > 0) {
      currentPrompt += `\n\n🚨 ATTENTION — TENTATIVE PRÉCÉDENTE REJETÉE PAR LE VALIDATEUR CLINIQUE :\n` +
        previousValidationErrors.map(e => `- ${e}`).join('\n') +
        `\n👉 INSTRUCTION DE CORRECTION : Corrige STRICTEMENT ces erreurs médicales/structurelles dans ta nouvelle réponse JSON !`;
    }

    const apiResult = await callLLMApi(systemPrompt, currentPrompt, {
      ...options,
      responseSchema: options.responseSchema || SUB_CAT_SCHEMA
    });

    try {
      subResult = safeParseLLMJson(apiResult.text);

      if (subResult.summary) subResult.summary = sanitizeMarkdownText(subResult.summary);
      if (subResult.ordonnance) subResult.ordonnance = sanitizeMarkdownText(subResult.ordonnance);
      if (subResult.red_flags) subResult.red_flags = sanitizeMarkdownText(subResult.red_flags);

      // Verify 4-step summary presence
      const subErrors = [];
      if (!subResult.label || typeof subResult.label !== 'string') {
        subErrors.push('Field "label" is missing or invalid.');
      }
      if (!subResult.summary || !subResult.summary.includes('Spécificités') || !subResult.summary.includes('Diagnostic')) {
        subErrors.push('Sub-CAT summary must strictly contain the 4 steps (0. Spécificités & Urgence, 1. Diagnostic, 2. Prise en Charge, 3. Surveillance).');
      }
      if (!subResult.ordonnance || subResult.ordonnance.length < 20) {
        subErrors.push('Sub-CAT ordonnance is required with 4 structured sections.');
      }
      if (!subResult.red_flags || subResult.red_flags.length < 10) {
        subErrors.push('Sub-CAT red_flags field is required.');
      }

      // Run complete 8-layer Medical Validator on the parent CAT with this new sub-profile attached
      const syntheticParent = {
        ...parentCat,
        id: parentCat.id || 999,
        sub_cats: [subResult]
      };
      const validation = validateCAT(syntheticParent);

      const allErrors = [...subErrors, ...(validation.valid ? [] : validation.errors)];

      if (allErrors.length === 0) {
        console.log(`✅ Sub-CAT Medical Checksum PASSED on Attempt ${attempts}!`);
        
        subResult._manually_requested = true;
        subResult._profile_query = subProfileDescription;
        subResult._generated_at = new Date().toISOString();
        subResult._execution_metrics = apiResult.metrics;

        debugEmitter.emitEvent('generation_done', {
          title: `[Sub-CAT] ${parentCat.title} -> ${subResult.label || subProfileDescription}`,
          status: 'success',
          attempt: attempts,
          latencyMs: apiResult.metrics ? apiResult.metrics.latencyMs : 0,
          totalTokens: apiResult.metrics ? apiResult.metrics.totalTokens : 0,
          model: apiResult.metrics ? apiResult.metrics.model : 'unknown'
        });

        return {
          sub_cat: subResult,
          validation: validation,
          metrics: apiResult.metrics
        };
      } else {
        console.warn(`❌ Sub-CAT Medical Validation Failed (Attempt ${attempts}):`, allErrors);
        previousValidationErrors = allErrors;
      }
    } catch (parseErr) {
      console.warn(`⚠️ Sub-CAT JSON parse error on attempt ${attempts}: ${parseErr.message}`);
      previousValidationErrors = [`Erreur de formatage JSON : ${parseErr.message}`];
    }
  }

  const failureReason = previousValidationErrors.length > 0
    ? `Validation clinique de la sous-fiche non résolue après ${maxAttempts} tentatives :\n` + previousValidationErrors.map(e => `• ${e}`).join('\n')
    : `Échec de l'appel LLM pour la sous-fiche après ${maxAttempts} tentatives.`;

  throw new Error(failureReason);
}

module.exports = {
  callLLMApi,
  generateCATWithLLM,
  generateSubCATWithLLM,
  applyModelBlocklist,
  discoverDynamicModels,
  safeParseLLMJson,
  FALLBACK_GEMINI_MODELS
};
