/**
 * Medical Synonym & Clinical Token Expander
 * Expands disease names into clinical keywords, acronyms, and related pharmacology.
 */

const fs = require('fs');
const path = require('path');

const SYNONYMS_PATH = path.join(__dirname, 'medical-synonyms.json');
let synonymsData = null;

function loadSynonyms() {
  if (synonymsData) return synonymsData;
  try {
    if (fs.existsSync(SYNONYMS_PATH)) {
      synonymsData = JSON.parse(fs.readFileSync(SYNONYMS_PATH, 'utf8'));
    } else {
      synonymsData = {};
    }
  } catch (_) {
    synonymsData = {};
  }
  return synonymsData;
}

function normalizeTerm(str) {
  return (str || '')
    .toLowerCase()
    .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9\s]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

/**
 * Expands a query phrase and its primary tokens with medical synonyms
 * @param {string} fullPhrase - Clean full phrase (e.g. "gale")
 * @param {string[]} tokens - Primary tokens (e.g. ["gale"])
 * @returns {{ expandedTokens: string[], relatedTerms: string[] }}
 */
function expandMedicalTokens(fullPhrase, tokens = []) {
  const dict = loadSynonyms();
  const normalizedPhrase = normalizeTerm(fullPhrase);
  const resultTokens = new Set(tokens);
  const relatedTerms = new Set();

  // 1. Direct match on full phrase
  if (dict[normalizedPhrase]) {
    for (const item of dict[normalizedPhrase]) {
      const normItem = normalizeTerm(item);
      relatedTerms.add(normItem);
      for (const tok of normItem.split(/\s+/)) {
        if (tok.length >= 3) resultTokens.add(tok);
      }
    }
  }

  // 2. Token-level dictionary lookup
  for (const t of tokens) {
    const normT = normalizeTerm(t);
    if (dict[normT]) {
      for (const item of dict[normT]) {
        const normItem = normalizeTerm(item);
        relatedTerms.add(normItem);
        for (const tok of normItem.split(/\s+/)) {
          if (tok.length >= 3) resultTokens.add(tok);
        }
      }
    }
  }

  return {
    expandedTokens: Array.from(resultTokens),
    relatedTerms: Array.from(relatedTerms)
  };
}

module.exports = {
  expandMedicalTokens,
  loadSynonyms
};
