/**
 * Dr. CAT — Comprehensive Quiz Suite Generator Engine (V2)
 * Generates an extensive, doctor-grade training suite (10 to 15 items) per CAT:
 * - 2 Multi-stage Real Clinical Vignettes (KFQs & SCTs with patient vitals & rationales)
 * - 4 Smart Diagnosis & Orientation MCQs
 * - 4 Realistic Prescription & Dosage MCQs
 * - 2 Vital Red Flags written scenarios
 * Stored in staging (quiz_db_staged.json) before publishing to public/data/quiz_db.json
 */

const fs = require('fs');
const path = require('path');
const { callLLMApi } = require('./llm-engine');

const QUIZ_STAGED_PATH = path.join(__dirname, '..', 'quiz_db_staged.json');
const QUIZ_PROD_PATH = path.join(__dirname, '..', '..', 'public', 'data', 'quiz_db.json');

/**
 * Validate a quiz suite for a given CAT
 */
function validateQuizSuite(suite) {
  if (!suite || typeof suite !== 'object') return false;
  if (!suite.cat_id || !suite.title || !Array.isArray(suite.vignettes)) return false;
  return true;
}

/**
 * Generate a complete, rich clinical quiz suite for 1 CAT
 */
async function generateQuizSuiteForCat(cat, options = {}) {
  if (!cat || !cat.title || !cat.summary) {
    throw new Error("Invalid CAT object provided for quiz suite generation.");
  }

  const systemPrompt = `Tu es le Directeur Pédagogique et Docimologue en Chef de Dr. CAT.
Ta mission est de créer une BANQUE DE QUESTIONS MÉDICALES D'ÉLITE (Niveau Concours / Internat / Pratique Réelle) basée sur la fiche CAT fournie.

RÈGLES DOCIMOLOGIQUES :
1. VIGNETTES CLINIQUES RÉELLES (2 cas complets multi-étapes) :
   - Présente un patient concret (âge, sexe, terrain, motif et constantes vitales à l'arrivée : TA, FC, T°, SpO2).
   - Étape 1 : Réflexe d'urgence ou reconnaissance d'un drapeau rouge (Key Feature).
   - Étape 2 : Choix thérapeutique de 1ère intention ou adaptation au terrain.
   - Fournis 3 options par étape avec une JUSTIFICATION PHARMACOLOGIQUE/MÉDICALE ("rationale") pour chaque option.

2. QCMS D'ORIENTATION & DIAGNOSTIC (3 à 4 questions) :
   - Questions sémiologiques et paracliniques pointues (pas de copier-coller brut).
   - 4 choix : 1 exact + 3 pièges cliniques plausibles.

3. QCMS D'ORDONNANCES & POSOLOGIES (3 à 4 questions) :
   - Comparatif de 4 ordonnances réelles : 1 exacte conforme à la CAT + 3 ordonnances avec erreurs fréquentes (sous-dosage, durée inadaptée, contre-indication de terrain).

4. ÉPREUVES RÉDIGÉES DE DRAPEAUX ROUGES (2 questions) :
   - Mise en situation demandant de citer les signes de gravité imposant l'hospitalisation immédiate.

RÉPONDS EXCLUSIVEMENT AVEC UN OBJET JSON VALIDE AU FORMAT :
{
  "cat_id": ${cat.id},
  "title": "${cat.title}",
  "category": "${cat.category || 'Général'}",
  "vignettes": [
    {
      "id": "vig_${cat.id}_01",
      "level": "intermédiaire",
      "patient": {
        "age": 35,
        "sex": "M",
        "terrain": "Sans antécédent",
        "presentation": "Arrive aux urgences pour... Constantes : TA 120/80, FC 80, T° 37.5°C."
      },
      "stages": [
        {
          "stage_index": 1,
          "type": "key_feature",
          "title_step": "Étape 1 : Décision Initiale",
          "prompt": "Quelle est votre conduite immédiate ?",
          "options": [
            { "text": "Option A...", "correct": false, "rationale": "Explication du piège..." },
            { "text": "Option B (Exacte)...", "correct": true, "rationale": "Justification..." },
            { "text": "Option C...", "correct": false, "rationale": "Explication..." }
          ]
        },
        {
          "stage_index": 2,
          "type": "prescription_choice",
          "title_step": "Étape 2 : Traitement",
          "prompt": "Quelle est la prescription optimale ?",
          "options": [
            { "text": "Prescription A...", "correct": true, "rationale": "Explication..." },
            { "text": "Prescription B...", "correct": false, "rationale": "Explication..." }
          ]
        }
      ]
    }
  ],
  "qcm_diagnostics": [
    {
      "question": "Question diagnostique...",
      "options": ["Choix A", "Choix B", "Choix C", "Choix D"],
      "correctIndex": 0,
      "rationale": "Explication médicale..."
    }
  ],
  "qcm_prescriptions": [
    {
      "question": "Quelle est l'ordonnance de 1ère intention adaptée ?",
      "options": ["Ordonnance A", "Ordonnance B", "Ordonnance C", "Ordonnance D"],
      "correctIndex": 0,
      "rationale": "Justification pharmacologique..."
    }
  ],
  "red_flags_cases": [
    {
      "prompt": "Quels sont les critères d'urgence vitale à éliminer ?",
      "expected_keywords": ["choc", "déshydratation", "oligurie"],
      "model_answer": "Signes de choc, déshydratation > 10%..."
    }
  ]
}`;

  const userPrompt = `GÉNÈRE LE SET DE QUESTIONS MÉDICALES COMPLET POUR :
Titre : ${cat.title}
Catégorie : ${cat.category}

SYNTHÈSE CLINIQUE :
${cat.summary}

SIGNES DE GRAVITÉ (RED FLAGS) :
${cat.red_flags || 'Aucun'}

ORDONNANCE TYPE DE RÉFÉRENCE :
${cat.ordonnance || 'Aucune'}`;

  const apiResult = await callLLMApi(systemPrompt, userPrompt, { temperature: 0.2 });
  const responseText = apiResult.text || '';
  
  const jsonMatch = responseText.match(/\{[\s\S]*\}/);
  if (!jsonMatch) {
    throw new Error("LLM did not return valid JSON for quiz suite.");
  }

  const suite = JSON.parse(jsonMatch[0]);
  return suite;
}

/**
 * Helper to flatten all vignettes from staged quiz suite into public format
 */
function exportToPublicQuizDb(suites) {
  const flattenedVignettes = [];
  suites.forEach(s => {
    if (Array.isArray(s.vignettes)) {
      s.vignettes.forEach(v => {
        flattenedVignettes.push({
          ...v,
          cat_id: s.cat_id,
          title: s.title,
          category: s.category
        });
      });
    }
  });
  return flattenedVignettes;
}

module.exports = {
  validateQuizSuite,
  generateQuizSuiteForCat,
  exportToPublicQuizDb,
  QUIZ_STAGED_PATH,
  QUIZ_PROD_PATH
};
