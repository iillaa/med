const http = require('http');
const fs = require('fs');
const { spawn } = require('child_process');
const path = require('path');
const BASE = 'http://127.0.0.1:3000';

function req(method, path, body, headers = {}) {
  return new Promise((resolve, reject) => {
    const url = new URL(path, BASE);
    const opts = {
      hostname: url.hostname, port: url.port,
      path: url.pathname + url.search, method,
      headers: { 'Content-Type': 'application/json', 'Accept': 'application/json', ...headers }
    };
    const r = http.request(opts, res => {
      let d = ''; res.on('data', c => d += c); res.on('end', () => {
        try { resolve({ status: res.statusCode, body: JSON.parse(d) }); }
        catch { resolve({ status: res.statusCode, body: d }); }
      });
    });
    r.on('error', reject);
    if (body && method !== 'GET') r.write(JSON.stringify(body));
    r.end();
  });
}

(async () => {
  let serverProcess = null;
  const PASSWORD_FILE = path.join(__dirname, 'admin_password.txt');
  let originalPasswordContent = '';
  
  if (fs.existsSync(PASSWORD_FILE)) {
    originalPasswordContent = fs.readFileSync(PASSWORD_FILE, 'utf-8');
  }
  
  // Set temporary plain text password
  const tempPassword = 'test-temp-password-999';
  fs.writeFileSync(PASSWORD_FILE, tempPassword, 'utf-8');
  
  function cleanup() {
    if (serverProcess) {
      try { serverProcess.kill(); } catch (_) {}
    }
    // Restore original password
    if (originalPasswordContent) {
      fs.writeFileSync(PASSWORD_FILE, originalPasswordContent, 'utf-8');
    } else {
      try { fs.unlinkSync(PASSWORD_FILE); } catch (_) {}
    }
  }

  // Handle exits
  process.on('exit', cleanup);
  process.on('SIGINT', () => { cleanup(); process.exit(1); });
  process.on('SIGTERM', () => { cleanup(); process.exit(1); });

  // Spawn server
  console.log('Starting test server...');
  serverProcess = spawn('node', ['server.js'], {
    cwd: __dirname,
    stdio: ['pipe', 'pipe', 'pipe'],
    env: { ...process.env, NODE_ENV: 'test' }
  });

  let serverReady = false;
  serverProcess.stdout.on('data', (data) => {
    const msg = data.toString();
    if (msg.includes('Medical CAT Learning App is running')) {
      serverReady = true;
    }
  });

  // Wait up to 10s for server to start
  for (let i = 0; i < 20; i++) {
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
    // Auth required endpoints without token
    console.log('1. Unauthenticated access control:');
    check('POST /api/cats/:id → 403', (await req('POST', '/api/cats/1', { summary: 'x' })).status === 403);
    check('GET  /api/suggestions → 403', (await req('GET', '/api/suggestions')).status === 403);
    check('POST /api/reindex → 403', (await req('POST', '/api/reindex')).status === 403);
    check('GET  /api/diagnostics/system → 403', (await req('GET', '/api/diagnostics/system')).status === 403);
    check('POST /api/suggestions/:id/approve → 403', (await req('POST', '/api/suggestions/x/approve')).status === 403);

    // Login
    console.log('\n2. Login flow:');
    const login = await req('POST', '/api/login', { password: tempPassword });
    check('POST /api/login → 200', login.status === 200 && login.body.success === true);
    const token = login.body.token;
    check('Token present', typeof token === 'string' && token.length > 0);

    // Token grants access
    console.log('\n3. Authenticated access control:');
    check('GET  /api/is-admin → true', (await req('GET', '/api/is-admin', null, { 'x-admin-token': token })).body.isAdmin === true);

    const newCat = await req('POST', '/api/cats', { title: 'Test CAT ' + Date.now(), category: 'Test', summary: 'original summary', red_flags: '', ordonnance: '', pdf_keywords: [] }, { 'x-admin-token': token });
    check('POST /api/cats → 200', newCat.status === 200 && newCat.body.success === true);
    const testCatId = newCat.body.cat.id;

    check('POST /api/cats/:id → 200', (await req('POST', '/api/cats/' + testCatId, { summary: 'auth test' }, { 'x-admin-token': token })).status === 200);
    check('POST /api/reindex → 200', (await req('POST', '/api/reindex', {}, { 'x-admin-token': token })).status === 200);
    check('GET  /api/diagnostics/system → 200', (await req('GET', '/api/diagnostics/system', null, { 'x-admin-token': token })).status === 200);

    // Suggestion lifecycle
    console.log('\n4. Suggestion lifecycle:');
    const sug = await req('POST', '/api/suggestions', { type: 'edit', catId: testCatId, data: { summary: 'sug ' + Date.now() } });
    check('POST /api/suggestions → created', sug.status === 200 && sug.body.success === true);
    const sugId = sug.body.suggestion.id;

    const edit = await req('POST', '/api/suggestions/' + sugId + '/edit', { data: { summary: 'updated ' + Date.now() } }, { 'x-admin-token': token });
    check('POST /api/suggestions/:id/edit → 200', edit.status === 200 && edit.body.success === true);

    const approve = await req('POST', '/api/suggestions/' + sugId + '/approve', {}, { 'x-admin-token': token });
    check('POST /api/suggestions/:id/approve → 200', approve.status === 200 && approve.body.success === true);

    const after = await req('GET', '/api/suggestions', null, { 'x-admin-token': token });
    check('Suggestion removed after approve', !after.body.find(s => s.id === sugId));

    // Cleanup test cat
    await req('DELETE', '/api/cats/' + testCatId, {}, { 'x-admin-token': token });

    // Logout
    console.log('\n5. Logout:');
    const logout = await req('POST', '/api/logout', {}, { 'x-admin-token': token });
    check('POST /api/logout → 200', logout.status === 200);
    check('GET  /api/is-admin after logout → false', (await req('GET', '/api/is-admin', null, { 'x-admin-token': token })).body.isAdmin === false);

  } catch (err) {
    console.error('Test run failed:', err);
    failed++;
  }

  // Summary
  console.log('\n' + '='.repeat(50));
  console.log(`Results: ${passed} passed, ${failed} failed`);
  console.log('='.repeat(50) + '\n');
  
  cleanup();
  process.exit(failed > 0 ? 1 : 0);
})();
