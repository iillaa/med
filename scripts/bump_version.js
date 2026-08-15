#!/usr/bin/env node

/**
 * Atomic Version Bumper for Dr.CAT Medical Application
 * Synchronizes versions across:
 * 1. package.json
 * 2. android/app/build.gradle (versionName & versionCode)
 * 3. server/config/version.json
 * 4. public/index.html (meta[name="app-version"])
 * 5. worker.js
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const ROOT = path.join(__dirname, '..');

function getVersionCode(versionStr) {
  const parts = versionStr.split('.').map(n => parseInt(n, 10) || 0);
  const major = parts[0] || 1;
  const minor = parts[1] || 0;
  const patch = parts[2] || 0;
  return major * 10000 + minor * 100 + patch;
}

function bump() {
  const targetVersion = process.argv[2] || '1.7.9';
  const targetVersionCode = getVersionCode(targetVersion);

  console.log(`\n🚀 Bumping Dr.CAT to version v${targetVersion} (versionCode: ${targetVersionCode})...\n`);

  // 1. package.json
  const pkgPath = path.join(ROOT, 'package.json');
  if (fs.existsSync(pkgPath)) {
    const pkg = JSON.parse(fs.readFileSync(pkgPath, 'utf8'));
    pkg.version = targetVersion;
    fs.writeFileSync(pkgPath, JSON.stringify(pkg, null, 2) + '\n');
    console.log(`  ✅ Updated package.json → v${targetVersion}`);
  }

  // 2. android/app/build.gradle
  const gradlePath = path.join(ROOT, 'android', 'app', 'build.gradle');
  if (fs.existsSync(gradlePath)) {
    let gradle = fs.readFileSync(gradlePath, 'utf8');
    gradle = gradle.replace(/versionCode\s+\d+/, `versionCode ${targetVersionCode}`);
    gradle = gradle.replace(/versionName\s+"[^"]+"/, `versionName "${targetVersion}"`);
    fs.writeFileSync(gradlePath, gradle);
    console.log(`  ✅ Updated android/app/build.gradle → versionName "${targetVersion}", versionCode ${targetVersionCode}`);
  }

  // 3. server/config/version.json
  const versionJsonPath = path.join(ROOT, 'server', 'config', 'version.json');
  if (fs.existsSync(versionJsonPath)) {
    const vJson = JSON.parse(fs.readFileSync(versionJsonPath, 'utf8'));
    vJson.latestVersion = targetVersion;
    vJson.updateMessage = `Une mise à jour de Dr.CAT v${targetVersion} est disponible.`;
    vJson.lastUpdated = new Date().toISOString();
    fs.writeFileSync(versionJsonPath, JSON.stringify(vJson, null, 2) + '\n');
    console.log(`  ✅ Updated server/config/version.json → latestVersion: "${targetVersion}"`);
  }

  // 4. public/index.html
  const htmlPath = path.join(ROOT, 'public', 'index.html');
  if (fs.existsSync(htmlPath)) {
    let html = fs.readFileSync(htmlPath, 'utf8');
    html = html.replace(/<meta\s+name="app-version"\s+content="[^"]*">/, `<meta name="app-version" content="${targetVersion}">`);
    fs.writeFileSync(htmlPath, html);
    console.log(`  ✅ Updated public/index.html → meta app-version: "${targetVersion}"`);
  }

  // 5. worker.js
  const workerPath = path.join(ROOT, 'worker.js');
  if (fs.existsSync(workerPath)) {
    let worker = fs.readFileSync(workerPath, 'utf8');
    worker = worker.replace(/version:\s*"[^"]*"/, `version: "${targetVersion}"`);
    fs.writeFileSync(workerPath, worker);
    console.log(`  ✅ Updated worker.js → version: "${targetVersion}"`);
  }

  // 6. Run rebuild to stamp bundle
  console.log('\n📦 Running automated build to stamp assets & bundles...');
  try {
    execSync('npm run build', { cwd: ROOT, stdio: 'inherit' });
    console.log('  ✅ Build completed successfully.');
  } catch (err) {
    console.error('  ⚠️ Rebuild error:', err.message);
  }

  console.log(`\n🎉 Dr.CAT successfully synchronized to v${targetVersion} across all platforms!\n`);
}

bump();
