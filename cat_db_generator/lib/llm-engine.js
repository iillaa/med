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
      const filtered = applyModelBlocklist(models);
      cachedDynamicModels = filtered;
      lastModelDiscoveryTime = now;
      console.log(`🤖 [Dynamic LLM Discovery] Discovered ${models.length} active models (${models.length - filtered.length} blocklisted). Top primary: ${filtered[0] || 'NONE'}`);
      return filtered;
    }
  } catch (err) {
    console.warn(`⚠️ Dynamic model discovery failed: ${err.message}. Using fallback model list.`);
  }

  return applyModelBlocklist(FALLBACK_GEMINI_MODELS);
}

const V3_DB_PATH = path.join(__dirname, '..', 'cats_db_v3_generated.json');
const V2_DB_PATH_FALLBACK = path.join(__dirname, '..', 'cats_db_v2_generated.json');

function getV3DbPath() {
  if (!fs.existsSync(V3_DB_PATH) && fs.existsSync(V2_DB_PATH_FALLBACK)) {
    try { fs.renameSync(V2_DB_PATH_FALLBACK, V3_DB_PATH); } catch (_) {}
  }
  return fs.existsSync(V3_DB_PATH) ? V3_DB_PATH : V2_DB_PATH_FALLBACK;
}

function getHumanEditMemory(title) {
  const dbPath = getV3DbPath();
  if (fs.existsSync(dbPath)) {
    try {
      const db = JSON.parse(fs.readFileSync(dbPath, 'utf8'));
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
/**
 * Filters out models matching the GEMINI_BLOCKLIST env var (comma-separated substrings).
 * Protects against a bad/experimental Google model auto-becoming primary via version sort.
 * Example: GEMINI_BLOCKLIST="flash-preview, exp"
 */
function applyModelBlocklist(models) {
  const blocklist = (process.env.GEMINI_BLOCKLIST || '')
    .split(',')
    .map(s => s.trim().toLowerCase())
    .filter(Boolean);
  if (!blocklist.length) return Array.isArray(models) ? models.slice() : [];
  return (models || []).filter(m => {
    const name = String(m).toLowerCase();
    return !blocklist.some(b => name.includes(b));
  });
}

async function callLLMApi(systemPrompt, userPrompt, options = {}) {
  const apiKey = options.apiKey || process.env.GOOGLE_API_KEY || process.env.GEMINI_API_KEY;
  if (!apiKey) {
    throw new Error('LLM API Key missing! Set GOOGLE_API_KEY or GEMINI_API_KEY in .env');
  }

  // Discover highest dynamic active models from Google API
  const dynamicModels = await discoverDynamicModels(apiKey);
  let modelsToTry = options.model ? [options.model, ...dynamicModels] : dynamicModels;
  modelsToTry = applyModelBlocklist(modelsToTry);
  if (modelsToTry.length === 0) {
    throw new Error('GEMINI_BLOCKLIST a filtré tous les modèles disponibles. Vérifier la variable GEMINI_BLOCKLIST dans .env.');
  }
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

  // 1. Tier 1: Core Curated Reference Documents (PDF Index)
  console.log(`🔍 [Tier 1 Core References] Searching pdf_index.json for "${cleanTitle}" (category: ${category})...`);
  const pdfMatches = await searchLocalPDFs(cleanTitle, { maxMatchesPerFile: 3, category });
  const ragSnippets = pdfMatches.flatMap(p => p.matches.map(m => `[Core Reference: ${p.pdfFile}] ${m.snippet}`)).join('\n');
  const pdfKeywords = pdfMatches.map(p => p.pdfFile.replace(/\.pdf$/i, '')).slice(0, 4);

  // 1bis. Tier 2: Standard Clinical Guidelines Library (MSF, HAS, SFMU, Colleges)
  const { queryClinicalLibrary } = require('./knowledge-library');
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

  // 4. Build Reputable Medical Sources Context
  const sourcesSummary = REPUTABLE_MEDICAL_SOURCES
    .map(s => `- ${s.name} (${s.domain}): ${s.category}`)
    .join('\n');

  // 5. Formulate System Prompt with Master Clinical Logic & Strict Schema Lock
  let systemPrompt = `Tu es le moteur d'intelligence médicale de Dr. CAT (Doctor Clinical Action Protocol) alimenté par Gemini 3.6 Flash (Dual RAG + Human Active Learning Engine).
Ta mission est de synthétiser et de structurer une conduite à tenir (CAT) clinique ou administrative hautement précise, vérifiée et conforme aux recommandations médicales actuelles.

SOURCES ET RÉFÉRENCES (4 ANCRES DE VÉRITÉ MÉDICALE) :
${sourcesSummary}
- Algérie : Ministère de la Santé (sante.gov.dz), CNPM (cnpm.org.dz), SAMI (samidz.com).
- France & International : Vidal, HAS, SFMU, ANSM, MSF, WHO/OMS, CRAT.

1. HIÉRARCHIE DES SOURCES DE CONNAISSANCES :
   - PRIORITÉ 1 (SOCLE CLINIQUE DE RÉFÉRENCE) : FICHES DÉDIÉES DU CORPUS LOCAL (PDF Index)
     * Utilise les molécules disponibles localement, les posologies usuelles et les habitudes de prescription comme ancre thérapeutique prioritaire.
   - PRIORITÉ 2 (ENRICHISSEMENT CLINIQUE EN LIGNE) : DONNÉES WEB RAG (PubMed/NCBI, MSD Manuals, MedG, Wiki FR)
     * Fournit les critères diagnostiques récents, les scores pronostiques et les bilans paracliniques recommandés.
   - PRIORITÉ 3 (MÉMOIRE MÉDICALE ACTIVE) : Corrections et préférences de l'utilisateur médecin.
   - PRIORITÉ 4 (SYNTHÈSE ET VALIDATION) : Moteur de raisonnement Gemini (structuration élégante, fluidité médicale et anti-hallucination).

2. RÈGLE DE RÉDACTION DE L'ORDONNANCE (RÉPLIQUE RÉELLE EN 4 SECTIONS) :
   - Le champ "ordonnance" est une RÉPLIQUE CONCRÈTE D'ORDONNANCE DE CABINET prête à être imprimée/copiée.
   - Interdiction formelle de la liste plate numérotée (1, 2, 3, 4) confondant traitements et alternatives.
   - Structuration obligatoire en Markdown :

   **TRAITEMENT NON MÉDICAMENTEUX & RHD :**
   - Mesures diététiques, hydratation, repos, kinésithérapie, éviction des toxiques et éducation du patient.

   **1ère INTENTION (Traitement médicamenteux de choix) :**
   - DCI et/ou nom commercial usuel, forme galénique exacte (cp, sirop, sachet), posologie journalière concrète (ex: 1 cp matin, midi et soir au milieu des repas pendant 7 jours).
   - ⚠️ Mentionner le rappel d'allergie préalable si pertinent (ex: 'Vérifier l'absence d'allergie aux pénicillines/bêta-lactamines').

   **ALTERNATIVES [OU] (En cas d'allergie, échec, intolérance ou terrain spécifique) :**
   - Précéder TOUJOURS par la mention claire '[OU] Alternative' ou '2ème intention' avec le motif clinique (ex: '[OU] Alternative si allergie aux pénicillines : Azithromycine 500 mg à J1 puis 250 mg/j de J2 à J5').
   - Si deux traitements sont des alternatives exclusives, ajouter : '⚠️ ALTERNATIVE : Ne pas associer en première intention'.

   **TRAITEMENT SYMPTOMATIQUE / ADJUVANT (Si besoin / En option) :**
   - Traitements de confort ciblés uniquement sur les symptômes associés (ex: 'Uniquement si fièvre > 38.5°C : Paracétamol 1g...').

   **RÈGLE UNIVERSELLE ZÉRO POSOLOGIE VAGUE :**
   - Chaque ligne médicamenteuse DOIT comporter : [DCI] + [Nom commercial usuel] + [Forme galénique précise (cp, sachet, sirop)] + [Posologie journalière explicite en mg/g ou dose-poids] + [Fréquence de prise] + [Durée chiffrée en jours ou semaines]. Interdiction des mentions floues type "dose usuelle", "à adapter", "selon le cas".

3. RÈGLES DE SÉCURITÉ CLINIQUE PAR TERRAIN (INVARIANTS TRANSVERSAUX) :
   - Pédiatrie : Posologies obligatoirement exprimées en dose-poids (mg/kg/j ou cuillère-mesure selon le poids). Rappel du seuil néonatal (< 2 mois = avis spécialisé/hospitalier).
   - Grossesse / Allaitement : Respect strict des données du CRAT. Mentionner les contre-indications absolues (ex: IEC/ARA2, AINS aux T2/T3).
   - Insuffisance Rénale / Gériatrie : Adapter les doses selon le DFG (Cockcroft) et éliminer les molécules néphrotoxiques.
   - Anti-Hallucination : N'invente AUCUNE section pédiatrique ou gynécologique si la pathologie ne la concerne pas.

4. SOUS-PROFILS CLINIQUES ET SUB-CATS DÉDIÉS :
   - Pour CHAQUE sous-fiche ("sub_cats"), le champ "summary" DOIT suivre ce format condensé en 4 étapes :
     **0. Spécificités & Urgence du Profil :** (Mesures réflexes, détresse, seuils d'alerte vitale)
     **1. Diagnostic & Particularités Cliniques :** (Formes atypiques, examens spécifiques à ce profil)
     **2. Prise en Charge & Adaptation Thérapeutique :** (Molécules autorisées, posologies adaptées mg/kg/j ou DFG, exclusions)
     **3. Surveillance, Hospitalisation & Suivi :** (Critères d'admission, délai de contrôle)
   - Le champ "ordonnance" de chaque sous-fiche DOIT suivre la réplique en 4 sections (**TRAITEMENT NON MÉDICAMENTEUX & RHD**, **1ère INTENTION**, **ALTERNATIVES [OU]**, **TRAITEMENT SYMPTOMATIQUE / ADJUVANT**).
   - INTERDICTION STRICTE DE LIENS MARKDOWN DANS LE SUMMARY : Ne génère JAMAIS de liens ou boutons markdown type [🚨 Ouvrir la Sous-Fiche ...](subcat:1) ou [👶 Sous-Fiche ...](subcat:2) dans le texte du summary principal. L'application affiche automatiquement des onglets interactifs.
`;

  if (Array.isArray(options.requestedSubCats) && options.requestedSubCats.length > 0) {
    systemPrompt += `
DEMANDE EXPLICITE DE SOUS-FICHES PAR LE MÉDECIN (GÉNÉRATION MULTI-PROFILS SUR-MESURE) :
L'utilisateur médecin a expressément demandé d'inclure les sous-fiches suivantes dans le tableau "sub_cats" :
${options.requestedSubCats.map((sub, i) => `${i + 1}. "${sub}"`).join('\n')}

DIRECTIVES IMPÉRATIVES :
- Génère EXACTEMENT ces ${options.requestedSubCats.length} sous-fiches dans le tableau JSON "sub_cats" en plus de la fiche principale.
- Chaque sous-fiche dans "sub_cats" doit comporter : "label" (emoji + nom clair), "summary" (4 étapes), "red_flags", "ordonnance" (4 sections).
- Non-contradiction et cohérence absolue entre la fiche principale (Master) et chaque sous-fiche.
`;
  } else if (options.standardSingleOnly) {
    systemPrompt += `
MODE 1-TAB STANDARD STRICT :
Ne génère AUCUNE sous-fiche ("sub_cats": []). Concentre toute l'information essentielle dans la fiche principale en 1 onglet unique rapide et dense.
`;
  } else {
    systemPrompt += `
MODE STANDARD AUTOMATIQUE :
Si la pathologie présente des complications aiguës majeures, des formes graves ou des profils cliniques distincts nécessitant une prise en charge dédiée (ex: Diabète ➔ Acidocétose, Diarrhée ➔ SRO Enfant / Forme fébrile glairo-sanglante, HTA ➔ Urgence hypertensive), génère 1 à 3 sous-fiches pertinentes dans "sub_cats" selon le besoin clinique réel. Si la pathologie est simple ou univoque, "sub_cats" sera vide [].
`;
  }

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
STRUCTURE MODULAIRE CLINIQUE DU CHAMP "summary" (Inclure uniquement les étapes pertinentes. Ne JAMAIS écrire "sans objet" ou "non disponible" ; si une étape n'est pas pertinente, l'omettre entièrement) :
- **0. Stabilisation Immédiate & ABCDE :** (Uniquement en cas d'urgence vitale détresse respiratoire/choc/coma. Omettre si non-urgent).
- **1. Évaluation initiale & Diagnostic :** (Interrogatoire, sémiologie clinique fine, critères diagnostiques positifs).
- **2. Conduite immédiate si drapeau rouge :** (Mesures urgentes : transfert SMUR, hospitalisation, isolement, arrêt du traitement suspect. Ne pas dupliquer la liste descriptive des symptômes qui figure dans le champ red_flags).
- **3. Examens complémentaires :** (Bilan de 1ère intention et 2nde intention, imagerie, biologie, ECG).
- **3bis. Terrain, Comorbidités & Contrôle Iatrogène :** (Filtre Allergies, adaptation au DFG/clairance, précautions grossesse/pédiatrie, évitement des interactions médicamenteuses à risque. Omettre entièrement si sans objet).
- **4. Prise en charge & Stratégie Thérapeutique :** (Stratégie thérapeutique globale, mesures d'hygiène/RHD, et DCI académiques de référence avec leurs fourchettes posologiques cibles ex: Amoxicilline 50-80 mg/kg/j).
- **5. Orientation, Suivi & Volet Médico-Légal :** (Suivi ambulatoire vs hospitalier, éviction scolaire/collective, MDO - Maladies à Déclaration Obligatoire, aptitude à la conduite, ALD 30, arrêt de travail).
`;
  }

  systemPrompt += `
FORMAT DE RÉPONSE ATTENDU (EXCLUSIVEMENT DU JSON VALIDE) :
{
  "category": "${category || 'Gastro-entérologie'}",
  "title": "${cleanTitle}",
  "search_keywords": ["mot-clé 1", "mot-clé 2"],
  "summary": "...",
  "red_flags": "Critères de gravité / Signes d'alarme cliniques (liste à puces)...",
  "ordonnance": "Réplique d'ordonnance de cabinet en 4 sections...",
  "sub_cats": [
    {
      "label": "🚨 Nom de la sous-fiche spécialisée",
      "summary": "**0. Spécificités & Urgence du Profil :** ...\\n**1. Diagnostic & Particularités Cliniques :** ...\\n**2. Prise en Charge & Adaptation Thérapeutique :** ...\\n**3. Surveillance, Hospitalisation & Suivi :** ...",
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

--- 📚 DUAL RAG CHANNEL 2 (TIER 1): DOCUMENTS DE RÉFÉRENCE CORPUS (PDF INDEX) ---
${ragSnippets || 'Aucun extrait PDF trouvé directement.'}

--- 🏛️ DUAL RAG CHANNEL 2 (TIER 2): GUIDES CLINIQUES STANDARDS (MSF / HAS / SFMU / COLLÈGES) ---
${librarySnippets || 'Aucun guide standard spécifique trouvé pour cette pathologie.'}`;

  // 4. Execution & Automated Anti-Hallucination Validation Checksum Loop (Up to 3 Attempts)
  let attempts = 0;
  const maxAttempts = 3;
  let catResult = null;
  let executionMetrics = null;
  let previousValidationErrors = [];
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
    
    let currentPrompt = userPrompt;
    if (previousValidationErrors.length > 0) {
      currentPrompt += `\n\n🚨 ATTENTION — TENTATIVE PRÉCÉDENTE REJETÉE PAR LE VALIDATEUR CLINIQUE :\n` +
        previousValidationErrors.map(e => `- ${e}`).join('\n') +
        `\n👉 INSTRUCTION DE CORRECTION : Corrige STRICTEMENT ces erreurs médicales/structurelles dans ta nouvelle réponse JSON !`;
    }

    const apiResult = await callLLMApi(systemPrompt, currentPrompt, options);
    executionMetrics = apiResult.metrics;

    try {
      catResult = safeParseLLMJson(apiResult.text);
      catResult._raw_llm_response = apiResult.text;
      catResult._raw_prompts = { systemPrompt, userPrompt: currentPrompt };

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

  const { extractSmartKeywords } = require('./web-fetcher');

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
   - Grossesse / Allaitement : Respect strict des données du CRAT (Centre de Référence sur les Agents Tératogènes). Mentionner clairement les molécules sûres et proscrire les tératogènes (ex: AINS aux T2/T3, IEC/ARA2).
   - Sujet Âgé / Gériatrie : Adapter les posologies selon le DFG (Cockcroft), la fonction hépatique et la fragilité globale (règle « start low, go slow » avec posologies initiales prudentes). Proscrire les médicaments inappropriés chez le sujet âgé (BZD à demi-vie longue, molécules à fort effet anticholinergique comme l'Hydroxyzine ➔ risque majeur de chutes, rétention d'urine et confusion).
   - Pédiatrie / Nourrisson : Posologies obligatoires en mg/kg/j ou cuillère-mesure selon le poids, formes adaptées (sirops/gouttes), critères stricts d'hospitalisation (< 2-3 mois).
   - Insuffisance Rénale / Hépatique : Ajustement posologique précis selon la clairance et alternatives non-néphrotoxiques.
   - Formes Aiguës / Urgences : Conduite de réanimation immédiate, posologies de charge, critères d'alerte et transfert SMUR/Hospitalisation.
   - Volet Psychiatrique & Médico-Légal (Algérie) : Utiliser exclusivement « Hospitalisation Libre » ou « Hospitalisation Sans Consentement / Placement d'Office » (Loi sanitaire n° 18-11).

4. FORMAT DU SUMMARY (STRICTEMENT 4 ÉTAPES NUMÉROTÉES EN MARKDOWN) :
   **0. Spécificités & Urgence du Profil :** (Mesures réflexes, détresse, seuils d'alerte vitale sur ce terrain)
   **1. Diagnostic & Particularités Cliniques :** (Formes atypiques, examens ou pièges spécifiques à ce profil)
   **2. Prise en Charge & Adaptation Thérapeutique :** (Molécules de choix autorisées, posologies adaptées mg/kg/j ou DFG, exclusions)
   **3. Surveillance, Hospitalisation & Suivi :** (Critères d'admission, délai de contrôle)

5. FORMAT DE L'ORDONNANCE (RÉPLIQUE EXACTE EN 4 SECTIONS EN MARKDOWN) :
   **TRAITEMENT NON MÉDICAMENTEUX & RHD :**
   **1ère INTENTION (Traitement médicamenteux de choix) :**
   **ALTERNATIVES [OU] :**
   **TRAITEMENT SYMPTOMATIQUE / ADJUVANT :**

   **RÈGLE UNIVERSELLE ZÉRO POSOLOGIE VAGUE :**
   - Chaque ligne médicamenteuse de la sous-fiche DOIT comporter : [DCI] + [Nom commercial usuel] + [Forme galénique précise (cp, sachet, sirop)] + [Posologie journalière explicite en mg/g ou dose-poids] + [Fréquence de prise] + [Durée chiffrée en jours ou semaines]. Interdiction des mentions floues type "dose usuelle", "à adapter", "selon le cas".

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

  const { queryClinicalLibrary } = require('./knowledge-library');
  const libraryMatches = queryClinicalLibrary(searchQuery);
  const librarySnippets = libraryMatches.map(l => `[Standard Clinical Library: ${l.source} (${l.file})]\n${l.snippet}`).join('\n\n');

  let sourcesContext = '';
  if (ragSnippets) sourcesContext += `\n\n--- EXTRAITS PERTINENTS DU CORPUS MÉDICAL LOCAL (PDFs) ---\n${ragSnippets}`;
  if (librarySnippets) sourcesContext += `\n\n--- RECOMMANDATIONS CLINIQUES SPÉCIALISÉES (SFMU, MSF, Antibioclic, CRAT) ---\n${librarySnippets}`;

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

  const { validateCAT } = require('./medical-validator');
  let attempts = 0;
  const maxAttempts = 3;
  let previousValidationErrors = [];
  let subResult = null;
  let lastMetrics = null;

  while (attempts < maxAttempts) {
    attempts++;
    console.log(`🤖 Sub-CAT Generation Attempt ${attempts}/${maxAttempts} for "${parentCat.title}" -> "${subProfileDescription}"...`);

    let currentPrompt = userPrompt;
    if (previousValidationErrors.length > 0) {
      currentPrompt += `\n\n🚨 ATTENTION — TENTATIVE PRÉCÉDENTE REJETÉE PAR LE VALIDATEUR CLINIQUE :\n` +
        previousValidationErrors.map(e => `- ${e}`).join('\n') +
        `\n👉 INSTRUCTION DE CORRECTION : Corrige STRICTEMENT ces erreurs médicales/structurelles dans ta nouvelle réponse JSON !`;
    }

    const apiResult = await callLLMApi(systemPrompt, currentPrompt, options);
    lastMetrics = apiResult.metrics;

    try {
      subResult = safeParseLLMJson(apiResult.text);

      // Markdown Header Sanitizer
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
        
        // Metadata tags
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
  applyModelBlocklist
};
