#!/usr/bin/env node

/**
 * 🩺 Dr. CAT — Automatic Tunnel Installer (Cloudflare & Ngrok)
 * 
 * Automatically detects OS / CPU Architecture (Android Termux aarch64/arm, Linux x64/arm64, macOS, Windows)
 * and installs or configures:
 * 1. Cloudflare Tunnel (`cloudflared`)
 * 2. Ngrok binary (`ngrok`)
 */

const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');
const os = require('os');

const ROOT_DIR = path.resolve(__dirname, '..');
const PREFIX_BIN = process.env.PREFIX ? path.join(process.env.PREFIX, 'bin') : '/data/data/com.termux/files/usr/bin';
const isTermux = fs.existsSync('/data/data/com.termux/files/usr/bin/bash');
const arch = os.arch(); // 'arm64', 'x64', 'arm'

console.log('\n\x1b[1;36m╔════════════════════════════════════════════════════════════╗\x1b[0m');
console.log('\x1b[1;36m║   🩺 DR. CAT — INSTALLATEUR DE TUNNELS (CLOUDFLARE/NGROK)  ║\x1b[0m');
console.log('\x1b[1;36m╚════════════════════════════════════════════════════════════╝\x1b[0m\n');
console.log(`  • Système détecté : ${os.platform()} (${arch}) | Termux: ${isTermux ? 'Oui' : 'Non'}\n`);

// 1. Cloudflared Installation
console.log('\x1b[1;34m[1/2]\x1b[0m Vérification / Installation de Cloudflare Tunnel (cloudflared)...');
try {
  execSync('cloudflared --version', { stdio: 'ignore' });
  console.log('  ✅ cloudflared est déjà installé.');
} catch (e) {
  if (isTermux) {
    try {
      console.log('  📦 Installation de cloudflared via `pkg install cloudflared -y`...');
      execSync('pkg install cloudflared -y', { stdio: 'inherit' });
      console.log('  ✅ cloudflared installé avec succès.');
    } catch (pkgErr) {
      console.warn('  ⚠️ Échec de `pkg install cloudflared`.');
    }
  } else {
    console.log('  ℹ️ Sur Linux/macOS, installez cloudflared via brew ou https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/downloads/');
  }
}

// 2. Ngrok Installation
console.log('\n\x1b[1;34m[2/2]\x1b[0m Vérification / Téléchargement de Ngrok...');
const ngrokLocal = path.join(ROOT_DIR, 'ngrok');
const ngrokBin = path.join(PREFIX_BIN, 'ngrok');
let hasNgrok = false;

try {
  execSync('ngrok version', { stdio: 'ignore' });
  hasNgrok = true;
  console.log('  ✅ ngrok est déjà accessible dans PATH.');
} catch (e) {}

if (!hasNgrok && fs.existsSync(ngrokLocal)) {
  try {
    fs.chmodSync(ngrokLocal, 0o755);
    console.log('  ✅ Binaire ./ngrok déjà présent.');
    hasNgrok = true;
  } catch (e) {}
}

if (!hasNgrok) {
  console.log('  ⬇️ Téléchargement du binaire ngrok adapté à votre architecture...');
  let ngrokUrl = '';
  if (arch === 'arm64' || arch === 'aarch64') {
    ngrokUrl = 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz';
  } else if (arch === 'x64') {
    ngrokUrl = 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz';
  } else if (arch === 'arm') {
    ngrokUrl = 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm.tgz';
  }

  if (ngrokUrl) {
    try {
      const tarPath = path.join(ROOT_DIR, 'ngrok.tgz');
      execSync(`curl -sSL "${ngrokUrl}" -o "${tarPath}"`, { stdio: 'inherit' });
      execSync(`tar -xzf "${tarPath}" -C "${ROOT_DIR}"`, { stdio: 'inherit' });
      if (fs.existsSync(tarPath)) fs.unlinkSync(tarPath);
      if (fs.existsSync(ngrokLocal)) {
        fs.chmodSync(ngrokLocal, 0o755);
        if (fs.existsSync(PREFIX_BIN)) {
          try {
            if (fs.existsSync(ngrokBin) || fs.lstatSync(ngrokBin).isSymbolicLink()) fs.unlinkSync(ngrokBin);
            fs.symlinkSync(ngrokLocal, ngrokBin);
          } catch (e) {}
        }
        console.log('  ✅ ngrok téléchargé et configuré avec succès.');
        hasNgrok = true;
      }
    } catch (downloadErr) {
      console.warn('  ⚠️ Échec du téléchargement ngrok :', downloadErr.message);
    }
  }
}

console.log('\n\x1b[1;32m════════════════════════════════════════════════════════════════\x1b[0m');
console.log('\x1b[1;32m   🎉 OUTILS DE TUNNEL PRÊTS POUR DR. CAT !                   \x1b[0m');
console.log('\x1b[1;32m════════════════════════════════════════════════════════════════\x1b[0m\n');
