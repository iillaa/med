/**
 * Medical Data & Anti-Hallucination Validator
 * Enforces strict medical schema integrity, 5-step clinical structure lock,
 * administrative template structure lock, mandatory red flags, and valid drug prescription formats.
 */

const { VALID_CATEGORIES } = require('./medical-sources');

const CLINICAL_SUMMARY_SECTIONS = [
  '1. Évaluation initiale & Diagnostic',
  '2. Conduite à tenir',
  '3. Traitement',
  '4. Examens complémentaires',
  '5. Orientation / Avis Spécialisé'
];

const ADMIN_SUMMARY_SECTIONS = [
  '1. Principes de rédaction',
  '2. Structure type',
  '3. Cadre réglementaire'
];

const FORBIDDEN_PLACEHOLDERS = [
  'lorem ipsum',
  'todo',
  'à compléter',
  'tbd',
  'sample text',
  'texte d\'exemple',
  'sans objet',
  'non disponible',
  '[remplir',
  '<remplir',
  'insérer ici'
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
      for (const section of ADMIN_SUMMARY_SECTIONS) {
        if (!cat.summary.includes(section)) {
          errors.push(`Administrative Schema Error: Missing mandatory administrative section: "${section}".`);
        }
      }
    } else {
      // Enforce 5-Step Clinical Structure Lock for Clinical CATs
      for (const section of CLINICAL_SUMMARY_SECTIONS) {
        if (!cat.summary.includes(section)) {
          errors.push(`Clinical 5-Step Schema Lock Error: Missing mandatory section: "${section}".`);
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
  }

  // 8. PDF Keywords Check
  if (!Array.isArray(cat.pdf_keywords) || cat.pdf_keywords.length === 0) {
    warnings.push('Field "pdf_keywords" is empty. Linking to local PDF index will be disabled for this CAT.');
  }

  return {
    valid: errors.length === 0,
    errors,
    warnings
  };
}

module.exports = {
  validateCAT,
  isAdministrativeCAT,
  CLINICAL_SUMMARY_SECTIONS,
  ADMIN_SUMMARY_SECTIONS,
  FORBIDDEN_PLACEHOLDERS
};

