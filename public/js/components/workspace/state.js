export function buildPrintableText(cat) {
  const lines = [
    `Dr.CAT — ${cat.id}. ${cat.title}`,
    `Catégorie : ${cat.category}`,
    '-------------------------------------------'
  ];
  if (cat.red_flags && cat.red_flags.trim()) {
    lines.push(`\nRED FLAGS:\n${cat.red_flags}`);
  }
  const summary = cat.customSummary || cat.summary;
  if (summary && summary.trim()) {
    lines.push(`\nCONDUCTE À TENIR:\n${summary}`);
  }
  const prescription = cat.customOrdonnance || cat.ordonnance;
  if (prescription && prescription.trim()) {
    lines.push(`\nORDONNANCE TYPE:\n${prescription}`);
  }
  if (cat.notes && cat.notes.trim()) {
    lines.push(`\nNOTES:\n${cat.notes}`);
  }
  lines.push(`\nLe : ${new Date().toLocaleDateString('fr-FR')}`);
  return lines.join('\n');
}
