const http = require('http');
const fs = require('fs');
const { spawn } = require('child_process');
const path = require('path');

const ROOT = path.join(__dirname, '..');
const PORT = process.env.PORT || '3098';
const BASE = `http://127.0.0.1:${PORT}`;

function req(method, reqPath, body, headers = {}) {
  return new Promise((resolve, reject) => {
    const url = new URL(reqPath, BASE);
    const opts = {
      hostname: url.hostname,
      port: url.port,
      path: url.pathname + url.search,
      method,
      headers: { 'Content-Type': 'application/json', 'Accept': 'application/json', ...headers }
    };
    const r = http.request(opts, res => {
      let d = '';
      res.on('data', c => d += c);
      res.on('end', () => {
        try { resolve({ status: res.statusCode, body: JSON.parse(d) }); }
        catch { resolve({ status: res.statusCode, body: d }); }
      });
    });
    r.on('error', reject);
    if (body && method !== 'GET') r.write(JSON.stringify(body));
    r.end();
  });
}

async function runSecurityAudit() {
  console.log('\n╔════════════════════════════════════════════════════════════╗');
  console.log('║   🛡️ DR. CAT — AUDIT ANTI-USURPATION LOCALHOST & TUNNELS    ║');
  console.log('╚════════════════════════════════════════════════════════════╝\n');

  const PASSWORD_FILE = path.join(ROOT, 'admin_password.txt');
  let originalPasswordContent = '';
  if (fs.existsSync(PASSWORD_FILE)) {
    originalPasswordContent = fs.readFileSync(PASSWORD_FILE, 'utf-8');
  }

  const SUGGESTIONS_FILE = path.join(ROOT, 'suggestions.json');
  let originalSuggestionsContent = null;
  if (fs.existsSync(SUGGESTIONS_FILE)) {
    originalSuggestionsContent = fs.readFileSync(SUGGESTIONS_FILE, 'utf-8');
  }

  const testPassword = 'security-audit-password-2026';
  fs.writeFileSync(PASSWORD_FILE, testPassword, 'utf-8');

  function cleanup() {
    if (serverProcess) {
      try { serverProcess.kill('SIGKILL'); } catch (_) {}
    }
    if (originalPasswordContent) {
      fs.writeFileSync(PASSWORD_FILE, originalPasswordContent, 'utf-8');
    }
    if (originalSuggestionsContent !== null) {
      fs.writeFileSync(SUGGESTIONS_FILE, originalSuggestionsContent, 'utf-8');
    } else if (fs.existsSync(SUGGESTIONS_FILE)) {
      try { fs.unlinkSync(SUGGESTIONS_FILE); } catch (_) {}
    }
  }

  process.on('exit', cleanup);
  process.on('SIGINT', () => { cleanup(); process.exit(1); });

  console.log('🚀 Démarrage du serveur de test en isolation...');
  serverProcess = spawn('node', ['server.js'], {
    cwd: ROOT,
    stdio: ['pipe', 'pipe', 'pipe'],
    env: { ...process.env, NODE_ENV: 'test', PORT: PORT }
  });

  let serverReady = false;
  serverProcess.stdout.on('data', (d) => {
    const text = d.toString();
    if (text.includes('Local Access:') || text.includes('Clinical Assistant') || text.includes('Dr. CAT') || text.includes('App is running')) serverReady = true;
  });
  serverProcess.stderr.on('data', () => {});

  for (let i = 0; i < 40; i++) {
    await new Promise(r => setTimeout(r, 250));
    if (serverReady) break;
  }

  if (!serverReady) {
    console.error('❌ Impossible de démarrer le serveur de test.');
    cleanup();
    process.exit(1);
  }

  // Standard remote headers
  const REMOTE_HEADERS = {
    'x-forwarded-for': '198.51.100.42, 10.0.0.1',
    'cf-connecting-ip': '198.51.100.42',
    'x-real-ip': '198.51.100.42'
  };

  let passed = 0, failed = 0;
  function assert(name, condition, extraInfo = '') {
    if (condition) {
      console.log(`  ✅ [PASS] ${name} ${extraInfo ? '(' + extraInfo + ')' : ''}`);
      passed++;
    } else {
      console.log(`  ❌ [FAIL] ${name} ${extraInfo ? '(' + extraInfo + ')' : ''}`);
      failed++;
    }
  }

  console.log('\n🔒 1. TEST DE VERROUILLAGE DU LOGIN ADMIN VIA TUNNEL :');
  
  const remoteLogin = await req('POST', '/api/login', { password: testPassword }, REMOTE_HEADERS);
  assert(
    'POST /api/login depuis IP distante -> Bloqué avec 403 Forbidden',
    remoteLogin.status === 403,
    `Status reçu: ${remoteLogin.status}`
  );

  const remoteIsLocal = await req('GET', '/api/is-local', null, REMOTE_HEADERS);
  assert(
    'GET /api/is-local depuis IP distante -> isLocal=false',
    remoteIsLocal.status === 200 && remoteIsLocal.body.isLocal === false,
    `isLocal = ${remoteIsLocal.body?.isLocal}`
  );

  console.log('\n⚔️ 2. TENTATIVES D\'USURPATION DE HEADERS (FAKE LOCALHOST SPOOFING ATTACKS) :');

  // Attack A: Attacker prefixes forged 127.0.0.1 before real IP
  const spoofChain = await req('POST', '/api/login', { password: testPassword }, {
    'x-forwarded-for': '127.0.0.1, 198.51.100.42'
  });
  assert(
    'Attaque 1 : Faux "X-Forwarded-For: 127.0.0.1, <attacker_ip>" -> Bloqué 403',
    spoofChain.status === 403,
    `Status: ${spoofChain.status}`
  );

  // Attack B: Attacker forges X-Forwarded-For: 127.0.0.1 through Cloudflare (Cloudflare adds cf-ray / cf-connecting-ip)
  const spoofCloudflare = await req('POST', '/api/login', { password: testPassword }, {
    'x-forwarded-for': '127.0.0.1',
    'cf-ray': '8a1234567890-PAR',
    'cf-connecting-ip': '198.51.100.42'
  });
  assert(
    'Attaque 2 : Faux 127.0.0.1 avec signature Cloudflare Edge -> Bloqué 403',
    spoofCloudflare.status === 403,
    `Status: ${spoofCloudflare.status}`
  );

  // Attack C: Attacker forges X-Forwarded-For: 127.0.0.1 through Ngrok (Ngrok adds ngrok-trace-id)
  const spoofNgrok = await req('POST', '/api/login', { password: testPassword }, {
    'x-forwarded-for': '127.0.0.1',
    'ngrok-trace-id': 'ngrok_trace_987654321'
  });
  assert(
    'Attaque 3 : Faux 127.0.0.1 avec signature Ngrok -> Bloqué 403',
    spoofNgrok.status === 403,
    `Status: ${spoofNgrok.status}`
  );

  // Attack D: Remote X-Real-IP
  const spoofRealIp = await req('POST', '/api/login', { password: testPassword }, {
    'x-real-ip': '198.51.100.42'
  });
  assert(
    'Attaque 4 : X-Real-IP distante -> Bloqué 403',
    spoofRealIp.status === 403,
    `Status: ${spoofRealIp.status}`
  );

  console.log('\n🔒 3. TEST D\'USURPATION DE TOKEN ADMIN DEPUIS UN TUNNEL DISTANT :');
  
  // Legitimate local login to obtain token
  const localLogin = await req('POST', '/api/login', { password: testPassword });
  const adminToken = localLogin.body.token;

  const remoteCatCreate = await req('POST', '/api/cats', { title: 'Hacked CAT', category: 'Hack' }, { ...REMOTE_HEADERS, 'x-admin-token': adminToken });
  assert(
    'POST /api/cats avec Token Admin depuis IP distante -> Bloqué 403 Forbidden',
    remoteCatCreate.status === 403,
    `Status reçu: ${remoteCatCreate.status}`
  );

  const remoteReindex = await req('POST', '/api/reindex', {}, { ...REMOTE_HEADERS, 'x-admin-token': adminToken });
  assert(
    'POST /api/reindex depuis IP distante -> Bloqué 403 Forbidden',
    remoteReindex.status === 403,
    `Status reçu: ${remoteReindex.status}`
  );

  const remoteSuggestions = await req('GET', '/api/suggestions', null, { ...REMOTE_HEADERS, 'x-admin-token': adminToken });
  assert(
    'GET /api/suggestions depuis IP distante -> Bloqué 403 Forbidden',
    remoteSuggestions.status === 403,
    `Status reçu: ${remoteSuggestions.status}`
  );

  console.log('\n🌐 4. DISPONIBILITÉ DES SERVICES PUBLICS LÉGITIMES :');

  const publicCats = await req('GET', '/api/cats', null, { ...REMOTE_HEADERS, 'x-app-key': 'drcat_pub_2f7a91c4e8' });
  assert(
    'GET /api/cats (Lecture publique avec clé app) depuis IP distante -> 200 OK',
    publicCats.status === 200 && Array.isArray(publicCats.body) && publicCats.body.length > 0,
    `${publicCats.body?.length || 0} fiches retournées`
  );

  const publicSuggestion = await req('POST', '/api/suggestions', {
    type: 'add',
    data: { title: 'Suggestion Distante Test', category: 'Cardiologie' }
  }, { ...REMOTE_HEADERS, 'x-app-key': 'drcat_pub_2f7a91c4e8' });
  assert(
    'POST /api/suggestions (Soumission publique) depuis IP distante -> 200 OK',
    publicSuggestion.status === 200 && publicSuggestion.body?.success === true,
    `ID: ${publicSuggestion.body?.suggestion?.id}`
  );

  console.log(`\n════════════════════════════════════════════════════════════════`);
  console.log(`📊 RÉSULTAT DE L'AUDIT DE SÉCURITÉ : ${passed} Succès, ${failed} Échecs`);
  console.log(`════════════════════════════════════════════════════════════════\n`);

  cleanup();
  process.exit(failed > 0 ? 1 : 0);
}

runSecurityAudit().catch(err => {
  console.error('Fatal error in security audit:', err);
  process.exit(1);
});
