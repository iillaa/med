import { FRENCH_STOP_WORDS, shuffleArray } from './state.js';

export function getOrientationText(cat) {
  if (!cat || !cat.summary) return "";
  const marker = "5. Orientation";
  const index = cat.summary.indexOf(marker);
  if (index !== -1) {
    let text = cat.summary.substring(index + marker.length);
    text = text.replace(/^[^\n\r]*[\n\r]+/, '').trim();
    const lines = text.split('\n');
    const resultLines = [];
    for (const line of lines) {
      if (line.includes('**')) break;
      resultLines.push(line.replace(/^-\s*/, '').trim());
    }
    return resultLines.filter(l => l).join(' ');
  }
  return "";
}

export function cleanTextOfClues(text, title, category) {
  if (!text) return "";
  const lines = text.split('\n');
  const cleanLines = [];
  for (const line of lines) {
    const trimmed = line.trim();
    if (!trimmed) continue;
    if (trimmed.startsWith('**') && (trimmed.toLowerCase().includes('pour') || trimmed.toLowerCase().includes('cas') || trimmed.toLowerCase().includes('symptômes') || trimmed.toLowerCase().includes('en cas') || trimmed.endsWith(':**') || trimmed.includes(':**'))) {
      continue;
    }
    cleanLines.push(trimmed);
  }
  let result = cleanLines.join('\n');

  if (title) {
    const cleanTitle = title.replace(/^CAT devant\s+/i, '').replace(/^Différence entre\s+/i, '').replace(/^Interprétation du\s+/i, '').trim();
    if (cleanTitle.length > 2) {
      const escapedTitle = cleanTitle.replace(/[-$*+?.()|[\]{}]/g, '\\$&');
      const regex = new RegExp(escapedTitle, 'gi');
      result = result.replace(regex, '[la pathologie]');
    }
  }
  if (category) {
    const escapedCat = category.replace(/[-$*+?.()|[\]{}]/g, '\\$&');
    const regex = new RegExp(escapedCat, 'gi');
    result = result.replace(regex, '[spécialité]');
  }

  return result;
}

export function cleanOrientationOfClues(text, title, category) {
  if (!text) return "";
  let result = text.trim();

  if (title) {
    const cleanTitle = title.replace(/^CAT devant\s+/i, '').replace(/^Différence entre\s+/i, '').replace(/^Interprétation du\s+/i, '').trim();
    if (cleanTitle.length > 2) {
      const escapedTitle = cleanTitle.replace(/[-$*+?.()|[\]{}]/g, '\\$&');
      const regex = new RegExp(escapedTitle, 'gi');
      result = result.replace(regex, '[la pathologie]');
    }
  }
  if (category) {
    const escapedCat = category.replace(/[-$*+?.()|[\]{}]/g, '\\$&');
    const regex = new RegExp(escapedCat, 'gi');
    result = result.replace(regex, '[spécialité]');
  }

  return result;
}

function parseClinicalSigns(cat) {
  if (!cat || !cat.summary) return '';

  // Extract Section 0 (Stabilisation / Urgence) if present
  let sec0Text = '';
  const sec0Match = cat.summary.match(/\*\*0\.[^*]+\*\*([\s\S]+?)(?=\*\*1\.|\n\n|$)/);
  if (sec0Match) sec0Text = sec0Match[1].trim();

  // Extract Section 1 (Évaluation & Diagnostic)
  let sec1Text = '';
  const sec1Match = cat.summary.match(/\*\*1\.[^*]+\*\*([\s\S]+?)(?=\*\*2\.|\*\*3\.|\*\*4\.|\*\*5\.|\n\n|$)/);
  if (sec1Match) sec1Text = sec1Match[1].trim();

  const combined = (sec1Text || sec0Text || cat.summary)
    .replace(/\*\*/g, '')
    .replace(/^-\s*/gm, '')
    .replace(/\[la pathologie\]/g, '')
    .trim();

  const lines = combined.split('\n').map(l => l.trim()).filter(l => l.length > 10);
  if (lines.length > 0) {
    return lines.slice(0, 3).join('. ');
  }
  return combined.substring(0, 240);
}

export function generateClinicalVignette(cat) {
  const cleanTitle = cat.title
    .replace(/^CAT devant\s+/i, '')
    .replace(/^Différence entre\s+/i, '')
    .replace(/^Interprétation du\s+/i, '')
    .trim();

  let gender = Math.random() > 0.5 ? "Un homme" : "Une femme";
  let age = Math.floor(Math.random() * 45) + 20;

  if (cat.category === 'Pédiatrie') {
    gender = Math.random() > 0.5 ? "Un petit garçon" : "Une petite fille";
    age = Math.floor(Math.random() * 8) + 1;
    if (age === 1) age = "14 mois";
    else age = `${age} ans`;
  } else if (cat.category === 'Gynécologie / Obstétrique') {
    gender = "Une patiente";
    age = Math.floor(Math.random() * 20) + 22;
  }

  const ageStr = typeof age === 'number' ? `${age} ans` : age;

  const places = [
    "se présente aux urgences médico-chirurgicales",
    "consulte à votre cabinet médical",
    "est admis(e) en salle de soins",
    "vient en consultation de médecine générale"
  ];
  const place = places[Math.floor(Math.random() * places.length)];

  let signs = parseClinicalSigns(cat);
  if (signs && signs.length > 280) {
    signs = signs.substring(0, 280) + '...';
  }

  let vitals = "";
  if (cat.category === 'Pédiatrie') {
    vitals = "Constantes : T° 38.2°C, FC 110 bpm, FR 28/min, bon état général.";
  } else if (cat.category === 'Cardiologie') {
    vitals = "Constantes : TA 165/95 mmHg, FC 88 bpm, SpO2 98% en air ambiant.";
  } else {
    vitals = "Constantes à l'arrivée : TA 125/80 mmHg, FC 76 bpm, T° 37.3°C, SpO2 99%.";
  }

  if (signs && signs.length > 10) {
    return `${gender} de ${ageStr} ${place}.\n\nTableau clinique initial : ${signs}.\n${vitals}`;
  }

  return `${gender} de ${ageStr} ${place} pour tableau évocateur de : ${cleanTitle}.\n${vitals}`;
}

function extractKeywords(text) {
  if (!text) return [];
  const words = text.split(/[^a-zA-ZÀ-ÿ0-9]+/);
  const seenNormalized = new Set();
  const keywords = [];

  words.forEach(w => {
    const clean = w.trim();
    if (clean.length >= 4) {
      const normalized = clean.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "");
      if (!FRENCH_STOP_WORDS.has(normalized) && isNaN(normalized) && !seenNormalized.has(normalized)) {
        seenNormalized.add(normalized);
        keywords.push(clean);
      }
    }
  });
  return keywords;
}

export function checkMatchedKeywords(userAnswer, referenceText) {
  if (!userAnswer || !referenceText) return [];
  const refKeywords = extractKeywords(referenceText);
  const cleanUserAnswer = userAnswer.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "");

  return refKeywords.map(word => {
    const normalizedWord = word.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "");
    const matched = cleanUserAnswer.includes(normalizedWord);
    return { word, matched };
  });
}

export function getKeywordHints(correctAnswer) {
  if (!correctAnswer) return "";

  const words = correctAnswer.toLowerCase()
    .replace(/[.,/#!$%^&*;:{}=\-_`~()?"'\n]/g, " ")
    .replace(/\b\d+mg\b/g, '')
    .replace(/\b\d+g\b/g, '')
    .split(/\s+/)
    .filter(w => {
      return w.length > 4 &&
             !FRENCH_STOP_WORDS.has(w) &&
             !['comprimé', 'comprimés', 'gélule', 'gélules', 'sachet', 'sachets', 'traitement', 'traitements', 'pendant', 'jours', 'semaines', 'matin', 'soir'].includes(w);
    });

  const uniqueWords = Array.from(new Set(words));
  shuffleArray(uniqueWords);
  const selected = uniqueWords.slice(0, 3);
  if (selected.length === 0) return "Aucun indice disponible pour cette question.";
  return selected.join(', ');
}
