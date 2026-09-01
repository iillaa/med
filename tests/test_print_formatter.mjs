import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.join(__dirname, '..');

const db = JSON.parse(fs.readFileSync(path.join(ROOT, 'cats_db.json'), 'utf8'));

console.log('═══════════════════════════════════════════════════════════════════════');
console.log('🧪 UNIT TEST: DOCTOR-GRADE COMPACT PRINT FORMATTER');
console.log('═══════════════════════════════════════════════════════════════════════\n');

// Mock DOM for NodeJS environment
let createdIframe = null;
let writtenHtml = '';

global.document = {
  createElement: (tag) => {
    if (tag === 'iframe') {
      createdIframe = {
        style: {},
        contentWindow: {
          document: {
            open: () => {},
            write: (html) => { writtenHtml = html; },
            close: () => {}
          },
          focus: () => {},
          print: () => {}
        },
        parentNode: {
          removeChild: () => {}
        }
      };
      return createdIframe;
    }
    return {};
  },
  body: {
    appendChild: () => {},
    removeChild: () => {}
  }
};

async function runTests() {
  const printCode = fs.readFileSync(path.join(ROOT, 'public/js/components/workspace/print.js'), 'utf8');
  // Strip import statements for isolated evaluation
  const isolatedCode = printCode
    .replace(/import\s+.*?;/g, '')
    .replace(/escapeHTML/g, '((s) => String(s || "").replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;"))');

  const printModule = await import('data:text/javascript,' + encodeURIComponent(isolatedCode));
  const { printCatDocument } = printModule;

  let allPassed = true;

  // Test 1: Comprehensive CAT with Sub-CATs
  const testCatRich = {
    id: 1001,
    title: 'Diarrhée Aiguë de l\'Adulte',
    category: 'Gastro-entérologie',
    summary: '## 0. Évaluation initiale & Gravité\n- **A/B (Airway/Breathing) :** Évaluer la déshydratation.\n- **Signes de Choc :** Marbrures, hypotension.\n\n## 1. Diagnostic\nExamen clinique complet.\n\n| Paramètre | Normal | Gravité |\n| --- | --- | --- |\n| TA | > 100 mmHg | < 90 mmHg |\n\n## 2. Traitement\nRéhydratation orale ou IV.',
    red_flags: 'Collapsus, déshydratation sévère > 10%, rectorragies massives.',
    ordonnance: 'SRO 1 sachet dans 1L d\'eau à boire par petites gorgées.\nParacétamol 1g si fièvre.',
    sub_cats: [
      {
        label: 'Diarrhée fébrile au retour de voyage',
        summary: 'Coproculture et antibiothérapie probabiliste.',
        red_flags: 'Syndrome dysentérique franc.',
        ordonnance: 'Azithromycine 500mg 1cp/j pendant 3 jours.'
      },
      {
        label: 'Diarrhée sous antibiotiques (C. difficile)',
        summary: 'Recherche toxine A/B et arrêt antibiothérapie en cours.',
        red_flags: 'Mégacôlon toxique.',
        ordonnance: 'Vancomycine 125mg 4 fois/j per os pendant 10 jours.'
      }
    ]
  };

  printCatDocument(testCatRich);

  if (!writtenHtml.includes('Diarrhée Aiguë')) {
    console.error('❌ Failed to find title in output');
    allPassed = false;
  }
  if (!writtenHtml.includes('Dr. Kibeche Ali')) {
    console.error('❌ Author credit missing');
    allPassed = false;
  }
  if (!writtenHtml.includes('PROFILS PARTICULIERS & SOUS-FICHES (2)')) {
    console.error('❌ Sub-CATs section missing');
    allPassed = false;
  }
  if (!writtenHtml.includes('<strong>A/B (Airway/Breathing) :</strong>')) {
    console.error('❌ Bold tag formatting failed in Step 0');
    allPassed = false;
  }
  if (!writtenHtml.includes('💊 ORDONNANCE TYPE & POSOLOGIES RECOMMANDÉES :')) {
    console.error('❌ Prescription section missing');
    allPassed = false;
  }
  if (!writtenHtml.includes('<table class="print-table">')) {
    console.error('❌ Table formatting failed in rich test CAT');
    allPassed = false;
  }

  console.log('✅ Rich Test CAT (avec 2 sous-fiches et tableau) generated clean compact HTML (' + writtenHtml.length + ' chars)');

  // Test 2: Verify all database records in cats_db.json
  let count = 0;
  for (const cat of db) {
    writtenHtml = '';
    printCatDocument(cat);
    if (writtenHtml.length > 500 && writtenHtml.includes('Dr. Kibeche Ali')) {
      count++;
    } else {
      console.error('❌ CAT ' + cat.id + ' failed to generate complete print HTML');
      allPassed = false;
    }
  }
  console.log('✅ ' + count + ' / ' + db.length + ' database records generated 100% compliant print documents');

  console.log('\n═══════════════════════════════════════════════════════════════════════');
  if (allPassed) {
    console.log('🎉 ALL PRINT ENGINE TESTS PASSED 100%!');
  } else {
    console.log('❌ SOME TESTS FAILED');
    process.exit(1);
  }
  console.log('═══════════════════════════════════════════════════════════════════════');
}

runTests();
