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
  const sec1Match = cat.summary.match(/\*\*1\.[^*]+\*\*([\s\S]+?)(?=\*\*2\.|\*\*3\.|\*\*4\.|\*\*5\.|\n\n|$)/);
  if (!sec1Match) return '';
  const sec1Text = sec1Match[1].trim();

  const cliniqueMatch = sec1Text.match(/-\s*Clinique\s*:\s*([^\n]+)/i);
  if (cliniqueMatch) {
    return cliniqueMatch[1].trim();
  }

  const diagMatch = sec1Text.match(/-\s*Diagnostic\s*:\s*([^\n]+)/i);
  if (diagMatch) {
    return diagMatch[1].trim();
  }

  const bullets = sec1Text.split('\n').filter(line => line.trim().startsWith('-'));
  if (bullets.length > 0) {
    return bullets.slice(0, 2).map(b => b.replace(/^-\s*/, '').trim()).join('. ');
  }

  return sec1Text;
}

export function generateClinicalVignette(cat) {
  const cleanTitle = cat.title
    .replace(/^CAT devant\s+/i, '')
    .replace(/^Différence entre\s+/i, '')
    .replace(/^Interprétation du\s+/i, '')
    .trim();

  let gender = Math.random() > 0.5 ? "Un patient" : "Une patiente";
  let age = Math.floor(Math.random() * 50) + 18;

  if (cat.category === 'Pédiatrie') {
    gender = Math.random() > 0.5 ? "Un enfant" : "Une fillette";
    age = Math.floor(Math.random() * 10) + 1;
    if (age === 1) age = "12 mois";
    else age = `${age} ans`;
  } else if (cat.category === 'Gynécologie / Obstétrique') {
    gender = "Une patiente";
  }

  let signs = parseClinicalSigns(cat);
  signs = signs.replace(/\*\*/g, '').replace(/\[la pathologie\]/g, cleanTitle).trim();

  signs = signs.substring(0, 220).trim();
  if (signs.endsWith('.') === false && signs.length > 0) signs += '...';

  const settings = [
    "se présente à votre cabinet médical",
    "se présente aux urgences",
    "vous consulte",
    "arrive en consultation"
  ];
  const setting = settings[Math.floor(Math.random() * settings.length)];

  const ageStr = typeof age === 'number' ? `${age} ans` : age;
  let text = `${gender} de ${ageStr} ${setting}`;

  if (signs && signs.length > 5) {
    text += ` présentant les signes suivants : "${signs}".`;
  } else {
    text += ` pour suspicion de : "${cleanTitle}".`;
  }

  return text;
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
