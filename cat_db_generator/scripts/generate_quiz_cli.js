#!/usr/bin/env node

/**
 * CLI Tool to generate or view Quiz Suites for CATs
 * Usage:
 *   node cat_db_generator/scripts/generate_quiz_cli.js --cat 1
 *   node cat_db_generator/scripts/generate_quiz_cli.js --all
 *   node cat_db_generator/scripts/generate_quiz_cli.js --publish
 */

const fs = require('fs');
const path = require('path');
const { generateQuizSuiteForCat, exportToPublicQuizDb, QUIZ_STAGED_PATH, QUIZ_PROD_PATH } = require('../lib/quiz-generator-v2');

const CATS_DB_PATH = path.join(__dirname, '..', '..', 'cats_db.json');

async function main() {
  const args = process.argv.slice(2);
  const catIdArg = args.find((a, i) => args[i - 1] === '--cat' || a.startsWith('--cat='));
  const isAll = args.includes('--all');
  const isPublish = args.includes('--publish');

  if (isPublish) {
    if (!fs.existsSync(QUIZ_STAGED_PATH)) {
      console.error("Aucune base de quiz staging trouvée :", QUIZ_STAGED_PATH);
      process.exit(1);
    }
    const stagedSuites = JSON.parse(fs.readFileSync(QUIZ_STAGED_PATH, 'utf-8'));
    const publicList = exportToPublicQuizDb(stagedSuites);
    fs.writeFileSync(QUIZ_PROD_PATH, JSON.stringify(publicList, null, 2), 'utf-8');
    console.log(`✅ Base Quiz Publique mise à jour (${publicList.length} vignettes publiées dans public/data/quiz_db.json)`);
    return;
  }

  const rawCats = JSON.parse(fs.readFileSync(CATS_DB_PATH, 'utf-8'));

  let stagedSuites = [];
  if (fs.existsSync(QUIZ_STAGED_PATH)) {
    try {
      stagedSuites = JSON.parse(fs.readFileSync(QUIZ_STAGED_PATH, 'utf-8'));
    } catch (_) {
      stagedSuites = [];
    }
  }

  let targets = [];
  if (catIdArg) {
    const id = parseInt(catIdArg.includes('=') ? catIdArg.split('=')[1] : args[args.indexOf('--cat') + 1]);
    const found = rawCats.find(c => c.id === id);
    if (!found) {
      console.error(`CAT avec ID ${id} non trouvée.`);
      process.exit(1);
    }
    targets = [found];
  } else if (isAll) {
    targets = rawCats;
  } else {
    console.log("Usage : node generate_quiz_cli.js [--cat <id> | --all | --publish]");
    process.exit(0);
  }

  console.log(`🚀 Démarrage de la génération de Quiz pour ${targets.length} CAT(s)...`);

  for (const cat of targets) {
    console.log(`\n⏳ [CAT ${cat.id}] Génération du set de questions pour : ${cat.title}...`);
    try {
      const suite = await generateQuizSuiteForCat(cat);
      // Replace existing in staged
      const existingIdx = stagedSuites.findIndex(s => s.cat_id === cat.id);
      if (existingIdx >= 0) {
        stagedSuites[existingIdx] = suite;
      } else {
        stagedSuites.push(suite);
      }
      fs.writeFileSync(QUIZ_STAGED_PATH, JSON.stringify(stagedSuites, null, 2), 'utf-8');
      console.log(`✅ [CAT ${cat.id}] Set de questions généré avec succès dans le staging !`);
    } catch (err) {
      console.error(`❌ [CAT ${cat.id}] Erreur lors de la génération :`, err.message);
    }
  }

  // Auto-sync to public if requested
  const publicList = exportToPublicQuizDb(stagedSuites);
  fs.writeFileSync(QUIZ_PROD_PATH, JSON.stringify(publicList, null, 2), 'utf-8');
  console.log(`\n✨ Terminé ! ${stagedSuites.length} suites de quiz enregistrées dans ${QUIZ_STAGED_PATH}`);
}

main().catch(err => {
  console.error("Fatal CLI Error:", err);
  process.exit(1);
});
