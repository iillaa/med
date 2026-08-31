/**
 * Test Generation Runner for 6 Sample Clinical Topics
 * Tests: 2 Simple (0 sub-cat), 2 Moderate (1-2 sub-cats), 2 Complex (2-4 sub-cats)
 */

require('dotenv').config();
const fs = require('fs');
const path = require('path');
const { generateCATWithLLM } = require('../cat_db_generator/lib/llm-engine');
const debugEmitter = require('../cat_db_generator/lib/debug-emitter');

const TEST_TOPICS = [
  { id: 101, title: 'Bouchon de Cérumen', category: 'ORL', expected: '0 Sub-CAT (Simple)' },
  { id: 102, title: 'Blépharite', category: 'Ophtalmologie', expected: '0 Sub-CAT (Simple)' },
  { id: 103, title: 'Angine Aiguë', category: 'ORL', expected: '1-2 Sub-CAT (Phlegmon / Complication)' },
  { id: 104, title: 'Abcès Dentaire', category: 'Stomatologie', expected: '1-2 Sub-CAT (Cellulite / Grossesse AINS)' },
  { id: 105, title: 'Diabète de Type 2', category: 'Endocrinologie', expected: '2-4 Sub-CAT (Acidocétose / Hyperosmolaire / Pied)' },
  { id: 106, title: 'Hypertension Artérielle', category: 'Cardiologie', expected: '1-3 Sub-CAT (Urgence HTA / HTA Gravidique)' }
];

async function runTestGeneration() {
  console.log('================================================================');
  console.log('🚀 DÉMARRAGE DU TEST DE GÉNÉRATION DES 6 FICHES ÉCHANTILLONS');
  console.log('================================================================\n');

  const results = [];
  const logs = [];

  // Listen to debug events
  debugEmitter.on('debug_event', (evt) => {
    logs.push({ time: new Date().toISOString(), ...evt });
  });

  for (let i = 0; i < TEST_TOPICS.length; i++) {
    const topic = TEST_TOPICS[i];
    console.log(`\n----------------------------------------------------------------`);
    console.log(`[${i + 1}/${TEST_TOPICS.length}] 🩺 Génération : "${topic.title}" (${topic.category})`);
    console.log(`🎯 Attente clinique : ${topic.expected}`);
    console.log(`----------------------------------------------------------------`);

    const startTime = Date.now();
    try {
      const genResult = await generateCATWithLLM(topic.title, topic.category, { id: topic.id });
      const cat = genResult.cat;
      const validation = genResult.validation;
      const metrics = genResult.metrics || {};
      const subCatsCount = Array.isArray(cat.sub_cats) ? cat.sub_cats.length : 0;
      const subLabels = Array.isArray(cat.sub_cats) ? cat.sub_cats.map(s => s.label) : [];

      console.log(`✅ Succès en ${((Date.now() - startTime) / 1000).toFixed(1)}s ! Modèle: ${metrics.model || 'Gemini'}`);
      console.log(`📊 Tokens: ${metrics.totalTokens || 0} (${metrics.promptTokens || 0} in / ${metrics.completionTokens || 0} out)`);
      console.log(`🔢 Sub-CATs générés (${subCatsCount}) : ${subLabels.length > 0 ? subLabels.join(' | ') : 'AUCUN (0 Sub-CAT)'}`);
      console.log(`🛡️ Validation médicale : ${validation.valid ? 'VALIDÉ' : 'REJETÉ'} (Erreurs: ${validation.errors.length}, Warnings: ${validation.warnings.length})`);

      results.push({
        topic,
        success: true,
        metrics,
        subCatsCount,
        subLabels,
        validation,
        catSummarySnippet: (cat.summary || '').substring(0, 300) + '...',
        catOrdonnanceSnippet: (cat.ordonnance || '').substring(0, 300) + '...',
        catRedFlagsSnippet: (cat.red_flags || '').substring(0, 200) + '...',
        rawCat: cat
      });
    } catch (err) {
      console.error(`❌ Erreur sur "${topic.title}":`, err.message);
      results.push({
        topic,
        success: false,
        error: err.message
      });
    }

    // Small delay between calls to preserve quota
    await new Promise(r => setTimeout(r, 2000));
  }

  // Save report
  const reportPath = path.join(__dirname, '../data/test_generation_sample_report.json');
  fs.writeFileSync(reportPath, JSON.stringify({ timestamp: new Date().toISOString(), results, logs }, null, 2));

  // Build markdown summary
  let md = `# 📊 Rapport de Test Réel — Génération des 6 Fiches Témoins\n\n`;
  md += `> **Date** : ${new Date().toLocaleString('fr-FR')}\n`;
  md += `> **Moteur** : Gemini AI (Dual RAG + Charte Clinique v1.17.0)\n\n---\n\n`;
  md += `## 📋 Synthèse des Résultats\n\n`;
  md += `| # | Pathologie | Spécialité | Attente | Sub-CATs Réels | Statut | Validation |\n`;
  md += `|---|------------|------------|---------|----------------|:------:|:----------:|\n`;

  results.forEach((r, idx) => {
    const t = r.topic;
    const subStr = r.success ? `${r.subCatsCount} (${r.subLabels.join(', ') || '0'})` : 'ÉCHEC';
    const status = r.success ? '✅ OK' : '❌ ERREUR';
    const val = r.success ? (r.validation.valid ? '🟢 Valide' : `⚠️ ${r.validation.errors.length} err`) : 'N/A';
    md += `| ${idx + 1} | **${t.title}** | ${t.category} | ${t.expected} | ${subStr} | ${status} | ${val} |\n`;
  });

  md += `\n---\n\n## 🔍 Analyse Détaillée par Fiche\n\n`;

  results.forEach((r, idx) => {
    const t = r.topic;
    md += `### ${idx + 1}. ${t.title} (${t.category})\n\n`;
    if (!r.success) {
      md += `❌ **Erreur** : ${r.error}\n\n`;
      return;
    }
    md += `- **Modèle utilisé** : \`${r.metrics.model || 'Gemini'}\`\n`;
    md += `- **Tokens utilisés** : ${r.metrics.totalTokens || 0} (${r.metrics.promptTokens} in / ${r.metrics.completionTokens} out)\n`;
    md += `- **Latence** : ${r.metrics.latencyMs} ms\n`;
    md += `- **Nombre de Sub-CATs** : **${r.subCatsCount}**\n`;
    if (r.subLabels.length > 0) {
      md += `- **Titres des Sub-CATs** :\n`;
      r.rawCat.sub_cats.forEach((s, sIdx) => {
        md += `  * **${s.label || `Sous-fiche ${sIdx + 1}`}**\n`;
        md += `    - *Summary :* ${(s.summary || '').substring(0, 150)}...\n`;
        md += `    - *Ordonnance :* ${(s.ordonnance || '').substring(0, 150)}...\n`;
      });
    } else {
      md += `- **Sub-CATs** : *Aucun (Fiche univoque monobloc - Règle d'abstention respectée)*\n`;
    }
    md += `\n#### 📄 Extrait Fiche Principale (Master) :\n`;
    md += `\`\`\`markdown\n${(r.rawCat.summary || '').substring(0, 400)}...\n\`\`\`\n`;
    md += `\n#### 💊 Extrait Ordonnance Master :\n`;
    md += `\`\`\`markdown\n${(r.rawCat.ordonnance || '').substring(0, 400)}...\n\`\`\`\n\n---\n\n`;
  });

  const mdPath = path.join(__dirname, '../docs/test_generation_sample_report.md');
  fs.writeFileSync(mdPath, md);

  // Copy to shared storage
  try {
    fs.copyFileSync(mdPath, '/storage/emulated/0/termux-files/test_generation_sample_report.md');
    fs.copyFileSync(reportPath, '/storage/emulated/0/termux-files/test_generation_sample_report.json');
    console.log('\n📱 Rapport copié sur le stockage tablette : /storage/emulated/0/termux-files/test_generation_sample_report.md');
  } catch (_) {}

  console.log('\n================================================================');
  console.log('🏁 TEST DE GÉNÉRATION TERMINÉ !');
  console.log(`📄 Rapport complet disponible dans : ${mdPath}`);
  console.log('================================================================\n');
}

runTestGeneration().catch(err => {
  console.error('Fatal error during test run:', err);
  process.exit(1);
});
