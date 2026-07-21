import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.join(__dirname, '..');

function runPrescriptionTests() {
  console.log('\n💊 Dr. CAT — Prescription Rendering Audit\n');
  let passed = 0, failed = 0;

  function check(name, ok) {
    if (ok) { console.log('  ✅ ' + name); passed++; }
    else { console.log('  ❌ ' + name); failed++; }
  }

  // 1. Verify index.html contains workspace-prescription ID
  const indexHtml = fs.readFileSync(path.join(ROOT, 'public/index.html'), 'utf-8');
  check('index.html contains id="workspace-prescription"', indexHtml.includes('id="workspace-prescription"'));

  // 2. Verify prescription.js targets workspace-prescription ID
  const prescriptionJs = fs.readFileSync(path.join(ROOT, 'public/js/components/workspace/prescription.js'), 'utf-8');
  check('prescription.js references document.getElementById("workspace-prescription")', prescriptionJs.includes('document.getElementById(\'workspace-prescription\')'));

  // 3. Verify index.html and workspace.css include official red medical stamp & paper pad styling
  const workspaceCss = fs.readFileSync(path.join(ROOT, 'public/css/workspace.css'), 'utf-8');
  check('index.html contains official-red-stamp element', indexHtml.includes('class="official-red-stamp"'));
  check('workspace.css contains .official-red-stamp styles', workspaceCss.includes('.official-red-stamp'));
  check('workspace.css contains natural paper sheet background', workspaceCss.includes('#fcfaf5'));

  console.log(`\n==================================================`);
  console.log(`Results: ${passed} passed, ${failed} failed`);
  console.log(`==================================================\n`);

  process.exit(failed > 0 ? 1 : 0);
}

runPrescriptionTests();
