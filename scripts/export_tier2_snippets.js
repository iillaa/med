const fs = require('fs');
const path = require('path');
const { queryClinicalLibrary } = require('../cat_db_generator/lib/knowledge-library');

const targetDir = '/storage/emulated/0/termux/hta';
const title = 'CAT devant une Hypertension Artérielle (HTA)';

const results = queryClinicalLibrary(title, ['hta', 'pression', 'iec']);

let md = '# 🏛️ EXTRAIT EXACT DE LA BIBLIOTHÈQUE CLINIQUE (TIER 2) INJECTÉ DANS LE PROMPT IA\n\n';
md += `> **Pathologie** : ${title}\n`;
md += `> **Fichiers Tier 2 Correspondants** : ${results.length}\n\n---\n\n`;

results.forEach((r, idx) => {
  md += `## 📑 ${idx + 1}. ${r.source} (${r.file}) — Score : ${r.score} pts\n\n`;
  md += '```markdown\n' + r.snippet + '\n```\n\n---\n\n';
});

const dest = path.join(targetDir, '02_EXACT_EXTRACTED_TIER2_SNIPPETS_SENT_TO_AI.md');
fs.writeFileSync(dest, md, 'utf8');
console.log('✅ Exported Tier 2 snippets with full text to:', dest);
