import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.join(__dirname, '..');

console.log('═══════════════════════════════════════════════════════════════════════');
console.log('🧪 TEST SUITE: DYNAMIC STEP ACCORDIONS & SUB-CAT PARSER');
console.log('═══════════════════════════════════════════════════════════════════════\n');

let passCount = 0;
let totalCount = 0;

function assert(condition, name, details = '') {
  totalCount++;
  if (condition) {
    console.log(`✅ [PASS] ${name}`);
    if (details) console.log(`   └─ ${details}`);
    passCount++;
  } else {
    console.error(`❌ [FAIL] ${name}`);
    if (details) console.error(`   └─ ${details}`);
  }
}

async function runTests() {
  const utilsCode = fs.readFileSync(path.join(ROOT, 'public/js/utils.js'), 'utf8');
  const utilsModule = await import('data:text/javascript,' + encodeURIComponent(utilsCode));
  const { parseSummaryMarkdown } = utilsModule;

  // TEST 1: Clinical Step Parsing
  const sampleClinicalMarkdown = `
**0. Stabilisation Immédiate & ABCDE (Si urgence vitale) :**
- Signes de choc anaphylactique
- Oxygénothérapie 10-15 L/min

**1. Diagnostic & Triage Initial :**
- Examen dermatologique
- Prurit nocturne

**2. Traitement & Conduite Pratique :**
- 1ère Intention : Ascabiol lotion
- Traitement de tout l'entourage

**3bis. Terrain Particulier & Grossesse :**
- Femme enceinte : application unique < 12h

**4. Critères d'Hospitalisation & Transfert :**
- Forme profuse ou surinfectée
`;

  const parsedHtml = parseSummaryMarkdown(sampleClinicalMarkdown);

  assert(parsedHtml.includes('<details class="cat-step-section step-theme-emergency" open>'), 'Step 0 parsed as Emergency Section with open=true');
  assert(parsedHtml.includes('<details class="cat-step-section step-theme-diagnostic" open>'), 'Step 1 parsed as Diagnostic Section with open=true');
  assert(parsedHtml.includes('<details class="cat-step-section step-theme-treatment" open>'), 'Step 2 parsed as Treatment Section with open=true');
  assert(parsedHtml.includes('<details class="cat-step-section step-theme-terrain" open>'), 'Step 3bis parsed as Terrain Section with open=true (full text visible by default)');
  assert(parsedHtml.includes('<details class="cat-step-section step-theme-hospital" open>'), 'Step 4 parsed as Hospitalization Section with open=true');
  assert(parsedHtml.includes('cat-step-title-toggle'), 'Step headers have cat-step-title-toggle class');

  // TEST 2: Administrative Step Parsing
  const sampleAdminMarkdown = `
**1. Cadre Légal & Définition :**
- Certificat médical initial légal

**2. Structure & Mentions Obligatoires :**
- Identité, Date, Signature, Cachet

**3. Formules Types & Rédaction :**
- Je soussigné Dr. certifie...
`;

  const parsedAdminHtml = parseSummaryMarkdown(sampleAdminMarkdown);
  assert(parsedAdminHtml.includes('Cadre Légal') && parsedAdminHtml.includes('step-theme-diagnostic'), 'Admin Step 1 parsed correctly');
  assert(parsedAdminHtml.includes('Structure') && parsedAdminHtml.includes('step-theme-treatment'), 'Admin Step 2 parsed correctly');
  assert(parsedAdminHtml.includes('Formules Types') && parsedAdminHtml.includes('step-theme-terrain'), 'Admin Step 3 parsed correctly');

  // TEST 3: Fallback on Non-Step Text
  const plainText = 'Ceci est une description médicale simple sans étapes numérotées.';
  const plainHtml = parseSummaryMarkdown(plainText);
  assert(!plainHtml.includes('<details'), 'Plain markdown falls back without creating accordion cards');
  assert(plainHtml.includes('<p>Ceci est une description médicale simple'), 'Plain markdown formatted as clean paragraph');

  // TEST 4: Workspace CSS Accordion & Sub-Profile Styles
  const workspaceCss = fs.readFileSync(path.join(ROOT, 'public/css/workspace.css'), 'utf-8');
  assert(workspaceCss.includes('.cat-step-section'), 'workspace.css contains .cat-step-section');
  assert(workspaceCss.includes('.cat-step-title-toggle'), 'workspace.css contains .cat-step-title-toggle');
  assert(workspaceCss.includes('.subcat-selector-bar'), 'workspace.css contains .subcat-selector-bar');
  assert(workspaceCss.includes('.subcat-pill'), 'workspace.css contains .subcat-pill');

  console.log(`\n═══════════════════════════════════════════════════════════════════════`);
  console.log(`📊 ACCORDION & SUBCAT TEST SUMMARY: ${passCount} / ${totalCount} TESTS PASSED`);
  console.log(`═══════════════════════════════════════════════════════════════════════\n`);

  if (passCount === totalCount) {
    console.log('🎉 ALL DYNAMIC ACCORDION & SUB-CAT TESTS PASSED 100%!\n');
    process.exit(0);
  } else {
    console.error('❌ SOME TESTS FAILED!\n');
    process.exit(1);
  }
}

runTests();
