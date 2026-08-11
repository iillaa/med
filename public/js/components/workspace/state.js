export function buildPrintableText(cat) {
  const dateStr = new Date().toLocaleDateString('fr-FR');
  const lines = [
    `===========================================`,
    `🩺 Dr.CAT — Aide à la Décision Médicale Clinique`,
    `👨‍⚕️ Dr. Kibeche Ali`,
    `===========================================`,
    `\n📋 FICHE N° ${cat.id} : ${cat.title.toUpperCase()}`,
    `📂 Spécialité : ${cat.category}`,
    `📅 Date : ${dateStr}`,
    `-------------------------------------------`
  ];

  // Red Flags
  if (cat.red_flags && cat.red_flags.trim()) {
    lines.push(`\n🚨 SIGNES DE GRAVITÉ (RED FLAGS) :`);
    lines.push(cat.red_flags.trim());
  }

  // Conduite à Tenir Principale
  const summary = cat.customSummary || cat.summary;
  if (summary && summary.trim()) {
    lines.push(`\n📑 CONDUITE À TENIR PRINCIPALE :`);
    lines.push(summary.trim());
  }

  // Ordonnance Type
  const prescription = cat.customOrdonnance || cat.ordonnance;
  if (prescription && prescription.trim()) {
    lines.push(`\n💊 ORDONNANCE TYPE & POSOLOGIES :`);
    lines.push(prescription.trim());
  }

  // Sub-CATs (Sous-Fiches Spécialisées)
  if (Array.isArray(cat.sub_cats) && cat.sub_cats.length > 0) {
    lines.push(`\n-------------------------------------------`);
    lines.push(`🔀 PROFILS PARTICULIERS & SOUS-FICHES (${cat.sub_cats.length})`);
    lines.push(`-------------------------------------------`);

    cat.sub_cats.forEach((sub, idx) => {
      lines.push(`\n━━━ 🔹 Sous-Fiche ${idx + 1} : ${sub.label || 'Profil Spécialisé'} ━━━`);
      if (sub.red_flags && sub.red_flags.trim() && sub.red_flags !== cat.red_flags) {
        lines.push(`\n🚨 Red Flags Spécifiques :\n${sub.red_flags.trim()}`);
      }
      if (sub.summary && sub.summary.trim()) {
        lines.push(`\n📋 Conduite à Tenir :\n${sub.summary.trim()}`);
      }
      if (sub.ordonnance && sub.ordonnance.trim()) {
        lines.push(`\n💊 Ordonnance :\n${sub.ordonnance.trim()}`);
      }
    });
  }

  // Doctor's Personal Notes
  if (cat.notes && cat.notes.trim()) {
    lines.push(`\n-------------------------------------------`);
    lines.push(`📝 MES NOTES & PROTOCOLES LOCAUX :`);
    lines.push(cat.notes.trim());
  }

  lines.push(`\n===========================================`);
  lines.push(`Généré via Dr.CAT Rappel Clinique (Dr. Kibeche Ali)`);
  lines.push(`===========================================`);

  return lines.join('\n');
}
