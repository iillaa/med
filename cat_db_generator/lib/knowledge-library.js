/**
 * Formal Action-Oriented Clinical Knowledge Library Engine
 * Manages pure "Conduite à Tenir" (CAT) decision support packs with Section-Aware Precision Chunking:
 *   1. MedG.fr Fiches de Synthèse & Algorithmes Cliniques
 *   2. Antibioclic / SPILF Infectious Disease Decision Trees
 *   3. SFMU Fiches Réflexes d'Urgence & Réanimation
 *   4. Pédiadol Protocoles Thérapeutiques Pédiatriques
 *   5. MSF Guide Clinique de Poche (Dispensaires & Soins Primaires)
 *   6. Orphanet Urgences Fiches Réflexes de Garde
 *   7. CRAT Fiches Grossesse & Allaitement
 *   8. HAS Fiches Mémo de Bonne Pratique
 *   9. Algérie MSPRH Nomenclature & Guides Nationaux
 */

const fs = require('fs');
const path = require('path');
const { expandMedicalTokens } = require('./medical-synonyms');

const CLINICAL_LIBRARY_DIR = path.join(__dirname, '..', 'clinical_library');

// All specialized CAT library sub-directories
const LIBRARY_SUBDIRS = [
  'medg_fiches_cat',
  'antibioclic_decision_trees',
  'sfmu_emergency_reflex',
  'pediadol_pediatric_protocols',
  'msf_pocket_clinical_guides',
  'orphanet_urgences_reflex',
  'crat_pregnancy_lactation',
  'has_clinical_memos',
  'algeria_msprh_nomenclature'
];

function ensureLibraryDirectories() {
  if (!fs.existsSync(CLINICAL_LIBRARY_DIR)) {
    fs.mkdirSync(CLINICAL_LIBRARY_DIR, { recursive: true });
  }
  for (const sub of LIBRARY_SUBDIRS) {
    const subPath = path.join(CLINICAL_LIBRARY_DIR, sub);
    if (!fs.existsSync(subPath)) {
      fs.mkdirSync(subPath, { recursive: true });
    }
  }
}

// Word-boundary matcher for accurate French topic matching
function hasExactWord(text, word) {
  if (!text || !word) return false;
  const escaped = word.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  const rx = new RegExp(`(?:^|[^a-z0-9à-ÿ])${escaped}(?:$|[^a-z0-9à-ÿ])`, 'i');
  return rx.test(text);
}

/**
 * Extracts the most clinically relevant section from a markdown file
 * instead of blindly taking the top of the file.
 * @param {string} fullContent 
 * @param {string[]} primaryTokens 
 * @param {string[]} expandedTokens 
 * @returns {{ snippet: string, sectionScore: number }}
 */
function extractRelevantSection(fullContent, primaryTokens = [], expandedTokens = []) {
  if (!fullContent) return { snippet: '', sectionScore: 0 };

  // Split markdown by headings (## or ###)
  const rawSections = fullContent.split(/(?=^#{1,3}\s+)/m).map(s => s.trim()).filter(s => s.length > 20);

  if (rawSections.length === 0) {
    return { snippet: fullContent.substring(0, 2000), sectionScore: 10 };
  }

  let bestSection = rawSections[0];
  let bestScore = 0;

  for (const sec of rawSections) {
    let score = 0;
    const normalizedSec = sec.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');
    const firstLine = (sec.split('\n')[0] || '').toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');

    // Heading match (highest relevance)
    for (const tok of primaryTokens) {
      if (hasExactWord(firstLine, tok)) score += 60;
      else if (hasExactWord(normalizedSec, tok)) score += 15;
    }

    // Expanded synonyms match
    for (const syn of expandedTokens) {
      if (!primaryTokens.includes(syn)) {
        if (hasExactWord(firstLine, syn)) score += 30;
        else if (hasExactWord(normalizedSec, syn)) score += 8;
      }
    }

    // Clinical content anchors bonus
    if (/(?:traitement|posologie|ordonnance|prise\s+en\s+charge|mhd|drapeaux\s+rouges)/i.test(sec)) {
      score += 10;
    }

    if (score > bestScore) {
      bestScore = score;
      bestSection = sec;
    }
  }

  return {
    snippet: bestSection.substring(0, 3000),
    sectionScore: bestScore
  };
}

/**
 * Searches across all formal CAT clinical libraries with section-aware extraction
 * @param {string} title - Topic title (e.g. "Colique néphrétique", "Hypertension Artérielle")
 * @param {string[]} keywords - Secondary keywords
 * @returns {Array<{ source: string, category: string, file: string, snippet: string, score: number }>}
 */
function queryClinicalLibrary(title, keywords = []) {
  ensureLibraryDirectories();
  const results = [];
  const primaryTokens = (title || '')
    .toLowerCase()
    .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
    .split(/[\s,–—\-_/()]+/)
    .filter(t => t.length > 3 && !['devant', 'prise', 'charge', 'conduite', 'tenir'].includes(t));

  const { expandedTokens } = expandMedicalTokens(title, primaryTokens);

  for (const sub of LIBRARY_SUBDIRS) {
    const subPath = path.join(CLINICAL_LIBRARY_DIR, sub);
    if (!fs.existsSync(subPath)) continue;

    const files = fs.readdirSync(subPath).filter(f => f.endsWith('.md') || f.endsWith('.json'));
    for (const f of files) {
      const filePath = path.join(subPath, f);
      let content = '';
      try {
        if (f.endsWith('.json')) {
          const parsed = JSON.parse(fs.readFileSync(filePath, 'utf8'));
          content = typeof parsed === 'string' ? parsed : JSON.stringify(parsed, null, 2);
        } else {
          content = fs.readFileSync(filePath, 'utf8');
        }
      } catch (_) {
        continue;
      }

      // Check filename score
      let fileScore = 0;
      const normalizedFilename = f.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');

      for (const token of primaryTokens) {
        if (hasExactWord(normalizedFilename, token)) fileScore += 50;
      }
      for (const syn of expandedTokens) {
        if (!primaryTokens.includes(syn) && hasExactWord(normalizedFilename, syn)) fileScore += 20;
      }

      // Section-aware extraction
      const { snippet, sectionScore } = extractRelevantSection(content, primaryTokens, expandedTokens);
      const totalScore = fileScore + sectionScore;

      if (totalScore > 15) {
        // Human-friendly library label
        const prettySource = sub
          .replace(/_/g, ' ')
          .toUpperCase()
          .replace('MEDG FICHES CAT', 'MEDG.FR — CONDUITE À TENIR')
          .replace('ANTIBIOCLIC DECISION TREES', 'ANTIBIOCLIC / SPILF')
          .replace('SFMU EMERGENCY REFLEX', 'SFMU URGENCES')
          .replace('PEDIADOL PEDIATRIC PROTOCOLS', 'PÉDIADOL PÉDIATRIE')
          .replace('MSF POCKET CLINICAL GUIDES', 'MSF GUIDE CLINIQUE DE POCHE')
          .replace('ORPHANET URGENCES REFLEX', 'ORPHANET URGENCES')
          .replace('CRAT PREGNANCY LACTATION', 'CRAT GROSSESSE & ALLAITEMENT')
          .replace('HAS CLINICAL MEMOS', 'HAS FICHES MÉMO');

        results.push({
          source: prettySource,
          category: sub,
          file: f,
          snippet,
          score: totalScore
        });
      }
    }
  }

  results.sort((a, b) => b.score - a.score);
  return results.slice(0, 5);
}

module.exports = {
  CLINICAL_LIBRARY_DIR,
  LIBRARY_SUBDIRS,
  ensureLibraryDirectories,
  extractRelevantSection,
  queryClinicalLibrary
};
