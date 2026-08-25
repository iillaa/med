/**
 * Dr. CAT — Clinical Vignette & Progressive Quiz V2 Generator Engine
 * Generates structured, progressive clinical reasoning cases (KFQs & SCTs)
 * stored in a dedicated database (quiz_db.json) separated from cats_db.json.
 */

const fs = require('fs');
const path = require('path');
const { callLLM } = require('./llm-engine');

const QUIZ_STAGED_PATH = path.join(__dirname, '..', 'quiz_db_staged.json');
const QUIZ_PROD_PATH = path.join(__dirname, '..', 'public', 'data', 'quiz_db.json');

/**
 * Zod-like validation for a Clinical Vignette Object
 */
function validateVignette(vignette) {
  if (!vignette || typeof vignette !== 'object') return false;
  if (!vignette.cat_id || !vignette.title || !vignette.patient || !Array.isArray(vignette.stages)) {
    return false;
  }
  if (vignette.stages.length < 2) return false;
  for (const stage of vignette.stages) {
    if (!stage.prompt || !Array.isArray(stage.options) || stage.options.length < 2) {
      return false;
    }
    const hasCorrect = stage.options.some(o => o.correct === true);
    if (!hasCorrect) return false;
  }
  return true;
}

/**
 * Generate high-yield clinical reasoning vignettes for a single CAT
 */
async function generateVignettesForCat(cat) {
  if (!cat || !cat.title || !cat.summary) {
    throw new Error("Invalid CAT object provided for vignette generation.");
  }

  const systemPrompt = `Tu es le Directeur Pédagogique et Docimologue de Dr. CAT.
Ta mission est de créer des VIGNETTES CLINIQUES DE HAUT NIVEAU MÉDICAL (Key Feature Questions & Tests de Concordance de Script) basées sur la conduite à tenir fournie.

RÈGLES DOCIMOLOGIQUES STRICTES :
1. LE DÉCOR (Patient & Contexte Réel) :
   - Présente un patient concret (âge, sexe, antécédents/terrain, motif d'admission, constantes vitales réelles).
   - Utilise la 2ème personne du singulier ou du pluriel ("Vous recevez aux urgences...", "En consultation...").

2. PROGRESSION EN 2 OU 3 ÉTAPES CLINIQUES (STAGES) :
   - ÉTAPE 1 (Key Feature / Urgence) : Décision critique immédiate (Reconnaissance d'un Red Flag, geste de déchocage, examen clé).
   - ÉTAPE 2 (Thérapeutique de 1ère intention) : Choix de l'ordonnance exacte avec posologie et durée conforme à la fiche.
   - ÉTAPE 3 (Évolution / Terrain particulier) : Survenue d'une complication, allergie ou terrain spécifique (ex: Enfant, Femme enceinte, Insuffisance rénale).

3. PROPOSITIONS & JUSTIFICATIONS :
   - Fournis 3 ou 4 options crédibles par étape (1 seule correcte, les autres étant des pièges fréquents en pratique clinique).
   - CHAQUE OPTION DOIT COMPORTER UNE "rationale" (explication pharmacologique ou sémiologique claire).

RÉPONDS EXCLUSIVEMENT AVEC UN TABLEAU JSON VALIDE :
[
  {
    "id": "vig_${cat.id}_01",
    "cat_id": ${cat.id},
    "title": "${cat.title}",
    "category": "${cat.category || 'Général'}",
    "difficulty": "intermédiaire",
    "patient": {
      "age": 45,
      "sex": "M",
      "terrain": "Diabétique type 2",
      "presentation": "Description clinique initiale avec constantes vitales..."
    },
    "stages": [
      {
        "stage_index": 1,
        "type": "key_feature",
        "title_step": "Étape 1 : Évaluation Initiale & Décision d'Urgence",
        "prompt": "Question clinique précise sur la décision immédiate...",
        "options": [
          { "text": "Option A...", "correct": false, "rationale": "Explication du piège..." },
          { "text": "Option B (Exacte)...", "correct": true, "rationale": "Justification conforme aux recommandations..." },
          { "text": "Option C...", "correct": false, "rationale": "Explication..." }
        ]
      },
      {
        "stage_index": 2,
        "type": "prescription_choice",
        "title_step": "Étape 2 : Stratégie Thérapeutique & Posologie",
        "prompt": "Le bilan confirme le diagnostic. Quelle est la prescription optimale de sortie ?",
        "options": [
          { "text": "Prescription A...", "correct": true, "rationale": "Traitement de 1ère intention validé..." },
          { "text": "Prescription B...", "correct": false, "rationale": "Sous-dosage ou durée inadaptée..." }
        ]
      }
    ]
  }
]`;

  const userPrompt = `GÉNÈRE 1 OU 2 VIGNETTES CLINIQUES DÉTAILLÉES POUR :
Titre : ${cat.title}
Spécialité : ${cat.category}
Synthèse clinique :
${cat.summary}

Signes de Gravité :
${cat.red_flags || 'Aucun'}

Ordonnance de Référence :
${cat.ordonnance || 'Aucune'}`;

  const responseText = await callLLM(systemPrompt, userPrompt, { temperature: 0.2 });
  
  // Extract JSON
  const jsonMatch = responseText.match(/\[\s*\{[\s\S]*\}\s*\]/);
  if (!jsonMatch) {
    throw new Error("LLM did not return a valid JSON array for vignettes.");
  }

  const vignettes = JSON.parse(jsonMatch[0]);
  return vignettes.filter(validateVignette);
}

module.exports = {
  validateVignette,
  generateVignettesForCat,
  QUIZ_STAGED_PATH,
  QUIZ_PROD_PATH
};
