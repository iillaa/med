/**
 * Batch Generator for all 55 CATs
 * Delegates to the production LLM engine inside `cat_db_generator/generate_cat_db_v2.js`.
 * Outputs strictly to `cat_db_generator/cats_db_v3_generated.json`.
 * Keeps main app `cats_db.json` untouched for user review.
 */

const { spawn } = require('child_process');
const path = require('path');

function runRealBatchGenerator() {
  console.log('====================================================');
  console.log(' 🩺 Triggering Real LLM Batch Generator v2 for all 55 CATs...');
  console.log('====================================================\n');

  const scriptPath = path.join(__dirname, 'generate_cat_db_v2.js');
  const child = spawn('node', [scriptPath, '--batch'], { stdio: 'inherit' });

  child.on('close', code => {
    if (code === 0) {
      console.log('\n🎉 Real Batch LLM Generation completed successfully!');
    } else {
      console.error(`\n❌ Batch Generator exited with error code ${code}`);
      process.exit(code);
    }
  });
}

runRealBatchGenerator();
