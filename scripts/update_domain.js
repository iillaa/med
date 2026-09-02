#!/usr/bin/env node
/**
 * scripts/update_domain.js
 * 
 * Single-command tool to migrate or update the Dr.CAT Cloudflare Worker
 * domain / subdomain across all configuration, SEO, telemetry, and CI/CD files.
 * 
 * Usage:
 *   node scripts/update_domain.js drcat.is-an-app.workers.dev
 *   npm run set:domain -- drcat.is-an-app.workers.dev
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const ROOT_DIR = path.resolve(__dirname, '..');

// 1. Parse CLI input
const rawInput = process.argv[2];
if (!rawInput) {
  console.error('\x1b[31m%s\x1b[0m', '❌ Error: Missing new domain argument.');
  console.log('\nUsage:');
  console.log('  node scripts/update_domain.js <new-domain-or-url>');
  console.log('Example:');
  console.log('  node scripts/update_domain.js drcat.is-an-app.workers.dev\n');
  process.exit(1);
}

// Clean target input
let cleanDomain = rawInput.trim().replace(/^https?:\/\//i, '').replace(/\/+$/, '');
const newFullUrl = `https://${cleanDomain}`;

// 2. Discover current active domain
let oldFullUrl = 'https://drcat.is-an-app.workers.dev';
const remoteConfigPath = path.join(ROOT_DIR, 'remote_server_config.json');

if (fs.existsSync(remoteConfigPath)) {
  try {
    const parsed = JSON.parse(fs.readFileSync(remoteConfigPath, 'utf8'));
    const cfEntry = (parsed.servers || []).find(s => s.provider === 'cloudflare') || (parsed.urls || []).find(u => u.includes('workers.dev'));
    if (cfEntry) {
      oldFullUrl = (typeof cfEntry === 'string' ? cfEntry : cfEntry.url).replace(/\/+$/, '');
    }
  } catch (e) {}
}

const oldCleanDomain = oldFullUrl.replace(/^https?:\/\//i, '').replace(/\/+$/, '');

console.log('\x1b[36m%s\x1b[0m', '════════════════════════════════════════════════════════════');
console.log('\x1b[36m%s\x1b[0m', ' 🩺 Dr.CAT — Outil de Migration de Domaine Cloudflare       ');
console.log('\x1b[36m%s\x1b[0m', '════════════════════════════════════════════════════════════');
console.log(` 🔄 Ancien Domaine : \x1b[33m${oldFullUrl}\x1b[0m`);
console.log(` 🚀 Nouveau Domaine: \x1b[32m${newFullUrl}\x1b[0m\n`);

if (oldFullUrl === newFullUrl) {
  console.log('ℹ️ Le domaine cible est identique au domaine actuel. Aucune modification nécessaire.');
  process.exit(0);
}

// Target files & replacement rules
const targetFiles = [
  'public/index.html',
  'public/js/remote_config.js',
  'public/js/version-checker.js',
  'remote_server_config.json',
  'server/services/sync-suggestions.js',
  'worker/routes/static-alias.js',
  'public/robots.txt',
  'public/sitemap.xml',
  'public/llms.txt',
  'shortcuts/start_med.sh',
  '.github/workflows/build-apk.yml',
  '.agents/AGENTS.md'
];

let updatedCount = 0;

targetFiles.forEach(relPath => {
  const absPath = path.join(ROOT_DIR, relPath);
  if (!fs.existsSync(absPath)) return;

  let content = fs.readFileSync(absPath, 'utf8');
  if (content.includes(oldFullUrl) || content.includes(oldCleanDomain)) {
    // Replace full URLs first, then naked domains if any
    content = content.split(oldFullUrl).join(newFullUrl);
    content = content.split(oldCleanDomain).join(cleanDomain);
    fs.writeFileSync(absPath, content, 'utf8');
    console.log(`  ✅ \x1b[32m[MODIFIÉ]\x1b[0m ${relPath}`);
    updatedCount++;
  } else {
    console.log(`  ⚪ [INCHANGÉ] ${relPath}`);
  }
});

// 3. Re-generate Open Graph Banner with new domain
const bannerScript = path.join(ROOT_DIR, 'scripts', 'generate_og_banner.py');
if (fs.existsSync(bannerScript)) {
  try {
    console.log('\n🎨 Régénération de la bannière Open Graph HD 1200x630...');
    execSync('python3 scripts/generate_og_banner.py', { cwd: ROOT_DIR, stdio: 'inherit' });
  } catch (e) {
    console.warn('⚠️ Note: Impossible de régénérer la bannière via python3 (optionnel).');
  }
}

// 4. Run automated build
try {
  console.log('\n📦 Recompilation du bundle de production (build.js)...');
  execSync('npm run build', { cwd: ROOT_DIR, stdio: 'inherit' });
} catch (e) {
  console.error('\x1b[31m%s\x1b[0m', '❌ Erreur lors du build.');
}

console.log('\n\x1b[32m%s\x1b[0m', `✨ Migration réussie : ${updatedCount} fichiers mis à jour.`);
console.log('🚀 Pour déployer en direct sur Cloudflare, exécutez :');
console.log('   \x1b[33mnpx wrangler deploy\x1b[0m\n');
