/**
 * Automated Sanity & End-to-End Test Suite for Dr.CAT V3 Generator & Telemetry
 */

const http = require('http');
const path = require('path');
const fs = require('fs');

console.log('═══════════════════════════════════════════════════════════════════════');
console.log('🩺 DR.CAT V3 GENERATOR & TELEMETRY SANITY CHECK');
console.log('═══════════════════════════════════════════════════════════════════════\n');

async function runSanityTests() {
  let passedTests = 0;
  let totalTests = 0;

  function assert(condition, testName, details = '') {
    totalTests++;
    if (condition) {
      console.log(`✅ [PASS] ${testName}`);
      if (details) console.log(`   └─ ${details}`);
      passedTests++;
    } else {
      console.error(`❌ [FAIL] ${testName}`);
      if (details) console.error(`   └─ ${details}`);
    }
  }

  // --- TEST 1: MODULE INTEGRITY & DEPENDENCY RESOLUTION ---
  console.log('▶ TEST 1: Module Loading & Dependency Resolution');
  const debugEmitter = require('../cat_db_generator/lib/debug-emitter');
  const { validateCAT, isAdministrativeCAT } = require('../cat_db_generator/lib/medical-validator');
  const { searchLocalPDFs, getPdfIndex } = require('../cat_db_generator/lib/pdf-extractor');
  const { getCachedWebSources, extractSmartKeywords } = require('../cat_db_generator/lib/web-fetcher');
  const { callLLMApi, generateCATWithLLM } = require('../cat_db_generator/lib/llm-engine');
  const drugRules = require('../cat_db_generator/lib/drug-safety-rules.json');

  assert(!!debugEmitter && typeof debugEmitter.emitEvent === 'function', 'DebugEmitter Singleton initialized');
  assert(Array.isArray(drugRules.rules) && drugRules.rules.length >= 16, 'Dynamic Drug Safety Database loaded', `Covering ${drugRules.rules.length} drugs`);
  assert(typeof validateCAT === 'function', 'Medical Validator loaded');
  assert(typeof searchLocalPDFs === 'function', 'PDF Extractor loaded');
  assert(typeof generateCATWithLLM === 'function', 'LLM Engine loaded');

  // --- TEST 2: DYNAMIC DRUG SAFETY ENGINE ASSERTIONS ---
  console.log('\n▶ TEST 2: Dynamic Drug Safety Engine Assertions');
  
  // Paracetamol Overdose test (5000mg/day)
  const fakeOverdoseCAT = {
    id: 999,
    category: 'Gastro-entérologie',
    title: 'CAT devant Douleur Abdominale',
    summary: '**1. Évaluation initiale & Diagnostic**\nDiagnostic...\n**2. Drapeaux Rouges & Signes de Gravité**\nSignes...\n**3. Examens complémentaires**\nBilan...\n**4. Prise en charge & Conduite à tenir**\nTraitement...\n**5. Orientation & Suivi**\nSuivi...',
    red_flags: 'Drapeaux rouges urgents...',
    ordonnance: 'Paracétamol 1000 mg 5 fois/j si douleur.',
    pdf_keywords: ['douleur']
  };
  const validationOverdose = validateCAT(fakeOverdoseCAT);
  assert(
    !validationOverdose.valid && validationOverdose.errors.some(e => e.includes('5000mg/j') || e.includes('Paracétamol')),
    'Paracetamol 5g/day overdose correctly rejected by dynamic safety rule',
    validationOverdose.errors.find(e => e.includes('Paracétamol')) || 'No error'
  );

  // NSAID in Pregnancy Contraindication test
  const fakePregnancyCAT = {
    id: 999,
    category: 'Gynécologie-Obstétrique',
    title: 'CAT devant Douleur Pelvienne Grossesse',
    summary: '**1. Évaluation initiale & Diagnostic**\nGrossesse...\n**2. Drapeaux Rouges & Signes de Gravité**\nSignes...\n**3. Examens complémentaires**\nBilan...\n**4. Prise en charge & Conduite à tenir**\nIbuprofène 400 mg 3x/j pendant la grossesse...\n**5. Orientation & Suivi**\nSuivi...',
    red_flags: 'Drapeaux rouges urgents...',
    ordonnance: 'Ibuprofène 400 mg 3x/j',
    pdf_keywords: ['grossesse']
  };
  const validationPregnancy = validateCAT(fakePregnancyCAT);
  assert(
    !validationPregnancy.valid && validationPregnancy.errors.some(e => e.includes('Ibuprofène') || e.includes('24 SA')),
    'Ibuprofen in pregnancy correctly flagged by dynamic contraindication rule',
    validationPregnancy.errors.find(e => e.includes('Ibuprofène')) || 'No error'
  );

  // --- TEST 3: PDF EXTRACTOR & TELEMETRY EMISSION ---
  console.log('\n▶ TEST 3: PDF Extractor Search & Telemetry Events');
  debugEmitter.clearLogs();
  
  const pdfResults = await searchLocalPDFs('CAT devant une Anémie', { maxMatchesPerFile: 2 });
  const recentLogs = debugEmitter.getRecentLogs(300);
  const hasPdfSearchStart = recentLogs.some(l => l.type === 'pdf_search_start');
  const hasPdfSearchDone = recentLogs.some(l => l.type === 'pdf_search_done');

  assert(Array.isArray(pdfResults), 'searchLocalPDFs returned results array', `Found ${pdfResults.length} matching PDF documents`);
  assert(hasPdfSearchStart && hasPdfSearchDone, 'PDF search correctly emitted telemetry events to DebugEmitter', `Buffer has ${recentLogs.length} events (start: ${hasPdfSearchStart}, done: ${hasPdfSearchDone})`);

  // --- TEST 4: SMART KEYWORD NORMALIZER ---
  console.log('\n▶ TEST 4: Smart Keyword Extraction');
  const kw1 = extractSmartKeywords('CAT devant la gale humaine');
  const kw2 = extractSmartKeywords('CAT devant RGO / vomissements chez le nourrisson');
  assert(kw1.includes('gale'), 'Normalized "CAT devant la gale" -> ["gale"]', `Keywords: ${JSON.stringify(kw1)}`);
  assert(kw2.includes('rgo') && kw2.includes('vomissements'), 'Normalized multi-term title properly', `Keywords: ${JSON.stringify(kw2)}`);

  // --- TEST 5: SSE HTTP STREAM ENDPOINT ---
  console.log('\n▶ TEST 5: SSE Real-Time Stream Endpoint over HTTP');
  const sseCheck = await new Promise((resolve) => {
    const req = http.get('http://127.0.0.1:3000/api/admin/cat-generator/debug-stream', (res) => {
      let dataChunks = '';
      res.on('data', (chunk) => {
        dataChunks += chunk.toString();
      });

      // Emit a test event to trigger stream write
      setTimeout(() => {
        debugEmitter.emitEvent('sanity_test_event', { message: 'Verification event over live HTTP stream' });
      }, 200);

      setTimeout(() => {
        req.destroy();
        resolve({
          statusCode: res.statusCode,
          contentType: res.headers['content-type'] || '',
          receivedData: dataChunks.length > 0,
          dataSample: dataChunks.slice(0, 120)
        });
      }, 1500);
    });

    req.on('error', (err) => {
      resolve({ error: err.message });
    });
  });

  if (sseCheck.error) {
    assert(false, 'SSE Stream endpoint HTTP check', sseCheck.error);
  } else {
    assert(
      sseCheck.statusCode === 200 && sseCheck.contentType.includes('text/event-stream'),
      'SSE HTTP Endpoint responds with 200 text/event-stream',
      `Headers: ${sseCheck.contentType}`
    );
    assert(sseCheck.receivedData, 'SSE Client receives streamed data over HTTP', `Sample: ${sseCheck.dataSample}`);
  }

  // --- SUMMARY ---
  console.log('\n═══════════════════════════════════════════════════════════════════════');
  console.log(`📊 SANITY TEST SUMMARY: ${passedTests} / ${totalTests} TESTS PASSED (${Math.round((passedTests / totalTests) * 100)}%)`);
  console.log('═══════════════════════════════════════════════════════════════════════\n');

  if (passedTests === totalTests) {
    console.log('🎉 ALL V3 GENERATOR & TELEMETRY SANITY CHECKS PASSED PERFECTLY!\n');
    process.exit(0);
  } else {
    console.error('⚠️ SOME SANITY CHECKS FAILED!\n');
    process.exit(1);
  }
}

runSanityTests().catch(err => {
  console.error('Fatal test error:', err);
  process.exit(1);
});
