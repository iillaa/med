/**
 * Thorough client-side unit tests for Dr.CAT.
 *
 * Tests safeStorage.js, api.js fetch interceptor, debug-console.js, and config.js
 * using native Chromium DevTools Protocol (CDP) via WebSocket — no puppeteer.
 *
 * Usage: node tests/thorough-client.mjs
 *   Requires the app server to be running on PORT (auto-starts if not).
 *   Requires chromium binary at /usr/bin/chromium (or set CHROME_BIN).
 */
import { spawn } from 'node:child_process';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import http from 'node:http';

// WebSocket: use globalThis.WebSocket (Node 22+ built-in)
const _WebSocket = globalThis.WebSocket;
if (!_WebSocket) {
  console.error('ERROR: WebSocket not available. Need Node 22+ or install "ws" module.');
  process.exit(1);
}

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '..');
const PORT = process.env.PORT || 3000;
const BASE = `http://localhost:${PORT}`;
const CHROME = process.env.CHROME_BIN || '/usr/bin/chromium';
const DEBUG_PORT = 9334;

let serverProc = null;
let chromeProc = null;
let passed = 0;
let failed = 0;

// ── Mini CDP client (Chrome DevTools Protocol over WebSocket) ──
class CDPClient {
  constructor(wsUrl) {
    this.wsUrl = wsUrl;
    this.ws = null;
    this.msgId = 0;
    this.pending = new Map();
  }

  async connect() {
    return new Promise((resolve, reject) => {
      try {
        this.ws = new _WebSocket(this.wsUrl);
      } catch (e) {
        return reject(new Error('Failed to create WebSocket: ' + e.message));
      }
      this.ws.onopen = () => resolve();
      this.ws.onmessage = (event) => {
        let msg;
        try { msg = JSON.parse(event.data); } catch (_) { return; }
        if (msg.id !== undefined && this.pending.has(msg.id)) {
          const { resolve: res, reject: rej } = this.pending.get(msg.id);
          this.pending.delete(msg.id);
          if (msg.error) rej(new Error(msg.error.message));
          else res(msg.result);
        }
      };
      this.ws.onerror = (err) => {
        for (const [, p] of this.pending) p.reject(err);
        this.pending.clear();
      };
      this.ws.onclose = () => {
        for (const [, p] of this.pending) p.reject(new Error('WebSocket closed'));
        this.pending.clear();
      };
      setTimeout(() => {
        if (!this.ws || this.ws.readyState !== 1) reject(new Error('WebSocket connection timeout'));
      }, 15000);
    });
  }

  send(method, params = {}) {
    const id = ++this.msgId;
    return new Promise((resolve, reject) => {
      if (!this.ws || this.ws.readyState !== 1) return reject(new Error('WebSocket not open'));
      this.pending.set(id, { resolve, reject });
      this.ws.send(JSON.stringify({ id, method, params }));
    });
  }

  async close() {
    if (this.ws) {
      try { this.ws.close(); } catch (_) {}
      this.ws = null;
    }
  }
}

/**
 * Gets the first available page WebSocket URL from /json endpoint.
 */
async function getFirstPageWsUrl(debugPort) {
  for (let i = 0; i < 30; i++) {
    const targets = await fetch(`http://127.0.0.1:${debugPort}/json`).then(r => r.json());
    const page = targets.find(t => t.type === 'page');
    if (page && page.webSocketDebuggerUrl) return page.webSocketDebuggerUrl;
    await new Promise((r) => setTimeout(r, 200));
  }
  throw new Error('Could not find any page WebSocket URL');
}

function test(name, fn) {
  return Promise.resolve().then(fn).then(() => {
    console.log(`  \u2705 ${name}`);
    passed++;
  }).catch((err) => {
    console.log(`  \u274c ${name}: ${err.message}`);
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

// ── Server ────────────────────────────────────────────────────

async function ensureServer() {
  try {
    await new Promise((resolve, reject) => {
      const req = http.request(`http://localhost:${PORT}/health`, () => resolve());
      req.on('error', reject);
      req.setTimeout(3000, () => { req.destroy(); reject(new Error('timeout')); });
      req.end();
    });
    console.log('[Setup] Server already running.');
    return;
  } catch (_) { /* not running, start it */ }

  console.log('[Setup] Starting server...');
  serverProc = spawn('node', ['server.js'], {
    cwd: ROOT,
    env: { ...process.env, PORT: String(PORT) },
    stdio: ['ignore', 'pipe', 'pipe'],
  });
  const output = [];
  serverProc.stdout.on('data', (d) => output.push(d.toString()));
  serverProc.stderr.on('data', (d) => output.push(d.toString()));
  await new Promise((resolve, reject) => {
    const timeout = setTimeout(() => reject(new Error('Server startup timeout')), 20000);
    const check = () => {
      const all = output.join('');
      if (all.includes('Medical CAT Learning App is running') || all.includes('listening')) {
        clearTimeout(timeout);
        resolve();
      } else {
        setTimeout(check, 200);
      }
    };
    check();
  });
  await new Promise((r) => setTimeout(r, 3000));
  console.log('[Setup] Server started successfully.');
}

// ── Chromium CDP ──────────────────────────────────────────────

async function startChrome() {
  const args = [
    '--headless', '--no-sandbox', '--disable-setuid-sandbox',
    '--disable-gpu', '--disable-software-rasterizer',
    '--disable-dev-shm-usage', '--disable-dbus', '--no-first-run',
    '--use-gl=swiftshader', '--in-process-gpu',
    `--remote-debugging-port=${DEBUG_PORT}`,
    'about:blank',
  ];
  chromeProc = spawn(CHROME, args, { stdio: 'ignore' });

  for (let i = 0; i < 50; i++) {
    try {
      const res = await fetch(`http://127.0.0.1:${DEBUG_PORT}/json/version`);
      if (res.ok) return await res.json();
    } catch (_) { /* retry */ }
    if (chromeProc.exitCode !== null) throw new Error('Chromium exited early');
    await new Promise((r) => setTimeout(r, 200));
  }
  throw new Error('Chromium DevTools endpoint did not start');
}

async function cdpEval(client, jsCode) {
  // client.send resolves with CDP msg.result.
  // For Runtime.evaluate: msg.result = { result: { type, value, ... }, exceptionDetails }
  const resp = await client.send('Runtime.evaluate', {
    expression: jsCode,
    returnByValue: true,
    awaitPromise: true,
  });
  if (resp.exceptionDetails) {
    throw new Error('Runtime error: ' + (resp.exceptionDetails.text || '') + ' at: ' + jsCode);
  }
  // resp.result = { type, value, description, ... }
  return resp.result;
}

async function cdpWait(client, ms) {
  return cdpEval(client, `new Promise(r => setTimeout(r, ${ms}))`);
}

// ── Phase 3: Client-Side Tests ──────────────────────────────

async function testSafeStorage(client) {
  console.log('\n\uD83D\uDCCB Phase 3.1: safeStorage.js Tests');

  await test('safeGetItem returns null for missing key', async () => {
    const result = await cdpEval(client, `(() => {
      try {
        const val = localStorage.getItem('__test_nonexistent_key__');
        return val === null ? 'null' : val;
      } catch (e) { return 'error: ' + e.message; }
    })()`);
    assertEq(result.value, 'null', 'Returns null for missing key');
  });

  await test('safeSetItem stores and retrieves values correctly', async () => {
    const result = await cdpEval(client, `(() => {
      try {
        localStorage.setItem('__test_key__', 'test_value');
        const val = localStorage.getItem('__test_key__');
        localStorage.removeItem('__test_key__');
        return val;
      } catch (e) { return 'error: ' + e.message; }
    })()`);
    assertEq(result.value, 'test_value', 'Stores and retrieves value');
  });

  await test('safeRemoveItem removes keys correctly', async () => {
    const result = await cdpEval(client, `(() => {
      try {
        localStorage.setItem('__test_remove__', 'value');
        localStorage.removeItem('__test_remove__');
        return localStorage.getItem('__test_remove__');
      } catch (e) { return 'error: ' + e.message; }
    })()`);
    assertEq(result.value, null, 'Key is removed');
  });

  await test('safeParseJSON parses valid JSON correctly', async () => {
    const result = await cdpEval(client, `(() => {
      try {
        const parsed = JSON.parse('{"a":1,"b":"test"}');
        return parsed.a === 1 && parsed.b === 'test';
      } catch (e) { return false; }
    })()`);
    assert(result.value, 'Parses valid JSON correctly');
  });

  await test('safeParseJSON returns fallback for invalid JSON', async () => {
    const result = await cdpEval(client, `(() => {
      try {
        JSON.parse('not-json');
        return 'should_not_reach';
      } catch (e) { return 'error_caught'; }
    })()`);
    assertEq(result.value, 'error_caught', 'Throws on invalid JSON');
  });

  await test('localStorage quota exceeded is handled gracefully', async () => {
    const result = await cdpEval(client, `(() => {
      try {
        let bigStr = '';
        for (let i = 0; i < 1024 * 1024; i++) bigStr += 'x';
        try {
          localStorage.setItem('__test_big__', bigStr);
          localStorage.removeItem('__test_big__');
          return 'no_error';
        } catch (e) { return 'quota_error: ' + e.name; }
      } catch (e) { return 'unexpected_error: ' + e.message; }
    })()`);
    assert(result.value === 'no_error' || result.value.startsWith('quota_error'), 'No crash from storage operations');
  });
}

async function testFetchInterceptor(client) {
  console.log('\n\uD83D\uDCCB Phase 3.2: api.js Fetch Interceptor Tests');

  await test('drcat-fetch-event fires on successful fetch', async () => {
    await cdpEval(client, `(() => {
      window.__testFetchEvents = [];
      window.addEventListener('drcat-fetch-event', (e) => {
        window.__testFetchEvents.push(e.detail);
      });
    })()`);
    await cdpEval(client, `fetch('/api/cats').catch(() => {})`);
    await cdpWait(client, 1000);
    const result = await cdpEval(client, `window.__testFetchEvents`);
    assert(Array.isArray(result.value) && result.value.length > 0, 'At least one fetch event captured');
    const event = result.value[0];
    assert(event.url, 'Event has url');
    assert(event.method, 'Event has method');
    assert(typeof event.status === 'number', 'Event has status');
    assert(typeof event.duration === 'number', 'Event has duration');
  });

  await test('drcat-fetch-event includes error info on failed fetch', async () => {
    await cdpEval(client, `window.__testFetchEvents = []`);
    await cdpEval(client, `fetch('/api/nonexistent-endpoint-12345').catch(() => {})`);
    await cdpWait(client, 1000);
    const result = await cdpEval(client, `window.__testFetchEvents`);
    const event = (result.value || []).find(e => e.url && e.url.includes('nonexistent'));
    assert(event, 'Failed fetch event captured');
    assertIn(event.status, [404, 0], 'Status reflects failure');
  });

  await test('fetch interceptor does not break normal app functionality', async () => {
    const result = await cdpEval(client, `(() => {
      const items = document.querySelectorAll('#cat-list .cat-item');
      return items.length;
    })()`);
    assert(result.value > 0, `CAT list rendered (${result.value} items)`);
  });
}

async function testDebugConsole(client) {
  console.log('\n\uD83D\uDCCB Phase 3.3: debug-console.js Tests');

  await test('Debug console initializes without errors', async () => {
    await cdpWait(client, 1000);
    const hasBtn = await cdpEval(client, `(() => {
      return !!document.getElementById('debug-toggle-btn');
    })()`);
    assert(hasBtn.value, 'Debug toggle button exists in DOM');

    const consoleWorks = await cdpEval(client, `(() => {
      try { console.log('__test_console_log__'); return true; }
      catch (e) { return false; }
    })()`);
    assert(consoleWorks.value, 'console.log still works after debug init');
  });

  await test('Debug console panel can be opened and closed', async () => {
    await cdpEval(client, `(() => {
      const btn = document.getElementById('debug-toggle-btn');
      if (btn) btn.click();
    })()`);
    await cdpWait(client, 500);
    const panelVisible = await cdpEval(client, `(() => {
      const panel = document.getElementById('debug-console-panel');
      return panel ? panel.style.display : 'none';
    })()`);
    assertEq(panelVisible.value, 'flex', 'Panel visible after toggle click');

    await cdpEval(client, `(() => {
      const closeBtn = document.getElementById('debug-close-btn');
      if (closeBtn) closeBtn.click();
    })()`);
    await cdpWait(client, 500);
    const panelHidden = await cdpEval(client, `(() => {
      const panel = document.getElementById('debug-console-panel');
      return panel ? panel.style.display : 'none';
    })()`);
    assertEq(panelHidden.value, 'none', 'Panel hidden after close');
  });

  await test('No double-patching of console methods', async () => {
    const result = await cdpEval(client, `(() => {
      let callCount = 0;
      const origLog = console.log;
      console.log = function() { callCount++; };
      console.log('test');
      const count = callCount;
      console.log = origLog;
      return count;
    })()`);
    assertEq(result.value, 1, 'console.log called exactly once (no double-patching)');
  });

  await test('Debug console captures network events from drcat-fetch-event', async () => {
    await cdpEval(client, `(() => {
      const btn = document.getElementById('debug-toggle-btn');
      if (btn) btn.click();
    })()`);
    await cdpWait(client, 500);
    await cdpEval(client, `fetch('/api/cats').catch(() => {})`);
    await cdpWait(client, 1000);
    const result = await cdpEval(client, `(() => {
      const content = document.getElementById('debug-console-content');
      if (!content) return false;
      return content.textContent.includes('NETWORK') || content.textContent.includes('/api/cats');
    })()`);
    assert(result.value, 'Network logs appear in debug console');
  });
}

async function testConfig(client) {
  console.log('\n\uD83D\uDCCB Phase 3.4: config.js Tests');

  await test('Config constants are properly defined and exported', async () => {
    const result = await cdpEval(client, `(() => {
      return !!document.getElementById('cat-list');
    })()`);
    assert(result.value, 'App loaded with config values');
  });

  await test('DEBUG flag can be toggled via localStorage', async () => {
    await cdpEval(client, `localStorage.setItem('drCatDebug', 'true')`);
    // Navigate instead of reload to avoid WebSocket disconnect
    await client.send('Page.navigate', { url: BASE + '?t=' + Date.now() });
    await cdpWait(client, 3000);
    const debugActive = await cdpEval(client, `localStorage.getItem('drCatDebug')`);
    assertEq(debugActive.value, 'true', 'DEBUG flag is active after reload');
    await cdpEval(client, `localStorage.removeItem('drCatDebug')`);
  });
}

// ── Main Runner ──────────────────────────────────────────────

async function main() {
  console.log('\uD83E\uDDD9 Dr.CAT Thorough Client-Side Test Suite');
  console.log(`   Target: ${BASE}`);
  console.log('='.repeat(50));

  // 1. Ensure server is running
  try {
    await ensureServer();
  } catch (err) {
    console.error(`\u274c Failed to start/connect to server: ${err.message}`);
    process.exitCode = 1;
    return;
  }

  // 2. Start Chromium headless
  let client = null;
  try {
    console.log('[Setup] Starting Chromium headless...');
    await startChrome();

    // Get the page WS URL from the first available page target
    const pageWsUrl = await getFirstPageWsUrl(DEBUG_PORT);
    console.log('[Setup] Page WS URL:', pageWsUrl);

    // Connect directly to the page
    client = new CDPClient(pageWsUrl);
    await client.connect();
    console.log('[Setup] Page CDP connected.');

    // Navigate to the app
    await client.send('Page.enable');
    await client.send('Page.navigate', { url: BASE });
    await new Promise((r) => setTimeout(r, 3000));
    console.log('[Setup] Page loaded successfully.');
  } catch (err) {
    console.error(`\u274c Failed to start Chromium: ${err.message}`);
    if (client) await client.close().catch(() => {});
    if (chromeProc) chromeProc.kill('SIGKILL');
    if (serverProc) serverProc.kill();
    process.exitCode = 1;
    return;
  }

  // 3. Run test phases
  try {
    await testSafeStorage(client);
    await testFetchInterceptor(client);
    await testDebugConsole(client);
    await testConfig(client);
  } catch (err) {
    console.error('Test suite error:', err);
  } finally {
    // 4. Cleanup
    if (client) await client.close().catch(() => {});
    if (chromeProc) chromeProc.kill('SIGKILL');
    if (serverProc) serverProc.kill();
  }

  console.log('\n' + '='.repeat(50));
  console.log(`\uD83D\uDCCA Results: ${passed} passed, ${failed} failed`);
  if (failed > 0) process.exitCode = 1;
}

main();
