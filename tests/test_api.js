const http = require('http');
const { spawn } = require('child_process');
const path = require('path');

const ROOT = path.join(__dirname, '..');
const BASE = 'http://127.0.0.1:3000';

function req(method, reqPath, body, headers = {}) {
  return new Promise((resolve, reject) => {
    const url = new URL(reqPath, BASE);
    const opts = {
      hostname: url.hostname, port: url.port,
      path: url.pathname + url.search, method,
      headers: { 'Content-Type': 'application/json', 'Accept': 'application/json', 'x-app-key': 'drcat_pub_2f7a91c4e8', ...headers }
    };
    const r = http.request(opts, res => {
      let d = ''; res.on('data', c => d += c); res.on('end', () => {
        try { resolve({ status: res.statusCode, headers: res.headers, body: JSON.parse(d) }); }
        catch { resolve({ status: res.statusCode, headers: res.headers, body: d }); }
      });
    });
    r.on('error', reject);
    if (body && method !== 'GET') r.write(JSON.stringify(body));
    r.end();
  });
}

(async () => {
  let serverProcess = null;
  function cleanup() {
    if (serverProcess) {
      try { serverProcess.kill(); } catch (_) {}
    }
  }

  process.on('exit', cleanup);
  process.on('SIGINT', () => { cleanup(); process.exit(1); });
  process.on('SIGTERM', () => { cleanup(); process.exit(1); });

  console.log('\n🩺 Dr. CAT — API Smoke Tests\n');
  console.log('Starting server...');

  serverProcess = spawn('node', ['server.js'], {
    cwd: ROOT,
    stdio: ['pipe', 'pipe', 'pipe'],
    env: { ...process.env, NODE_ENV: 'test' }
  });

  let serverReady = false;
  serverProcess.stdout.on('data', (data) => {
    if (data.toString().includes('Medical CAT Learning App is running')) {
      serverReady = true;
    }
  });

  for (let i = 0; i < 20; i++) {
    await new Promise(r => setTimeout(r, 500));
    if (serverReady) break;
  }

  if (!serverReady) {
    console.error('Test server failed to start');
    cleanup();
    process.exit(1);
  }
  console.log('  ✅ Server started');

  let passed = 0, failed = 0;
  function check(name, ok) {
    if (ok) { console.log('  ✅ ' + name); passed++; }
    else { console.log('  ❌ ' + name); failed++; }
  }

  try {
    console.log('\nTesting GET /api/cats...');
    const cats = await req('GET', '/api/cats');
    const catsList = Array.isArray(cats.body) ? cats.body : (cats.body.cats || []);
    check('Status 200', cats.status === 200);
    check('Returns array', Array.isArray(catsList));
    check('Array not empty', catsList.length > 0);
    check('CAT has id', typeof catsList[0].id === 'number');
    check('CAT has title', typeof catsList[0].title === 'string');
    check('CAT has category', typeof catsList[0].category === 'string');

    console.log('Testing GET /api/is-local...');
    const isLocal = await req('GET', '/api/is-local');
    check('Status 200', isLocal.status === 200);
    check('Returns isLocal boolean', typeof isLocal.body.isLocal === 'boolean');

    console.log('Testing GET /api/is-admin...');
    const isAdmin = await req('GET', '/api/is-admin');
    check('Status 200', isAdmin.status === 200);
    check('Returns isAdmin false', isAdmin.body.isAdmin === false);

    console.log('Testing POST /api/login (wrong password)...');
    const badLogin = await req('POST', '/api/login', { password: 'wrong-password-xyz' });
    check('Status 401 on wrong password', badLogin.status === 401);
    check('Error message present', typeof badLogin.body.error === 'string');

    console.log('Testing GET /api/pdf-index-status...');
    const pdfStatus = await req('GET', '/api/pdf-index-status');
    check('Status 200', pdfStatus.status === 200);
    check('Returns object', typeof pdfStatus.body === 'object');

    console.log('Testing GET /api/search-status...');
    const searchStatus = await req('GET', '/api/search-status');
    check('Status 200', searchStatus.status === 200);
    check('Has isIndexing field', typeof searchStatus.body.isIndexing === 'boolean');

    console.log('Testing OPTIONS preflight...');
    const preflight = await req('OPTIONS', '/api/cats', null, {
      'Origin': 'http://localhost:3000',
      'Access-Control-Request-Method': 'GET'
    });
    check('OPTIONS returns 204', preflight.status === 204);
    check('CORS origin echoed back', preflight.headers['access-control-allow-origin'] === 'http://localhost:3000');

    console.log('Testing static file serving...');
    const indexHtml = await req('GET', '/');
    check('Status 200', indexHtml.status === 200);
    check('Contains Dr.CAT title', typeof indexHtml.body === 'string' && indexHtml.body.includes('Dr.CAT'));

  } catch (err) {
    console.error('Test error:', err);
    failed++;
  }

  console.log(`\n==================================================`);
  console.log(`Results: ${passed} passed, ${failed} failed`);
  console.log(`==================================================\n`);

  cleanup();
  process.exit(failed > 0 ? 1 : 0);
})();
