#!/usr/bin/env node

/**
 * 🩺 Dr. CAT — Shortcut Setup Utility
 * 
 * Configures Termux:Widget shortcuts, CLI binary symlinks, and shell aliases
 * so Dr. CAT can be launched seamlessly from anywhere (Android Home Screen Widget, CLI, Termux).
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const ROOT_DIR = path.resolve(__dirname, '..');
const SHORTCUTS_DIR = path.join(ROOT_DIR, 'shortcuts');
const HOME_DIR = process.env.HOME || '/data/data/com.termux/files/home';
const PREFIX_BIN = process.env.PREFIX ? path.join(process.env.PREFIX, 'bin') : '/data/data/com.termux/files/usr/bin';
const TERMUX_SHORTCUTS_DIR = path.join(HOME_DIR, '.shortcuts');
const TERMUX_TASKS_DIR = path.join(TERMUX_SHORTCUTS_DIR, 'tasks');

console.log('\n\x1b[1;36m╔════════════════════════════════════════════════════════════╗\x1b[0m');
console.log('\x1b[1;36m║         🩺 DR. CAT — CONFIGURATION DES RACCOURCIS          ║\x1b[0m');
console.log('\x1b[1;36m╚════════════════════════════════════════════════════════════╝\x1b[0m\n');

// 1. Ensure executable permissions and fix shebangs on all shortcut scripts
console.log('\x1b[1;34m[1/4]\x1b[0m Rendre exécutables et ajuster les shebangs dans `shortcuts/`...');
const isTermux = fs.existsSync('/data/data/com.termux/files/usr/bin/bash');
const shortcutFiles = fs.readdirSync(SHORTCUTS_DIR).filter(f => f.endsWith('.sh') || f === 'med');

shortcutFiles.forEach(file => {
  const fullPath = path.join(SHORTCUTS_DIR, file);
  try {
    let content = fs.readFileSync(fullPath, 'utf8');
    if (isTermux && !content.startsWith('#!/data/data/com.termux/files/usr/bin/bash')) {
      content = content.replace(/^#![^\n]+/, '#!/data/data/com.termux/files/usr/bin/bash');
      fs.writeFileSync(fullPath, content, 'utf8');
    }
    fs.chmodSync(fullPath, 0o755);
    console.log(`  ✅ chmod +x & shebang OK : shortcuts/${file}`);
  } catch (err) {
    console.warn(`  ⚠️ Erreur sur ${file} :`, err.message);
  }
});

// 2. Setup Termux:Widget shortcuts in ~/.shortcuts and ~/.shortcuts/tasks
console.log('\n\x1b[1;34m[2/4]\x1b[0m Configuration des raccourcis Termux:Widget (~/.shortcuts)...');
try {
  if (!fs.existsSync(TERMUX_SHORTCUTS_DIR)) {
    fs.mkdirSync(TERMUX_SHORTCUTS_DIR, { recursive: true });
    console.log('  📁 Création du dossier ~/.shortcuts');
  }
  if (!fs.existsSync(TERMUX_TASKS_DIR)) {
    fs.mkdirSync(TERMUX_TASKS_DIR, { recursive: true });
    console.log('  📁 Création du dossier ~/.shortcuts/tasks');
  }

  try { fs.chmodSync(HOME_DIR, 0o755); } catch (e) {}
  fs.chmodSync(TERMUX_SHORTCUTS_DIR, 0o755);
  fs.chmodSync(TERMUX_TASKS_DIR, 0o755);

  const bashPath = isTermux ? '/data/data/com.termux/files/usr/bin/bash' : '/bin/bash';

  const widgetScripts = [
    { name: 'DrCAT_Menu.sh', source: 'menu_med.sh' },
    { name: 'DrCAT_Start.sh', source: 'start_med.sh' },
    { name: 'DrCAT_Local.sh', source: 'open_app.sh' },
    { name: 'DrCAT_Status.sh', source: 'status_med.sh' },
    { name: 'DrCAT_Stop.sh', source: 'stop_med.sh' },
    { name: 'DrCAT_Inspect.sh', source: 'inspect_med.sh' },
    { name: 'start_med.sh', source: 'start_med.sh' },
    { name: 'stop_med.sh', source: 'stop_med.sh' },
    { name: 'status_med.sh', source: 'status_med.sh' },
    { name: 'open_app.sh', source: 'open_app.sh' },
    { name: 'inspect_med.sh', source: 'inspect_med.sh' }
  ];

  widgetScripts.forEach(({ name, source }) => {
    const target = path.join(TERMUX_SHORTCUTS_DIR, name);
    const srcPath = path.join(SHORTCUTS_DIR, source);
    if (fs.existsSync(srcPath)) {
      try {
        if (fs.existsSync(target) || fs.lstatSync(target).isSymbolicLink()) {
          fs.unlinkSync(target);
        }
      } catch (e) {}
      const wrapper = `#!${bashPath}\nexport PATH=/data/data/com.termux/files/usr/bin:$PATH\ncd "${ROOT_DIR}"\nexec "${srcPath}" "$@"\n`;
      fs.writeFileSync(target, wrapper, { mode: 0o755, encoding: 'utf8' });
      fs.chmodSync(target, 0o755);
      console.log(`  📄 Widget UI Script : ~/.shortcuts/${name}`);
    }
  });

  // Background tasks (executed silently without opening terminal)
  const taskScripts = [
    { name: 'DrCAT_Stop.sh', source: 'stop_med.sh' },
    { name: 'stop_med.sh', source: 'stop_med.sh' }
  ];

  taskScripts.forEach(({ name, source }) => {
    const target = path.join(TERMUX_TASKS_DIR, name);
    const srcPath = path.join(SHORTCUTS_DIR, source);
    if (fs.existsSync(srcPath)) {
      try {
        if (fs.existsSync(target) || fs.lstatSync(target).isSymbolicLink()) {
          fs.unlinkSync(target);
        }
      } catch (e) {}
      const wrapper = `#!${bashPath}\nexport PATH=/data/data/com.termux/files/usr/bin:$PATH\ncd "${ROOT_DIR}"\nexec "${srcPath}" "$@"\n`;
      fs.writeFileSync(target, wrapper, { mode: 0o755, encoding: 'utf8' });
      fs.chmodSync(target, 0o755);
      console.log(`  ⚡ Widget Background Task : ~/.shortcuts/tasks/${name}`);
    }
  });
} catch (err) {
  console.warn('  ⚠️ Erreur configuration Termux:Widget :', err.message);
}

// 3. Setup CLI symlinks in $PREFIX/bin
console.log(`\n\x1b[1;34m[3/4]\x1b[0m Installation des commandes globales dans PATH (${PREFIX_BIN})...`);
if (fs.existsSync(PREFIX_BIN)) {
  const binCommands = [
    { cmd: 'med', target: 'med.sh' },
    { cmd: 'med-start', target: 'start_med.sh' },
    { cmd: 'med-stop', target: 'stop_med.sh' },
    { cmd: 'med-status', target: 'status_med.sh' },
    { cmd: 'med-local', target: 'open_app.sh' },
    { cmd: 'med-inspect', target: 'inspect_med.sh' },
    { cmd: 'med-menu', target: 'menu_med.sh' },
    { cmd: 'start_med', target: 'start_med.sh' },
    { cmd: 'stop_med', target: 'stop_med.sh' },
    { cmd: 'status_med', target: 'status_med.sh' },
    { cmd: 'open_app', target: 'open_app.sh' },
    { cmd: 'inspect_med', target: 'inspect_med.sh' }
  ];

  binCommands.forEach(({ cmd, target }) => {
    const binPath = path.join(PREFIX_BIN, cmd);
    const scriptPath = path.join(SHORTCUTS_DIR, target);
    if (fs.existsSync(scriptPath)) {
      try {
        if (fs.existsSync(binPath) || fs.lstatSync(binPath).isSymbolicLink()) {
          fs.unlinkSync(binPath);
        }
      } catch (e) {}
      try {
        fs.symlinkSync(scriptPath, binPath);
        console.log(`  🚀 Commande globale : \x1b[1;32m${cmd}\x1b[0m -> shortcuts/${target}`);
      } catch (e) {
        // If symlink fails, create a wrapper script
        const wrapper = `#!/bin/sh\nexec "${scriptPath}" "$@"\n`;
        fs.writeFileSync(binPath, wrapper, { mode: 0o755 });
        console.log(`  🚀 Wrapper global : \x1b[1;32m${cmd}\x1b[0m -> shortcuts/${target}`);
      }
    }
  });
} else {
  console.log(`  ℹ️ Dossier ${PREFIX_BIN} non trouvé (Environnement hors-Termux standard).`);
}

// 4. Setup Shell Aliases in ~/.bashrc / ~/.zshrc
console.log('\n\x1b[1;34m[4/4]\x1b[0m Configuration des alias shell (~/.bashrc)...');
const bashrcFiles = [path.join(HOME_DIR, '.bashrc'), path.join(HOME_DIR, '.zshrc')].filter(f => fs.existsSync(f));

const ALIAS_BLOCK = `
# >>> Dr. CAT Medical App Shortcuts >>>
alias med='${path.join(SHORTCUTS_DIR, 'med.sh')}'
alias med-start='${path.join(SHORTCUTS_DIR, 'start_med.sh')}'
alias med-stop='${path.join(SHORTCUTS_DIR, 'stop_med.sh')}'
alias med-status='${path.join(SHORTCUTS_DIR, 'status_med.sh')}'
alias med-local='${path.join(SHORTCUTS_DIR, 'open_app.sh')}'
alias med-inspect='${path.join(SHORTCUTS_DIR, 'inspect_med.sh')}'
alias med-menu='${path.join(SHORTCUTS_DIR, 'menu_med.sh')}'
# <<< Dr. CAT Medical App Shortcuts <<<
`;

bashrcFiles.forEach(rcFile => {
  try {
    let content = fs.readFileSync(rcFile, 'utf8');
    if (content.includes('Dr. CAT Medical App Shortcuts')) {
      content = content.replace(/# >>> Dr\. CAT Medical App Shortcuts >>>[\s\S]*?# <<< Dr\. CAT Medical App Shortcuts <<</, ALIAS_BLOCK.trim());
      fs.writeFileSync(rcFile, content, 'utf8');
      console.log(`  ✅ Alias mis à jour dans ${path.basename(rcFile)}`);
    } else {
      fs.appendFileSync(rcFile, ALIAS_BLOCK, 'utf8');
      console.log(`  ✅ Alias ajoutés dans ${path.basename(rcFile)}`);
    }
  } catch (err) {
    console.warn(`  ⚠️ Erreur écriture dans ${rcFile} :`, err.message);
  }
});

console.log('\n\x1b[1;32m════════════════════════════════════════════════════════════════\x1b[0m');
console.log('\x1b[1;32m   🎉 RACCOURCIS DR. CAT CONFIGURÉS AVEC SUCCÈS !             \x1b[0m');
console.log('\x1b[1;32m════════════════════════════════════════════════════════════════\x1b[0m\n');
console.log('  📱 \x1b[1;37mSur l\'écran d\'accueil Android (Termux:Widget) :\x1b[0m');
console.log('     Ajoutez un widget Termux:Widget pour lancer directement :');
console.log('     • DrCAT_Menu.sh (Menu interactif)');
console.log('     • DrCAT_Start.sh (Lancer avec tunnels & navigateur)');
console.log('     • DrCAT_Local.sh (Lancer en local)');
console.log('     • DrCAT_Stop.sh (Arrêter le serveur)');
console.log('     • DrCAT_Status.sh (Voir le statut)\n');
console.log('  💻 \x1b[1;37mDepuis le terminal (n\'importe où) :\x1b[0m');
console.log('     • \x1b[1;33mmed\x1b[0m            (Menu CLI unifié : start, stop, status, etc.)');
console.log('     • \x1b[1;33mmed start\x1b[0m      (ou \x1b[1;33mmed-start\x1b[0m / \x1b[1;33mstart_med\x1b[0m)');
console.log('     • \x1b[1;33mmed stop\x1b[0m       (ou \x1b[1;33mmed-stop\x1b[0m / \x1b[1;33mstop_med\x1b[0m)');
console.log('     • \x1b[1;33mmed status\x1b[0m     (ou \x1b[1;33mmed-status\x1b[0m / \x1b[1;33mstatus_med\x1b[0m)');
console.log('     • \x1b[1;33mmed local\x1b[0m      (ou \x1b[1;33mmed-local\x1b[0m / \x1b[1;33mopen_app\x1b[0m)\n');
