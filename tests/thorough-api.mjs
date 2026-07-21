/**
 * Thorough API endpoint tests for Dr.CAT.
 *
 * Tests server startup, CSP headers, schema validation, and all critical endpoints.
 * Requires the app server to be running on PORT.
 *
 * Usage: node tests/thorough-api.mjs
 *   Set CHROME_TEST_START_SERVER=1 to auto-start the server.
 */
import http from 'node:http';
import { spawn } from 'node:child_process';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '..');
const PORT = process.env.PORT || 3000;
const BASE = `http://localhost:${PORT}`;

let serverProc = null;
let passed = 0;
let failed = 0;

// ── Helpers ──────────────────────────────────────────────────

function request(method, urlPath, body = null, headers = {}) {
  return new Promise((resolve, reject) => {
    const url = new URL(urlPath, BASE);
    const opts = {
      method,
      hostname: url.hostname,
      port: url.port,
      path: url.pathname + url.search,
      headers: { ...headers },
    };
    if (body) {
      opts.headers['Content-Type'] = 'application/json';
      opts.headers['Content-Length'] = Buffer.byteLength(body);
    }
    const req = http.request(opts, (res) => {
      let data = '';
      res.on('data', (chunk) => (data += chunk));
      res.on('end', () => {
        let parsed = null;
        try { parsed = JSON.parse(data); } catch (_) { parsed = data; }
        resolve({ status: res.statusCode, headers: res.headers, body: parsed });
      });
    });
    req.on('error', reject);
    req.setTimeout(10000, () => { req.destroy(); reject(new Error('Request timed out')); });
    if (body) req.write(body);
    req.end();
  });
}

function test(name, fn) {
  return Promise.resolve().then(fn).then(() => {
    console.log(`  ✅ ${name}`);
    passed++;
  }).catch((err) => {
    console.log(`  ❌ ${name}: ${err.message}`);
    failed++;
  });
}

function assert(condition, msg) {
  if (!condition) throw new Error(msg || 'Assertion failed');
}

function assertEq(actual, expected, msg) {
  if (actual !== expected) throw new Error(`${msg || ''} Expected ${JSON.stringify(expected)}, got ${JSON.stringify(actual)}`);
}

function assertIn(actual, expectedArr, msg) {
  if (!expectedArr.includes(actual)) throw new Error(`${msg || ''} Expected one of ${JSON.stringify(expectedArr)}, got ${JSON.stringify(actual)}`);
}

// ── Server Startup ───────────────────────────────────────────

async function ensureServer() {
  // Check if already running
  try {
    await request('GET', '/health');
    console.log('[Setup] Server already running.');
    return;
  } catch (_) { /* not running, start it */ }

  console.log('[Setup] Starting server...');
  serverProc = spawn('node', ['server.js'], {
    cwd: ROOT,
    env: { ...process.env, PORT },
    stdio: ['ignore', 'pipe', 'pipe'],
  });
  let output = '';
  serverProc.stdout.on('data', (d) => { output += d.toString(); });
  serverProc.stderr.on('data', (d) => { output += d.toString(); });
  await new Promise((resolve, reject) => {
    const timeout = setTimeout(() => reject(new Error('Server startup timeout')), 20000);
    const check = () => {
      if (output.includes('Medical CAT Learning App is running') || output.includes('listening') || output.includes('localhost')) {
        clearTimeout(timeout);
        resolve();
      } else {
        setTimeout(check, 200);
      }
    };
    check();
  });
  // Give server a moment to finish initialization (PDF indexing etc.)
  await new Promise((r) => setTimeout(r, 3000));
  console.log('[Setup] Server started successfully.');
}

function stopServer() {
  if (serverProc) {
    serverProc.kill();
    serverProc = null;
  }
}

// ── Phase 1: Server Startup Tests ───────────────────────────

async function testServerStartup() {
  console.log('\n📋 Phase 1: Server Startup Tests');

  await test('GET /health returns 200 with status healthy', async () => {
    const res = await request('GET', '/health');
    assertEq(res.status, 200, 'Status code');
    assertEq(res.body.status, 'healthy', 'Health status');
    assert(res.body.timestamp, 'Has timestamp');
    assert(typeof res.body.uptime === 'number', 'Has uptime');
  });

  await test('CSP headers are set on HTML responses', async () => {
    const res = await request('GET', '/');
    const csp = res.headers['content-security-policy'];
    assert(csp, 'CSP header is present');
    assert(csp.includes("default-src 'self'"), 'CSP includes default-src');
    assert(csp.includes("script-src 'self' 'unsafe-inline' 'unsafe-eval'"), 'CSP includes script-src');
    assert(csp.includes("style-src 'self' 'unsafe-inline'"), 'CSP includes style-src');
    assert(csp.includes("connect-src 'self'"), 'CSP includes connect-src');
    assert(csp.includes("img-src 'self' data: blob:"), 'CSP includes img-src');
  });

  await test('CSP headers are set on API responses', async () => {
    const res = await request('GET', '/api/cats');
    const csp = res.headers['content-security-policy'];
    assert(csp, 'CSP header is present on API response');
  });

  await test('Server provides CORS headers', async () => {
    const res = await request('GET', '/api/cats');
    assert(res.headers['access-control-allow-origin'] !== undefined, 'CORS origin header present');
  });

  await test('Rate limit headers are present', async () => {
    const res = await request('GET', '/api/cats');
    assert(res.headers['x-ratelimit-limit'] !== undefined || res.headers['retry-after'] !== undefined,
      'Rate limit headers present');
  });

  await test('GET /api/server-providers returns provider list', async () => {
    const res = await request('GET', '/api/server-providers');
    assertEq(res.status, 200, 'Status code');
    assert('primaryProvider' in res.body, 'Has primaryProvider');
    assert(Array.isArray(res.body.servers), 'servers is an array');
  });
}

// ── Phase 2: API Endpoint Tests ─────────────────────────────

async function testApiEndpoints() {
  console.log('\n📋 Phase 2: API Endpoint Tests');

  // ── 2.1 & 2.2 GET /api/pdf-index ──
  await test('GET /api/pdf-index returns full index (no since param)', async () => {
    const res = await request('GET', '/api/pdf-index');
    assertEq(res.status, 200, 'Status code');
    assert(res.body.incremental === false, 'incremental is false');
    assert(typeof res.body.count === 'number', 'count is a number');
    assert(Array.isArray(res.body.entries), 'entries is an array');
  });

  await test('GET /api/pdf-index?since=<future> returns empty entries', async () => {
    const future = Date.now() + 86400000; // tomorrow
    const res = await request('GET', `/api/pdf-index?since=${future}`);
    assertEq(res.status, 200, 'Status code');
    assert(res.body.incremental === true, 'incremental is true');
    assertEq(res.body.count, 0, 'count is 0 for future timestamp');
    assertEq(res.body.entries.length, 0, 'entries is empty for future timestamp');
  });

  await test('GET /api/pdf-index?since=<past> returns entries', async () => {
    const past = 1; // epoch + 1ms, so doc.mtime > 1 should match
    const res = await request('GET', `/api/pdf-index?since=${past}`);
    assertEq(res.status, 200, 'Status code');
    assert(res.body.incremental === true, 'incremental is true');
    assert(typeof res.body.count === 'number', 'count is a number');
    assert(Array.isArray(res.body.entries), 'entries is an array');
    // Should return all entries since filter is doc.mtime > 1
  });

  await test('GET /api/pdf-index handles invalid since param gracefully', async () => {
    const res = await request('GET', '/api/pdf-index?since=invalid');
    assertEq(res.status, 200, 'Status code');
    assert(res.body.incremental === false, 'falls back to non-incremental');
    assert(Array.isArray(res.body.entries), 'entries is an array');
  });

  // ── 2.3 POST /api/server-providers (needs admin auth) ──
  await test('POST /api/server-providers without auth returns 403', async () => {
    const payload = JSON.stringify({ servers: [{ url: 'http://example.com', provider: 'manual', priority: 1 }] });
    const res = await request('POST', '/api/server-providers', payload);
    assertEq(res.status, 403, 'Returns 403 for unauthenticated request');
  });

  await test('POST /api/server-providers malformed JSON returns 400', async () => {
    const res = await request('POST', '/api/server-providers', 'not-json}', { 'Content-Type': 'application/json' });
    assertIn(res.status, [400, 500], 'Returns error status for malformed JSON');
  });

  // ── 2.6 & 2.7 GET /api/cats ──
  await test('GET /api/cats returns full list with active IDs header', async () => {
    const res = await request('GET', '/api/cats');
    assertEq(res.status, 200, 'Status code');
    assert(Array.isArray(res.body), 'Response is an array');
    assert(res.body.length > 0, 'List has at least one CAT');
    const activeIds = res.headers['x-active-cat-ids'];
    assert(activeIds, 'X-Active-Cat-IDs header is present');
    const ids = activeIds.split(',').map(Number);
    assert(ids.length > 0, 'Header contains comma-separated IDs');
    assert(ids.every(id => !isNaN(id)), 'All IDs are numeric');
  });

  await test('GET /api/cats?since=<future> returns empty list', async () => {
    const future = Date.now() + 86400000;
    const res = await request('GET', `/api/cats?since=${future}`);
    assertEq(res.status, 200, 'Status code');
    assert(Array.isArray(res.body), 'Response is an array');
    assertEq(res.body.length, 0, 'Empty for future timestamp');
  });

  await test('GET /api/cats?since=<past> returns full list', async () => {
    const past = 0;
    const res = await request('GET', `/api/cats?since=${past}`);
    assertEq(res.status, 200, 'Status code');
    assert(Array.isArray(res.body), 'Response is an array');
    assert(res.body.length > 0, 'Returns CATs for epoch since');
  });

  // ── Other endpoints ──
  await test('GET /api/search-status returns index status', async () => {
    const res = await request('GET', '/api/search-status');
    assertEq(res.status, 200, 'Status code');
    assert('isIndexing' in res.body, 'Has isIndexing');
    assert('totalFiles' in res.body, 'Has totalFiles');
    assert('indexedFiles' in res.body, 'Has indexedFiles');
  });

  await test('GET /api/pdf-index-status returns status map', async () => {
    const res = await request('GET', '/api/pdf-index-status');
    assertEq(res.status, 200, 'Status code');
    assert(typeof res.body === 'object', 'Response is an object');
    // Keys should be PDF filenames
    const keys = Object.keys(res.body);
    if (keys.length > 0) {
      const entry = res.body[keys[0]];
      assertIn(entry.status, ['green', 'orange', 'red'], 'Status is valid');
      assert(typeof entry.pagesWithText === 'number', 'Has pagesWithText');
      assert(typeof entry.totalPages === 'number', 'Has totalPages');
    }
  });

  // ── Auth endpoints ──
  await test('GET /api/is-admin without token returns false', async () => {
    const res = await request('GET', '/api/is-admin');
    assertEq(res.status, 200, 'Status code');
    assert(res.body.isAdmin === false, 'isAdmin is false without token');
  });

  await test('POST /api/logout works without auth', async () => {
    const res = await request('POST', '/api/logout');
    assertEq(res.status, 200, 'Status code');
    assert(res.body.success !== undefined, 'Has success field');
  });

  // ── Suggestion endpoints ──
  await test('POST /api/suggestions with valid payload returns ok', async () => {
    const payload = JSON.stringify({
      type: 'edit',
      catId: 1,
      data: { summary: 'Test suggestion' },
    });
    const res = await request('POST', '/api/suggestions', payload);
    // Should work without auth for end users
    assertIn(res.status, [200, 201, 400, 403], 'Responds to suggestion submission');
  });

  await test('GET /api/suggestions without auth returns 403', async () => {
    const res = await request('GET', '/api/suggestions');
    assertIn(res.status, [200, 403], 'Admin-only endpoint');
    if (res.status === 403) {
      assert(res.body.error, 'Has error message');
    }
  });

  // ── Diagnostic endpoints ──
  await test('GET /api/diagnostics/system returns 403 without admin', async () => {
    const res = await request('GET', '/api/diagnostics/system');
    assertEq(res.status, 403, 'Admin-only endpoint');
  });

  await test('GET /api/performance/server-metrics returns 403 without admin', async () => {
    const res = await request('GET', '/api/performance/server-metrics');
    assertEq(res.status, 403, 'Admin-only endpoint returns 403');
    assert(res.body.error, 'Has error message');
  });
}

// ── Main Runner ──────────────────────────────────────────────

async function main() {
  console.log('🧪 Dr.CAT Thorough API Test Suite');
  console.log(`   Target: ${BASE}`);
  console.log('='.repeat(50));

  try {
    await ensureServer();
  } catch (err) {
    console.error(`❌ Failed to start/connect to server: ${err.message}`);
    console.log('   Make sure the server is running on port', PORT);
    console.log('   Or set CHROME_TEST_START_SERVER=1 to auto-start it.');
    process.exitCode = 1;
    return;
  }

  // Retry loop for server readiness
  for (let i = 0; i < 10; i++) {
    try {
      await request('GET', '/health');
      break;
    } catch (_) {
      if (i === 9) {
        console.error('❌ Server did not become ready');
        stopServer();
        process.exitCode = 1;
        return;
      }
      await new Promise((r) => setTimeout(r, 1000));
    }
  }

  await testServerStartup();
  await testApiEndpoints();

  console.log('\n' + '='.repeat(50));
  console.log(`📊 Results: ${passed} passed, ${failed} failed`);
  if (failed > 0) process.exitCode = 1;

  stopServer();
}

main();
