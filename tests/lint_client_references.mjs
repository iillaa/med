import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.join(__dirname, '..');
const JS_DIR = path.join(ROOT, 'public/js');

console.log('═══════════════════════════════════════════════════════════════════════');
console.log('🔍 CLIENT STATIC ANALYSIS: IMPORTS & EXPORTS AUDIT');
console.log('═══════════════════════════════════════════════════════════════════════\n');

function getAllJsFiles(dir, fileList = []) {
  const files = fs.readdirSync(dir);
  files.forEach(file => {
    const fullPath = path.join(dir, file);
    if (fs.statSync(fullPath).isDirectory()) {
      getAllJsFiles(fullPath, fileList);
    } else if (file.endsWith('.js') && !file.endsWith('.min.js') && !file.endsWith('.cjs')) {
      fileList.push(fullPath);
    }
  });
  return fileList;
}

const jsFiles = getAllJsFiles(JS_DIR);
console.log(`Found ${jsFiles.length} JavaScript source files to audit.\n`);

let errorCount = 0;
let passCount = 0;

// Step 1: Collect all exports per module
const moduleExports = new Map();

jsFiles.forEach(file => {
  const content = fs.readFileSync(file, 'utf8');
  const relPath = path.relative(JS_DIR, file).replace(/\\/g, '/');
  const exports = new Set();

  // match: export function foo / export const foo / export let foo / export class foo
  const exportMatches = content.matchAll(/export\s+(?:function|const|let|var|class|async\s+function)\s+([a-zA-Z0-9_$]+)/g);
  for (const m of exportMatches) {
    exports.add(m[1]);
  }

  // match: export { a, b, c }
  const exportGroupMatches = content.matchAll(/export\s*\{([^}]+)\}/g);
  for (const gm of exportGroupMatches) {
    gm[1].split(',').forEach(item => {
      const name = item.trim().split(/\s+as\s+/)[0].trim();
      if (name) exports.add(name);
    });
  }

  // match: export default
  if (/export\s+default\s+/.test(content)) {
    exports.add('default');
  }

  moduleExports.set(relPath, exports);
});

// Step 2: Validate all named imports
jsFiles.forEach(file => {
  const content = fs.readFileSync(file, 'utf8');
  const relFile = path.relative(JS_DIR, file).replace(/\\/g, '/');

  // match: import { a, b } from './path.js' or '../path.js'
  const importMatches = content.matchAll(/import\s*\{([^}]+)\}\s*from\s*['"]([^'"]+)['"]/g);

  for (const m of importMatches) {
    const importedSymbols = m[1].split(',').map(s => s.trim().split(/\s+as\s+/)[0].trim()).filter(Boolean);
    const importPath = m[2];

    // Resolve relative path to moduleExports key
    const targetAbs = path.resolve(path.dirname(file), importPath);
    const targetRel = path.relative(JS_DIR, targetAbs).replace(/\\/g, '/');

    const targetExports = moduleExports.get(targetRel);

    if (!targetExports) {
      console.error(`❌ [BROKEN IMPORT] ${relFile} imports from unknown module "${importPath}" (resolved: ${targetRel})`);
      errorCount++;
      continue;
    }

    importedSymbols.forEach(sym => {
      if (!targetExports.has(sym)) {
        console.error(`❌ [UNDEFINED SYMBOL] ${relFile} imports "${sym}" which is NOT exported by ${targetRel}`);
        errorCount++;
      } else {
        passCount++;
      }
    });
  }
});

console.log(`\n═══════════════════════════════════════════════════════════════════════`);
console.log(`📊 AUDIT SUMMARY: ${passCount} Valid Named Imports, ${errorCount} Errors Found`);
console.log(`═══════════════════════════════════════════════════════════════════════\n`);

if (errorCount === 0) {
  console.log('🎉 ALL CLIENT IMPORTS & EXPORTS ARE 100% CLEAN AND RESOLVABLE!\n');
  process.exit(0);
} else {
  process.exit(1);
}
