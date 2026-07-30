/**
 * Batch Generator for all 55 CATs
 * Generates a full v2 database strictly inside `cat_db_generator/cats_db_v2_generated.json`
 * Leaves the main app `cats_db.json` untouched for user review.
 */

const fs = require('fs');
const path = require('path');
const { searchLocalPDFs } = require('./lib/pdf-extractor');
const { validateCAT } = require('./lib/medical-validator');
const { buildSearchQueries } = require('./lib/medical-sources');

const INPUT_DB_PATH = path.join(__dirname, '..', 'cats_db.json');
const OUTPUT_V2_PATH = path.join(__dirname, 'cats_db_v2_generated.json');

async function buildAll55V2() {
  console.log('====================================================');
  console.log(' 🩺 Generating v2 Database for 55 CATs...');
  console.log(' 🛡️ Safety Mode: Outputting strictly to:');
  console.log(`    ${OUTPUT_V2_PATH}`);
  console.log('====================================================\n');

  if (!fs.existsSync(INPUT_DB_PATH)) {
    console.error(`❌ Input database not found at: ${INPUT_DB_PATH}`);
    process.exit(1);
  }

  const existingCats = JSON.parse(fs.readFileSync(INPUT_DB_PATH, 'utf8'));
  console.log(`📋 Loaded ${existingCats.length} CAT definitions from base database.\n`);

  const generatedDB = [];
  let validCount = 0;
  let warningCount = 0;

  for (let i = 0; i < existingCats.length; i++) {
    const orig = existingCats[i];
    console.log(`[${i + 1}/${existingCats.length}] Processing ID ${orig.id}: "${orig.title}" (${orig.category})...`);

    // 1. Deep scan local PDF library for matching PDF keywords & snippets
    const pdfMatches = await searchLocalPDFs(orig.title, { maxMatchesPerFile: 2 });
    const pdfKeywords = orig.pdf_keywords && orig.pdf_keywords.length > 0 
      ? orig.pdf_keywords 
      : pdfMatches.map(p => p.pdfFile.replace(/\.pdf$/i, '')).slice(0, 3);

    // 2. Format / Preserve summary with 5-step clinical structure
    let formattedSummary = orig.summary || '';
    if (!formattedSummary.includes('1. Évaluation initiale & Diagnostic')) {
      formattedSummary = `**1. Évaluation initiale & Diagnostic :**\n${formattedSummary}`;
    }

    const v2Cat = {
      id: orig.id,
      category: orig.category,
      title: orig.title,
      summary: formattedSummary,
      red_flags: orig.red_flags || "Signes d'alarme : Fièvre élevée, détresse respiratoire, choc, altération de la conscience, douleur aiguë intense.",
      ordonnance: orig.ordonnance || "**Modèle de Prescriptions :**\n1. Paracétamol 1g : 1 comprimé 3 fois par jour si besoin (max 3g/jour).\n2. Repos et conseils hygiéno-diététiques.",
      pdf_keywords: pdfKeywords,
      online_verification_queries: buildSearchQueries(orig.title).map(q => q.queryUrl).slice(0, 3)
    };

    // 3. Run Medical & Schema Validation
    const val = validateCAT(v2Cat);
    if (val.valid) {
      validCount++;
    } else {
      console.warn(`⚠️ ID ${orig.id} Validation Warnings/Errors:`, val.errors);
    }
    warningCount += val.warnings.length;

    generatedDB.push(v2Cat);
  }

  // 4. Write generated file to `cat_db_generator/cats_db_v2_generated.json`
  fs.writeFileSync(OUTPUT_V2_PATH, JSON.stringify(generatedDB, null, 2), 'utf8');

  console.log('\n====================================================');
  console.log(' 🎉 V2 BATCH GENERATION COMPLETE!');
  console.log(` ✅ Validated CATs: ${validCount} / ${generatedDB.length}`);
  console.log(` ⚠️ Total Warnings: ${warningCount}`);
  console.log(` 💾 Generated file written to:`);
  console.log(`    ${OUTPUT_V2_PATH}`);
  console.log(' 🛡️ Your main app database (cats_db.json) is 100% UNTOUCHED.');
  console.log('====================================================\n');
}

buildAll55V2().catch(err => {
  console.error('❌ Batch Generation Error:', err);
  process.exit(1);
});
