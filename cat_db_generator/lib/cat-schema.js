/**
 * Universal Zod Schema & Gemini Response Schema Definition for Dr. CAT
 * Enforces strict clinical structure, 5-step clinical locks, and source tracking.
 */

const { z } = require('zod');

// 1. Clinical Fiche Synthèse Schema (5-Step Clinical Lock)
const FicheSyntheseSchema = z.object({
  evaluation_diagnostic: z.string().min(20, 'Section 1 (Évaluation initiale) est trop courte'),
  drapeaux_rouges: z.string().min(10, 'Section 2 (Drapeaux rouges) est trop courte'),
  examens_complementaires: z.string().optional().default(''),
  traitement_conduite: z.string().min(20, 'Section 4 (Traitement) est trop courte'),
  orientation_suivi: z.string().min(10, 'Section 5 (Orientation) est trop courte')
});

// 2. Structured Prescription Schema (Multiple & Adaptive Variants)
const OrdonnanceSchema = z.object({
  adulte: z.string().min(10, 'Ordonnance adulte requise'),
  enfant: z.string().optional().default(''),
  alternatives: z.string().optional().default(''),
  conseils_hygieno_dietetiques: z.string().optional().default('')
});

// 3. Source Attribution Tagging Schema
const SourceAttributionSchema = z.object({
  type: z.enum(['pdf', 'clinical_library', 'web_cache', 'doctor_custom_url', 'human_edit']),
  name: z.string(),
  page: z.number().int().optional(),
  category: z.string().optional(),
  score: z.number().optional()
});

// 4. Master CAT Database Record Schema (handles both legacy and V3 schemas)
const CatRecordSchema = z.object({
  id: z.union([z.string(), z.number()]),
  titre: z.string().optional(),
  title: z.string().optional(),
  specialite: z.string().optional(),
  category: z.string().optional(),
  summary: z.string().optional().default(''),
  red_flags: z.union([z.array(z.string()), z.string()]).optional().default([]),
  fiche_synthese: z.union([FicheSyntheseSchema, z.string()]).optional().default(''),
  ordonnance: z.union([OrdonnanceSchema, z.string()]).optional().default(''),
  sub_cats: z.array(z.any()).optional().default([]),
  sources: z.array(SourceAttributionSchema).optional().default([]),
  _human_edited: z.boolean().optional(),
  last_updated: z.string().optional()
}).refine(data => data.titre || data.title, {
  message: "Le champ 'titre' ou 'title' est obligatoire"
});

// 5. Gemini Flash Native JSON Schema (OpenAPI 3.0 subset)
const GEMINI_CAT_RESPONSE_SCHEMA = {
  type: "OBJECT",
  properties: {
    id: { type: "STRING", description: "Identifiant kebab-case unique en minuscules (ex: gale-scabiose)" },
    titre: { type: "STRING", description: "Titre clinique complet (ex: CAT devant une Gale)" },
    specialite: { type: "STRING", description: "Spécialité médicale principale (ex: Dermatologie, Urgences, Pédiatrie)" },
    summary: { type: "STRING", description: "Synthèse clinique exécutive rapide en 2-3 phrases claires" },
    red_flags: {
      type: "ARRAY",
      items: { type: "STRING" },
      description: "Liste des signes de gravité imposant une hospitalisation ou une alerte vitale"
    },
    fiche_synthese: {
      type: "STRING",
      description: "Fiche de synthèse clinique complète structurée en 5 étapes markdown (## 1. Évaluation initiale, ## 2. Drapeaux rouges, ## 3. Examens, ## 4. Traitement, ## 5. Orientation)"
    },
    ordonnance: {
      type: "STRING",
      description: "Ordonnance type avec variantes (--- Adulte ---, --- Enfant ---) avec DCI, forme, posologie et durée"
    }
  },
  required: ["id", "titre", "specialite", "summary", "red_flags", "fiche_synthese", "ordonnance"]
};

/**
 * Validates any CAT object against the Zod clinical schema
 * @param {object} cat 
 * @returns {{ valid: boolean, errors?: string[], data?: any }}
 */
function validateCatWithZod(cat) {
  const result = CatRecordSchema.safeParse(cat);
  if (result.success) {
    return { valid: true, data: result.data };
  } else {
    const issues = result.error.issues || [];
    const errorMessages = issues.map(e => `${e.path.join('.')}: ${e.message}`);
    return { valid: false, errors: errorMessages };
  }
}

module.exports = {
  FicheSyntheseSchema,
  OrdonnanceSchema,
  SourceAttributionSchema,
  CatRecordSchema,
  GEMINI_CAT_RESPONSE_SCHEMA,
  validateCatWithZod
};
