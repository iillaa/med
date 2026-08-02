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
const fs = require('fs');

const GEMINI_MODELS = [
  'gemini-3.6-flash',
  'gemini-3.5-flash',
  'gemini-2.5-flash',
  'gemini-2.0-flash',
  'gemini-flash-lite-latest'
];

const V2_DB_PATH = path.join(__dirname, '..', 'cats_db_v2_generated.json');
let humanEditCache = null;

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

/**
 * Call Gemini REST API with token logging and latency tracking
 */
async function callLLMApi(systemPrompt, userPrompt, options = {}) {
  const apiKey = options.apiKey || process.env.GOOGLE_API_KEY || process.env.GEMINI_API_KEY;
  if (!apiKey) {
    throw new Error('LLM API Key missing! Set GOOGLE_API_KEY or GEMINI_API_KEY in .env');
  }

  const modelsToTry = options.model ? [options.model, ...GEMINI_MODELS] : GEMINI_MODELS;
  let lastError = null;

  for (const model of modelsToTry) {
    const startTime = Date.now();
    let res = null;
    let netAttempts = 0;

    while (netAttempts < 3) {
      netAttempts++;
      try {
        const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent?key=${apiKey}`;

        const payload = {
          contents: [
            {
              role: 'user',
              parts: [{ text: `${systemPrompt}\n\n--- TASK INPUT ---\n${userPrompt}` }]
            }
          ],
          generationConfig: {
            temperature: 0.2,
            responseMimeType: 'application/json'
          }
        };

        res = await fetch(url, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(payload)
        });

        if (res) break;
      } catch (netErr) {
        lastError = netErr;
        console.warn(`⚠️ Network fetch attempt ${netAttempts}/3 for model ${model} failed: ${netErr.message}`);
        if (netAttempts < 3) await new Promise(r => setTimeout(r, 1500));
      }
    }

    if (!res) continue;

    const latencyMs = Date.now() - startTime;

    if (!res.ok) {
      const errText = await res.text();
      lastError = new Error(`HTTP ${res.status} [${model}]: ${errText.substring(0, 200)}`);
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

  // 5. Formulate System Prompt with Strict Schema Lock
  let systemPrompt = `Tu es le moteur d'intelligence médicale de Dr. CAT (Doctor Clinical Action Protocol) alimenté par Gemini 3.6 Flash (Dual RAG + Human Active Learning Engine).
Ta mission est de synthétiser et de structurer une conduite à tenir (CAT) clinique ou administrative hautement précise, vérifiée et conforme aux recommandations médicales.

SOURCES ET RÉFÉRENCES À SYNTHÉTISER :
${sourcesSummary}
- Algérie : Ministère de la Santé (sante.gov.dz), CNPM (cnpm.org.dz), SAMI (samidz.com).
- France & International : Vidal, HAS, SFMU, ANSM, MSF, WHO/OMS.

DIRECTIVES MAJEURES DE PONDÉRATION ET PRESCRIPTION CLINIQUE :

1. PONDÉRATION DE DISPONIBILITÉ LOCALE (LOCAL-FIRST PRESCRIBING) :
   - Pour les traitements et modèles d'ordonnances, donne une PRIORITÉ ABSOLUE à la disponibilité médicamenteuse et aux habitudes de prescription locales (extraites du PDF Index et du contexte algérien/maghrébin comme Ascabiol/Benzoate de benzyle, Spasfon/Phloroglucinol, Tiorfan/Racécadotril, Smecta/Diosmectite).
   - Ne masque jamais un traitement local de premier recours au profit d'un traitement international non disponible localement.

2. RÈGLE STRICTE DE RÉDACTION DE L'ORDONNANCE (HIÉRARCHISATION CLINIQUE ET ANTI-POLYPHARMACIE) :
   - INTERDICTION STRICTE DE LA LISTE PLATE NUMÉROTÉE (1, 2, 3, 4) FANTÔME FAIRE CROIRE QUE TOUS LES MÉDICAMENTS DOIVENT ÊTRE PRIS ENSEMBLE !
   - Le champ "ordonnance" DOIT OBLIGATOIREMENT être structuré avec les rubriques claires suivantes (en Markdown) :

   **1ère INTENTION (Traitement de choix / Principal) :**
   - Nom du médicament de premier recours, posologie exacte, mode, rythme et durée d'administration (ex: Ascabiol lotion 10%/25% : 1 application à J0, renouveler à J7-J14).

   **ALTERNATIVES [OU] (En cas de contre-indication, échec, indisponibilité ou terrain spécifique) :**
   - Précède TOUJOURS chaque traitement alternatif par la mention claire '[OU] Alternative' ou '2ème intention' avec le motif d'indication (ex: '[OU] Alternative (Si contre-indication au traitement topique ou épidémie collective) : Ivermectine orale 200 µg/kg en prise unique').
   - SI deux traitements sont des alternatives exclusives (ex: topique vs oral pour la gale), ajoute OBLIGATOIREMENT l'avertissement : '⚠️ ALTERNATIVE : Ne pas associer le traitement topique et oral en première intention sauf forme grave/croûteuse'.

   **TRAITEMENT SYMPTOMATIQUE / ADJUVANT (Si besoin / En option) :**
   - Traitements de confort ciblés uniquement sur les symptômes associés (ex: 'Uniquement en cas de prurit intense : Anti-histaminique H1...').

RÈGLES ET CONTRAINTES STRICTES :
1. Synthétise un contenu médical rigoureux en combinant le Web RAG direct et le PDF Index.
2. Posologies explicites : Pour tout médicament, précise la forme, la dose et la fréquence (ex: Paracétamol 1g 3x/j, max 3g/j).
3. Aucun texte fictif ou générique (INTERDICTION TOTALE de: "lorem ipsum", "todo", "à compléter", "sample text", "sans objet", etc.).
4. Si le sujet est pédiatrique, la posologie DOIT obligatoirement être exprimée en dose-poids ou mg/kg/j.
`;

  if (isAdmin) {
    systemPrompt += `
STRUCTURE STRICTEMENT ADMINISTRATIVE LOCK :
Tu dois générer un objet JSON structuré pour une CAT administrative (certificat, attestation, lettre de liaison).
LE CHAMP "summary" DOIT STRICTEMENT CONTENIR LES 3 SECTIONS SUIVANTES (UTILISE EXACTEMENT CES TITRES EN MARKDOWN) :
**1. Principes de rédaction :**
(Regles medico-legales, consentement, secret medical)
**2. Structure type :**
(Mentions obligatoires, corps du texte, formule de conclusion)
**3. Cadre réglementaire :**
(Textes de loi, responsabilite, conservation)

ATTENTION ADMINISTRATIVE : NE METS SURTOUT PAS le titre "Évaluation initiale & Diagnostic" car il s'agit d'un document administratif !
`;
  } else {
    systemPrompt += `
STRUCTURE STRICTEMENT CLINIQUE LOCK (5 ÉTAPES MANDATOIRES) :
Tu dois générer un objet JSON structuré pour une CAT clinique.
LE CHAMP "summary" DOIT STRICTEMENT CONTENIR LES 5 ÉTAPES SUIVANTES (UTILISE EXACTEMENT CES TITRES EN MARKDOWN) :
**1. Évaluation initiale & Diagnostic :**
(Interrogatoire, examen physique, signes d'alarme immédiats)
**2. Conduite à tenir :**
(Mise en condition, urgences immédiates, réflexes de prise en charge)
**3. Traitement :**
(Médicamenteux avec posologies exactes, non médicamenteux, règles hygiéno-diététiques)
**4. Examens complémentaires :**
(Bilan de 1ère intention et 2nde intention, imagerie, biologie)
**5. Orientation / Avis Spécialisé :**
(Critères d'hospitalisation, suivi ambulatoire, orientation)
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
  "ordonnance": "Modèle de prescription type prêt à l'emploi avec posologies..."
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

  while (attempts < maxAttempts) {
    attempts++;
    console.log(`🤖 LLM Generation Attempt ${attempts}/${maxAttempts} for "${cleanTitle}"...`);
    
    const apiResult = await callLLMApi(systemPrompt, userPrompt, options);
    executionMetrics = apiResult.metrics;

    try {
      const cleanJson = apiResult.text
        .replace(/^```json/i, '')
        .replace(/^```/, '')
        .replace(/```$/, '')
        .trim();
      catResult = JSON.parse(cleanJson);

      // Enforce search_keywords array
      if (!Array.isArray(catResult.search_keywords) || catResult.search_keywords.length === 0) {
        catResult.search_keywords = extractSmartKeywords(cleanTitle, options.search_keywords);
      }

      catResult.id = options.id || Date.now();
      catResult.category = category || catResult.category || 'Gastro-entérologie';
      catResult.title = cleanTitle;
      catResult.pdf_keywords = pdfKeywords;
      catResult.online_verification_queries = buildSearchQueries(cleanTitle).map(q => q.queryUrl).slice(0, 3);

      // Validate using Medical Validator
      const validation = validateCAT(catResult);
      if (validation.valid) {
        console.log(`✅ Medical Checksum PASSED on Attempt ${attempts}!`);
        catResult._execution_metrics = executionMetrics;
        return { cat: catResult, validation, metrics: executionMetrics };
      } else {
        console.warn(`❌ Medical Validation Checksum Failed (Attempt ${attempts}):`, validation.errors);
      }
    } catch (parseErr) {
      console.warn(`⚠️ JSON parse error on attempt ${attempts}: ${parseErr.message}`);
    }
  }

  if (catResult) {
    catResult._execution_metrics = executionMetrics;
    const finalValidation = validateCAT(catResult);
    return { cat: catResult, validation: finalValidation, metrics: executionMetrics };
  }

  throw new Error(`Failed to generate valid CAT for "${cleanTitle}" after ${maxAttempts} attempts.`);
}

module.exports = {
  callLLMApi,
  generateCATWithLLM
};
