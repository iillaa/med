const http = require('http');
const fs = require('fs');
const { spawn } = require('child_process');
const path = require('path');

const ROOT = path.join(__dirname, '..');
const PORT = process.env.PORT || '3099';
const BASE = `http://127.0.0.1:${PORT}`;

function req(method, reqPath, body, headers = {}) {
  return new Promise((resolve, reject) => {
    const url = new URL(reqPath, BASE);
    const payload = (body && method !== 'GET') ? JSON.stringify(body) : null;
    const reqHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      ...headers
    };
    if (payload) {
      reqHeaders['Content-Length'] = Buffer.byteLength(payload);
    }
    const opts = {
      hostname: url.hostname, port: url.port,
      path: url.pathname + url.search, method,
      headers: reqHeaders
    };
    const r = http.request(opts, res => {
      let d = ''; res.on('data', c => d += c); res.on('end', () => {
        try { resolve({ status: res.statusCode, body: JSON.parse(d) }); }
        catch { resolve({ status: res.statusCode, body: d }); }
      });
    });
    r.on('error', reject);
    if (payload) r.write(payload);
    r.end();
  });
}

async function runTests() {
  let serverProcess = null;
  const PASSWORD_FILE = path.join(ROOT, 'admin_password.txt');
  let originalPasswordContent = '';
  
  if (fs.existsSync(PASSWORD_FILE)) {
    originalPasswordContent = fs.readFileSync(PASSWORD_FILE, 'utf-8');
  }
  
  const tempPassword = 'test-temp-password-999';
  fs.writeFileSync(PASSWORD_FILE, tempPassword, 'utf-8');
  
  const CATS_DB_FILE = path.join(ROOT, 'cats_db.json');
  const CATS_DB_TEST = path.join(ROOT, 'cats_db_test_auth.json');

  // Create isolated dedicated test database from master template
  fs.copyFileSync(CATS_DB_FILE, CATS_DB_TEST);

  function cleanup() {
    if (serverProcess) {
      try {
        serverProcess.kill('SIGKILL');
      } catch (_) {}
    }
    if (originalPasswordContent) {
      fs.writeFileSync(PASSWORD_FILE, originalPasswordContent, 'utf-8');
    } else {
      try { fs.unlinkSync(PASSWORD_FILE); } catch (_) {}
    }
    if (fs.existsSync(CATS_DB_TEST)) {
      try { fs.unlinkSync(CATS_DB_TEST); } catch (_) {}
    }
  }

  process.on('exit', cleanup);
  process.on('SIGINT', () => { cleanup(); process.exit(1); });
  process.on('SIGTERM', () => { cleanup(); process.exit(1); });

  console.log('Starting test server (Isolated DB)...');
  serverProcess = spawn('node', ['server.js'], {
    cwd: ROOT,
    stdio: ['pipe', 'pipe', 'pipe'],
    env: { ...process.env, NODE_ENV: 'test', PORT: PORT, CATS_DB_PATH: CATS_DB_TEST }
  });

  let serverReady = false;
  const onData = (data) => {
    const text = data.toString();
    if (text.includes('Local Access:') || text.includes('Clinical Assistant') || text.includes('Dr. CAT') || text.includes('App is running')) {
      serverReady = true;
    }
  };
  serverProcess.stdout.on('data', (d) => {
    const text = d.toString();
    if (text.includes('Local Access:') || text.includes('Clinical Assistant') || text.includes('Dr. CAT') || text.includes('App is running')) {
      serverReady = true;
    }
  });
  serverProcess.stderr.on('data', (d) => {
    console.error('[Server STDERR]', d.toString());
  });

  for (let i = 0; i < 60; i++) {
    await new Promise(r => setTimeout(r, 500));
    if (serverReady) break;
  }

  if (!serverReady) {
    console.error('Test server failed to start');
    cleanup();
    process.exit(1);
  }

  let passed = 0, failed = 0;
  function check(name, ok) {
    if (ok) { console.log('  ✅ ' + name); passed++; }
    else { console.log('  ❌ ' + name); failed++; }
  }

  console.log('\n🩺 Dr. CAT — Protected Routes & Auth Flow\n');

  try {
    console.log('1. Unauthenticated access control:');
    check('POST /api/cats/:id → 403', (await req('POST', '/api/cats/1', { summary: 'x' })).status === 403);
    check('GET  /api/suggestions → 403', (await req('GET', '/api/suggestions')).status === 403);
    check('POST /api/reindex → 403', (await req('POST', '/api/reindex')).status === 403);
    check('POST /api/suggestions/:id/approve → 403', (await req('POST', '/api/suggestions/x/approve')).status === 403);

    console.log('\n2. Login flow:');
    const login = await req('POST', '/api/login', { password: tempPassword });
    check('POST /api/login → 200', login.status === 200 && login.body.success === true);
    const token = login.body.token;
    check('Token present', typeof token === 'string' && token.length > 0);

    console.log('\n3. Authenticated access control:');
    check('GET  /api/is-admin → true', (await req('GET', '/api/is-admin', null, { 'x-admin-token': token })).body.isAdmin === true);

    const newCat = await req('POST', '/api/cats', { title: 'Test CAT ' + Date.now(), category: 'Test', summary: 'original summary', red_flags: '', ordonnance: '', pdf_keywords: [] }, { 'x-admin-token': token });
    check('POST /api/cats → 200', newCat.status === 200 && newCat.body.success === true);
    const testCatId = newCat.body.cat.id;

    check('POST /api/cats/:id → 200', (await req('POST', '/api/cats/' + testCatId, { summary: 'auth test' }, { 'x-admin-token': token })).status === 200);
    check('GET  /api/suggestions → 200', (await req('GET', '/api/suggestions', null, { 'x-admin-token': token })).status === 200);

    console.log('\n4. Suggestion lifecycle:');
    const sug = await req('POST', '/api/suggestions', { type: 'edit', catId: testCatId, data: { summary: 'sug ' + Date.now() } }, { 'x-app-key': 'drcat_pub_2f7a91c4e8' });
    check('POST /api/suggestions → created', sug.status === 200 && sug.body.success === true);
    const sugId = sug.body.suggestion.id;

    const edit = await req('POST', '/api/suggestions/' + sugId + '/edit', { data: { summary: 'updated ' + Date.now() } }, { 'x-admin-token': token });
    check('POST /api/suggestions/:id/edit → 200', edit.status === 200 && edit.body.success === true);

    const approve = await req('POST', '/api/suggestions/' + sugId + '/approve', {}, { 'x-admin-token': token });
    check('POST /api/suggestions/:id/approve → 200', approve.status === 200 && approve.body.success === true);

    const after = await req('GET', '/api/suggestions', null, { 'x-admin-token': token });
    check('Suggestion removed after approve', !after.body.find(s => s.id === sugId));

    await req('DELETE', '/api/cats/' + testCatId, {}, { 'x-admin-token': token });

    console.log('\n5. Reindex & Logout:');
    check('POST /api/reindex → 200', (await req('POST', '/api/reindex', {}, { 'x-admin-token': token })).status === 200);

    const logout = await req('POST', '/api/logout', {}, { 'x-admin-token': token });
    check('POST /api/logout → 200', logout.status === 200);

    const afterLogout = await req('GET', '/api/is-admin', null, { 'x-admin-token': token });
    check('GET  /api/is-admin after logout → false', afterLogout.body.isAdmin === false);

  } catch (err) {
    console.error('Test error:', err);
    failed++;
  }

  console.log(`\n==================================================`);
  console.log(`Results: ${passed} passed, ${failed} failed`);
  console.log(`==================================================\n`);

  cleanup();
  process.exit(failed > 0 ? 1 : 0);
}

runTests();
