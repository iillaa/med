/**
 * Medical Data & Anti-Hallucination Validator
 * Enforces strict medical schema integrity, 5-step clinical structure lock,
 * administrative template structure lock, mandatory red flags,
 * and a fully DYNAMIC drug safety engine loaded from drug-safety-rules.json.
 */

const path = require('path');
const fs = require('fs');
const { VALID_CATEGORIES } = require('./medical-sources');

// Load dynamic drug safety rules from JSON (no code change needed to add a drug)
let DRUG_SAFETY_RULES = [];
try {
  const rulesPath = path.join(__dirname, 'drug-safety-rules.json');
  const rulesData = JSON.parse(fs.readFileSync(rulesPath, 'utf8'));
  DRUG_SAFETY_RULES = rulesData.rules || [];
} catch (e) {
  console.warn('[Medical Validator] Could not load drug-safety-rules.json:', e.message);
}

// Load comprehensive clinical drug toxicity ceilings database
let CLINICAL_CEILINGS = {};
try {
  const ceilingsPath = path.join(__dirname, '..', 'data', 'clinical_drug_ceilings.json');
  const fallbackPath = path.join(__dirname, 'clinical_drug_ceilings.json');
  const targetPath = fs.existsSync(ceilingsPath) ? ceilingsPath : fallbackPath;
  if (fs.existsSync(targetPath)) {
    CLINICAL_CEILINGS = JSON.parse(fs.readFileSync(targetPath, 'utf8'));
  }
} catch (e) {
  console.warn('[Medical Validator] Could not load clinical_drug_ceilings.json:', e.message);
}

// Load official French BDPM / ANSM Pharmacopeia Database (15,857 medicines & 4,474 DCIs)
let BDPM_PHARMACOLOGY = null;
try {
  const bdpmPath = path.join(__dirname, '..', 'data', 'bdpm_pharmacology.json');
  const fallbackPath = path.join(__dirname, 'data', 'bdpm_pharmacology.json');
  const targetPath = fs.existsSync(bdpmPath) ? bdpmPath : fallbackPath;
  if (fs.existsSync(targetPath)) {
    BDPM_PHARMACOLOGY = JSON.parse(fs.readFileSync(targetPath, 'utf8'));
  }
} catch (e) {
  console.warn('[Medical Validator] Could not load bdpm_pharmacology.json:', e.message);
}

// Load official Algerian Drug Nomenclature Database (4,627 registered products & 1,358 DCIs)
let ALGERIAN_NOMENCLATURE = null;
try {
  const algPath = path.join(__dirname, '..', 'data', 'algerian_nomenclature.json');
  const fallbackPath = path.join(__dirname, 'data', 'algerian_nomenclature.json');
  const targetPath = fs.existsSync(algPath) ? algPath : fallbackPath;
  if (fs.existsSync(targetPath)) {
    ALGERIAN_NOMENCLATURE = JSON.parse(fs.readFileSync(targetPath, 'utf8'));
  }
} catch (e) {
  console.warn('[Medical Validator] Could not load algerian_nomenclature.json:', e.message);
}

const CLINICAL_REQUIRED_SECTION_PATTERNS = [
  { name: '1. Évaluation initiale & Diagnostic', regex: /(?:1\.|#+ 1\.)\s*(?:Évaluation initiale|Définition|Diagnostic)/i },
  { name: '2. Conduite immédiate si drapeau rouge / Signes de Gravité', regex: /(?:2\.|#+ 2\.)\s*(?:Drapeaux?\s*Rouges?|Signes?\s*de\s*Gravité|Conduite|Mesures?\s*urgentes?)/i },
  { name: '3. Examens complémentaires', regex: /(?:3\.|#+ 3\.)\s*(?:Examens complémentaires|Bilan)/i },
  { name: '4. Prise en charge & Stratégie Thérapeutique', regex: /(?:4\.|#+ 4\.|3\.)\s*(?:Prise en charge|Conduite à tenir|Traitement|Stratégie)/i },
  { name: '5. Orientation & Suivi', regex: /(?:5\.|#+ 5\.)\s*(?:Orientation|Suivi|Avis Spécialisé|Volet Médico-Légal)/i }
];

const ADMIN_REQUIRED_SECTION_PATTERNS = [
  { name: '1. Cadre Légal & Prérequis', regex: /(?:1\.|#+ 1\.)\s*(?:Cadre Légal|Principes|Prérequis|Réglementation|Généralités)/i },
  { name: '2. Structure & Mentions Obligatoires', regex: /(?:2\.|#+ 2\.)\s*(?:Structure|Mentions|Contenu|Rédaction|Éléments)/i },
  { name: '3. Formules Types & Modèles de Rédaction', regex: /(?:3\.|#+ 3\.)\s*(?:Formules Types|Modèles|Exemples|Trame|Textes|Cadre réglementaire|Réglementation|Volet Légal)/i }
];

const ADMIN_SUMMARY_SECTIONS = ADMIN_REQUIRED_SECTION_PATTERNS.map(p => p.name);

const FORBIDDEN_PLACEHOLDERS = [
  'lorem ipsum',
  'todo',
  'à compléter',
  'tbd',
  'sample text',
  'texte d\'exemple',
  '[remplir',
  '<remplir',
  'insérer ici',
  'insérer texte'
];

const DOSAGE_UNITS_REGEX = /(?:mg|g|gélule|comprimé|sachet|ampoule|cuillère|flacon|ui|ml|gouttes|application|injection|suppositoire|mg\/kg|dose-poids)/i;
const PEDIATRIC_KEYWORD_REGEX = /(?:pédiatr|enfant|nourrisson|nouveau-né|bébé|poids)/i;
const PEDIATRIC_DOSAGE_REGEX = /(?:mg\/kg|dose-poids|par kg|poids|mg\/kg\/j|mg\/kg\/jour)/i;

/**
 * Determines whether a CAT is administrative (non-clinical template)
 */
function isAdministrativeCAT(cat) {
  if (!cat) return false;
  const category = (cat.category || '').toLowerCase();
  const title = (cat.title || '').toLowerCase();
  return category === 'administratif' || 
    /certificat|attestation|lettre|rédaction|dossier|médico-légal|arrêt de travail/i.test(title);
}

/**
 * Validates a complete CAT object against strict medical & administrative schema standards
 * @param {object} cat 
 * @returns {{ valid: boolean, errors: Array<string>, warnings: Array<string> }}
 */
function validateCAT(cat) {
  const errors = [];
  const warnings = [];

  if (!cat || typeof cat !== 'object') {
    return { valid: false, errors: ['CAT object is null or not an object.'], warnings: [] };
  }

  // 1. ID check
  if (!cat.id || typeof cat.id !== 'number') {
    errors.push('Field "id" must be a positive integer.');
  }

  // 2. Category check
  if (!cat.category || !VALID_CATEGORIES.includes(cat.category)) {
    errors.push(`Field "category" must be one of: ${VALID_CATEGORIES.join(', ')}. Got: "${cat.category}"`);
  }

  // 3. Title check
  if (!cat.title || typeof cat.title !== 'string' || cat.title.trim().length < 5) {
    errors.push('Field "title" must be a descriptive string at least 5 characters long.');
  }

  // 4. Placeholder text check across all text fields
  const fullText = `${cat.title || ''} ${cat.summary || ''} ${cat.red_flags || ''} ${cat.ordonnance || ''}`.toLowerCase();
  for (const placeholder of FORBIDDEN_PLACEHOLDERS) {
    if (fullText.includes(placeholder)) {
      errors.push(`Anti-Hallucination Checksum Rejected: Detected forbidden placeholder or incomplete text ("${placeholder}").`);
    }
  }

  const isAdmin = isAdministrativeCAT(cat);

  // 5. Summary Structure Check
  if (!cat.summary || typeof cat.summary !== 'string') {
    errors.push('Field "summary" is required and must be markdown text.');
  } else {
    if (isAdmin) {
      // Exclude clinical headers from administrative templates
      if (cat.summary.includes('Évaluation initiale & Diagnostic')) {
        errors.push('Administrative Schema Error: Non-clinical administrative CAT must NOT include clinical header "Évaluation initiale & Diagnostic".');
      }
      for (const pattern of ADMIN_REQUIRED_SECTION_PATTERNS) {
        if (!pattern.regex.test(cat.summary)) {
          errors.push(`Administrative Schema Error: Missing mandatory administrative section: "${pattern.name}".`);
        }
      }
    } else {
      // Enforce 5-Step Clinical Structure Lock for Clinical CATs
      for (const pattern of CLINICAL_REQUIRED_SECTION_PATTERNS) {
        if (!pattern.regex.test(cat.summary)) {
          errors.push(`Clinical 5-Step Schema Lock Error: Missing mandatory section: "${pattern.name}".`);
        }
      }
    }

    if (cat.summary.trim().length < 200) {
      warnings.push('Summary content length is under 200 characters. Consider expanding details.');
    }
  }

  // 6. Red Flags Check
  if (!cat.red_flags || typeof cat.red_flags !== 'string' || cat.red_flags.trim().length < 15) {
    errors.push('Field "red_flags" (drapeaux rouges / urgences ou consignes de sécurité) is required.');
  }

  // 7. Ordonnance / Prescription Model Check & Pediatric Dosage Verification
  if (!cat.ordonnance || typeof cat.ordonnance !== 'string' || cat.ordonnance.trim().length < 15) {
    errors.push('Field "ordonnance" (prescription model / trame type) is required.');
  } else {
    if (!DOSAGE_UNITS_REGEX.test(cat.ordonnance)) {
      warnings.push('Ordonnance does not explicitly mention standard drug dosage units (mg, gélule, sachet, comprimé, etc.). Verify dosage precision.');
    }

    // Check pediatric weight-based dosing if clinical CAT is pediatric
    const isPediatric = PEDIATRIC_KEYWORD_REGEX.test(`${cat.title} ${cat.category} ${cat.summary}`);
    if (isPediatric && !PEDIATRIC_DOSAGE_REGEX.test(`${cat.summary} ${cat.ordonnance}`)) {
      warnings.push('Pediatric CAT detected: Ensure weight-based dosing (mg/kg or dose-poids) is explicitly provided.');
    }

    // --- DYNAMIC DRUG SAFETY ENGINE (loaded from drug-safety-rules.json) ---
    const ordTextLower = (cat.ordonnance || '').toLowerCase();
    const fullTextLower = `${cat.summary || ''} ${cat.ordonnance || ''}`.toLowerCase();

    for (const rule of DRUG_SAFETY_RULES) {
      const detectPattern = `(?:${rule.detect_regex})`;
      const detectRx = new RegExp(detectPattern, 'i');
      
      // 7a. Overdose checks (Daily Gram ceiling / Daily mg frequency / Pediatric mg/kg)
      if (detectRx.test(ordTextLower)) {
        if (rule.max_daily_dose_g) {
          const dailyMgMatch = ordTextLower.match(
            new RegExp(detectPattern + '[^.\\n]*?(\\d+)\\s*mg[^.\\n]*?(\\d+)\\s*(?:fois|x)\\/?j', 'i')
          );
          if (dailyMgMatch && dailyMgMatch[1] && dailyMgMatch[2]) {
            const singleMg = parseInt(dailyMgMatch[1], 10);
            const freq = parseInt(dailyMgMatch[2], 10);
            const totalMg = singleMg * freq;
            if (totalMg > rule.max_daily_dose_g * 1000) {
              errors.push(`[Safety Overdose] ${rule.name} : ${singleMg}mg × ${freq}/j = ${totalMg}mg/j dépasse la dose max de ${rule.max_daily_dose_g * 1000}mg/j. ${rule.error_message}`);
            }
          }

          const dailyGramMatch = ordTextLower.match(
            new RegExp(detectPattern + '[^.\\n]*?(\\d+(?:[.,]\\d+)?)\\s*g(?:/j|/jour|\\s+par\\s+jour)?', 'i')
          );
          if (dailyGramMatch && dailyGramMatch[1]) {
            const grams = parseFloat(dailyGramMatch[1].replace(',', '.'));
            if (grams > rule.max_daily_dose_g) {
              errors.push(`[Safety Overdose] ${rule.name} : ${grams}g dépasse la dose max journalière de ${rule.max_daily_dose_g}g/j. ${rule.error_message}`);
            }
          }
        }

        // Pediatric mg/kg check
        if (rule.pediatric_max_single_mg_per_kg && isPediatric) {
          const mgKgMatch = ordTextLower.match(
            new RegExp(detectPattern + '[^.\\n]*?(\\d+)\\s*mg\\/kg', 'i')
          );
          if (mgKgMatch && mgKgMatch[1]) {
            const dose = parseInt(mgKgMatch[1], 10);
            if (dose > rule.pediatric_max_single_mg_per_kg) {
              errors.push(`[Safety Pediatric] ${rule.name} : ${dose} mg/kg/prise dépasse la limite pédiatrique de ${rule.pediatric_max_single_mg_per_kg} mg/kg/prise. ${rule.error_message}`);
            }
          }
        }

        // 7b. Contraindication checks (Only if prescribed to contraindicated population without a warning clause)
        if (Array.isArray(rule.contraindications)) {
          for (const ci of rule.contraindications) {
            const ciRx = new RegExp(ci.trigger_regex, 'i');
            const targetPatientContext = `${cat.title || ''} ${cat.category || ''} ${ordTextLower}`;
            
            if (ciRx.test(targetPatientContext)) {
              // If the ordonnance contains explicit warning words ("ne pas", "contre-indiqué", "éviter", "attention"), it is an advisory, not an illegal prescription
              const isWarningClause = /(?:contre-indiqu[eé]|ne\s+pas|pas\s+de|[eé]viter|attention|ne\s+jamais|interdit|proscrit|sauf\s+si|absence\s+d[e'’]|si\s+allergie)/i.test(ordTextLower);
              if (!isWarningClause) {
                errors.push(`[Safety CI] ${rule.name} : ${ci.message}`);
              }
            }
          }
        }
      }
    }

    // --- 7c. COMPREHENSIVE PHARMACOLOGICAL CEILINGS & TOXICITY FIREWALL ---
    const allPrescriptionTexts = [ordTextLower];
    if (Array.isArray(cat.sub_cats)) {
      cat.sub_cats.forEach(s => {
        if (s.ordonnance) allPrescriptionTexts.push(s.ordonnance.toLowerCase());
      });
    }

    const isPregnancyContext = /(?:grossesse|enceinte|femme enceinte|gravidique|obstétrique)/i.test(`${cat.title || ''} ${cat.category || ''}`);

    for (const [key, drug] of Object.entries(CLINICAL_CEILINGS)) {
      const brandPatterns = [drug.dci, ...(drug.algerian_brands || [])]
        .map(b => b.toLowerCase().replace(/[.*+?^${}()|[\]\\]/g, '\\$&'))
        .join('|');
      const drugDetectRx = new RegExp(`(?:^|[^a-z0-9à-ÿ])(?:${brandPatterns})(?:$|[^a-z0-9à-ÿ])`, 'i');

      for (const pText of allPrescriptionTexts) {
        if (drugDetectRx.test(pText)) {
          // Check adult max daily ceiling in mg
          if (drug.adult_max_daily_ceiling_mg > 0) {
            // Pattern: [Drug] ... [number] mg ... [number] fois/j
            const mgFreqMatch = pText.match(new RegExp(`(?:${brandPatterns})[^.\\n]*?(\\d+(?:[.,]\\d+)?)\\s*mg[^.\\n]*?(\\d+)\\s*(?:fois|x|cp|gélules?|prises?)\\/?(?:j|jour)?`, 'i'));
            if (mgFreqMatch && mgFreqMatch[1] && mgFreqMatch[2]) {
              const singleDose = parseFloat(mgFreqMatch[1].replace(',', '.'));
              const freq = parseInt(mgFreqMatch[2], 10);
              const totalDose = singleDose * freq;
              if (totalDose > drug.adult_max_daily_ceiling_mg) {
                errors.push(`[Plafond Toxique] ${drug.dci} : la dose calculée de ${totalDose} mg/j dépasse le plafond toxique absolu de ${drug.adult_max_daily_ceiling_mg} mg/j.`);
              }
            }
          }

          // Pregnancy Contraindication Check
          if (isPregnancyContext && drug.pregnancy_safe === false) {
            const hasWarningClause = /(?:contre-indiqu[eé]|ne\s+pas|pas\s+de|[eé]viter|attention|ne\s+jamais|interdit|proscrit|proscrire)/i.test(pText);
            if (!hasWarningClause) {
              errors.push(`[Contre-indication Grossesse] ${drug.dci} (${drug.classe}) est formellement contre-indiqué en contexte obstétrique / grossesse.`);
            }
          }
        }
      }
    }

    // --- 7d. DANGEROUS UNIT TYPO SAFEGUARD (mg vs g typographical confusion) ---
    for (const pText of allPrescriptionTexts) {
      const lethalGramTypoMatch = pText.match(/(?:parac[eé]tamol|amoxicilline|ibuprof[eè]ne|m[eé]tronidazole|c[eé]tirizine|azithromycine|clarithromycine|ciprofloxacine|ramipril|amlodipine)\s*(?:[^\n.]*?)(\d{2,4})\s*g\b(?!\s*\/\s*(?:l|100ml|kg))/i);
      if (lethalGramTypoMatch && parseFloat(lethalGramTypoMatch[1]) >= 10) {
        errors.push(`[Erreur Typographique Unité] Posologie aberrante détectée : "${lethalGramTypoMatch[0]}". Confusion probable entre "mg" et "g". Corriger l'unité en mg.`);
      }
    }
  }

  // 8. PDF Keywords Check
  if (!Array.isArray(cat.pdf_keywords) || cat.pdf_keywords.length === 0) {
    warnings.push('Field "pdf_keywords" is empty. Linking to local PDF index will be disabled for this CAT.');
  }

  // 9. Sub-CATs Verification (Optional nested specialized profiles)
  if (cat.sub_cats) {
    if (!Array.isArray(cat.sub_cats)) {
      errors.push('Field "sub_cats" must be an array of specialized profile objects.');
    } else {
      cat.sub_cats.forEach((sub, sIdx) => {
        if (!sub.label || typeof sub.label !== 'string') {
          errors.push(`Sub-CAT #${sIdx + 1}: Missing "label" field.`);
        }
        if (!sub.summary || typeof sub.summary !== 'string' || sub.summary.length < 50) {
          errors.push(`Sub-CAT #${sIdx + 1} ("${sub.label || 'Sans nom'}"): "summary" is required and must contain structured markdown.`);
        }
        if (!sub.ordonnance || typeof sub.ordonnance !== 'string' || sub.ordonnance.length < 15) {
          errors.push(`Sub-CAT #${sIdx + 1} ("${sub.label || 'Sans nom'}"): "ordonnance" is required.`);
        }
      });
    }
  }

  return {
    valid: errors.length === 0,
    errors,
    warnings
  };
}

const CLINICAL_SUMMARY_SECTIONS = CLINICAL_REQUIRED_SECTION_PATTERNS.map(p => p.name);

module.exports = {
  validateCAT,
  isAdministrativeCAT,
  CLINICAL_REQUIRED_SECTION_PATTERNS,
  CLINICAL_SUMMARY_SECTIONS,
  ADMIN_SUMMARY_SECTIONS,
  FORBIDDEN_PLACEHOLDERS
};

