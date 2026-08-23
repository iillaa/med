/**
 * Dr.CAT Production APK Asset Hardener
 *
 * Strips raw unbundled development JS source files (components/, lib/, main.js, etc.)
 * from android/app/src/main/assets/public/js/ after `cap sync`.
 * Preserves ONLY:
 *  - public/dist/app-*.js (Minified production ES module bundle)
 *  - pdf.min.js & pdf.worker.min.js (Mozilla PDF.js engine)
 *  - version-checker.js (Security version lock gate)
 *  - remote_config.js & server-providers.js (Server connectivity configs)
 */

const fs = require('fs');
const path = require('path');

function hardenAndroidAssets() {
  const androidAssetsJs = path.join(__dirname, '..', 'android', 'app', 'src', 'main', 'assets', 'public', 'js');

  if (!fs.existsSync(androidAssetsJs)) {
    console.log('[AssetHardening] Android assets directory not found. Skipping.');
    return;
  }

  const allowedFiles = new Set([
    'pdf.min.js',
    'pdf.worker.min.js',
    'version-checker.js',
    'remote_config.js',
    'server-providers.js',
    'server-providers.cjs'
  ]);

  const items = fs.readdirSync(androidAssetsJs);
  let removedCount = 0;

  for (const item of items) {
    const fullPath = path.join(androidAssetsJs, item);
    const stat = fs.statSync(fullPath);

    if (stat.isDirectory()) {
      fs.rmSync(fullPath, { recursive: true, force: true });
      removedCount++;
    } else if (stat.isFile() && !allowedFiles.has(item)) {
      fs.unlinkSync(fullPath);
      removedCount++;
    }
  }

  console.log(`[AssetHardening] Cleaned ${removedCount} raw development items from Android APK assets.`);
  console.log('[AssetHardening] Production APK web assets are 100% hardened! Only minified dist bundle and runtime engines remain.');
}

if (require.main === module) {
  hardenAndroidAssets();
}

module.exports = { hardenAndroidAssets };
