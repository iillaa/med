/**
 * Fast Lightweight OCR Noise & Medical Typo Normalizer
 * Repares character deformations and common scan glitches in RAM in < 1ms.
 */

const MEDICAL_TYPO_MAP = {
  "hoerdumon": "hématome",
  "hyjetnphie": "hypertrophie",
  "vraaroudaire": "ventriculaire",
  "scirntinque": "scientifique",
  "poso1ogie": "posologie",
  "amoxici11ine": "amoxicilline",
  "c1inique": "clinique",
  "traiternent": "traitement",
  "médicarnent": "médicament",
  "ordonnanee": "ordonnance",
  "preseripfion": "prescription"
};

/**
 * Cleans OCR artifacts from text in memory
 * @param {string} text Raw OCR text
 * @returns {string} Cleaned text
 */
function cleanOcrText(text) {
  if (!text || typeof text !== 'string') return '';

  let cleaned = text;

  // 1. Fix letter-number swaps inside words (e.g., c1inique -> clinique, p0sologie -> posologie)
  cleaned = cleaned.replace(/([a-zA-ZÀ-ÿ])1([a-zA-ZÀ-ÿ])/g, '$1l$2');
  cleaned = cleaned.replace(/([a-zA-ZÀ-ÿ])0([a-zA-ZÀ-ÿ])/g, '$1o$2');
  cleaned = cleaned.replace(/([a-zA-ZÀ-ÿ])5([a-zA-ZÀ-ÿ])/g, '$1s$2');

  // 2. Fix broken French accents and quote splits
  cleaned = cleaned.replace(/e['`’]/g, 'é');
  cleaned = cleaned.replace(/a['`’]/g, 'à');
  cleaned = cleaned.replace(/u['`’]/g, 'ù');
  cleaned = cleaned.replace(/c[,]/g, 'ç');

  // 3. Normalize common scan ligatures
  cleaned = cleaned.replace(/\brn([a-zA-ZÀ-ÿ]{3,})\b/g, 'm$1'); // e.g. rnédicament -> médicament

  // 4. Exact dictionary replacements for known distorted medical terms
  for (const [bad, good] of Object.entries(MEDICAL_TYPO_MAP)) {
    const rx = new RegExp(`\\b${bad}\\b`, 'gi');
    cleaned = cleaned.replace(rx, good);
  }

  // 5. Collapse excessive whitespace and tabs
  cleaned = cleaned.replace(/[ \t]{2,}/g, ' ');

  return cleaned;
}

module.exports = {
  cleanOcrText,
  MEDICAL_TYPO_MAP
};
