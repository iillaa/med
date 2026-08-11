export function buildPrintableText(cat, activeSubCat) {
  const titleSuffix = activeSubCat && activeSubCat.label ? ` — ${activeSubCat.label}` : '';
  const lines = [
    `Dr.CAT — ${cat.id}. ${cat.title}${titleSuffix}`,
    `Catégorie : ${cat.category}`,
    '-------------------------------------------'
  ];
  const redFlags = activeSubCat ? (activeSubCat.red_flags || cat.red_flags) : cat.red_flags;
  if (redFlags && redFlags.trim()) {
    lines.push(`\nRED FLAGS:\n${redFlags}`);
  }
  const summary = activeSubCat ? activeSubCat.summary : (cat.customSummary || cat.summary);
  if (summary && summary.trim()) {
    lines.push(`\nCONDUITE À TENIR:\n${summary}`);
  }
  const prescription = activeSubCat ? activeSubCat.ordonnance : (cat.customOrdonnance || cat.ordonnance);
  if (prescription && prescription.trim()) {
    lines.push(`\nORDONNANCE TYPE:\n${prescription}`);
  }
  if (cat.notes && cat.notes.trim()) {
    lines.push(`\nNOTES:\n${cat.notes}`);
  }
  lines.push(`\nLe : ${new Date().toLocaleDateString('fr-FR')}`);
  return lines.join('\n');
}
