const { execSync } = require('child_process');
const path = require('path');

const ROOT = path.join(__dirname, '..');
const testFiles = [
  { name: 'Step Accordions & Sub-CAT Parser Test', file: 'tests/test_accordions_and_subcats.mjs' },
  { name: 'Doctor-Grade Compact Print Formatter Test', file: 'tests/test_print_formatter.mjs' },
  { name: 'Client References & Lint Static Audit', file: 'tests/lint_client_references.mjs' },
  { name: 'Prescription Rendering Test', file: 'tests/test_prescription.mjs' },
  { name: 'Reprendre la révision Test', file: 'tests/test_resume.mjs' },
  { name: 'Suggestion Lifecycle Test', file: 'tests/test_suggestions.js' },
  { name: 'Auth & Security Test', file: 'tests/test_auth.js' },
  { name: 'API & Server Smoke Test', file: 'tests/test_api.js' }
];

console.log('🚀 Running Dr. CAT Automated Test Suite Suite...\n');

let totalPassed = 0;
let totalFailed = 0;

for (const t of testFiles) {
  console.log(`--------------------------------------------------`);
  console.log(`🏃 Running: ${t.name} (${t.file})`);
  console.log(`--------------------------------------------------`);
  try {
    try { execSync('pkill -f "node server.js" 2>/dev/null || true'); } catch (_) {}
    const output = execSync(`node ${t.file}`, { cwd: ROOT, encoding: 'utf-8', stdio: 'inherit' });
    totalPassed++;
  } catch (err) {
    console.error(`❌ Suite Failed: ${t.name}`);
    totalFailed++;
  }
}

console.log(`\n==================================================`);
console.log(`📊 MASTER TEST SUITE SUMMARY: ${totalPassed} Passed, ${totalFailed} Failed`);
console.log(`==================================================\n`);

process.exit(totalFailed > 0 ? 1 : 0);
