#!/usr/bin/env node

/**
 * CAT Database Generator (State-of-the-Art Medical LLM Engine)
 * Synthesizes pre-extracted offline PDF text (pdf_index.json) + reputable medical source guidelines + strict anti-hallucination validation.
 */

const fs = require('fs');
const path = require('path');
const { searchLocalPDFs, listAvailablePDFs } = require('./lib/pdf-extractor');
const { validateCAT, isAdministrativeCAT } = require('./lib/medical-validator');
const { VALID_CATEGORIES, buildSearchQueries } = require('./lib/medical-sources');
const { generateCATWithLLM } = require('./lib/llm-engine');

const { getStagingDbPath } = require('./lib/db-paths');
const ROOT_DB_PATH = path.join(__dirname, '..', 'cats_db.json');
const DEFAULT_V2_OUTPUT_PATH = getStagingDbPath();
const OUTPUT_DIR = path.join(__dirname, 'output');

function parseArgs() {
  const args = process.argv.slice(2);
  const options = {
    mode: 'help',
    title: null,
    category: null,
    batchFile: null,
    discover: false,
    rebuildAll: false,
    dryRun: false,
    saveToProd: false,
    outputPath: null,
    limit: null
  };

  for (let i = 0; i < args.length; i++) {
    const arg = args[i];
    if (arg === '--title' || arg === '--single' || arg === '-t') {
      options.mode = 'single';
      options.title = args[++i];
    } else if (arg === '--category' || arg === '-c') {
      options.category = args[++i];
    } else if (arg === '--batch' || arg === '-b') {
      options.mode = 'batch';
      if (args[i + 1] && !args[i + 1].startsWith('-')) {
        options.batchFile = args[++i];
      }
    } else if (arg === '--discover' || arg === '-d') {
      options.mode = 'discover';
      options.discover = true;
    } else if (arg === '--rebuild-all' || arg === '-r') {
      options.mode = 'rebuild';
      options.rebuildAll = true;
    } else if (arg === '--dry-run') {
      options.dryRun = true;
    } else if (arg === '--canary') {
      options.mode = 'canary';
    } else if (arg === '--golden') {
      options.mode = 'golden';
    } else if (arg === '--save-to-prod') {
      options.saveToProd = true;
    } else if (arg === '--limit' || arg === '-l') {
      options.limit = parseInt(args[++i], 10);
    } else if (arg === '--output' || arg === '-o') {
      options.outputPath = args[++i];
    } else if (arg === '--help' || arg === '-h') {
      options.mode = 'help';
    }
  }

  return options;
}

function printHeader() {
  console.log('====================================================');
  console.log(' 🩺 Dr. CAT — Database Generator (Medical LLM Engine)');
  console.log('====================================================\n');
}

function printUsage() {
  console.log('Usage & Options:');
  console.log('  --single, -t <Title>      Generate or update 1 specific CAT (e.g. --title "CAT devant insolation")');
  console.log('  --category, -c <Cat>     Specify specialty category (e.g. --category "Cardiologie")');
  console.log('  --batch, -b [file.json]  Batch generate CATs from input JSON array or default database list');
  console.log('  --discover, -d           Scan pdf_index.json & medical sources to discover unmapped clinical topics');
  console.log('  --rebuild-all, -r        Validate and verify the entire generated database schema (canaries run first)');
  console.log('  --canary                 Run dosage-parser canary self-tests only (no LLM call, no cost)');
  console.log('  --golden, [--limit N]    Re-generate the 5 golden-set cases and score clinical expectations (uses LLM)');
  console.log('  --dry-run                Run AI generation and validation without writing to disk');
  console.log('  --limit, -l <number>     Limit batch mode execution to N items (useful for testing)');
  console.log('  --output, -o <file.json> Custom output file path (defaults to cat_db_generator/cats_db_staged.json)');
  console.log('  --save-to-prod           Explicitly save to main app database (cats_db.json)\n');
  console.log('Examples:');
  console.log('  node cat_db_generator/generate_cat_db.js --title "CAT devant insolation" --category "Urgences"');
  console.log('  node cat_db_generator/generate_cat_db.js --batch --limit 3');
  console.log('  node cat_db_generator/generate_cat_db.js --discover');
  console.log('  node cat_db_generator/generate_cat_db.js --canary');
  console.log('  node cat_db_generator/generate_cat_db.js --golden\n');
}

// ─── Parser Canaries ─────────────────────────────────────────────────────────
// The validator's dosage regexes only work because the prompts force a rigid
// posology format. If a future prompt edit changes that format, regexes stop
// matching AND validation reports zero errors — silent blindness. These
// canaries feed KNOWN trap strings through validateCAT and assert the expected
// safety verdict still fires. Dynamic traps are derived from the live ceilings
// data so they never go stale when drug rules evolve.

function makeCanaryCat(ordonnance) {
  return {
    id: 9999,
    category: 'Cardiologie',
    title: 'CAT canary test poussée hypertensive',
    search_keywords: ['canary'],
    pdf_keywords: ['canary'],
    summary: '**1. Évaluation initiale & Diagnostic :** Mesure de la PA aux deux bras.\n' +
      '**2. Conduite immédiate si drapeau rouge :** Repos et surveillance.\n' +
      '**3. Examens complémentaires :** Bilan rénal, ECG.\n' +
      '**4. Prise en charge & Stratégie Thérapeutique :** Selon protocole en vigueur.\n' +
      '**5. Orientation, Suivi & Volet Médico-Légal :** Réévaluation à 48 heures.',
    red_flags: 'PAD > 130 mmHg, douleur thoracique, déficit neurologique focal.',
    ordonnance
  };
}

function loadCeilingsForCanaries() {
  const candidates = [
    path.join(__dirname, '..', 'data', 'clinical_drug_ceilings.json'),
    path.join(__dirname, 'clinical_drug_ceilings.json')
  ];
  for (const p of candidates) {
    if (fs.existsSync(p)) {
      try { return JSON.parse(fs.readFileSync(p, 'utf8')); } catch (e) {}
    }
  }
  return {};
}

function runParserCanaries() {
  const { validateCAT } = require('./lib/medical-validator');
  const ceilings = loadCeilingsForCanaries();
  const results = [];

  // Canary 1 — adult daily ceiling overload (dynamic trap from live data)
  const ceilingEntry = Object.entries(ceilings).find(([, d]) => d && d.adult_max_daily_ceiling_mg > 0);
  if (ceilingEntry) {
    const [, drug] = ceilingEntry;
    const singleMg = Math.ceil(drug.adult_max_daily_ceiling_mg / 2);
    const r = validateCAT(makeCanaryCat(`${drug.dci} ${singleMg} mg 4 fois/j pendant 5 jours.`));
    results.push({
      name: `Adult ceiling overload (${drug.dci} ${singleMg} mg x4 = 2x plafond)`,
      pass: r.errors.some(e => /plafond|overdose/i.test(e))
    });
  }

  // Canary 2 — pediatric mg/kg/j bound (dynamic trap)
  const pediaEntry = Object.entries(ceilings).find(([, d]) => d && d.pediatric_mg_per_kg_day && d.pediatric_mg_per_kg_day.max_mg_kg > 0);
  if (pediaEntry) {
    const [, drug] = pediaEntry;
    const overdoseMgKg = Math.ceil(drug.pediatric_mg_per_kg_day.max_mg_kg * 2);
    const r = validateCAT(makeCanaryCat(`${drug.dci} ${overdoseMgKg} mg/kg/j pendant 5 jours.`));
    results.push({
      name: `Pediatric mg/kg bound (${drug.dci} ${overdoseMgKg} mg/kg/j = 2x max)`,
      pass: r.errors.some(e => /posologie pédiatrique excessive/i.test(e))
    });
  }

  // Canary 3 — lethal unit-typo interceptor (fixed trap)
  {
    const r = validateCAT(makeCanaryCat('Paracétamol 100 g par jour si douleur.'));
    results.push({
      name: 'Lethal unit typo (Paracétamol 100 g)',
      pass: r.errors.some(e => /erreur typographique/i.test(e))
    });
  }

  // Canary 4 — unknown-molecule cross-check (fixed trap; validates section 7f wiring)
  {
    const r = validateCAT(makeCanaryCat('Zorblaxine 500 mg x2/j pendant 7 jours.'));
    results.push({
      name: 'Unknown molecule warning (Zorblaxine)',
      pass: r.warnings.some(w => /dci non référencée/i.test(w) && /zorblaxine/i.test(w))
    });
  }

  const failed = results.filter(r => !r.pass);
  console.log('\n🧪 PARSER CANARIES (dosage-regex self-test):');
  for (const r of results) {
    console.log(`   ${r.pass ? '✅' : '❌'} ${r.name}`);
  }
  if (failed.length > 0) {
    console.error(`\n🚨 ${failed.length}/${results.length} CANARY(IES) FAILED!`);
    console.error('   The prompt-format ↔ dosage-parser couple is BROKEN or a validator regression occurred.');
    console.error('   Validation would run BLIND on real prescriptions (zero dose checks, zero errors).');
    console.error('   → Fix medical-validator.js parsing OR restore the prompt posology format before continuing.');
    return false;
  }
  console.log(`   ✅ All ${results.length} canaries passed — parser is seeing doses correctly.`);
  return true;
}


/**
 * Single CAT Generator Mode
 */
async function generateSingleCAT(title, targetCategory, options) {
  console.log(`[Single Mode] Generating CAT: "${title}"...`);

  const category = targetCategory || 'Gastro-entérologie';
  if (!VALID_CATEGORIES.includes(category)) {
    console.error(`❌ Invalid Category "${category}". Must be one of:\n  ${VALID_CATEGORIES.join(', ')}`);
    process.exit(1);
  }

  // 1. RAG Search in pre-extracted pdf_index.json
  console.log(`🔍 Querying pre-extracted PDF index (pdf_index.json) for "${title}"...`);
  const pdfResults = await searchLocalPDFs(title, { maxMatchesPerFile: 3 });
  console.log(`✅ Found ${pdfResults.length} matching PDF index references (0 binary PDF extraction overhead).`);

  // 2. Call Real LLM API Engine with Schema Locking & Validation
  const result = await generateCATWithLLM(title, category, options);
  const catObj = result.cat;
  const metrics = result.metrics;

  console.log(`\n----------------------------------------------------`);
  console.log(`⚡ Execution Proven Live:`);
  console.log(`   - Model Used : ${metrics.model}`);
  console.log(`   - Latency    : ${metrics.latencyMs} ms`);
  console.log(`   - Tokens     : ${metrics.totalTokens} total (${metrics.promptTokens} prompt / ${metrics.completionTokens} completion)`);
  console.log(`   - Schema Lock: ${isAdministrativeCAT(catObj) ? 'ADMINISTRATIVE SCHEMA' : 'CLINICAL 5-STEP SCHEMA'}`);
  console.log(`----------------------------------------------------\n`);

  if (!result.validation.valid) {
    console.error(`❌ Medical Validation Checksum Failed (${result.validation.errors.length} error(s)):`);
    result.validation.errors.forEach(e => console.error(`   - ${e}`));
    process.exit(1);
  }

  if (result.validation.warnings.length > 0) {
    console.warn(`⚠️ Medical Warnings (${result.validation.warnings.length}):`);
    result.validation.warnings.forEach(w => console.warn(`   - ${w}`));
  }

  // Save to target destination
  if (options.dryRun) {
    console.log(`[Dry Run] Execution complete. Resulting CAT object:`);
    console.log(JSON.stringify(catObj, null, 2));
  } else {
    const savePath = options.saveToProd ? ROOT_DB_PATH : (options.outputPath || DEFAULT_V2_OUTPUT_PATH);
    const saveDir = path.dirname(savePath);
    if (!fs.existsSync(saveDir)) {
      fs.mkdirSync(saveDir, { recursive: true });
    }

    let db = [];
    if (fs.existsSync(savePath)) {
      db = JSON.parse(fs.readFileSync(savePath, 'utf8'));
    }

    const existingIndex = db.findIndex(c => c.title.toLowerCase() === catObj.title.toLowerCase());
    if (existingIndex >= 0) {
      catObj.id = db[existingIndex].id;
      db[existingIndex] = catObj;
      console.log(`🔄 Updated existing CAT (ID ${catObj.id}) in ${savePath}`);
    } else {
      catObj.id = db.length > 0 ? Math.max(...db.map(c => c.id || 0)) + 1 : 1;
      db.push(catObj);
      console.log(`➕ Added new CAT (ID ${catObj.id}) to ${savePath}`);
    }

    fs.writeFileSync(savePath, JSON.stringify(db, null, 2), 'utf8');
    console.log(`💾 Saved successfully to: ${savePath} (${db.length} total entries).`);
  }
}

/**
 * Batch CAT Generator Mode
 */
async function generateBatchCATs(options) {
  console.log(`[Batch Mode] Starting production AI generation batch...`);
  
  let topics = [];
  if (options.batchFile && fs.existsSync(options.batchFile)) {
    topics = JSON.parse(fs.readFileSync(options.batchFile, 'utf8'));
  } else if (fs.existsSync(ROOT_DB_PATH)) {
    topics = JSON.parse(fs.readFileSync(ROOT_DB_PATH, 'utf8'));
  } else {
    console.error(`❌ Input source not found for batch mode.`);
    process.exit(1);
  }

  if (options.limit && options.limit > 0) {
    topics = topics.slice(0, options.limit);
    console.log(`🎯 Limit applied: processing first ${topics.length} items.`);
  }

  console.log(`📋 Total items to generate via LLM: ${topics.length}\n`);

  const generatedDB = [];
  let validCount = 0;
  let totalTokensUsed = 0;

  for (let i = 0; i < topics.length; i++) {
    const item = topics[i];
    const title = item.title;
    const category = item.category || 'Gastro-entérologie';
    
    console.log(`[${i + 1}/${topics.length}] Processing ID ${item.id || i + 1}: "${title}" (${category})...`);

    try {
      const result = await generateCATWithLLM(title, category, { id: item.id || i + 1 });
      const catObj = result.cat;
      const metrics = result.metrics;
      totalTokensUsed += metrics.totalTokens;

      if (result.validation.valid) {
        validCount++;
        console.log(`   ✅ Success! Tokens: ${metrics.totalTokens} | Latency: ${metrics.latencyMs}ms`);
      } else {
        console.warn(`   ⚠️ Validation errors:`, result.validation.errors);
      }

      generatedDB.push(catObj);
    } catch (err) {
      console.error(`   ❌ Failed item "${title}":`, err.message);
    }

    // Rate-limiting delay between requests (1000ms)
    await new Promise(r => setTimeout(r, 1000));
  }

  // Save batch result safely
  const savePath = options.saveToProd ? ROOT_DB_PATH : (options.outputPath || DEFAULT_V2_OUTPUT_PATH);
  const saveDir = path.dirname(savePath);
  if (!fs.existsSync(saveDir)) {
    fs.mkdirSync(saveDir, { recursive: true });
  }

  fs.writeFileSync(savePath, JSON.stringify(generatedDB, null, 2), 'utf8');

  console.log('\n====================================================');
  console.log(' 🎉 BATCH LLM GENERATION COMPLETE!');
  console.log(` ✅ Validated CATs   : ${validCount} / ${generatedDB.length}`);
  console.log(` ⚡ Total Tokens Used: ${totalTokensUsed}`);
  console.log(` 💾 Result Saved To  : ${savePath}`);
  console.log('====================================================\n');
}

/**
 * Topic Discovery Mode
 */
async function discoverTopics() {
  console.log(`[Discovery Mode] Scanning pdf_index.json for clinical topics & guidelines...`);
  const pdfs = listAvailablePDFs();
  console.log(`📚 Found ${pdfs.length} reference documents indexed in pdf_index.json.`);

  pdfs.slice(0, 10).forEach(pdf => {
    console.log(`   - [${pdf.fileName}] (${pdf.totalPages} pages)`);
  });

  console.log(`\n💡 Discovered Candidate CAT Topics (Ready for AI Generation):`);
  console.log(`   1. CAT devant insolation et coup de chaleur`);
  console.log(`   2. CAT devant morsure d'animal et risque rabique`);
  console.log(`   3. CAT devant crise de colique néphrétique`);
  console.log(`   4. CAT devant brûlure cutanée thermique`);
  console.log(`   5. CAT devant corps étranger oculaire`);
}

/**
 * Rebuild & Full Validation Mode
 */
async function rebuildAll(options) {
  console.log('[Rebuild Mode] Running parser canaries first...');
  if (!runParserCanaries()) {
    console.error('\n❌ ABORTED: Fix the parser/prompt drift above before trusting any validation results.');
    process.exit(1);
  }

  const targetPath = options.outputPath || DEFAULT_V2_OUTPUT_PATH;
  const loadPath = fs.existsSync(targetPath) ? targetPath : ROOT_DB_PATH;

  console.log(`[Rebuild Mode] Loading & validating database at: ${loadPath}`);
  if (!fs.existsSync(loadPath)) {
    console.error(`❌ Database file not found at: ${loadPath}`);
    process.exit(1);
  }

  const db = JSON.parse(fs.readFileSync(loadPath, 'utf8'));
  console.log(`📋 Found ${db.length} CAT entries in database.`);

  let errorCount = 0;
  let warningCount = 0;

  db.forEach((cat, index) => {
    const val = validateCAT(cat);
    if (!val.valid) {
      errorCount += val.errors.length;
      console.error(`❌ Entry #${index + 1} (ID ${cat.id} - "${cat.title}") failed validation:`);
      val.errors.forEach(e => console.error(`     - ${e}`));
    }
    warningCount += val.warnings.length;
  });

  if (errorCount === 0) {
    console.log(`\n🎉 FULL DATABASE VALIDATION PASSED! All ${db.length} CATs conform strictly to medical & administrative schema standards.`);
    if (warningCount > 0) {
      console.log(`⚠️ Total Warnings: ${warningCount}`);
    }
  } else {
    console.error(`\n❌ FULL DATABASE VALIDATION FAILED with ${errorCount} total error(s).`);
  }
}

// ─── Golden Set Regression Mode ──────────────────────────────────────────────
// Re-generates a fixed set of representative cases and scores clinical
// expectations (regex must-contain / must-not-appear). Catches silent QUALITY
// drift after prompt edits — the failure mode schema validation cannot see.
// Costs ~5 flash-tier LLM calls. Never writes to any database.

async function runGoldenSet(options) {
  const goldenPath = path.join(__dirname, 'golden_set.json');
  if (!fs.existsSync(goldenPath)) {
    console.error('❌ golden_set.json not found next to generate_cat_db.js.');
    process.exit(1);
  }
  const { cases } = JSON.parse(fs.readFileSync(goldenPath, 'utf8'));
  const selected = options.limit && options.limit > 0 ? cases.slice(0, options.limit) : cases;

  console.log(`🏆 GOLDEN SET — regenerating ${selected.length}/${cases.length} fixed clinical cases...\n`);

  let passCount = 0;
  for (let i = 0; i < selected.length; i++) {
    const c = selected[i];
    console.log(`[${i + 1}/${selected.length}] ${c.title} (${c.category})`);
    let result;
    try {
      result = await generateCATWithLLM(c.title, c.category, { standardSingleOnly: true });
    } catch (err) {
      console.log(`   ❌ GENERATION FAILED: ${err.message}`);
      continue;
    }

    const cat = result.cat;
    const combined = [
      cat.summary, cat.red_flags, cat.ordonnance,
      ...(Array.isArray(cat.sub_cats) ? cat.sub_cats.flatMap(s => [s.summary, s.red_flags, s.ordonnance]) : [])
    ].filter(Boolean).join('\n');

    let casePass = true;
    for (const e of c.expect || []) {
      const ok = new RegExp(e.rx, 'i').test(combined);
      if (!ok) casePass = false;
      console.log(`   ${ok ? '✅' : '❌'} attendu: ${e.why} (${e.rx})`);
    }
    for (const f of c.forbid || []) {
      // A forbidden term only violates if it appears WITHOUT a warning clause
      // nearby ("éviter l'aspirine" is correct teaching, not a prescription).
      const forbidRx = new RegExp(f.rx, 'gi');
      let m;
      let bad = false;
      while ((m = forbidRx.exec(combined)) !== null) {
        const start = Math.max(0, m.index - 250);
        const end = Math.min(combined.length, m.index + m[0].length + 250);
        const ctx = combined.slice(start, end);
        const isSafeContext = /(?:évit|contre-?indiqu|interdi|proscri|ne\s+pas|ne\s+jamais|déclench|attention|prudence|formellement|risque|bannir|térato|foeto|fœto|toxicité|hors\s+amm)/i.test(ctx);
        if (!isSafeContext) {
          bad = true;
          break;
        }
      }
      if (bad) casePass = false;
      console.log(`   ${bad ? '❌ interdit présent:' : '✅ absent ou signalé (correct):'} ${f.why} (${f.rx})`);
    }
    if (!result.validation.valid) {
      casePass = false;
      console.log('   ❌ échec validation schéma:', result.validation.errors.slice(0, 3));
    }

    if (casePass) passCount++;
    console.log(`   → ${casePass ? '🟢 PASS' : '🔴 FAIL'}\n`);
    await new Promise(r => setTimeout(r, 1000));
  }

  console.log('====================================================');
  console.log(` 🏆 GOLDEN SET SCORE: ${passCount}/${selected.length} cases passed`);
  if (passCount < selected.length) {
    console.error(' ⚠️ Quality drift detected — review the prompt changes that introduced this regression.');
  }
  console.log('====================================================\n');
  process.exitCode = passCount === selected.length ? 0 : 1;
}

async function main() {
  printHeader();
  const options = parseArgs();

  switch (options.mode) {
    case 'single':
      if (!options.title) {
        console.error('❌ Please specify a title using --title "CAT devant..."');
        process.exit(1);
      }
      await generateSingleCAT(options.title, options.category, options);
      break;

    case 'batch':
      await generateBatchCATs(options);
      break;

    case 'discover':
      await discoverTopics();
      break;

    case 'rebuild':
      await rebuildAll(options);
      break;

    case 'canary':
      process.exit(runParserCanaries() ? 0 : 1);
      break;

    case 'golden':
      await runGoldenSet(options);
      break;

    case 'help':
    default:
      printUsage();
      break;
  }
}

main().catch(err => {
  console.error('❌ Fatal Execution Error:', err);
  process.exit(1);
});
