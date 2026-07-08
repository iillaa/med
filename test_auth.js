const http = require('http');
const fs = require('fs');
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
  const password = fs.readFileSync('admin_password.txt', 'utf-8').trim();
  let passed = 0, failed = 0;
  function check(name, ok) {
    if (ok) { console.log('  ✅ ' + name); passed++; }
    else { console.log('  ❌ ' + name); failed++; }
  }

  console.log('\n🩺 Dr. CAT — Protected Routes & Auth Flow\n');

  // Auth required endpoints without token
  console.log('1. Unauthenticated access control:');
  check('POST /api/cats/:id → 403', (await req('POST', '/api/cats/1', { summary: 'x' })).status === 403);
  check('GET  /api/suggestions → 403', (await req('GET', '/api/suggestions')).status === 403);
  check('POST /api/reindex → 403', (await req('POST', '/api/reindex')).status === 403);
  check('GET  /api/diagnostics/system → 403', (await req('GET', '/api/diagnostics/system')).status === 403);
  check('POST /api/suggestions/:id/approve → 403', (await req('POST', '/api/suggestions/x/approve')).status === 403);

  // Login
  console.log('\n2. Login flow:');
  const login = await req('POST', '/api/login', { password });
  check('POST /api/login → 200', login.status === 200 && login.body.success === true);
  const token = login.body.token;
  check('Token present', typeof token === 'string' && token.length > 0);

  // Token grants access
  console.log('\n3. Authenticated access control:');
  check('GET  /api/is-admin → true', (await req('GET', '/api/is-admin', null, { 'x-admin-token': token })).body.isAdmin === true);
  check('POST /api/cats/:id → 200', (await req('POST', '/api/cats/1', { summary: 'auth test' }, { 'x-admin-token': token })).status === 200);
  check('POST /api/reindex → 200', (await req('POST', '/api/reindex', {}, { 'x-admin-token': token })).status === 200);
  check('GET  /api/diagnostics/system → 200', (await req('GET', '/api/diagnostics/system', null, { 'x-admin-token': token })).status === 200);

  // Suggestion lifecycle
  console.log('\n4. Suggestion lifecycle:');
  const sug = await req('POST', '/api/suggestions', { type: 'edit', catId: 1, data: { summary: 'sug ' + Date.now() } });
  check('POST /api/suggestions → created', sug.status === 200 && sug.body.success === true);
  const sugId = sug.body.suggestion.id;

  const edit = await req('POST', '/api/suggestions/' + sugId + '/edit', { data: { summary: 'updated ' + Date.now() } }, { 'x-admin-token': token });
  check('POST /api/suggestions/:id/edit → 200', edit.status === 200 && edit.body.success === true);

  const approve = await req('POST', '/api/suggestions/' + sugId + '/approve', {}, { 'x-admin-token': token });
  check('POST /api/suggestions/:id/approve → 200', approve.status === 200 && approve.body.success === true);

  const after = await req('GET', '/api/suggestions', null, { 'x-admin-token': token });
  check('Suggestion removed after approve', !after.body.find(s => s.id === sugId));

  // Logout
  console.log('\n5. Logout:');
  const logout = await req('POST', '/api/logout', {}, { 'x-admin-token': token });
  check('POST /api/logout → 200', logout.status === 200);
  check('GET  /api/is-admin after logout → false', (await req('GET', '/api/is-admin', null, { 'x-admin-token': token })).body.isAdmin === false);

  // Summary
  console.log('\n' + '='.repeat(50));
  console.log(`Results: ${passed} passed, ${failed} failed`);
  console.log('='.repeat(50) + '\n');
  process.exit(failed > 0 ? 1 : 0);
})();
