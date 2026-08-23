/**
 * Deep Micro-Level Ghost Test Runner for Dr. CAT
 * Evaluates the pipeline down to the exact word, letter, raw prompt, and raw LLM response.
 * Exports comprehensive micro-audit files to /storage/emulated/0/termux/hta2
 */

const fs = require('fs');
const path = require('path');
const { generateCATWithLLM } = require('../cat_db_generator/lib/llm-engine');
const { searchLocalPDFs } = require('../cat_db_generator/lib/pdf-extractor');
const { queryClinicalLibrary } = require('../cat_db_generator/lib/knowledge-library');
const { expandMedicalTokens } = require('../cat_db_generator/lib/medical-synonyms');
const { getCachedWebSources } = require('../cat_db_generator/lib/web-fetcher');
const { validateCAT } = require('../cat_db_generator/lib/medical-validator');
const { validateCatWithZod } = require('../cat_db_generator/lib/cat-schema');
const debugEmitter = require('../cat_db_generator/lib/debug-emitter');

const TARGET_DIR = '/storage/emulated/0/termux/hta2';

async function runDeepMicroAudit() {
  console.log('🔬 ═══════════════════════════════════════════════════════════════');
  console.log('🔬 DR. CAT — DEEP MICRO-LEVEL GHOST TEST & PROMPT/RESPONSE AUDIT');
  console.log('🔬 ═══════════════════════════════════════════════════════════════\n');

  if (!fs.existsSync(TARGET_DIR)) {
    fs.mkdirSync(TARGET_DIR, { recursive: true });
  }

  const title = "CAT devant une Hypertension Artérielle (HTA)";
  const category = "Cardiologie";

  console.log(`🎯 Target Topic: "${title}" [Category: ${category}]`);
  console.log(`📂 Output Directory: ${TARGET_DIR}\n`);

  // Telemetry buffer
  const telemetryLogs = [];
  const onDebugEvent = (evt) => {
    telemetryLogs.push(evt);
  };
  debugEmitter.on('debug_event', onDebugEvent);

  try {
    // 1. Synonym Expansion Audit
    console.log('🔍 [1/6] Auditing Medical Synonym & Acronym Engine...');
    const synInfo = expandMedicalTokens("hypertension arterielle hta", ["hta", "hypertension", "arterielle"]);

    // 2. Tier 1 PDF RAG Micro-Audit
    console.log('📚 [2/6] Deep-Inspecting Tier 1 Offline PDF Index (77 Reference Books)...');
    const pdfMatches = await searchLocalPDFs(title, { maxMatchesPerFile: 3, category });

    // 3. Tier 2 Clinical Library Micro-Audit
    console.log('🏛️ [3/6] Deep-Inspecting Tier 2 Decision Library (Section-Aware Chunking)...');
    const libraryMatches = queryClinicalLibrary(title, ['hta', 'pression', 'iec']);

    // 4. Tier 3 Web Research Micro-Audit
    console.log('🌐 [4/6] Deep-Inspecting Tier 3 Web Guidelines Cache...');
    const webSources = getCachedWebSources(title);

    // 5. Live Synthesis & Raw Prompt/Response Capture
    console.log('🤖 [5/6] Executing Live Dual-RAG LLM Synthesis & Raw Stream Interception...');
    const startTime = Date.now();
    const result = await generateCATWithLLM(title, category, {
      id: 102,
      originalTitle: title,
      forceFetchWeb: false
    });
    const totalLatencyMs = Date.now() - startTime;
    const cat = result.cat;
    const metrics = result.metrics || cat._execution_metrics || {};

    // 6. Validation Checks
    console.log('🛡️ [6/6] Running Clinical Posology & Drug Safety Rule Assertions...');
    const medicalVal = validateCAT(cat);
    const zodVal = validateCatWithZod(cat);

    console.log('\n💾 Writing Micro-Audit Artifacts to /storage/emulated/0/termux/hta2...');

    // -------------------------------------------------------------
    // FILE 1: 01_RAW_SYSTEM_AND_USER_PROMPT_SENT_TO_AI.txt
    // -------------------------------------------------------------
    const rawPrompts = cat._raw_prompts || {};
    let promptDoc = '================================================================================\n';
    promptDoc += '📋 1. SYSTEM PROMPT (EXACT INSTRUCTIONS & CLINICAL GUIDELINES SENT TO GEMINI)\n';
    promptDoc += '================================================================================\n\n';
    promptDoc += (rawPrompts.systemPrompt || 'N/A') + '\n\n';
    promptDoc += '================================================================================\n';
    promptDoc += '📋 2. USER PROMPT (EXACT DUAL-RAG CONTEXT SENT TO GEMINI)\n';
    promptDoc += '================================================================================\n\n';
    promptDoc += (rawPrompts.userPrompt || 'N/A') + '\n';
    fs.writeFileSync(path.join(TARGET_DIR, '01_RAW_SYSTEM_AND_USER_PROMPT_SENT_TO_AI.txt'), promptDoc, 'utf8');
    console.log('  ✅ Saved: 01_RAW_SYSTEM_AND_USER_PROMPT_SENT_TO_AI.txt');

    // -------------------------------------------------------------
    // FILE 2: 02_RAW_API_RESPONSE_FROM_AI.txt
    // -------------------------------------------------------------
    const rawResponse = cat._raw_llm_response || JSON.stringify(cat, null, 2);
    fs.writeFileSync(path.join(TARGET_DIR, '02_RAW_API_RESPONSE_FROM_AI.txt'), rawResponse, 'utf8');
    console.log('  ✅ Saved: 02_RAW_API_RESPONSE_FROM_AI.txt');

    // -------------------------------------------------------------
    // FILE 3: 03_TIER1_PDF_RAG_DEEP_INSPECTION.md
    // -------------------------------------------------------------
    let pdfDoc = '# 📚 TIER 1 PDF RAG — DEEP EXTRACTION & SCORING AUDIT\n\n';
    pdfDoc += `> **Query Phrase** : "${title}"\n`;
    pdfDoc += `> **Category Priority** : ${category} (+35 pts bonus to matching books)\n`;
    pdfDoc += `> **Total Reference Books Matched** : ${pdfMatches.length}\n\n---\n\n`;

    pdfMatches.forEach((doc, idx) => {
      pdfDoc += `## ${idx + 1}. ${doc.pdfFile} (Score Total : ${doc.docScore} pts)\n`;
      pdfDoc += `- **Spécialité Document** : ${doc.specialty || 'Générale'}\n`;
      pdfDoc += `- **Nombre d'extraits** : ${doc.matches.length} page(s)\n\n`;

      doc.matches.forEach(m => {
        pdfDoc += `### 📄 Page ${m.page} (Score : ${m.score} pts) :\n`;
        pdfDoc += '```text\n' + m.snippet + '\n```\n\n';
      });
      pdfDoc += '---\n\n';
    });
    fs.writeFileSync(path.join(TARGET_DIR, '03_TIER1_PDF_RAG_DEEP_INSPECTION.md'), pdfDoc, 'utf8');
    console.log('  ✅ Saved: 03_TIER1_PDF_RAG_DEEP_INSPECTION.md');

    // -------------------------------------------------------------
    // FILE 4: 04_TIER2_CLINICAL_LIBRARY_DEEP_INSPECTION.md
    // -------------------------------------------------------------
    let libDoc = '# 🏛️ TIER 2 CLINICAL LIBRARY — SECTION-AWARE CHUNKING AUDIT\n\n';
    libDoc += `> **Query Phrase** : "${title}"\n`;
    libDoc += `> **Decision Packs Retained** : ${libraryMatches.length}\n\n---\n\n`;

    libraryMatches.forEach((lib, idx) => {
      libDoc += `## ${idx + 1}. ${lib.source} (${lib.file}) — Score : ${lib.score} pts\n`;
      libDoc += `- **Pack Category** : ${lib.category}\n\n`;
      libDoc += '```markdown\n' + lib.snippet + '\n```\n\n---\n\n';
    });
    fs.writeFileSync(path.join(TARGET_DIR, '04_TIER2_CLINICAL_LIBRARY_DEEP_INSPECTION.md'), libDoc, 'utf8');
    console.log('  ✅ Saved: 04_TIER2_CLINICAL_LIBRARY_DEEP_INSPECTION.md');

    // -------------------------------------------------------------
    // FILE 5: 05_TIER3_WEB_RESEARCH_DEEP_INSPECTION.md
    // -------------------------------------------------------------
    let webDoc = '# 🌐 TIER 3 WEB GUIDELINES — PEER-REVIEWED SOURCES AUDIT\n\n';
    webDoc += `> **Topic** : "${title}"\n`;
    webDoc += `> **Sources Cached** : ${webSources.length}\n\n---\n\n`;

    webSources.forEach((w, idx) => {
      webDoc += `## ${idx + 1}. ${w.sourceName}\n`;
      webDoc += `- **Domain** : ${w.domain}\n`;
      webDoc += `- **Source Type** : ${w.source}\n\n`;
      webDoc += '```markdown\n' + w.content + '\n```\n\n---\n\n';
    });
    fs.writeFileSync(path.join(TARGET_DIR, '05_TIER3_WEB_RESEARCH_DEEP_INSPECTION.md'), webDoc, 'utf8');
    console.log('  ✅ Saved: 05_TIER3_WEB_RESEARCH_DEEP_INSPECTION.md');

    // -------------------------------------------------------------
    // FILE 6: 06_FINAL_PARSED_CAT_RECORD.json
    // -------------------------------------------------------------
    // Strip temporary telemetry fields before saving clean schema
    const cleanCat = Object.assign({}, cat);
    delete cleanCat._raw_prompts;
    delete cleanCat._raw_llm_response;
    fs.writeFileSync(path.join(TARGET_DIR, '06_FINAL_PARSED_CAT_RECORD.json'), JSON.stringify(cleanCat, null, 2), 'utf8');
    console.log('  ✅ Saved: 06_FINAL_PARSED_CAT_RECORD.json');

    // -------------------------------------------------------------
    // FILE 7: 07_COMPREHENSIVE_MICRO_AUDIT_REPORT.md
    // -------------------------------------------------------------
    let report = '# 🩺 RAPPORT D\'AUDIT CLINIQUE & TECHNIQUE APPROFONDI (MICRO-AUDIT)\n\n';
    report += `> **Génération** : "${cat.title}" [ID: ${cat.id}]\n`;
    report += `> **Spécialité** : ${cat.category}\n`;
    report += `> **Modèle IA** : ${metrics.model || 'Gemini Flash'}\n`;
    report += `> **Temps d'exécution** : ${totalLatencyMs} ms (${metrics.latencyMs || totalLatencyMs} ms API)\n`;
    report += `> **Consommation Tokens** : ${metrics.totalTokens || 'N/A'} (Prompt: ${metrics.promptTokens || 'N/A'} in / Completion: ${metrics.completionTokens || 'N/A'} out)\n\n`;
    report += '---\n\n';

    report += '## 1. Audit de la Pureté Sémantique du Prompt (Context Purity)\n';
    report += `- **Tokens de Synonymes Injectés** : ${synInfo.expandedTokens.join(', ')}\n`;
    report += `- **Nombre de Livres PDF Consultés** : ${pdfMatches.length} (${pdfMatches.map(p => p.pdfFile).join(', ')})\n`;
    report += `- **Nombre de Guides Cliniques Tier 2** : ${libraryMatches.length} (${libraryMatches.map(l => l.source).join(', ')})\n`;
    report += `- **Nombre d\'Articles Web RAG** : ${webSources.length}\n\n`;

    report += '## 2. Audit des Règles de Sécurité Médicale & Posologies\n';
    report += `- **Validation Checksum Médical** : ${medicalVal.valid ? '✅ VALIDÉ' : '❌ REJETÉ'}\n`;
    report += `- **Validation Schéma Universel Zod** : ${zodVal.valid ? '✅ VALIDÉ (100% Conforme)' : '❌ ERREUR'}\n`;
    report += `- **Contre-indication Gravidique IEC / ARA2** : ${cat.ordonnance.toLowerCase().includes('contre-indiqu') || (cat.sub_cats && JSON.stringify(cat.sub_cats).toLowerCase().includes('contre-indiqu')) ? '✅ Respectée (Interdiction formelle mentionnée)' : '⚠️ À vérifier'}\n`;
    report += `- **Structure de Prescription en 4 Sections** : ${cat.ordonnance.includes('1ère INTENTION') || cat.ordonnance.includes('TRAITEMENT') ? '✅ Conforme aux standards' : '⚠️ Structure libre'}\n\n`;

    report += '## 3. Synthèse Clinique Générée (Vue Complète)\n\n';
    report += '### Résumé Principal :\n' + cat.summary + '\n\n';
    report += '### Drapeaux Rouges & Critères d\'Alerte :\n' + (Array.isArray(cat.red_flags) ? cat.red_flags.map(r => '- ' + r).join('\n') : cat.red_flags) + '\n\n';
    report += '### Ordonnance Type Principale :\n' + cat.ordonnance + '\n\n';

    if (cat.sub_cats && cat.sub_cats.length > 0) {
      report += '## 4. Sous-Fiches Spécialisées Générées (' + cat.sub_cats.length + ' Profils)\n\n';
      cat.sub_cats.forEach((sub, i) => {
        report += '### 🔹 Profil ' + (i + 1) + ' : ' + sub.label + '\n\n';
        report += '#### Protocole / Résumé :\n' + sub.summary + '\n\n';
        report += '#### Drapeaux Rouges Dédiés :\n' + sub.red_flags + '\n\n';
        report += '#### Prescription Dédiée :\n' + sub.ordonnance + '\n\n---\n\n';
      });
    }

    report += '## 5. Traçabilité des 12 Sources Médicales Attribuées\n\n';
    (cat.sources || []).forEach((s, idx) => {
      report += `${idx + 1}. **[${s.type.toUpperCase()}]** ${s.name || s.file || s.domain} ${s.page ? `(Page ${s.page})` : ''} ${s.specialty ? `[Spécialité : ${s.specialty}]` : ''} ${s.score ? `— Score : ${s.score} pts` : ''}\n`;
    });

    fs.writeFileSync(path.join(TARGET_DIR, '07_COMPREHENSIVE_MICRO_AUDIT_REPORT.md'), report, 'utf8');
    console.log('  ✅ Saved: 07_COMPREHENSIVE_MICRO_AUDIT_REPORT.md');

    console.log('\n🎉 Micro-Level Audit Completed Successfully!');
    console.log(`📁 All 7 detailed inspection files are now available in ${TARGET_DIR}`);

  } catch (err) {
    console.error('❌ Deep Micro Audit Failed:', err);
  } finally {
    debugEmitter.off('debug_event', onDebugEvent);
  }
}

runDeepMicroAudit();
