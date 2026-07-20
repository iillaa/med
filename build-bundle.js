/**
 * esbuild bundler for Dr.CAT (Phase 5.1).
 *
 * Bundles the browser ESM entry (public/js/main.js) into a single minified,
 * tree-shaken, content-hashed file under public/dist/. Vendored/native assets
 * (pdf.min.js, pdf.worker.min.js, capacitor.js) and build-generated files
 * (remote_config.js, server-providers.js/.cjs) are intentionally excluded.
 *
 * The hashed filename changes only when the bundle content changes, giving
 * permanent cache headers + automatic cache-busting without a query string.
 *
 * Run as part of `npm run build` (see build.js) on both local and CI runners.
 */
const fs = require('fs');
const path = require('path');
const esbuild = require('esbuild');

const PUBLIC_DIR = path.join(__dirname, 'public');
const ENTRY = path.join(PUBLIC_DIR, 'js', 'main.js');
const DIST_DIR = path.join(PUBLIC_DIR, 'dist');
const INDEX_HTML = path.join(PUBLIC_DIR, 'index.html');

function ensureDist() {
  if (!fs.existsSync(DIST_DIR)) fs.mkdirSync(DIST_DIR, { recursive: true });
  // Remove previously emitted app bundles so dist/ never accumulates stale
  // hashed files (the filename changes only when content changes).
  for (const f of fs.readdirSync(DIST_DIR)) {
    if (/^app-.*\.js$/.test(f)) fs.unlinkSync(path.join(DIST_DIR, f));
  }
}

function buildBundle() {
  ensureDist();

  // Bundle all modules reachable from main.js into one ESM file.
  // NOTE: with outdir + write:true, esbuild writes to disk and does NOT
  // populate result.outputFiles, so we read the emitted file from disk.
  esbuild.buildSync({
    entryPoints: [ENTRY],
    bundle: true,
    minify: true,
    format: 'esm',
    target: ['es2020'],
    sourcemap: false,
    logLevel: 'warning',
    outdir: DIST_DIR,
    entryNames: 'app-[hash]',
    legalComments: 'none',
  });

  // Find the freshly emitted bundle (single app-*.js in dist/).
  const files = fs.readdirSync(DIST_DIR).filter((f) => /^app-.*\.js$/.test(f));
  if (files.length === 0) {
    throw new Error('esbuild produced no JS output for the app bundle.');
  }
  // Pick the largest (the full bundle) to be safe against stale leftovers.
  files.sort((a, b) => fs.statSync(path.join(DIST_DIR, b)).size - fs.statSync(path.join(DIST_DIR, a)).size);
  const fileName = files[0];

  const sizeKb = Math.round(fs.statSync(path.join(DIST_DIR, fileName)).size / 1024);
  console.log(`Bundled app → public/dist/${fileName} (${sizeKb} KB minified)`);

  rewriteIndexScript(fileName);
  return fileName;
}

/**
 * Replace the module script tag in index.html so it loads the hashed bundle
 * instead of js/main.js. Preserves the surrounding markup and the existing
 * ?v= cache-buster that build.js manages.
 */
function rewriteIndexScript(bundleName) {
  if (!fs.existsSync(INDEX_HTML)) return;
  let html = fs.readFileSync(INDEX_HTML, 'utf-8');

  // Match: <script type="module" src="js/main.js?v=XXXX"></script>
  const pattern = /<script\s+type="module"\s+src="js\/main\.js[^"]*"><\/script>/;
  if (!pattern.test(html)) {
    console.warn('[bundle] Could not find js/main.js module script tag in index.html; skipping rewrite.');
    return;
  }

  const replacement = `<script type="module" src="dist/${bundleName}"></script>`;
  html = html.replace(pattern, replacement);
  fs.writeFileSync(INDEX_HTML, html, 'utf-8');
  console.log(`Rewired index.html module script → dist/${bundleName}`);
}

// Allow running directly: node build-bundle.js
if (require.main === module) {
  try {
    buildBundle();
  } catch (err) {
    console.error('[bundle] Build failed:', err);
    process.exit(1);
  }
}

module.exports = { buildBundle };
