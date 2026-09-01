const fs = require('fs');
const path = require('path');

// Phase 5.1: esbuild bundler for the browser app entry.
let buildBundle = () => {};
try {
  ({ buildBundle } = require('./build-bundle.js'));
} catch (_) {
  console.warn('[build] esbuild bundler not available; skipping app bundle.');
}

// Phase 5.4: inline critical (above-the-fold) CSS into index.html.
let inlineCriticalCss = () => {};
try {
  const { inlineIntoIndex } = require('./build-inline-critical-css.js');
  inlineCriticalCss = inlineIntoIndex;
} catch (_) {
  console.warn('[build] critical-css inliner not available; skipping.');
}
function rebuildClientAssets() {
  // Phase 5.4: inline critical CSS into index.html (before version-bump
  // stamping so the inlined <style> is preserved). No-op if unavailable.
  try {
    inlineCriticalCss();
  } catch (err) {
    console.error("Error inlining critical CSS during build:", err);
  }

  const publicDataDir = path.join(__dirname, 'public', 'data');
  if (!fs.existsSync(publicDataDir)) {
    fs.mkdirSync(publicDataDir, { recursive: true });
  }

  // Copy cats_db.json (stripping internal AI metrics, history, search queries, and minifying JSON to optimize PWA client asset size & protect IP)
  try {
    const rawDb = fs.readFileSync(path.join(__dirname, 'cats_db.json'), 'utf-8');
    const db = JSON.parse(rawDb);
    const cleanDb = db.map(c => {
      const {
        history,
        _execution_metrics,
        online_verification_queries,
        sources,
        _audit_trail,
        _raw_llm_response,
        ...rest
      } = c;
      if (Array.isArray(rest.sub_cats)) {
        rest.sub_cats = rest.sub_cats.map(sub => {
          const { _execution_metrics, online_verification_queries, sources, ...cleanSub } = sub;
          return cleanSub;
        });
      }
      return rest;
    });
    fs.writeFileSync(
      path.join(publicDataDir, 'cats_db.json'),
      JSON.stringify(cleanDb),
      'utf-8'
    );
    console.log("Copied cats_db.json (minified with internal AI metrics & history stripped) to public/data/");

    // Package quiz_db.json if staged or existing in public
    const stagedQuizPath = path.join(__dirname, 'cat_db_generator', 'quiz_db_staged.json');
    const publicQuizPath = path.join(publicDataDir, 'quiz_db.json');
    if (fs.existsSync(stagedQuizPath)) {
      try {
        const quizContent = fs.readFileSync(stagedQuizPath, 'utf-8');
        const parsed = JSON.parse(quizContent);
        fs.writeFileSync(publicQuizPath, JSON.stringify(parsed), 'utf-8');
        console.log("Copied quiz_db_staged.json to public/data/quiz_db.json");
      } catch (quizErr) {
        console.warn("⚠️ Warning: Failed to parse quiz_db_staged.json during build. Preserving existing public quiz_db.json:", quizErr.message);
      }
    } else if (fs.existsSync(publicQuizPath)) {
      console.log("Preserved existing public/data/quiz_db.json");
    }
  } catch (err) {
    console.error("Error packaging cats_db.json / quiz_db.json during build:", err);
    throw err;
  }

  // Clean and synchronize PDF indexes
  const { syncAndOptimizePdfIndexes } = require('./scripts/sync_pdf_index');
  try {
    syncAndOptimizePdfIndexes();
  } catch (syncErr) {
    console.warn('[Build] Warning during PDF index sync:', syncErr.message);
  }

  // Build clean public/data/pdf_index.json and pdf_list.json directly from public/pdfs/ and data/pdf_cache/
  const publicPdfsDir = path.join(__dirname, 'public', 'pdfs');
  const pdfCacheDir = path.join(__dirname, 'data', 'pdf_cache');

  if (fs.existsSync(publicPdfsDir)) {
    try {
      const publicFiles = fs.readdirSync(publicPdfsDir)
        .filter(f => f.toLowerCase().endsWith('.pdf') || f.toLowerCase().endsWith('.docx'));

      const cleanPublicIndex = [];
      const cleanPublicList = [];

      for (const file of publicFiles) {
        cleanPublicList.push(file);
        const cacheFile = path.join(pdfCacheDir, `${file}.json`);
        if (fs.existsSync(cacheFile)) {
          try {
            const cacheData = JSON.parse(fs.readFileSync(cacheFile, 'utf-8'));
            cleanPublicIndex.push({
              pdf: file,
              pages: Array.isArray(cacheData.pages) ? cacheData.pages.map(p => ({
                page: p.page,
                content: p.content || p.text || ''
              })) : []
            });
          } catch (_) {
            cleanPublicIndex.push({ pdf: file, pages: [] });
          }
        } else {
          cleanPublicIndex.push({ pdf: file, pages: [] });
        }
      }

      fs.writeFileSync(
        path.join(publicDataDir, 'pdf_index.json'),
        JSON.stringify(cleanPublicIndex),
        'utf-8'
      );
      console.log(`Generated clean public/data/pdf_index.json (${cleanPublicIndex.length} public books, 0 dev leaks)`);

      fs.writeFileSync(
        path.join(publicDataDir, 'pdf_list.json'),
        JSON.stringify(cleanPublicList),
        'utf-8'
      );
      console.log(`Generated clean public/data/pdf_list.json (${cleanPublicList.length} files)`);
    } catch (err) {
      console.error("Error generating public pdf_index.json during build:", err);
      throw err;
    }
  } else {
    console.warn("public/pdfs directory not found, skipping public PDF index generation.");
  }

  // Generate public/js/remote_config.js from remote_server_config.json
  const configFile = path.join(__dirname, 'remote_server_config.json');
  const configJsPath = path.join(__dirname, 'public', 'js', 'remote_config.js');
  let remoteServerUrl = '';
  let remoteServerUrls = [];
  let primaryProvider = null;
  
  if (fs.existsSync(configFile)) {
    try {
      const content = fs.readFileSync(configFile, 'utf-8');
      const parsed = JSON.parse(content);
      const rawList = Array.isArray(parsed.servers) ? parsed.servers.map(s => s.url) : (Array.isArray(parsed.urls) ? parsed.urls : [parsed.url]);
      remoteServerUrls = rawList.filter(Boolean).map(u => String(u).replace(/\/+$/, ''));
      remoteServerUrl = remoteServerUrls[0] || '';
      primaryProvider = parsed.primaryProvider || null;
    } catch (err) {
      console.error("Error reading remote_server_config.json during build:", err);
    }
  }

  try {
    fs.writeFileSync(
      configJsPath,
      `export const REMOTE_SERVER_URL = ${JSON.stringify(remoteServerUrl)};\nexport const REMOTE_SERVER_URLS = ${JSON.stringify(remoteServerUrls)};\nexport const REMOTE_SERVER_CONFIG = ${JSON.stringify({ primaryProvider, urls: remoteServerUrls })};\n`,
      'utf-8'
    );
    console.log(`Generated public/js/remote_config.js with ${remoteServerUrls.length} URL(s): ${remoteServerUrls.join(', ') || '(none)'}`);
  } catch (err) {
    console.error("Error writing remote_config.js during build:", err);
  }

  // 1. Auto-bump app-build-version in public/index.html AND auto-stamp every
  //    local CSS/JS asset with a cache-buster derived from the build version.
  //    This guarantees returning users (and the Android WebView) always fetch
  //    the freshest assets after a build — no manual ?v= edits, nothing missed.
  const now = new Date();
  const pad = (num) => String(num).padStart(2, '0');
  const versionString = `${now.getFullYear()}.${pad(now.getMonth() + 1)}.${pad(now.getDate())}.${pad(now.getHours())}.${pad(now.getMinutes())}`;
  // Compact numeric token (YYMMDDHHmm) used as ?v= — stable within a build,
  // changes every build. e.g. 2026.07.19.23.30 -> 2607192330
  const assetVersion = versionString.slice(2).replace(/\./g, '');

  // Rewrite ?v=... on a local asset URL (or append one if missing).
  // Only touches relative paths (css/…, js/…, style.css) — never CDN/https URLs.
  // Excludes assets that must NOT carry a query string:
  //   - capacitor.js: injected/served by the native bridge; a ?v= can break it.
  //   - pdf.min.js / pdf.worker.min.js: pdf.js resolves its worker by URL.
  const NO_STAMP = /(?:^|\/)(capacitor\.js|pdf\.min\.js|pdf\.worker\.min\.js)$/;
  const stampAsset = (content) =>
    content
      // Already-versioned local assets: replace the token.
      .replace(/(["'(])((?:\.\/)?(?:css\/|js\/)?[a-zA-Z0-9_\-./]+\.(?:css|js))\?v=[^"')]*/g,
        (m, pre, url) => (NO_STAMP.test(url) ? m : `${pre}${url}?v=${assetVersion}`))
      // Un-versioned local css/js links & imports: add ?v=.
      .replace(/((?:href|src)=["']|@import\s+["'])((?:\.\/)?(?:css\/|js\/)?[a-zA-Z0-9_\-./]+\.(?:css|js))(["'])/g,
        (m, pre, url, post) => (m.includes('?v=') || NO_STAMP.test(url) ? m : `${pre}${url}?v=${assetVersion}${post}`));

  // 1a. index.html: bump meta version + stamp all local asset links.
  try {
    const indexPath = path.join(__dirname, 'public', 'index.html');
    if (fs.existsSync(indexPath)) {
      let indexContent = fs.readFileSync(indexPath, 'utf-8');
      const pkg = JSON.parse(fs.readFileSync(path.join(__dirname, 'package.json'), 'utf-8'));
      const pkgVersion = pkg.version || '1.5.2';

      let updatedIndexContent = indexContent
        .replace(/<meta name="app-version" content="[^"]*">/, `<meta name="app-version" content="${pkgVersion}">`)
        .replace(/<meta name="app-build-version" content="[^"]*">/, `<meta name="app-build-version" content="${versionString}">`);

      if (!updatedIndexContent.includes('name="app-version"')) {
        updatedIndexContent = updatedIndexContent.replace(
          '<head>',
          `<head>\n  <meta name="app-version" content="${pkgVersion}">`
        );
      }

      updatedIndexContent = stampAsset(updatedIndexContent);

      if (updatedIndexContent !== indexContent) {
        fs.writeFileSync(indexPath, updatedIndexContent, 'utf-8');
        console.log(`Auto-bumped app-version to v${pkgVersion}, app-build-version to ${versionString} and stamped assets with ?v=${assetVersion}`);
      }
    }
  } catch (err) {
    console.error("Error auto-bumping app-version / app-build-version during build:", err);
  }

  // 1b. style.css: stamp the @import'd CSS files so they bust too.
  try {
    const stylePath = path.join(__dirname, 'public', 'style.css');
    if (fs.existsSync(stylePath)) {
      const styleContent = fs.readFileSync(stylePath, 'utf-8');
      const updatedStyle = stampAsset(styleContent);
      if (updatedStyle !== styleContent) {
        fs.writeFileSync(stylePath, updatedStyle, 'utf-8');
        console.log(`Stamped style.css @imports with ?v=${assetVersion}`);
      }
    }
  } catch (err) {
    console.error("Error stamping style.css imports during build:", err);
  }

  // 2. Generate CommonJS version of server-providers.js for server.js to require() without eval
  try {
    const srcPath = path.join(__dirname, 'public', 'js', 'server-providers.js');
    const destPath = path.join(__dirname, 'public', 'js', 'server-providers.cjs');
    if (fs.existsSync(srcPath)) {
      let content = fs.readFileSync(srcPath, 'utf-8');
      // Replace exports
      content = content.replace(/export\s+const\s+/g, 'const ');
      content = content.replace(/export\s+function\s+/g, 'function ');
      // Append module.exports
      content += `\n\nmodule.exports = {
  PROVIDERS,
  detectProvider,
  isTunnelUrl,
  getExtraHeaders,
  isDevHostname,
  isTunnelOrigin,
  getPrimaryProviderId,
  sortUrlsByProviderPriority
};\n`;
      fs.writeFileSync(destPath, content, 'utf-8');
      console.log("Generated public/js/server-providers.cjs from server-providers.js");
    }
  } catch (err) {
    console.error("Error generating server-providers.cjs during build:", err);
  }

  // Phase 5.1: bundle the browser app (js/main.js) into a hashed, minified
  // dist file and rewire index.html to load it. No-op if esbuild is missing.
  try {
    buildBundle();
  } catch (err) {
    console.error("Error bundling app during build:", err);
  }

  // Stamp worker.js /api/version with the package.json app version so the
  // Stamp worker /api/version with the package.json app version so the
  // Cloudflare kill-switch endpoint can never drift from the real release
  // (minVersion stays hand-controlled — that's the force-update lever).
  const staticAliasPath = path.join(__dirname, 'worker', 'routes', 'static-alias.js');
  const workerPath = fs.existsSync(staticAliasPath) ? staticAliasPath : path.join(__dirname, 'worker.js');
  if (!fs.existsSync(workerPath)) {
    console.warn("worker route file not found — skipping /api/version stamp.");
  } else {
    try {
      const pkg = JSON.parse(fs.readFileSync(path.join(__dirname, 'package.json'), 'utf-8'));
      const appVersion = pkg.version;
      if (!appVersion) throw new Error('package.json has no version field.');
      let workerContent = fs.readFileSync(workerPath, 'utf-8');
      const versionBlockRe = /(url\.pathname === '\/api\/version'[\s\S]{0,400}?\n\s+version:\s*")([^"]+)(")/;
      if (!versionBlockRe.test(workerContent)) {
        throw new Error('/api/version response block not found in worker — refusing to guess.');
      }
      const updatedWorker = workerContent.replace(versionBlockRe, `$1${appVersion}$3`);
      if (updatedWorker !== workerContent) {
        fs.writeFileSync(workerPath, updatedWorker, 'utf-8');
        console.log(`Stamped worker /api/version with v${appVersion}`);
      } else {
        console.log(`worker /api/version already at v${appVersion}`);
      }
    } catch (err) {
      console.error("Error stamping worker /api/version during build:", err);
      throw err;
    }
  }
}

module.exports = { rebuildClientAssets };

// If run directly from the command line
if (require.main === module) {
  rebuildClientAssets();
}

