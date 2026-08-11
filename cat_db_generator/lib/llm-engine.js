/**
 * Real LLM Generation & Anti-Hallucination Execution Engine
 * Handles live LLM API calls (Gemini API with model fallback),
 * token count logging, execution time tracking, RAG context synthesis,
 * strict schema locking, and automated validation checksum loops.
 */

require('dotenv').config();
const path = require('path');
const { searchLocalPDFs } = require('./pdf-extractor');
const { validateCAT, isAdministrativeCAT } = require('./medical-validator');
const { buildSearchQueries, REPUTABLE_MEDICAL_SOURCES } = require('./medical-sources');
const { fetchAndCacheWebSources, getCachedWebSources } = require('./web-fetcher');
const debugEmitter = require('./debug-emitter');
const fs = require('fs');

const FALLBACK_GEMINI_MODELS = [
  'gemini-3.6-flash',
  'gemini-3.5-flash',
  'gemini-3-flash-preview',
  'gemini-2.0-flash',
  'gemini-flash-latest',
  'gemini-flash-lite-latest'
];

let cachedDynamicModels = null;
let lastModelDiscoveryTime = 0;
const DISCOVERY_CACHE_TTL_MS = 60 * 60 * 1000; // 1 hour

/**
 * Dynamically queries Google AI Studio API to discover real active models
 * and ranks them automatically by highest version number and clinical reasoning capability.
 */
async function discoverDynamicModels(apiKey) {
  const now = Date.now();
  if (cachedDynamicModels && (now - lastModelDiscoveryTime) < DISCOVERY_CACHE_TTL_MS) {
    return cachedDynamicModels;
  }

  try {
    const url = `https://generativelanguage.googleapis.com/v1beta/models?key=${apiKey}`;
    const res = await fetch(url);
    if (!res.ok) return FALLBACK_GEMINI_MODELS;

    const data = await res.json();
    const models = (data.models || [])
      .filter(m => m.supportedGenerationMethods && m.supportedGenerationMethods.includes('generateContent'))
      .map(m => m.name.replace('models/', ''))
      .filter(name => !name.includes('tts') && !name.includes('image') && !name.includes('banana') && !name.includes('clip') && !name.includes('computer-use'));

    // Automatically sort by highest version (highest number first, e.g. 3.6 > 3.5 > 3.0 > 2.0 > latest)
    models.sort((a, b) => {
      const getVer = s => {
        const match = s.match(/gemini-(\d+(?:\.\d+)?)/i);
        return match ? parseFloat(match[1]) : (s.includes('latest') ? 1.9 : 1.0);
      };
      return getVer(b) - getVer(a);
    });

    if (models.length > 0) {
      cachedDynamicModels = models;
      lastModelDiscoveryTime = now;
      console.log(`🤖 [Dynamic LLM Discovery] Discovered ${models.length} active models. Top primary: ${models[0]}`);
      return models;
    }
  } catch (err) {
    console.warn(`⚠️ Dynamic model discovery failed: ${err.message}. Using fallback model list.`);
  }

  return FALLBACK_GEMINI_MODELS;
}

const V2_DB_PATH = path.join(__dirname, '..', 'cats_db_v2_generated.json');

function getHumanEditMemory(title) {
  if (fs.existsSync(V2_DB_PATH)) {
    try {
      const db = JSON.parse(fs.readFileSync(V2_DB_PATH, 'utf8'));
      const clean = title.toLowerCase().replace(/^cat\s+devant\s+/i, '').trim();
      const match = db.find(c => (c.title || '').toLowerCase().includes(clean));
      if (match && match._human_edited) {
        return match;
      }
    } catch (e) {}
  }
  return null;
}

function safeParseLLMJson(text) {
  if (!text || typeof text !== 'string') throw new Error('Empty LLM response');

  let cleaned = text
    .replace(/```json/gi, '')
    .replace(/```/g, '')
    .trim();

  const firstBrace = cleaned.indexOf('{');
  const lastBrace = cleaned.lastIndexOf('}');
  if (firstBrace !== -1 && lastBrace !== -1 && lastBrace > firstBrace) {
    cleaned = cleaned.substring(firstBrace, lastBrace + 1);
  }

  // 1. Direct parse attempt
  try {
    return JSON.parse(cleaned);
  } catch (err1) {
    // 2. Remove trailing commas & non-whitespace control characters
    try {
      const sanitized = cleaned
        .replace(/[\x00-\x08\x0B\x0C\x0E-\x1F]/g, '')
        .replace(/,\s*([\}\]])/g, '$1');
      return JSON.parse(sanitized);
    } catch (err2) {
      // 3. String-literal repair (newlines/tabs inside strings) + trailing comma strip
      try {
        const stringRepaired = cleaned
          .replace(/"(?:[^"\\]|\\.)*"/gs, (match) => {
            return match.replace(/\n/g, '\\n').replace(/\r/g, '\\r').replace(/\t/g, '\\t');
          })
          .replace(/,\s*([\}\]])/g, '$1');
        return JSON.parse(stringRepaired);
      } catch (err3) {
        // 4. Deterministic schema key regex extraction fallback
        const res = {};
        const catMatch = cleaned.match(/"category"\s*:\s*"([^"]+)"/i);
        if (catMatch) res.category = catMatch[1];

        const titleMatch = cleaned.match(/"title"\s*:\s*"([^"]+)"/i);
        if (titleMatch) res.title = titleMatch[1];

        const kwMatch = cleaned.match(/"search_keywords"\s*:\s*\[([\s\S]*?)\]/i);
        if (kwMatch) {
          try { res.search_keywords = JSON.parse(`[${kwMatch[1]}]`); } catch (_) {}
        }

        const summaryMatch = cleaned.match(/"summary"\s*:\s*"([\s\S]*?)"\s*,\s*"red_flags"/i);
        if (summaryMatch) {
          res.summary = summaryMatch[1].replace(/\\n/g, '\n').replace(/\\"/g, '"');
        }

        const rfMatch = cleaned.match(/"red_flags"\s*:\s*"([\s\S]*?)"\s*,\s*"ordonnance"/i);
        if (rfMatch) {
          res.red_flags = rfMatch[1].replace(/\\n/g, '\n').replace(/\\"/g, '"');
        }

        const ordMatch = cleaned.match(/"ordonnance"\s*:\s*"([\s\S]*?)"\s*(?:}|\n})/i);
        if (ordMatch) {
          res.ordonnance = ordMatch[1].replace(/\\n/g, '\n').replace(/\\"/g, '"');
        }

        if (res.title && res.summary) return res;
        throw err1;
      }
    }
  }
}

/**
 * Call Gemini REST API with dynamic model discovery, extended thinking budget, token logging, and rate-limit backoff
 */
async function callLLMApi(systemPrompt, userPrompt, options = {}) {
  const apiKey = options.apiKey || process.env.GOOGLE_API_KEY || process.env.GEMINI_API_KEY;
  if (!apiKey) {
    throw new Error('LLM API Key missing! Set GOOGLE_API_KEY or GEMINI_API_KEY in .env');
  }

  // Discover highest dynamic active models from Google API
  const dynamicModels = await discoverDynamicModels(apiKey);
  const modelsToTry = options.model ? [options.model, ...dynamicModels] : dynamicModels;
  let lastError = null;

  for (const model of modelsToTry) {
    const startTime = Date.now();
    let res = null;
    let rateLimitAttempts = 0;

    debugEmitter.emitEvent('llm_model_attempt', {
      model,
      attemptNumber: rateLimitAttempts + 1,
      totalModelsAvailable: modelsToTry.length
    });

    while (rateLimitAttempts < 3) {
      rateLimitAttempts++;
      try {
        const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${apiKey}`;

        const generationConfig = {
          temperature: 0.2,
          responseMimeType: 'application/json'
        };

        // Apply thinkingConfig only to full Flash/Pro models — exclude lite variants that don't support it
        if (/gemini-(3|2\.5|2\.0)/i.test(model) && !/lite/i.test(model)) {
          const defaultBudget = /pro/i.test(model) ? 4096 : 2048;
          generationConfig.thinkingConfig = {
            thinkingBudget: options.thinkingBudget || defaultBudget
          };
        }

        const payload = {
          contents: [
            {
              role: 'user',
              parts: [{ text: `${systemPrompt}\n\n--- TASK INPUT ---\n${userPrompt}` }]
            }
          ],
          generationConfig: generationConfig
        };

        // 60-second timeout per request — prevents infinite hang on stalled models
        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), 60000);
        try {
          res = await fetch(url, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(payload),
            signal: controller.signal
          });
        } finally {
          clearTimeout(timeoutId);
        }

        if (res.status === 429) {
          console.warn(`⚠️ [LLM Rate Limit HTTP 429] Model ${model} rate limited (attempt ${rateLimitAttempts}/3). Pausing 10s to reset quota...`);
          debugEmitter.emitEvent('llm_model_rate_limit', { model, attempt: rateLimitAttempts, cooldownSec: 10 });
          await new Promise(r => setTimeout(r, 10000));
          continue; // Retry same model after 10s cooldown
        }

        if (res) break;
      } catch (netErr) {
        lastError = netErr;
        console.warn(`⚠️ Network fetch attempt ${rateLimitAttempts}/3 for model ${model} failed: ${netErr.message}`);
        debugEmitter.emitEvent('llm_model_fail', { model, attempt: rateLimitAttempts, error: netErr.message });
        if (rateLimitAttempts < 3) await new Promise(r => setTimeout(r, 2000));
      }
    };

    if (!res) continue;

    const latencyMs = Date.now() - startTime;

    if (!res.ok) {
      const errText = await res.text();
      lastError = new Error(`HTTP ${res.status} [${model}]: ${errText.substring(0, 200)}`);
      console.warn(`⚠️ Model ${model} failed with HTTP ${res.status}. Falling back to next model...`);
      debugEmitter.emitEvent('llm_model_fail', { model, httpStatus: res.status, error: lastError.message });
      continue;
    }

    try {
      const data = await res.json();
      const candidate = data.candidates && data.candidates[0];
      if (!candidate || !candidate.content || !candidate.content.parts) {
        lastError = new Error(`Unexpected LLM output format from ${model}`);
        continue;
      }

      const rawText = candidate.content.parts.map(p => p.text).join('\n').trim();

      const usage = data.usageMetadata || {};
      const promptTokens = usage.promptTokenCount || Math.ceil((systemPrompt.length + userPrompt.length) / 4);
      const completionTokens = usage.candidatesTokenCount || Math.ceil(rawText.length / 4);
      const totalTokens = usage.totalTokenCount || (promptTokens + completionTokens);

      const metrics = {
        model: model,
        latencyMs: latencyMs,
        promptTokens: promptTokens,
        completionTokens: completionTokens,
        totalTokens: totalTokens,
        timestamp: new Date().toISOString()
      };

      console.log(`⚡ [LLM API CALL] Model: ${model} | Latency: ${latencyMs}ms | Tokens: ${totalTokens} (${promptTokens} in / ${completionTokens} out)`);

      debugEmitter.emitEvent('llm_response_received', {
        model,
        latencyMs,
        promptTokens,
        completionTokens,
        totalTokens,
        previewSnippet: rawText.slice(0, 300)
      });

      return {
        text: rawText,
        metrics: metrics
      };
    } catch (err) {
      lastError = err;
    }
  }

  throw new Error(`All LLM models failed. Last error: ${lastError ? lastError.message : 'Unknown'}`);
}

/**
 * Generate a complete CAT object using real LLM API synthesis (Dual RAG + Active Learning)
 */
async function generateCATWithLLM(title, category, options = {}) {
  const cleanTitle = title.startsWith('CAT') ? title : `CAT devant ${title}`;
  const catObjPlaceholder = { title: cleanTitle, category: category || 'Gastro-entérologie' };
  const isAdmin = isAdministrativeCAT(catObjPlaceholder);

  // 1. Offline RAG Search inside ready pdf_index.json
  console.log(`🔍 [Offline RAG] Searching pre-extracted pdf_index.json for "${cleanTitle}"...`);
  const pdfMatches = await searchLocalPDFs(cleanTitle, { maxMatchesPerFile: 3 });
  const ragSnippets = pdfMatches.flatMap(p => p.matches.map(m => `[PDF Index: ${p.pdfFile}] ${m.snippet}`)).join('\n');
  const pdfKeywords = pdfMatches.map(p => p.pdfFile.replace(/\.pdf$/i, '')).slice(0, 4);

  // 2. Online RAG Web Cache Fetching
  let webSources = getCachedWebSources(cleanTitle);
  if (webSources.length === 0 && options.autoFetchWeb !== false) {
    console.log(`🌐 [Online RAG] Step 1: Web cache missing for "${cleanTitle}". Fetching live web sources...`);
    try {
      webSources = await fetchAndCacheWebSources(cleanTitle, { maxSources: 3 });
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

  // 4. Build Reputable Medical Sources Context
  const sourcesSummary = REPUTABLE_MEDICAL_SOURCES
    .map(s => `- ${s.name} (${s.domain}): ${s.category}`)
    .join('\n');

  // 5. Formulate System Prompt with Master Clinical Logic & Strict Schema Lock
  let systemPrompt = `Tu es le moteur d'intelligence médicale de Dr. CAT (Doctor Clinical Action Protocol) alimenté par Gemini 3.6 Flash (Dual RAG + Human Active Learning Engine).
Ta mission est de synthétiser et de structurer une conduite à tenir (CAT) clinique ou administrative hautement précise, vérifiée et conforme aux recommandations médicales.

SOURCES ET RÉFÉRENCES À SYNTHÉTISER (4 ANCRES DE VÉRITÉ MÉDICALE) :
${sourcesSummary}
- Algérie : Ministère de la Santé (sante.gov.dz), CNPM (cnpm.org.dz), SAMI (samidz.com).
- France & International : Vidal, HAS, SFMU, ANSM, MSF, WHO/OMS, CRAT.

1. HIÉRARCHIE STRICTE DES SOURCES DE CONNAISSANCES :
   - PRIORITÉ 1 (SOURCE PRIMAIRE LOCALE - BASELINE) : EXTRAITS PDF LOCAUX (PDF Index)
     * Détermine les molécules disponibles localement, les posologies usuelles et les habitudes de prescription (ex: Ascabiol/Benzoate de benzyle, Spasfon/Phloroglucinol, Tiorfan/Racécadotril, Smecta/Diosmectite).
     * Ne masque JAMAIS un traitement local de premier recours au profit d'une molécule internationale indisponible localement.
   - PRIORITÉ 2 (ENRICHISSEMENT ET SÉCURITÉ EN LIGNE) : DONNÉES WEB RAG (StatPearls NCBI, MSD Manuals, MedG Consensus, Wiki FR)
     * Fournit les critères diagnostiques récents, les scores pronostiques et les bilans paracliniques recommandés.
   - PRIORITÉ 3 (MÉMOIRE MÉDICALE ACTIVE) : CORRECTIONS ET ÉDITIONS MANUELLES DE L'UTILISATEUR MÉDECIN
   - PRIORITÉ 4 (SYNTHÈSE ET VALIDATION) : MOTEUR DE RAISONNEMENT GEMINI (Synthèse, mise en page et anti-hallucination).

2. RÈGLE STRICTE DE RÉDACTION DE L'ORDONNANCE (ANTI-POLYPHARMACIE & LEDGER STRUCTURÉ EN 4 SECTIONS) :
   - INTERDICTION ABSOLUE DE LA LISTE PLATE NUMÉROTÉE (1, 2, 3, 4) faisant croire que tous les médicaments doivent être pris ensemble !
   - Le champ "ordonnance" DOIT OBLIGATOIREMENT être structuré avec les 4 rubriques suivantes en Markdown :

   **TRAITEMENT NON MÉDICAMENTEUX & RHD (Prise en charge globale) :**
   - Mesures diététiques précises, activité physique adaptée, kinésithérapie/rééducation, sevrage des toxiques et éducation thérapeutique du patient.

   **1ère INTENTION (Traitement médicamenteux de choix) :**
   - Nom de la molécule, forme galénique, posologie exacte, mode, rythme et durée d'administration (ex: Paracétamol 1g : 1 cp toutes les 8h si douleur, max 3g/j).
   - ⚠️ Micro-filtre d'allergie systématique : Mentionne le rappel d'allergie préalable si pertinent (ex: 'Vérifier l'absence d'allergie aux pénicillines/bêta-lactamines').

   **ALTERNATIVES [OU] (En cas d'échec, contre-indication, intolérance ou terrain spécifique) :**
   - Précède TOUJOURS chaque traitement alternatif par la mention claire '[OU] Alternative' ou '2ème intention' avec le motif clinique (ex: '[OU] Alternative (si allergie aux bêta-lactamines) : Azithromycine 500 mg à J1 puis 250 mg/j de J2 à J5').
   - Si deux traitements sont des alternatives exclusives, ajoute l'avertissement formel : '⚠️ ALTERNATIVE : Ne pas associer en première intention'.

   **TRAITEMENT SYMPTOMATIQUE / ADJUVANT (Si besoin / En option) :**
   - Traitements de confort ciblés uniquement sur les symptômes associés (ex: 'Uniquement en cas de prurit intense : Anti-histaminique H1...').

3. RÈGLES DE SÉCURITÉ CLINIQUE PAR TERRAIN :
   - Pédiatrie : Posologies obligatoirement exprimées en dose-poids (mg/kg/j ou cuillères-mesures selon le poids). Rappel du seuil néonatal (< 2 mois = avis spécialisé/hospitalier).
   - Grossesse / Allaitement : Respect strict des données du CRAT. Mentionner les contre-indications absolues (ex: IEC/ARA2, AINS aux 2ème/3ème trimestres).
   - Insuffisance Rénale / Gériatrie : Adapter les doses selon le DFG (Cockcroft / CKD-EPI) et éliminer les molécules néphrotoxiques.
   - Psychiatrie & Interactions : Alerte sur le risque de syndrome sérotoninergique (ISRS + Tramadol) et d'allongement du QTc.
   - Anti-Hallucination : N'invente AUCUNE section pédiatrique ou gynécologique si la pathologie et les sources ne la concernent pas.

4. SOUS-PROFILS CLINIQUES ET SUB-CATS DÉDIÉS (Pour les pathologies complexes ou à sous-types critiques) :
   - Si la pathologie présente des complications aiguës majeures ou des formes cliniques distinctes nécessitant une prise en charge/réanimation dédiée (ex: Diabète ➔ Acidocétose diabétique, Diabète gestationnel ; Diarrhée ➔ Forme glairo-sanglante, Nourrisson/SRO ; HTA ➔ Urgence hypertensive, HTA gravidique ; Asthme ➔ Asthme aigu grave) :
   - A. DANS LE TEXTE "summary" PRINCIPAL : Insère un lien contextuel naturel vers la sous-fiche avec la syntaxe markdown :
     [🚨 Ouvrir la Sous-Fiche Acidocétose Diabétique](subcat:1) ou [👶 Ouvrir la Sous-Fiche Nourrisson / SRO](subcat:2)
   - B. DANS LE TABLEAU "sub_cats" DU JSON : Fournis la sous-fiche complète avec ses 5 étapes modulaires, ses red_flags et son ordonnance dédiée.
   - Si la pathologie est simple ou univoque (ex: Constipation banale, Furoncle simple), ne génère pas de sub_cats (tableau vide ou absent).
`;

  if (isAdmin) {
    systemPrompt += `
STRUCTURE STRICTEMENT ADMINISTRATIVE LOCK (DOCUMENT MÉDICO-LÉGAL / CERTIFICAT / LETTRE) :
Tu dois générer un objet JSON structuré pour un acte administratif médical (certificat médical, attestation, lettre d'orientation, CBU, accident du travail).
INTERDICTION STRICTE DE LA STRUCTURE CLINIQUE ! Utilise exclusivement les 3 étapes administratives suivantes :

LE CHAMP "summary" DOIT STRICTEMENT CONTENIR LES 3 SECTIONS SUIVANTES (UTILISE EXACTEMENT CES TITRES EN MARKDOWN) :
**1. Cadre Légal & Prérequis :**
- Identification formelle du patient (Nom, Prénom, Date de naissance, Pièce d'identité).
- Règle d'or : Examen médical physique effectif et personnellement réalisé par le médecin.
- Interdiction absolue de délivrer un certificat de complaisance ou de l'antidater (responsabilité pénale/disciplinaire).
- Consentement éclairé du patient et respect du secret médical (remise en main propre).

**2. Structure & Mentions Obligatoires :**
- En-tête du praticien (Nom, Prénom, Qualité, Adresse, N° d'inscription à l'Ordre).
- Date et lieu de rédaction rédigés en toutes lettres.
- Faits cliniques constatés médicalement de visu (constatations objectives et doléances rapportées entre guillemets).
- Évaluation précise de l'Incapacité Totale de Travail (ITT) en jours si applicable.
- Formule de clôture réglementaire : "Certificat établi à la demande de l'intéressé(e) et remis en main propre pour servir et valoir ce que de droit". Signature et tampon.

**3. Formules Types & Modèles de Rédaction :**
- Modèles textuels types et expressions juridiques exactes adaptées à cet acte.

LE CHAMP "red_flags" DOIT CONTENIR : "Risques Médico-Légaux & Erreurs à Éviter".
LE CHAMP "ordonnance" DOIT CONTENIR : "Modèle de Rédaction / Formule Type Prête à l'Emploi".
`;
  } else {
    systemPrompt += `
STRUCTURE MODULAIRE CLINIQUE DU CHAMP "summary" (EXACTEMENT CES TITRES EN MARKDOWN) :
**0. Stabilisation Immédiate & ABCDE (Si urgence vitale) :**
(Si détresse respiratoire, hémodynamique ou neurologique : Airway, Breathing, Circulation, Dextro/Glasgow avant de poser le diagnostic)
**1. Évaluation initiale & Diagnostic :**
(Interrogatoire, sémiologie clinique fine, critères diagnostiques positifs)
**2. Drapeaux Rouges & Signes de Gravité :**
(Signes d'alarme imposant une hospitalisation d'urgence ou un avis spécialisé immédiat)
**3. Examens complémentaires :**
(Bilan de 1ère intention et 2nde intention, imagerie, biologie, ECG)
**3bis. Terrain, Comorbidités & Contrôle Iatrogène :**
(Filtre Allergies, adaptation au DFG/clairance, précautions grossesse/pédiatrie, évitement des interactions médicamenteuses à risque)
**4. Prise en charge & Conduite à tenir :**
(Mesures immédiates, surveillance, règles de prescription)
**5. Orientation, Suivi & Volet Médico-Légal :**
(Suivi ambulatoire vs hospitalier, éviction scolaire/collective, MDO - Maladies à Déclaration Obligatoire, aptitude à la conduite, ALD 30, arrêt de travail)
`;
  }

  systemPrompt += `
FORMAT DE RÉPONSE ATTENDU (EXCLUSIVEMENT DU JSON VALIDE) :
{
  "category": "${category || 'Gastro-entérologie'}",
  "title": "${cleanTitle}",
  "search_keywords": ["mot-clé 1", "mot-clé 2"],
  "summary": "...",
  "red_flags": "Critères de gravité / Signes d'alarme...",
  "ordonnance": "Modèle de prescription type structuré en 4 parties...",
  "sub_cats": [
    {
      "label": "🚨 Nom de la sous-fiche spécialisée",
      "summary": "**0. Stabilisation...**\\n**1. Diagnostic...**\\n**2. Traitement...**",
      "red_flags": "Drapeaux rouges spécifiques au sous-profil...",
      "ordonnance": "Prescription dédiée pour ce sous-profil..."
    }
  ]
}`;

  const userPrompt = `GÉNÈRE ET SYNTHÉTISE LA CAT POUR : "${cleanTitle}"
Catégorie : ${category || 'Gastro-entérologie'}

${activeLearningText}

--- 🌐 DUAL RAG CHANNEL 1: DONNÉES WEB RECUEILLIES (STEP 1 WEB FETCH) ---
${webSnippets || 'Aucune donnée web en cache.'}

--- 📚 DUAL RAG CHANNEL 2: EXTRAITS DES MANUELS PDF (PDF INDEX) ---
${ragSnippets || 'Aucun extrait PDF trouvé directement.'}`;

  // 4. Execution & Automated Anti-Hallucination Validation Checksum Loop (Up to 3 Attempts)
  let attempts = 0;
  const maxAttempts = 3;
  let catResult = null;
  let executionMetrics = null;
  const { extractSmartKeywords } = require('./web-fetcher');

  debugEmitter.emitEvent('llm_prompt_built', {
    title: cleanTitle,
    category: category || 'Gastro-entérologie',
    systemPromptChars: systemPrompt.length,
    userPromptChars: userPrompt.length,
    estimatedTokens: Math.ceil((systemPrompt.length + userPrompt.length) / 4),
    ragWebCount: webSources.length,
    ragPdfCount: pdfMatches.length
  });

  while (attempts < maxAttempts) {
    attempts++;
    console.log(`🤖 LLM Generation Attempt ${attempts}/${maxAttempts} for "${cleanTitle}"...`);
    
    const apiResult = await callLLMApi(systemPrompt, userPrompt, options);
    executionMetrics = apiResult.metrics;

    try {
      catResult = safeParseLLMJson(apiResult.text);

      // Automated Markdown Sanitizer (Strips dangling **, unclosed tags, cleans headers)
      const sanitizeMarkdownText = (text) => {
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
      };

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
      }
    } catch (parseErr) {
      console.warn(`⚠️ JSON parse error on attempt ${attempts}: ${parseErr.message}`);
      debugEmitter.emitEvent('llm_parse_fail', {
        attempt: attempts,
        error: parseErr.message
      });
    }
  }

  if (catResult) {
    catResult._execution_metrics = executionMetrics;
    const finalValidation = validateCAT(catResult);
    debugEmitter.emitEvent('generation_done', {
      title: cleanTitle,
      status: 'fallback_accepted',
      attempts: maxAttempts,
      validation: finalValidation
    });
    return { cat: catResult, validation: finalValidation, metrics: executionMetrics };
  }

  throw new Error(`Failed to generate valid CAT for "${cleanTitle}" after ${maxAttempts} attempts.`);
}

module.exports = {
  callLLMApi,
  generateCATWithLLM
};
