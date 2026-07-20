/**
 * Lightweight headless test harness for Dr.CAT.
 *
 * Uses the system Chromium present in Termux (no 300MB download) via
 * puppeteer-core. Because Termux's Chromium can't be driven reliably through
 * puppeteer.launch (GPU/zygote quirks), we spawn Chromium ourselves with a
 * remote-debugging port and connect over CDP.
 *
 * Run:  node tests/headless/harness.mjs [command]
 *   commands: smoke | safeAreas | console | themeReveal
 *
 * Requires the app server to be running on PORT (start it separately), or set
 * CHROME_TEST_START_SERVER=1 to have this harness boot node server.js itself.
 */
import puppeteer from 'puppeteer-core';
import { spawn, execSync } from 'node:child_process';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '../..');
const PORT = process.env.PORT || 3000;
const BASE = `http://localhost:${PORT}`;
const CHROME = process.env.CHROME_BIN || '/usr/bin/chromium';
const DEBUG_PORT = 9333;

let serverProc = null;
let chromeProc = null;

async function ensureServer() {
  if (process.env.CHROME_TEST_START_SERVER === '1') {
    serverProc = spawn('node', ['server.js'], { cwd: ROOT, env: { ...process.env, PORT } });
    await new Promise((r) => setTimeout(r, 1800));
  }
}

function startChrome() {
  const args = [
    '--headless', '--no-sandbox', '--disable-setuid-sandbox',
    '--disable-gpu', '--disable-software-rasterizer',
    '--disable-dev-shm-usage', '--disable-dbus', '--no-first-run',
    '--use-gl=swiftshader', '--in-process-gpu',
    `--remote-debugging-port=${DEBUG_PORT}`,
    'about:blank',
  ];
  chromeProc = spawn(CHROME, args, { stdio: 'ignore' });
  // Wait for the DevTools endpoint to come up.
  for (let i = 0; i < 30; i++) {
    try {
      execSync(`curl -s http://127.0.0.1:${DEBUG_PORT}/json/version >/dev/null`);
      return;
    } catch (_) { /* not ready yet */ }
    if (chromeProc.exitCode !== null) throw new Error('Chromium exited early');
    Atomics.wait(new Int32Array(new SharedArrayBuffer(4)), 0, 0, 300);
  }
  throw new Error('Chromium DevTools endpoint did not start');
}

async function connect() {
  startChrome();
  return puppeteer.connect({ browserURL: `http://127.0.0.1:${DEBUG_PORT}`, defaultViewport: null });
}

async function smoke() {
  const browser = await connect();
  const page = await browser.newPage();
  const errors = [];
  page.on('console', (m) => { if (m.type() === 'error') errors.push(m.text()); });
  page.on('pageerror', (e) => errors.push(String(e)));

  await page.setViewport({ width: 1280, height: 800 });
  await page.goto(BASE, { waitUntil: 'networkidle2', timeout: 25000 });

  const checks = {};
  checks.title = await page.title();
  checks.hasSidebar = (await page.$('#cat-list')) !== null;
  checks.catCount = await page.$$eval('#cat-list .cat-item', (els) => els.length).catch(() => 0);
  checks.loadingHidden = await page.$eval('#app-loading-overlay', (el) => el.classList.contains('hidden')).catch(() => null);

  await browser.disconnect();
  return { checks, errors };
}

async function safeAreas() {
  const browser = await connect();
  const page = await browser.newPage();
  await page.setViewport({ width: 390, height: 844, isMobile: true, hasTouch: true, deviceScaleFactor: 3 });
  await page.goto(BASE, { waitUntil: 'networkidle2', timeout: 25000 });
  const env = await page.evaluate(() => {
    const cs = getComputedStyle(document.documentElement);
    const header = document.querySelector('.sidebar-header') || document.querySelector('header');
    return {
      safeTop: cs.getPropertyValue('padding-top').trim(),
      safeBottom: cs.getPropertyValue('padding-bottom').trim(),
      headerPadTop: header ? getComputedStyle(header).paddingTop : 'n/a',
    };
  });
  await browser.disconnect();
  return env;
}

async function consoleErrors() {
  const browser = await connect();
  const page = await browser.newPage();
  const errors = [];
  page.on('console', (m) => { if (m.type() === 'error') errors.push(m.text()); });
  page.on('pageerror', (e) => errors.push(String(e)));
  await page.goto(BASE, { waitUntil: 'networkidle2', timeout: 25000 });
  await new Promise((r) => setTimeout(r, 800));
  await browser.disconnect();
  return errors;
}

async function themeReveal() {
  const browser = await connect();
  const page = await browser.newPage();
  const errors = [];
  page.on('pageerror', (e) => errors.push(String(e)));
  await page.setViewport({ width: 390, height: 844, isMobile: true, hasTouch: true });
  await page.goto(BASE, { waitUntil: 'networkidle2', timeout: 25000 });
  const supportsVT = await page.evaluate(() => typeof document.startViewTransition === 'function');
  // Toggle theme and capture whether a view-transition pseudo appears.
  await page.click('#theme-toggle-btn').catch(() => {});
  await new Promise((r) => setTimeout(r, 400));
  const isLight = await page.evaluate(() => document.documentElement.classList.contains('light-theme'));
  await browser.disconnect();
  return { supportsViewTransitions: supportsVT, toggledToLight: isLight, errors };
}

async function tapTargets() {
  const browser = await connect();
  const page = await browser.newPage();
  await page.setViewport({ width: 1280, height: 800 });
  await page.goto(BASE, { waitUntil: 'networkidle2', timeout: 25000 });
  await page.$eval('#cat-list .cat-item', (el) => el.click()).catch(() => {});
  await new Promise((r) => setTimeout(r, 800));
  const measure = () => page.evaluate(() => {
    const out = [];
    const els = document.querySelectorAll('button, a, [role="button"], input[type="checkbox"], input[type="radio"]');
    els.forEach((el) => {
      const cs = getComputedStyle(el);
      if (cs.display === 'none' || cs.visibility === 'hidden') return;
      const r = el.getBoundingClientRect();
      if (r.width === 0 && r.height === 0) return;
      out.push({
        tag: el.tagName.toLowerCase(),
        cls: (el.className && el.className.baseVal !== undefined ? el.className.baseVal : el.className || '').toString().slice(0, 40),
        w: Math.round(r.width),
        h: Math.round(r.height),
        small: Math.round(r.width) < 44 || Math.round(r.height) < 44,
      });
    });
    return out;
  });
  const all = await measure();
  await browser.disconnect();
  const small = all.filter((e) => e.small);
  return { total: all.length, smallCount: small.length, small };
}


async function ariaTabs() {
  const browser = await connect();
  const page = await browser.newPage();
  const errors = [];
  page.on('pageerror', (e) => errors.push(String(e)));
  await page.setViewport({ width: 1280, height: 800 });
  await page.goto(BASE, { waitUntil: 'networkidle2', timeout: 25000 });
  // Open first CAT so the workspace tabs render.
  await page.$eval('#cat-list .cat-item', (el) => el.click()).catch(() => {});
  await new Promise((r) => setTimeout(r, 800));
  const roles = await page.evaluate(() => ({
    tablist: document.querySelectorAll('[role="tablist"]').length,
    tab: document.querySelectorAll('[role="tab"]').length,
    tabpanel: document.querySelectorAll('[role="tabpanel"]').length,
    dialog: document.querySelectorAll('[role="dialog"]').length,
  }));
  const before = await page.$$eval('.tab-btn', (b) =>
    b.map((x) => ({ tab: x.dataset.tab, sel: x.getAttribute('aria-selected') })));
  await page.$eval('.tab-btn[data-tab="tab-notes"]', (el) => el.click()).catch(() => {});
  await new Promise((r) => setTimeout(r, 300));
  const after = await page.$$eval('.tab-btn', (b) =>
    b.map((x) => ({ tab: x.dataset.tab, sel: x.getAttribute('aria-selected') })));
  await browser.disconnect();
  return { roles, before, after, errors };
}

const cmd = process.argv[2] || 'smoke';
await ensureServer();
let result;
try {
  if (cmd === 'smoke') result = await smoke();
  else if (cmd === 'safeAreas') result = await safeAreas();
  else if (cmd === 'console') result = await consoleErrors();
  else if (cmd === 'themeReveal') result = await themeReveal();
  else if (cmd === 'ariaTabs') result = await ariaTabs();
  else if (cmd === 'tapTargets') result = await tapTargets();
  else { console.error('unknown command:', cmd); process.exitCode = 1; }
  console.log(JSON.stringify(result, null, 2));
} catch (e) {
  console.error('HARNESS ERROR:', e.message);
  process.exitCode = 1;
} finally {
  if (chromeProc) chromeProc.kill('SIGKILL');
  if (serverProc) serverProc.kill();
}
