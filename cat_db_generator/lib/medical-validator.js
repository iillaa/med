/**
 * Medical Data & Anti-Hallucination Validator
 * Enforces strict medical schema integrity, 5-step clinical structure,
 * mandatory red flags, and valid drug prescription formats.
 */

const { VALID_CATEGORIES } = require('./medical-sources');

const MANDATORY_SUMMARY_SECTIONS = [
  '1. Évaluation initiale & Diagnostic',
  '2. Conduite à tenir',
  '3. Traitement',
  '4. Examens complémentaires',
  '5. Orientation / Avis Spécialisé'
];

const FORBIDDEN_PLACEHOLDERS = [
  'lorem ipsum',
  'todo',
  'à compléter',
  'tbd',
  'sample text',
  'texte d\'exemple',
  'sans objet',
  'non disponible'
];

const DOSAGE_UNITS_REGEX = /(?:mg|g|gélule|comprimé|sachet|ampoule|cuillère|flacon|ui|ml|gouttes|application|injection|suppositoire)/i;

/**
 * Validates a complete CAT object against strict medical standards
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
      errors.push(`Anti-Hallucination Reject: Detected forbidden placeholder or incomplete text ("${placeholder}").`);
    }
  }

  // 5. Summary 5-Step Structure Check
  if (!cat.summary || typeof cat.summary !== 'string') {
    errors.push('Field "summary" is required and must be markdown text.');
  } else {
    for (const section of MANDATORY_SUMMARY_SECTIONS) {
      if (!cat.summary.includes(section)) {
        errors.push(`Summary Validation Error: Missing mandatory 5-step clinical section: "${section}".`);
      }
    }

    if (cat.summary.trim().length < 200) {
      warnings.push('Summary content length is under 200 characters. Consider expanding clinical details.');
    }
  }

  // 6. Red Flags Check
  if (!cat.red_flags || typeof cat.red_flags !== 'string' || cat.red_flags.trim().length < 20) {
    errors.push('Field "red_flags" (drapeaux rouges / urgences) is required and must be at least 20 characters long.');
  }

  // 7. Ordonnance / Prescription Model Check
  if (!cat.ordonnance || typeof cat.ordonnance !== 'string' || cat.ordonnance.trim().length < 20) {
    errors.push('Field "ordonnance" (prescription model) is required and must be at least 20 characters long.');
  } else {
    if (!DOSAGE_UNITS_REGEX.test(cat.ordonnance)) {
      warnings.push('Ordonnance does not explicitly mention standard drug dosage units (mg, gélule, sachet, comprimé, etc.). Verify dosage precision.');
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
  MANDATORY_SUMMARY_SECTIONS
};
