const fs = require('fs');
const path = require('path');

const cacheDir = path.join(__dirname, '..', 'data', 'pdf_cache');
const files = fs.readdirSync(cacheDir).filter(f => f.endsWith('.json'));

const GENERIC_SUBSECTIONS = /^(indications?|contre[\s\-]indications?|effets? (secondaires?|indésirables?)|posologies?|traitement|forme|clinique|symptômes?|paraclinique|diagnostic|définition|bilan|examens?|prévention|incubation|hospitalisation|conduite à tenir|cat|signes|physiopathologie|rechercher|surveillance|propriétés|effets|précautions|carnet|mon carnet|fiche|dr\b|professeur|docteur|sommaire|table des|page \d+|chapitre|collection|partie|cas clinique|qcm|sirop|adulte|nourrisson|grossesse|allaitement|femme enceinte|sujet âgé|insuffisance rénale|nom commercial|dci|mécanisme|mode d action|posologie usuelle|effets indésirables fréquents|voie d administration|surdosage|interactions|b\.\s*bilal)/i;

const pathologySet = new Map();

for (const file of files) {
  try {
    const data = JSON.parse(fs.readFileSync(path.join(cacheDir, file), 'utf8'));
    const bookName = data.pdf || file.replace(/\.json$/, '');
    
    if (data.toc && Array.isArray(data.toc)) {
      data.toc.forEach(t => {
        const raw = (t.title || '').trim().replace(/[\*\_#]/g, '');
        if (raw.length >= 4 && raw.length <= 70 && !GENERIC_SUBSECTIONS.test(raw)) {
          addEntry(raw, bookName, t.page || 1);
        }
      });
    }

    if (data.pages && Array.isArray(data.pages)) {
      data.pages.forEach((p, idx) => {
        const pNum = p.page || idx + 1;
        const text = p.content || p.text || '';
        const lines = text.split('\n');

        for (const line of lines) {
          const trimmed = line.trim();
          let title = null;

          const mHead = trimmed.match(/^#\s+(.+)$/);
          const mCat = trimmed.match(/^(?:CAT|Conduite|Prise en charge|Traitement)\s+(?:devant|de|d['\s]|du|des|en cas de)\s+([^:\n]+)/i);
          const mOrd = trimmed.match(/^\*\*(?:Ordonnance\s*(?:type)?\s*n?°?\s*\d*\s*[:\-])?\s*([^\*:\n]+)\*\*$/i);

          if (mHead) title = mHead[1];
          else if (mCat) title = mCat[1];
          else if (mOrd) title = mOrd[1];

          if (title) {
            title = title.replace(/[\*\_#]/g, '').trim();
            if (title.length >= 4 && title.length <= 70 && !GENERIC_SUBSECTIONS.test(title)) {
              addEntry(title, bookName, pNum);
            }
          }
        }
      });
    }
  } catch (_) {}
}

function addEntry(raw, book, page) {
  const clean = raw.replace(/^[\d\.\-\s]+/, '').replace(/[:\(\)\*\_]/g, ' ').replace(/\s+/g, ' ').trim();
  if (clean.length < 4 || GENERIC_SUBSECTIONS.test(clean)) return;
  const key = clean.toLowerCase();
  if (!pathologySet.has(key)) {
    pathologySet.set(key, { title: clean, occurrences: [] });
  }
  pathologySet.get(key).occurrences.push({ book, page });
}

console.log('Total Raw Entities Extracted Dynamically:', pathologySet.size);

const list = Array.from(pathologySet.values());
console.log('\nSample of 30 dynamic clinical entities discovered across the books:');
for (let i = 0; i < 30; i++) {
  const item = list[Math.floor(Math.random() * list.length)];
  console.log('• ' + item.title + ' -> ' + item.occurrences[0].book + ' (Page ' + item.occurrences[0].page + ')');
}
