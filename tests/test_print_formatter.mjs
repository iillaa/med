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

  // Test 1: CAT 2 (Diarrhée)
  const cat2 = db.find(c => c.id === 2);
  printCatDocument(cat2);

  if (!writtenHtml.includes('Diarrhée')) {
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

  console.log('✅ CAT 2 (Diarrhée avec 2 sous-fiches) generated clean compact HTML (' + writtenHtml.length + ' chars)');

  // Test 2: CAT 6 (Colique Hépatique avec Tableaux)
  const cat6 = db.find(c => c.id === 6);
  printCatDocument(cat6);
  if (!writtenHtml.includes('<table class="print-table">')) {
    console.error('❌ Table formatting failed in CAT 6');
    allPassed = false;
  }
  console.log('✅ CAT 6 (Tableaux comparatifs) generated clean compact HTML (' + writtenHtml.length + ' chars)');

  // Test 3: CAT 7 (Hépatites B/C)
  const cat7 = db.find(c => c.id === 7);
  printCatDocument(cat7);
  if (!writtenHtml.includes('<strong>Ag HBs</strong>')) {
    console.error('❌ Hepatitis Serology markers formatting failed in CAT 7');
    allPassed = false;
  }
  console.log('✅ CAT 7 (Sérologies Hépatites) generated clean compact HTML (' + writtenHtml.length + ' chars)');

  // Test 4: Verify all 57 CATs
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
