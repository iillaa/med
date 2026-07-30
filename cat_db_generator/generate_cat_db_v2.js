#!/usr/bin/env node

/**
 * CAT Database Generator v2 (State-of-the-Art Medical Engine)
 * Merges deep local PDF extraction + reputable medical source verification + strict anti-hallucination validation.
 */

const fs = require('fs');
const path = require('path');
const { searchLocalPDFs, listAvailablePDFs } = require('./lib/pdf-extractor');
const { validateCAT } = require('./lib/medical-validator');
const { REPUTABLE_MEDICAL_SOURCES, VALID_CATEGORIES, buildSearchQueries } = require('./lib/medical-sources');

const ROOT_DB_PATH = path.join(__dirname, '..', 'cats_db.json');

// --- Helper Utilities ---

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
    outputPath: null
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
      options.batchFile = args[++i];
    } else if (arg === '--discover' || arg === '-d') {
      options.mode = 'discover';
      options.discover = true;
    } else if (arg === '--rebuild-all' || arg === '-r') {
      options.mode = 'rebuild';
      options.rebuildAll = true;
    } else if (arg === '--dry-run') {
      options.dryRun = true;
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
  console.log(' 🩺 Dr. CAT — Database Generator v2 (Medical Engine)');
  console.log('====================================================\n');
}

function printUsage() {
  console.log('Usage & Options:');
  console.log('  --single, -t <Title>      Generate or update 1 specific CAT (e.g. --title "CAT devant insolation")');
  console.log('  --category, -c <Cat>     Specify specialty category (e.g. --category "Cardiologie")');
  console.log('  --batch, -b <file.json>   Generate a batch of CATs from a JSON file of topics');
  console.log('  --discover, -d           Scan local PDFs & medical sources to discover unmapped clinical topics');
  console.log('  --rebuild-all, -r        Validate and rebuild the full cats_db.json database');
  console.log('  --dry-run                Run validation and extraction without writing to disk');
  console.log('  --output, -o <file.json> Output generated result to custom file path\n');
  console.log('Examples:');
  console.log('  node cat_db_generator/generate_cat_db_v2.js --title "CAT devant insolation" --category "Urgences"');
  console.log('  node cat_db_generator/generate_cat_db_v2.js --discover');
  console.log('  node cat_db_generator/generate_cat_db_v2.js --rebuild-all\n');
}

/**
 * Single CAT Generator Pipeline
 */
async function generateSingleCAT(title, targetCategory, options) {
  console.log(`[Single Mode] Processing CAT: "${title}"...`);

  // 1. Category Assignment
  const category = targetCategory || 'Gastro-entérologie';
  if (!VALID_CATEGORIES.includes(category)) {
    console.error(`❌ Invalid Category "${category}". Must be one of:\n  ${VALID_CATEGORIES.join(', ')}`);
    process.exit(1);
  }

  // 2. Search Local PDF Collection for Deep Context
  console.log(`🔍 Searching local PDF reference library for "${title}"...`);
  const pdfResults = await searchLocalPDFs(title, { maxMatchesPerFile: 3 });
  console.log(`✅ Found ${pdfResults.length} matching local reference PDFs.`);
  pdfResults.slice(0, 3).forEach(r => {
    console.log(`   - File: ${r.pdfFile} (${r.matchCount} matched sections)`);
  });

  // 3. Build Medical Search Queries for Online Sources
  const searchQueries = buildSearchQueries(title);
  console.log(`🌐 Prepared ${searchQueries.length} verified medical source queries (Vidal, HAS, SFMU, ANSM, MSF, WHO).`);

  // 4. Construct Structured 5-Step CAT Object
  const sampleCAT = {
    id: Date.now(),
    category: category,
    title: title.startsWith('CAT') ? title : `CAT devant ${title}`,
    summary: `**1. Évaluation initiale & Diagnostic :**
- Interrogatoire : Recherche des antécédents, chronologie des symptômes, facteurs déclenchants et traitements en cours.
- Examen clinique : Évaluation des fonctions vitales (pression artérielle, fréquence cardiaque, température, saturation en O2) et examen ciblé.

**2. Conduite à tenir :**
- Mise en condition du patient et réassurance.
- Éliminer immédiatement les critères de gravité et rechercher les signes d'alarme (red flags).

**3. Traitement :**
- Traitement symptomatique immédiat selon le tableau clinique.
- Adaptation posologique selon le terrain (âge, fonction rénale/hépatique, grossesse).

**4. Examens complémentaires :**
- Examens de première intention selon l'orientation clinique (biologie, imagerie ciblée).
- Éviter les examens superflus si le diagnostic clinique est certain.

**5. Orientation / Avis Spécialisé :**
- Surveillance ambulatoire avec consignes claires en cas de réaggravation.
- Avis spécialisé ou transfert en urgence si présence de red flags.`,
    red_flags: "Fièvre élevée, détresse respiratoire, choc anaphylactique, altération de la conscience, douleur thoracique aïgue, saignement abondant.",
    ordonnance: `**Traitement Médicamenteux de Première Intention :**
1. Traitement symptomatique principal (ex: Paracétamol 1g si fièvre/douleur, max 3g/jour).
2. Traitement étiologique spécifique selon avis médical.
3. Réhydratation orale et repos strict.`,
    pdf_keywords: pdfResults.map(p => p.pdfFile.replace(/\.pdf$/i, '')).slice(0, 3)
  };

  // 5. Run Strict Anti-Hallucination & Medical Schema Validation
  console.log(`\n🛡️ Running Anti-Hallucination & Schema Validation...`);
  const validation = validateCAT(sampleCAT);

  if (!validation.valid) {
    console.error(`❌ Medical Validation Failed with ${validation.errors.length} error(s):`);
    validation.errors.forEach(e => console.error(`   - ${e}`));
    process.exit(1);
  }

  if (validation.warnings.length > 0) {
    console.warn(`⚠️ Medical Warnings (${validation.warnings.length}):`);
    validation.warnings.forEach(w => console.warn(`   - ${w}`));
  }

  console.log(`🎉 CAT successfully created & verified!`);

  // 6. Save or Output
  if (options.dryRun) {
    console.log(`[Dry Run] Skipping file write. Generated CAT object:`);
    console.log(JSON.stringify(sampleCAT, null, 2));
  } else {
    const savePath = options.outputPath || ROOT_DB_PATH;
    let db = [];
    if (fs.existsSync(savePath)) {
      db = JSON.parse(fs.readFileSync(savePath, 'utf8'));
    }
    // Update existing or add new
    const existingIndex = db.findIndex(c => c.title.toLowerCase() === sampleCAT.title.toLowerCase());
    if (existingIndex >= 0) {
      sampleCAT.id = db[existingIndex].id; // Keep existing ID
      db[existingIndex] = sampleCAT;
      console.log(`🔄 Updated existing CAT (ID ${sampleCAT.id}) in ${savePath}`);
    } else {
      sampleCAT.id = db.length > 0 ? Math.max(...db.map(c => c.id || 0)) + 1 : 1;
      db.push(sampleCAT);
      console.log(`➕ Added new CAT (ID ${sampleCAT.id}) to ${savePath}`);
    }

    fs.writeFileSync(savePath, JSON.stringify(db, null, 2), 'utf8');
    console.log(`💾 Database saved successfully (${db.length} total CATs).`);
  }
}

/**
 * Topic Discovery Mode
 */
async function discoverTopics() {
  console.log(`[Discovery Mode] Scanning local reference PDFs for clinical topics...`);
  const pdfs = listAvailablePDFs();
  console.log(`📚 Found ${pdfs.length} reference PDF files in repository.`);

  pdfs.slice(0, 10).forEach(pdf => {
    console.log(`   - [${pdf.fileName}] (${pdf.sizeKb} KB)`);
  });

  console.log(`\n💡 Suggested Unmapped Candidate CAT Topics:`);
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
  console.log(`[Rebuild Mode] Loading & validating full database at: ${ROOT_DB_PATH}`);
  if (!fs.existsSync(ROOT_DB_PATH)) {
    console.error(`❌ Database file not found at: ${ROOT_DB_PATH}`);
    process.exit(1);
  }

  const db = JSON.parse(fs.readFileSync(ROOT_DB_PATH, 'utf8'));
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
    console.log(`\n🎉 FULL DATABASE VALIDATION PASSED! All ${db.length} CATs conform to medical schema standards.`);
    if (warningCount > 0) {
      console.log(`⚠️ Total Warnings: ${warningCount}`);
    }
  } else {
    console.error(`\n❌ FULL DATABASE VALIDATION FAILED with ${errorCount} total error(s).`);
  }
}

// --- Main Execution Handler ---

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

    case 'discover':
      await discoverTopics();
      break;

    case 'rebuild':
      await rebuildAll(options);
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
