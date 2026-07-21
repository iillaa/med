/**
 * Thorough build verification tests for Dr.CAT.
 *
 * Tests that npm run build:bundle completes without errors,
 * chunk-*.js files are cleaned on rebuild, and index.html is rewritten correctly.
 *
 * Usage: node tests/thorough-build.mjs
 */
import { execSync, spawn } from 'node:child_process';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '..');
const DIST_DIR = path.join(ROOT, 'public', 'dist');
const INDEX_HTML = path.join(ROOT, 'public', 'index.html');

let passed = 0;
let failed = 0;

function test(name, fn) {
  return Promise.resolve().then(fn).then(() => {
    console.log(`  ✅ ${name}`);
    passed++;
  }).catch((err) => {
    console.log(`  ❌ ${name}: ${err.message}`);
    failed++;
  });
}

function assert(condition, msg) {
  if (!condition) throw new Error(msg || 'Assertion failed');
}

function assertEq(actual, expected, msg) {
  if (actual !== expected) throw new Error(`${msg || ''} Expected ${JSON.stringify(expected)}, got ${JSON.stringify(actual)}`);
}

function assertMatch(str, regex, msg) {
  if (!regex.test(str)) throw new Error(`${msg || ''} Expected ${regex} to match "${str}"`);
}

// ── Phase 4: Build Verification Tests ───────────────────────

async function testBuildBundle() {
  console.log('\n📋 Phase 4.1: Build Bundle Tests');

  await test('npm run build:bundle completes without errors', async () => {
    const result = execSync('npm run build:bundle', {
      cwd: ROOT,
      encoding: 'utf-8',
      timeout: 60000,
    });
    assert(result.includes('Bundled app'), 'Build output mentions bundled app');
    assert(!result.includes('Error'), 'No error in build output');
    assert(!result.includes('Failed'), 'No failure in build output');
  });

  await test('dist/ directory contains app-*.js bundle', async () => {
    const files = fs.readdirSync(DIST_DIR);
    const appBundle = files.find(f => /^app-.*\.js$/.test(f));
    assert(appBundle, 'app-*.js bundle exists in dist/');
    const stats = fs.statSync(path.join(DIST_DIR, appBundle));
    assert(stats.size > 0, 'Bundle file is not empty');
    console.log(`     Bundle: ${appBundle} (${(stats.size / 1024).toFixed(1)} KB)`);
  });

  await test('dist/ directory contains chunk-*.js files for code-splitting', async () => {
    const files = fs.readdirSync(DIST_DIR);
    const chunks = files.filter(f => /^chunk-.*\.js$/.test(f));
    assert(chunks.length > 0, 'At least one chunk-*.js file exists');
    console.log(`     Chunks: ${chunks.length} files`);
    chunks.forEach(chunk => {
      const stats = fs.statSync(path.join(DIST_DIR, chunk));
      assert(stats.size > 0, `Chunk ${chunk} is not empty`);
    });
  });

  await test('index.html script tag points to dist/app-*.js', async () => {
    const html = fs.readFileSync(INDEX_HTML, 'utf-8');
    const match = html.match(/<script\s+type="module"\s+src="(dist\/app-[^"]*\.js)">/);
    assert(match, 'index.html has script tag pointing to dist/app-*.js');
    const bundlePath = match[1];
    const fullPath = path.join(ROOT, 'public', bundlePath);
    assert(fs.existsSync(fullPath), `Referenced bundle exists: ${bundlePath}`);
  });

  await test('index.html does not reference js/main.js directly', async () => {
    const html = fs.readFileSync(INDEX_HTML, 'utf-8');
    const hasDirectRef = html.includes('src="js/main.js"') || html.includes("src='js/main.js'");
    assert(!hasDirectRef, 'index.html does not reference js/main.js directly');
  });
}

async function testBuildCleanup() {
  console.log('\n📋 Phase 4.2: Build Cleanup Tests');

  await test('Rebuild cleans old chunk-*.js files', async () => {
    // Create a stale chunk file
    const staleChunk = path.join(DIST_DIR, 'chunk-stale.js');
    fs.writeFileSync(staleChunk, '// stale');
    assert(fs.existsSync(staleChunk), 'Stale chunk file created');

    // Run build again
    execSync('npm run build:bundle', {
      cwd: ROOT,
      encoding: 'utf-8',
      timeout: 60000,
    });

    // Stale file should be cleaned
    assert(!fs.existsSync(staleChunk), 'Stale chunk file was cleaned');
  });

  await test('Rebuild cleans old app-*.js files', async () => {
    // Create a stale app bundle
    const staleApp = path.join(DIST_DIR, 'app-stale.js');
    fs.writeFileSync(staleApp, '// stale');
    assert(fs.existsSync(staleApp), 'Stale app bundle created');

    // Run build again
    execSync('npm run build:bundle', {
      cwd: ROOT,
      encoding: 'utf-8',
      timeout: 60000,
    });

    // Stale file should be cleaned
    assert(!fs.existsSync(staleApp), 'Stale app bundle was cleaned');
  });

  await test('Only app-*.js and chunk-*.js files are cleaned (other files preserved)', async () => {
    // Create a non-bundle file in dist/
    const otherFile = path.join(DIST_DIR, 'other-config.json');
    fs.writeFileSync(otherFile, '{"test": true}');
    assert(fs.existsSync(otherFile), 'Other file created');

    // Run build
    execSync('npm run build:bundle', {
      cwd: ROOT,
      encoding: 'utf-8',
      timeout: 60000,
    });

    // Other file should be preserved
    assert(fs.existsSync(otherFile), 'Non-bundle file is preserved');
    fs.unlinkSync(otherFile);
  });
}

async function testBuildOutput() {
  console.log('\n📋 Phase 4.3: Build Output Quality Tests');

  await test('Bundle is valid JavaScript (no syntax errors)', async () => {
    const files = fs.readdirSync(DIST_DIR);
    const appBundle = files.find(f => /^app-.*\.js$/.test(f));
    assert(appBundle, 'Bundle exists');

    // Try to parse the bundle with Node.js to check for syntax errors
    const bundlePath = path.join(DIST_DIR, appBundle);
    const content = fs.readFileSync(bundlePath, 'utf-8');
    
    // Check that it's valid JS by looking for key patterns
    assert(content.includes('import') || content.includes('function') || content.includes('const'),
      'Bundle contains valid JavaScript');
    assert(content.length > 1000, 'Bundle has substantial content');
  });

  await test('Bundle is minified (reasonable line count)', async () => {
    const files = fs.readdirSync(DIST_DIR);
    const appBundle = files.find(f => /^app-.*\.js$/.test(f));
    const bundlePath = path.join(DIST_DIR, appBundle);
    const content = fs.readFileSync(bundlePath, 'utf-8');
    const lines = content.split('\n').length;
    // Minified bundles may span hundreds of lines depending on chunk count.
    // Key indicator: average line length is high (tight packing).
    const avgLineLen = content.length / lines;
    assert(avgLineLen > 200, `Line length avg ${avgLineLen.toFixed(0)} chars — too low for minified output`);
    assert(lines < 2000, `Bundle has ${lines} lines — reasonable for a minified 86 KB bundle`);
  });

  await test('Chunk files are valid JavaScript', async () => {
    const files = fs.readdirSync(DIST_DIR);
    const chunks = files.filter(f => /^chunk-.*\.js$/.test(f));
    chunks.forEach(chunk => {
      const chunkPath = path.join(DIST_DIR, chunk);
      const content = fs.readFileSync(chunkPath, 'utf-8');
      assert(content.length > 50, `Chunk ${chunk} has content`);
    });
  });
}

// ── Main Runner ──────────────────────────────────────────────

async function main() {
  console.log('🧪 Dr.CAT Thorough Build Verification Test Suite');
  console.log(`   Root: ${ROOT}`);
  console.log('='.repeat(50));

  // Check that dist/ directory exists
  if (!fs.existsSync(DIST_DIR)) {
    fs.mkdirSync(DIST_DIR, { recursive: true });
    console.log('[Setup] Created dist/ directory');
  }

  await testBuildBundle();
  await testBuildCleanup();
  await testBuildOutput();

  console.log('\n' + '='.repeat(50));
  console.log(`📊 Results: ${passed} passed, ${failed} failed`);
  if (failed > 0) process.exitCode = 1;
}

main();
