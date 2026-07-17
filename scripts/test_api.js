#!/usr/bin/env node
/**
 * Smoke tests for Dr. CAT API
 * Starts the server, runs checks, then exits.
 * Usage: node test_api.js
 */

const http = require('http');
const { spawn } = require('child_process');
const path = require('path');

const BASE = 'http://127.0.0.1:3000';
let serverProcess = null;
let passed = 0;
let failed = 0;

const APP_DATA_KEY = 'drcat_pub_2f7a91c4e8';

function request(method, urlPath, body) {
  return new Promise((resolve, reject) => {
    const url = new URL(urlPath, BASE);
    const options = {
      hostname: url.hostname,
      port: url.port,
      path: url.pathname + url.search,
      method,
      headers: {
        'Accept': 'application/json',
        'x-app-key': APP_DATA_KEY
      }
    };
    if (body) {
      options.headers['Content-Type'] = 'application/json';
    }

    const req = http.request(options, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try {
          resolve({ status: res.statusCode, headers: res.headers, body: JSON.parse(data) });
        } catch {
          resolve({ status: res.statusCode, headers: res.headers, body: data });
        }
      });
    });

    req.on('error', reject);
    if (body) req.write(JSON.stringify(body));
    req.end();
  });
}

function assert(name, condition, detail) {
  if (condition) {
    console.log(`  ✅ ${name}`);
    passed++;
  } else {
    console.log(`  ❌ ${name}${detail ? ' — ' + detail : ''}`);
    failed++;
  }
}

async function runTests() {
  console.log('\n🩺 Dr. CAT — API Smoke Tests\n');

  // 1. Start server
  console.log('Starting server...');
  serverProcess = spawn('node', ['server.js'], {
    cwd: path.join(__dirname),
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

  serverProcess.stderr.on('data', (data) => {
    // Ignore indexing warnings during test
  });

  // Wait up to 15s for server to start
  for (let i = 0; i < 30; i++) {
    await new Promise(r => setTimeout(r, 500));
    if (serverReady) break;
  }

  if (!serverReady) {
    console.log('  ❌ Server did not start within 15s');
    cleanup();
    process.exit(1);
  }
  console.log('  ✅ Server started\n');

  // 2. Test GET /api/cats
  console.log('Testing GET /api/cats...');
  try {
    const res = await request('GET', '/api/cats');
    assert('Status 200', res.status === 200);
    assert('Returns array', Array.isArray(res.body));
    assert('Array not empty', res.body.length > 0, `got ${res.body.length} items`);
    if (res.body.length > 0) {
      const cat = res.body[0];
      assert('CAT has id', typeof cat.id === 'number');
      assert('CAT has title', typeof cat.title === 'string' && cat.title.length > 0);
      assert('CAT has category', typeof cat.category === 'string' && cat.category.length > 0);
    }
  } catch (err) {
    assert('GET /api/cats', false, err.message);
  }

  // 3. Test GET /api/is-local (from localhost, should be true)
  console.log('Testing GET /api/is-local...');
  try {
    const res = await request('GET', '/api/is-local');
    assert('Status 200', res.status === 200);
    assert('Returns isLocal boolean', typeof res.body.isLocal === 'boolean');
  } catch (err) {
    assert('GET /api/is-local', false, err.message);
  }

  // 4. Test GET /api/is-admin (no token, should be false)
  console.log('Testing GET /api/is-admin...');
  try {
    const res = await request('GET', '/api/is-admin');
    assert('Status 200', res.status === 200);
    assert('Returns isAdmin false', res.body.isAdmin === false);
  } catch (err) {
    assert('GET /api/is-admin', false, err.message);
  }

  // 5. Test POST /api/login with wrong password (should 401)
  console.log('Testing POST /api/login (wrong password)...');
  try {
    const res = await request('POST', '/api/login', { password: 'wrong' });
    assert('Status 401', res.status === 401);
    assert('Error message present', typeof res.body.error === 'string');
  } catch (err) {
    assert('POST /api/login', false, err.message);
  }

  // 6. Test POST /api/login rate limit (5 rapid failures)
  console.log('Testing login rate limit...');
  try {
    for (let i = 0; i < 6; i++) {
      await request('POST', '/api/login', { password: 'wrong' });
    }
    const res = await request('POST', '/api/login', { password: 'wrong' });
    assert('Rate limit kicks in (429)', res.status === 429);
  } catch (err) {
    assert('Rate limit test', false, err.message);
  }

  // 7. Test GET /api/pdf-index-status
  console.log('Testing GET /api/pdf-index-status...');
  try {
    const res = await request('GET', '/api/pdf-index-status');
    assert('Status 200', res.status === 200);
    assert('Returns object', typeof res.body === 'object' && res.body !== null);
  } catch (err) {
    assert('GET /api/pdf-index-status', false, err.message);
  }

  // 8. Test GET /api/search-status
  console.log('Testing GET /api/search-status...');
  try {
    const res = await request('GET', '/api/search-status');
    assert('Status 200', res.status === 200);
    assert('Has isIndexing field', typeof res.body.isIndexing === 'boolean');
  } catch (err) {
    assert('GET /api/search-status', false, err.message);
  }

  // 9. Test OPTIONS preflight (CORS)
  console.log('Testing OPTIONS preflight...');
  try {
    const res = await new Promise((resolve, reject) => {
      const url = new URL('/api/cats', BASE);
      const req = http.request({
        hostname: url.hostname,
        port: url.port,
        path: url.pathname,
        method: 'OPTIONS',
        headers: {
          'Origin': 'http://localhost:3000',
          'Access-Control-Request-Method': 'GET'
        }
      }, (res) => {
        let data = '';
        res.on('data', chunk => data += chunk);
        res.on('end', () => resolve({ status: res.statusCode, headers: res.headers }));
      });
      req.on('error', reject);
      req.end();
    });
    assert('OPTIONS returns 204', res.status === 204);
    assert('CORS origin echoed back', res.headers['access-control-allow-origin'] === 'http://localhost:3000');
  } catch (err) {
    assert('OPTIONS preflight', false, err.message);
  }

  // 10. Test static file serving
  console.log('Testing static file serving...');
  try {
    const res = await request('GET', '/index.html');
    assert('Status 200', res.status === 200);
    assert('Contains Dr.CAT title', typeof res.body === 'string' && res.body.includes('Dr.CAT'));
  } catch (err) {
    assert('Static file /index.html', false, err.message);
  }

  // Summary
  console.log('\n' + '='.repeat(50));
  console.log(`Results: ${passed} passed, ${failed} failed`);
  console.log('='.repeat(50) + '\n');

  cleanup();
  process.exit(failed > 0 ? 1 : 0);
}

function cleanup() {
  if (serverProcess) {
    serverProcess.kill('SIGTERM');
    setTimeout(() => {
      try { serverProcess.kill('SIGKILL'); } catch (_) {}
    }, 2000);
  }
}

process.on('SIGINT', () => {
  cleanup();
  process.exit(1);
});

runTests().catch(err => {
  console.error('Test runner error:', err);
  cleanup();
  process.exit(1);
});
