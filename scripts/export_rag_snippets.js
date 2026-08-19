const fs = require('fs');
const path = require('path');
const { searchLocalPDFs } = require('../cat_db_generator/lib/pdf-extractor');

async function exportExactSnippets() {
  const targetDir = '/storage/emulated/0/termux/hta';
  const title = 'CAT devant une Hypertension Artérielle (HTA)';
  const category = 'Cardiologie';

  console.log('Extracting exact PDF excerpts from pdf_index.json for:', title);
  const pdfMatches = await searchLocalPDFs(title, { maxMatchesPerFile: 3, category });

  let md = '# 📑 EXTRAITS EXACTS DU PDF_INDEX.JSON INJECTÉS DANS LE PROMPT IA\n\n';
  md += `> **Pathologie** : ${title}\n`;
  md += `> **Catégorie ciblée** : ${category}\n`;
  md += `> **Total Documents RAG Retenus** : ${pdfMatches.length} livres / manuels\n\n`;
  md += '---\n\n';

  pdfMatches.forEach((doc, docIdx) => {
    md += `## 📚 ${docIdx + 1}. ${doc.pdfFile} (Score Total : ${doc.docScore} pts)\n`;
    md += `- **Spécialité Document** : ${doc.specialty || 'Générale'}\n`;
    md += `- **Nombre d'extraits de pages retenus** : ${doc.matches.length} page(s)\n\n`;

    doc.matches.forEach((match, matchIdx) => {
      md += `### 📄 Extrait Page ${match.page} (Score Clinique : ${match.score} pts) :\n`;
      if (match.isDirectTocTarget) md += `> 🎯 **[GPS Direct Jump TOC]** Page pointée directement par le Sommaire !\n\n`;
      if (match.hasFullPhrase) md += `> 🟢 **[Full-Phrase Match]** Phrase exacte trouvée sur cette page.\n\n`;
      
      md += '```markdown\n' + match.snippet + '\n```\n\n';
    });

    md += '---\n\n';
  });

  const destPath = path.join(targetDir, '01_EXACT_EXTRACTED_PDF_SNIPPETS_SENT_TO_AI.md');
  fs.writeFileSync(destPath, md, 'utf8');
  console.log('✅ Exported exact snippets with full content to:', destPath);
}

exportExactSnippets();
