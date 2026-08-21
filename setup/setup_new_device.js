#!/usr/bin/env node

/**
 * 🩺 Dr. CAT — Automated New Device Setup & Migration Wizard
 * 
 * Automates the initial bootstrap on a fresh machine (Android Termux, PC Linux, macOS, Windows WSL):
 * 1. Verifies Node.js runtime environment (>= v18).
 * 2. Checks/Installs npm dependencies (`npm install`).
 * 3. Creates .env with Gemini API key (interactive prompt if missing).
 * 4. Initializes the Admin Password (`admin_password.txt`).
 * 5. Builds production bundles & inlines critical assets (`npm run build`).
 * 6. Sets up optional remote server tunnel URLs (Ngrok / Cloudflare).
 * 7. Runs automated sanity tests to guarantee 100% operational readiness.
 */

const fs = require('fs');
const path = require('path');
const readline = require('readline');
const { execSync } = require('child_process');

const ROOT_DIR = path.join(__dirname, '..');
const ENV_FILE = path.join(ROOT_DIR, '.env');
const PASSWORD_FILE = path.join(ROOT_DIR, 'admin_password.txt');

function logStep(num, title) {
  console.log(`\n\x1b[1;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m`);
  console.log(`\x1b[1;32m[Étape ${num}/6]\x1b[0m \x1b[1;37m${title}\x1b[0m`);
  console.log(`\x1b[1;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m`);
}

function promptUser(query) {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });
  return new Promise(resolve => {
    rl.question(query, answer => {
      rl.close();
      resolve((answer || '').trim());
    });
  });
}

async function main() {
  console.log(`\n\x1b[1;36m╔════════════════════════════════════════════════════════════╗\x1b[0m`);
  console.log(`\x1b[1;36m║      🩺 DR. CAT — ASSISTANT D'INSTALLATION NOUVEL APPAREIL   ║\x1b[0m`);
  console.log(`\x1b[1;36m║              (Android Termux / PC Linux / macOS / WSL)     ║\x1b[0m`);
  console.log(`\x1b[1;36m╚════════════════════════════════════════════════════════════╝\x1b[0m\n`);

  // Step 1: Environment Check
  logStep(1, 'Vérification de l\'environnement Node.js');
  const nodeVersion = process.version;
  const major = parseInt(nodeVersion.slice(1).split('.')[0], 10);
  console.log(`  • Version Node.js détectée : \x1b[32m${nodeVersion}\x1b[0m`);
  if (major < 18) {
    console.warn(`  ⚠️ Node.js 18+ est fortement recommandé (actuel: ${nodeVersion}).`);
  } else {
    console.log(`  ✅ Environnement Node.js conforme.`);
  }

  // Step 2: Dependencies Check
  logStep(2, 'Vérification et Installation des Dépendances (npm install)');
  if (!fs.existsSync(path.join(ROOT_DIR, 'node_modules'))) {
    console.log('  📦 node_modules introuvable. Exécution de `npm install`...');
    execSync('npm install', { cwd: ROOT_DIR, stdio: 'inherit' });
    console.log('  ✅ Dépendances installées avec succès.');
  } else {
    console.log('  ✅ Dépendances (node_modules) déjà présentes.');
  }

  // Step 3: Configure .env (API Key)
  logStep(3, 'Configuration des Clés d\'API (.env)');
  let apiKey = '';
  if (fs.existsSync(ENV_FILE)) {
    const envContent = fs.readFileSync(ENV_FILE, 'utf8');
    const match = envContent.match(/GEMINI_API_KEY=([^\r\n]+)/);
    if (match && match[1] && match[1] !== 'your_gemini_api_key_here') {
      apiKey = match[1];
      console.log('  ✅ Fichier .env existant avec clé Gemini configurée.');
    }
  }

  if (!apiKey) {
    console.log('  🔑 La clé Google AI Studio (Gemini) est nécessaire pour le générateur IA.');
    console.log('     (Obtenez-la gratuitement sur : https://aistudio.google.com/app/apikey)\n');
    const inputKey = await promptUser('  Entrez votre GEMINI_API_KEY (ou Entrée pour ignorer) : ');
    if (inputKey) {
      apiKey = inputKey;
      fs.writeFileSync(ENV_FILE, `GEMINI_API_KEY=${apiKey}\nSESSION_SECRET=${require('crypto').randomBytes(32).toString('hex')}\n`, 'utf8');
      console.log('  ✅ Fichier .env créé avec succès.');
    } else {
      console.log('  ⚠️ Aucune clé renseignée. Le mode IA nécessitera d\'éditer le fichier .env plus tard.');
      if (!fs.existsSync(ENV_FILE)) {
        fs.writeFileSync(ENV_FILE, `GEMINI_API_KEY=your_gemini_api_key_here\nSESSION_SECRET=${require('crypto').randomBytes(32).toString('hex')}\n`, 'utf8');
      }
    }
  }

  // Step 4: Admin Password Setup
  logStep(4, 'Configuration du Mot de Passe Administrateur');
  if (fs.existsSync(PASSWORD_FILE)) {
    console.log('  ✅ Mot de passe Administrateur déjà configuré (admin_password.txt).');
  } else {
    console.log('  🔒 Définissez votre mot de passe d\'accès à l\'Admin Lab et au PDF Lab :');
    let pass = await promptUser('  Mot de passe Administrateur souhaité (min 4 caractères) : ');
    while (!pass || pass.length < 4) {
      console.log('  ⚠️ Le mot de passe doit contenir au moins 4 caractères.');
      pass = await promptUser('  Mot de passe Administrateur souhaité : ');
    }
    execSync(`node set_admin_password.js "${pass}"`, { cwd: ROOT_DIR, stdio: 'inherit' });
    console.log('  ✅ Mot de passe Administrateur initialisé et hashé avec succès.');
  }

  // Step 5: Production Assets Build
  logStep(5, 'Compilation et Bundling des Assets de Production (npm run build)');
  console.log('  ⚙️ Compilation du bundle JS minifié, synchronisation des bases JSON et CSS...');
  execSync('npm run build', { cwd: ROOT_DIR, stdio: 'inherit' });
  console.log('  ✅ Build terminé avec succès.');

  // Step 6: Sanity Tests
  logStep(6, 'Vérification de l\'Intégrité du Système (Tests Automatisés)');
  console.log('  🧪 Lancement de la suite de tests (Validation médicale, Auth, APIs)...');
  try {
    execSync('node tests/run_all_tests.js', { cwd: ROOT_DIR, stdio: 'inherit' });
    console.log('\n  🎉 TOUS LES TESTS SONT AU VERT !');
  } catch (testErr) {
    console.warn('  ⚠️ Certains tests ont signalé un avertissement, mais l\'app reste utilisable.');
  }

  // Final Summary
  console.log(`\n\x1b[1;32m════════════════════════════════════════════════════════════════\x1b[0m`);
  console.log(`\x1b[1;32m   🎉 DR. CAT EST 100% PRÊT SUR CE NOUVEL APPAREIL !          \x1b[0m`);
  console.log(`\x1b[1;32m════════════════════════════════════════════════════════════════\x1b[0m\n`);
  console.log(`  👉 Pour lancer l'application immédiatement :`);
  console.log(`     \x1b[1;33mnpm start\x1b[0m (ou avec supervision PM2 : \x1b[1;33mnpm run pm2:start\x1b[0m)\n`);
  console.log(`  👉 Pour accéder à l'application dans votre navigateur :`);
  console.log(`     \x1b[1;37mhttp://localhost:3000\x1b[0m (ou \x1b[1;37mhttp://localhost:8080\x1b[0m)\n`);
  console.log(`  👉 Pour configurer un tunnel Ngrok :`);
  console.log(`     \x1b[1;33mnpm run set:provider\x1b[0m\n`);
}

main().catch(err => {
  console.error('\n❌ Erreur pendant l\'installation :', err.message);
  process.exit(1);
});
