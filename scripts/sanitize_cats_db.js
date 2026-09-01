const fs = require('fs');
const path = require('path');

const DB_PATH = path.join(__dirname, '..', 'cats_db.json');
const db = JSON.parse(fs.readFileSync(DB_PATH, 'utf8'));

function sanitizeMarkdownText(text) {
  if (!text || typeof text !== 'string') return text;
  let clean = text;

  // 1. Remove standalone ** on empty lines or alone
  clean = clean.replace(/(?:^|\n)\s*\*\*\s*(?:\n|$)/g, '\n');

  // 2. Remove empty ** ** or ****
  clean = clean.replace(/\*\*\s*\*\*/g, '');

  // 3. Fix unclosed bold at end of line (e.g. '**D/E (Dextro/Bilan) :*' -> '**D/E (Dextro/Bilan) :**')
  clean = clean.replace(/\*\*([^*\n]+):\*(?!\*)/g, '**$1:**');

  // 4. Fix double colons or colon inside bold (e.g. '**0. Titre :** :' -> '**0. Titre :**')
  clean = clean.replace(/:\*\*\s*:/g, ':**');

  // 5. Ensure step headers are clean and followed by newline
  clean = clean.replace(/(?:^|\n)(?:\*\*|#{1,6}\s*)([0-9]+(?:bis|ter)?\.\s*[^:\n*]+?)(?:\*\*)?\s*:?\s*(?:\*\*)?\s*:?\s*(?:\n|$)/gi, (m, title) => {
    return '\n\n**' + title.trim() + ' :**\n';
  });

  // 6. Normalize multiple consecutive blank lines to max 2
  clean = clean.replace(/\n{3,}/g, '\n\n');

  return clean.trim();
}

function sanitizeCat(cat) {
  if (cat.summary) cat.summary = sanitizeMarkdownText(cat.summary);
  if (cat.ordonnance) cat.ordonnance = sanitizeMarkdownText(cat.ordonnance);
  if (cat.red_flags) cat.red_flags = sanitizeMarkdownText(cat.red_flags);

  if (Array.isArray(cat.sub_cats)) {
    cat.sub_cats.forEach(sub => {
      if (sub.summary) sub.summary = sanitizeMarkdownText(sub.summary);
      if (sub.ordonnance) sub.ordonnance = sanitizeMarkdownText(sub.ordonnance);
      if (sub.red_flags) sub.red_flags = sanitizeMarkdownText(sub.red_flags);
    });
  }
}

let modified = 0;
db.forEach(cat => {
  const before = JSON.stringify(cat);
  sanitizeCat(cat);
  const after = JSON.stringify(cat);
  if (before !== after) {
    modified++;
    console.log(`✨ Sanitized CAT ${cat.id}: ${cat.title}`);
  }
});

fs.writeFileSync(DB_PATH, JSON.stringify(db, null, 2), 'utf8');
console.log(`\n🎉 Successfully sanitized ${modified} CAT records in ${DB_PATH}!`);
