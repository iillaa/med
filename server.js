const express = require('express');
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const { indexPdfs, getIndexStatus, onIndexUpdated } = require('./index_pdfs');

const INDEX_FILE = path.join(__dirname, 'pdf_index.json');
const SUGGESTIONS_FILE = path.join(__dirname, 'suggestions.json');
const DB_FILE = path.join(__dirname, 'cats_db.json');
const LOCAL_PDF_DIR = '/storage/emulated/0/cat-med/CAT de Médecine Générale';
const PDF_DIR = fs.existsSync(LOCAL_PDF_DIR)
  ? LOCAL_PDF_DIR
  : path.join(__dirname, 'cat-med', 'reference-pdfs');
const PASSWORD_FILE = path.join(__dirname, 'admin_password.txt');
const CONFIG_FILE = path.join(__dirname, 'remote_server_config.json');

const app = express();
const PORT = 3000;

// ── Server Provider Abstraction ───────────────────────────
// Loaded dynamically so the server can support any tunnel provider
// without hardcoded ngrok references.
async function loadServerProviders() {
  try {
    const providerPath = path.join(__dirname, 'public', 'js', 'server-providers.js');
    const content = await fs.promises.readFile(providerPath, 'utf-8');
    // Extract PROVIDERS array by evaluating the module source
    const match = content.match(/export const PROVIDERS = (\[[\s\S]*?\]);/);
    if (match) {
      return eval('(' + match[1] + ')');
    }
  } catch (err) {
    console.warn('[Providers] Failed to load provider registry, using fallback:', err.message);
  }
  // Fallback: minimal ngrok-only support if provider file missing
  return [
    {
      id: 'ngrok',
      urlPattern: /(^|\.)ngrok(-free)?\.(app|dev|io)$/,
      extraHeaders: { 'ngrok-skip-browser-warning': 'true' },
      managementPort: 4040,
      managementPath: '/api/tunnels',
      isDevHostname: (h) => /(^|\.)ngrok(-free)?\.(app|dev|io)$/.test(h),
      isTunnelOrigin: (o) => o.includes('ngrok'),
      tunnelLabel: 'Tunnel',
    },
    {
      id: 'direct',
      urlPattern: null,
      extraHeaders: {},
      managementPort: null,
      managementPath: null,
      isDevHostname: () => false,
      isTunnelOrigin: () => false,
      tunnelLabel: 'Serveur direct',
    }
  ];
}

function detectProvider(url, providers) {
  if (!url) return providers[providers.length - 1];
  for (const provider of providers) {
    if (provider.urlPattern && provider.urlPattern.test(url)) {
      return provider;
    }
  }
  return providers[providers.length - 1];
}

function getProviderHeaders(provider) {
  return provider.extraHeaders || {};
}

function getManagementEndpoint(provider) {
  if (provider.managementPort && provider.managementPath) {
    return { hostname: '127.0.0.1', port: provider.managementPort, path: provider.managementPath };
  }
  return null;
}

// Dynamic CORS origin allowlist built from configured remote URLs + provider patterns
function buildAllowedOrigins(providers, configuredUrls) {
  const origins = new Set([
    'http://localhost:3000',
    'http://127.0.0.1:3000',
    'http://localhost:8080',
    'http://127.0.0.1:8080',
  ]);
  for (const url of configuredUrls) {
    if (!url) continue;
    origins.add(url);
    const provider = detectProvider(url, providers);
    if (provider.isTunnelOrigin) {
      // Allow all origins matching the provider’s tunnel pattern (e.g. any .ngrok-free.app)
      const pattern = provider.urlPattern;
      if (pattern) {
        // Extract the domain part from the URL
        const urlObj = new URL(url);
        const hostname = urlObj.hostname;
        origins.add(hostname);
      }
    }
  }
  // Also add direct hostnames from configured URLs
  for (const url of configuredUrls) {
    if (!url) continue;
    try {
      const urlObj = new URL(url);
      origins.add(`${urlObj.protocol}//${urlObj.hostname}`);
    } catch (_) {}
  }
  return origins;
}

function isOriginAllowedDynamic(origin, allowedOrigins) {
  if (!origin) return true;
  if (allowedOrigins.has(origin)) return true;
  // Check if origin matches any provider pattern
  for (const allowed of allowedOrigins) {
    if (allowed.includes('*')) {
      const regex = new RegExp('^' + allowed.replace(/\*/g, '.*') + '$');
      if (regex.test(origin)) return true;
    }
  }
  return false;
}

app.use(express.json());

// CORS middleware — dynamically configured based on remote server URLs
let serverProviders = [];
let allowedOrigins = new Set();
let configuredRemoteUrls = [];

async function initializeProviders() {
  serverProviders = await loadServerProviders();
  
  // Load configured remote URLs
  try {
    const exists = await fs.promises.access(CONFIG_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(CONFIG_FILE, 'utf-8');
      const parsed = JSON.parse(content);
      configuredRemoteUrls = Array.isArray(parsed.urls) ? parsed.urls : (parsed.url ? [parsed.url] : []);
      remoteServerUrl = configuredRemoteUrls[0] || '';
      if (parsed.primaryProvider && serverProviders.find(p => p.id === parsed.primaryProvider)) {
        console.log('[Providers] Primary provider:', parsed.primaryProvider);
      }
    }
  } catch (err) {
    console.error("Error loading remote_server_config.json:", err);
  }
  
  allowedOrigins = buildAllowedOrigins(serverProviders, configuredRemoteUrls);
  console.log('[Providers] Loaded', serverProviders.length, 'providers:', serverProviders.map(p => p.id).join(', '));
  console.log('[Providers] Configured URLs:', configuredRemoteUrls.length > 0 ? configuredRemoteUrls : '(none)');
}

app.use((req, res, next) => {
  const origin = req.headers.origin;
  const allowAll = !origin || isOriginAllowedDynamic(origin, allowedOrigins);
  
  if (allowAll) {
    // Build allowed headers list including all provider-specific headers
    const providerHeaders = serverProviders.flatMap(p => Object.keys(p.extraHeaders || {}));
    const uniqueHeaders = new Set([
      'Content-Type',
      'Authorization',
      'x-admin-token',
      ...providerHeaders
    ]);
    
    res.setHeader('Access-Control-Allow-Origin', origin || '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', Array.from(uniqueHeaders).join(', '));
    res.setHeader('Access-Control-Allow-Credentials', 'true');
  }
  if (req.method === 'OPTIONS') {
    return res.sendStatus(204);
  }
  next();
});

// Performance monitoring middleware for API timing tracking
app.use((req, res, next) => {
  const start = Date.now();
  res.on('finish', () => {
    // Only track API requests to avoid static asset noise
    if (req.path.startsWith('/api')) {
      const duration = Date.now() - start;
      global.perfServer.recordRequest(req.path, req.method, duration, res.statusCode);
    }
  });
  next();
});

app.use(express.static(path.join(__dirname, 'public'), {
  etag: false,
  lastModified: false,
  setHeaders: (res, filePath) => {
    // Never cache HTML, JS, or CSS — always serve fresh
    if (filePath.endsWith('.html') || filePath.endsWith('.js') || filePath.endsWith('.css')) {
      res.setHeader('Cache-Control', 'no-store, no-cache, must-revalidate');
    }
  }
}));

// Global in-memory caches
let catsCache = [];
let suggestionsCache = [];
let pdfIndex = [];
let adminPassword = '';
let remoteServerUrl = '';
const activeTokens = new Set();

// A lightweight asynchronous queue lock to serialize write operations on json databases
class AsyncLock {
  constructor() {
    this.promise = Promise.resolve();
    this.queueDepth = 0;
  }
  acquire(fn) {
    this.queueDepth++;
    const next = this.promise.then(() => fn());
    this.promise = next.catch(() => {});
    const originalThen = next.then.bind(next);
    next.then = (onFulfilled, onRejected) => {
      this.queueDepth = Math.max(0, this.queueDepth - 1);
      return originalThen(onFulfilled, onRejected);
    };
    return next;
  }
  getQueueDepth() {
    return this.queueDepth;
  }
}
const dbLock = new AsyncLock();

// Server-side performance recording structures
const endpointTimings = new Map();
const pdfParseTimes = [];
const writePhaseDurations = { backup: [], write: [], rename: [] };
let cacheHits = 0;
let cacheMisses = 0;

global.perfServer = {
  recordRequest(path, method, duration, status) {
    const key = `${method} ${path}`;
    if (!endpointTimings.has(key)) {
      endpointTimings.set(key, { samples: [], errors: 0 });
    }
    const data = endpointTimings.get(key);
    data.samples.push(duration);
    if (data.samples.length > 100) {
      data.samples.shift();
    }
    if (status >= 400) {
      data.errors++;
    }
  },
  recordPdfParse(file, duration, pages) {
    pdfParseTimes.push({ file, duration, pages });
    if (pdfParseTimes.length > 200) {
      pdfParseTimes.shift();
    }
  },
  recordWrite(phases) {
    if (phases.backup !== undefined) {
      writePhaseDurations.backup.push(phases.backup);
      if (writePhaseDurations.backup.length > 100) writePhaseDurations.backup.shift();
    }
    if (phases.write !== undefined) {
      writePhaseDurations.write.push(phases.write);
      if (writePhaseDurations.write.length > 100) writePhaseDurations.write.shift();
    }
    if (phases.rename !== undefined) {
      writePhaseDurations.rename.push(phases.rename);
      if (writePhaseDurations.rename.length > 100) writePhaseDurations.rename.shift();
    }
  },
  recordCacheHit() {
    cacheHits++;
  },
  recordCacheMiss() {
    cacheMisses++;
  }
};

// Asynchronous atomic file writes and backups to ensure data integrity
async function safeWriteJsonAsync(filePath, data) {
  const tempPath = filePath + '.tmp';
  const backupPath = filePath + '.bak';
  const phases = {};
  try {
    const jsonString = JSON.stringify(data, null, 2);
    const exists = await fs.promises.access(filePath).then(() => true).catch(() => false);
    if (exists) {
      const copyStart = Date.now();
      await fs.promises.copyFile(filePath, backupPath);
      phases.backup = Date.now() - copyStart;
    }
    const writeStart = Date.now();
    await fs.promises.writeFile(tempPath, jsonString, 'utf-8');
    phases.write = Date.now() - writeStart;
    const renameStart = Date.now();
    await fs.promises.rename(tempPath, filePath);
    phases.rename = Date.now() - renameStart;
    global.perfServer.recordWrite(phases);
  } catch (err) {
    console.error(`[Data Integrity Error] Failed to write atomically to ${filePath}:`, err);
    const tempExists = await fs.promises.access(tempPath).then(() => true).catch(() => false);
    if (tempExists) {
      try { await fs.promises.unlink(tempPath); } catch (_) {}
    }
    throw err;
  }
}

// Asynchronous atomic file writes and backups for plain text files (like CSS)
async function safeWriteTextAsync(filePath, textContent) {
  const tempPath = filePath + '.tmp';
  const backupPath = filePath + '.bak';
  const phases = {};
  try {
    const exists = await fs.promises.access(filePath).then(() => true).catch(() => false);
    if (exists) {
      const copyStart = Date.now();
      await fs.promises.copyFile(filePath, backupPath);
      phases.backup = Date.now() - copyStart;
    }
    const writeStart = Date.now();
    await fs.promises.writeFile(tempPath, textContent, 'utf-8');
    phases.write = Date.now() - writeStart;
    const renameStart = Date.now();
    await fs.promises.rename(tempPath, filePath);
    phases.rename = Date.now() - renameStart;
    global.perfServer.recordWrite(phases);
  } catch (err) {
    console.error(`[Data Integrity Error] Failed to write text atomically to ${filePath}:`, err);
    const tempExists = await fs.promises.access(tempPath).then(() => true).catch(() => false);
    if (tempExists) {
      try { await fs.promises.unlink(tempPath); } catch (_) {}
    }
    throw err;
  }
}


// Initialize admin password on startup
async function initAdminPassword() {
  try {
    const exists = await fs.promises.access(PASSWORD_FILE).then(() => true).catch(() => false);
    if (exists) {
      adminPassword = (await fs.promises.readFile(PASSWORD_FILE, 'utf-8')).trim();
    } else {
      adminPassword = crypto.randomBytes(16).toString('hex'); // 32-character hex password (~128 bits)
      await fs.promises.writeFile(PASSWORD_FILE, adminPassword, 'utf-8');
      console.log(`\n=================================================`);
      console.log(`[SECURITY] Generated Admin Password: ${adminPassword}`);
      console.log(`Saved to: ${PASSWORD_FILE}`);
      console.log(`=================================================\n`);
    }
  } catch (err) {
    console.error("Error loading or generating admin password:", err);
  }
}

// Load databases and file indices on server startup
async function initializeData() {
  await initAdminPassword();
  await initializeProviders(); // Load provider registry before handling any requests
  
  // Ensure remote_config.js is always fresh before serving requests
  try {
    const buildModule = require('./build.js');
    if (typeof buildModule.rebuildClientAssets === 'function') {
      await buildModule.rebuildClientAssets();
    }
  } catch (err) {
    console.warn('[Startup] Auto-build skipped:', err.message);
  }

  // Load cats_db.json
  try {
    const exists = await fs.promises.access(DB_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(DB_FILE, 'utf-8');
      catsCache = JSON.parse(content);
    } else {
      console.warn(`Database file not found at: ${DB_FILE}`);
    }
  } catch (err) {
    console.error("Error reading cats_db.json cache:", err);
  }

  // Load suggestions.json
  try {
    const exists = await fs.promises.access(SUGGESTIONS_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(SUGGESTIONS_FILE, 'utf-8');
      suggestionsCache = JSON.parse(content);
    } else {
      suggestionsCache = [];
      await safeWriteJsonAsync(SUGGESTIONS_FILE, []);
    }
  } catch (err) {
    console.error("Error reading suggestions.json cache:", err);
  }

  // Load pdf_index.json
  try {
    const exists = await fs.promises.access(INDEX_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(INDEX_FILE, 'utf-8');
      pdfIndex = JSON.parse(content);
    }
  } catch (err) {
    console.error("Error loading pdf_index.json cache:", err);
  }

  // Load remote_server_config.json
  try {
    const exists = await fs.promises.access(CONFIG_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(CONFIG_FILE, 'utf-8');
      const parsed = JSON.parse(content);
      remoteServerUrl = parsed.url || '';
      if (remoteServerUrl) {
        ALLOWED_ORIGINS.add(remoteServerUrl);
        // Also add the ngrok tunnel URL variations
        const urlObj = new URL(remoteServerUrl);
        ALLOWED_ORIGINS.add(`${urlObj.protocol}//${urlObj.host}`);
      }
    }
  } catch (err) {
    console.error("Error loading remote_server_config.json:", err);
  }
}

// Register indexer update callback to keep memory index in sync
onIndexUpdated(async () => {
  try {
    const exists = await fs.promises.access(INDEX_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(INDEX_FILE, 'utf-8');
      pdfIndex = JSON.parse(content);
      console.log("[Cache] PDF Index cache reloaded into memory.");
    }
  } catch (err) {
    console.error("Error updating PDF index in memory cache:", err);
  }
});

// Helper to check if the connection comes from the local physical device.
// IMPORTANT: ngrok tunnels all traffic through 127.0.0.1 locally, so we CANNOT
// rely solely on req.socket.remoteAddress. We must inspect X-Forwarded-For first:
//   - If X-Forwarded-For exists and contains a non-local IP → external user (return false)
//   - If X-Forwarded-For exists and all IPs are loopback → treat as local
//   - If no X-Forwarded-For at all → trust the raw socket address
function isLocalhostConnection(req) {
  const LOCAL_IPS = new Set(['127.0.0.1', '::1', '::ffff:127.0.0.1']);

  // 1. Check X-Forwarded-For (set by tunnel providers like ngrok, Cloudflare Tunnel, etc.)
  const forwarded = req.headers['x-forwarded-for'];
  if (forwarded) {
    // The header may contain a comma-separated list; the first entry is the real client IP
    const clientIp = forwarded.split(',')[0].trim();
    const cleanClient = clientIp.replace(/^::ffff:/, '');
    if (!LOCAL_IPS.has(cleanClient) && cleanClient !== 'localhost') {
      // Real remote IP present in forwarding chain → definitely external
      return false;
    }
    // All forwarded IPs appear to be loopback → treat as local
    return true;
  }

  // 2. No forwarding header → trust the raw socket address
  const rawIp = (req.socket.remoteAddress || '').replace(/^::ffff:/, '');
  if (LOCAL_IPS.has(rawIp)) return true;

  // 3. Also match the machine's own LAN interfaces (e.g. direct LAN access without proxy)
  const os = require('os');
  const interfaces = os.networkInterfaces();
  const localAddresses = [];
  for (const name of Object.keys(interfaces)) {
    for (const netInterface of interfaces[name]) {
      localAddresses.push(netInterface.address);
    }
  }
  return localAddresses.includes(rawIp);
}

// Helper to check if request is authenticated as admin using token
function isAdminRequest(req) {
  const token = req.headers['x-admin-token'];
  return Boolean(token && activeTokens.has(token));
}

// Serve PDFs statically with aggressive 7-day caching to save mobile data
app.use('/pdfs', express.static(PDF_DIR, {
  maxAge: '7d',
  immutable: true
}));

// API to check if current user is Admin
app.get('/api/is-admin', (req, res) => {
  res.json({ isAdmin: isAdminRequest(req) });
});

// API to check if the connection is from the local machine (localhost)
// Used by the client to decide whether to show the admin button
app.get('/api/is-local', (req, res) => {
  res.json({ isLocal: isLocalhostConnection(req) });
});

// Admin login route (only allowed from loopback interface)
// Rate limited: max 5 failed attempts per 5 minutes per IP
const loginAttempts = new Map(); // ip -> { count, lastAttempt }
const MAX_LOGIN_ATTEMPTS = 5;
const LOGIN_RATE_LIMIT_MS = 5 * 60 * 1000;

app.post('/api/login', (req, res) => {
  if (!isLocalhostConnection(req)) {
    return res.status(403).json({ error: "Connexion interdite depuis un appareil distant." });
  }

  const ip = req.socket.remoteAddress || 'unknown';
  const now = Date.now();
  const attempt = loginAttempts.get(ip);

  if (attempt && attempt.count >= MAX_LOGIN_ATTEMPTS && (now - attempt.lastAttempt) < LOGIN_RATE_LIMIT_MS) {
    return res.status(429).json({ error: "Trop de tentatives. Réessayez dans 5 minutes." });
  }

  const { password } = req.body;
  if (!password || password !== adminPassword) {
    if (attempt) {
      attempt.count++;
      attempt.lastAttempt = now;
    } else {
      loginAttempts.set(ip, { count: 1, lastAttempt: now });
    }
    return res.status(401).json({ error: "Mot de passe incorrect." });
  }

  // Success — clear rate limit for this IP
  loginAttempts.delete(ip);
  const token = crypto.randomBytes(16).toString('hex');
  activeTokens.add(token);
  res.json({ success: true, token });
});

// Admin logout route
app.post('/api/logout', (req, res) => {
  const token = req.headers['x-admin-token'];
  if (token) {
    activeTokens.delete(token);
  }
  res.json({ success: true });
});

// Endpoint to get all CATs (served from memory cache)
app.get('/api/cats', (req, res) => {
  res.json(catsCache);
});

// Endpoint to update a specific CAT's details directly (Admin only)
app.post('/api/cats/:id', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut modifier directement la base de données.' });
  }
  try {
    const catId = parseInt(req.params.id);
    const { summary, ordonnance, category, title, red_flags } = req.body;

    const result = await dbLock.acquire(async () => {
      const cat = catsCache.find(c => c.id === catId);
      if (!cat) {
        return { notFound: true };
      }

      if (summary !== undefined) cat.summary = summary;
      if (ordonnance !== undefined) cat.ordonnance = ordonnance;
      if (category !== undefined) cat.category = category;
      if (title !== undefined) cat.title = title;
      if (red_flags !== undefined) cat.red_flags = red_flags;

      await safeWriteJsonAsync(DB_FILE, catsCache);
      return { success: true, message: `CAT ${catId} mise à jour directement.` };
    });

    if (result.notFound) {
      return res.status(404).json({ error: 'CAT fiche introuvable.' });
    }
    res.json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to save CAT data' });
  }
});

// Endpoint to add a new CAT to the database directly (Admin only)
app.post('/api/cats', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut modifier directement la base de données.' });
  }
  try {
    const { title, category, summary, red_flags, ordonnance, pdf_keywords } = req.body;
    if (!title || !category) {
      return res.status(400).json({ error: 'Title and Category are required' });
    }

    const result = await dbLock.acquire(async () => {
      const nextId = catsCache.reduce((max, cat) => cat.id > max ? cat.id : max, 0) + 1;
      const newCat = {
        id: nextId,
        category,
        title,
        summary: summary || '',
        red_flags: red_flags || '',
        ordonnance: ordonnance || '',
        pdf_keywords: pdf_keywords || []
      };

      catsCache.push(newCat);
      await safeWriteJsonAsync(DB_FILE, catsCache);
      return { success: true, cat: newCat };
    });

    res.json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to create new CAT' });
  }
});

// Endpoint to delete a custom CAT from the database (Admin only)
app.delete('/api/cats/:id', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut modifier directement la base de données.' });
  }
  try {
    const catId = parseInt(req.params.id);
    if (isNaN(catId)) {
      return res.status(400).json({ error: 'Invalid CAT ID' });
    }

    if (catId <= 55) {
      return res.status(400).json({ error: 'Cannot delete core CAT fiches (IDs 1-55)' });
    }

    const result = await dbLock.acquire(async () => {
      const initialLength = catsCache.length;
      catsCache = catsCache.filter(cat => cat.id !== catId);

      if (catsCache.length === initialLength) {
        return { notFound: true };
      }

      await safeWriteJsonAsync(DB_FILE, catsCache);
      return { success: true, message: `CAT ${catId} successfully deleted` };
    });

    if (result.notFound) {
      return res.status(404).json({ error: 'CAT fiche not found' });
    }
    res.json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to delete CAT' });
  }
});

// GET /api/suggestions - List pending suggestions (Admin only)
app.get('/api/suggestions', (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit.' });
  }
  res.json(suggestionsCache);
});

// POST /api/suggestions - Submit a new suggestion (Guest or Admin)
app.post('/api/suggestions', async (req, res) => {
  try {
    const { type, catId, data } = req.body;
    if (!type || !data) {
      return res.status(400).json({ error: 'Type (add/edit) et Data sont requis.' });
    }

    const result = await dbLock.acquire(async () => {
      const suggestionId = 'sug_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9);
      const newSug = {
        id: suggestionId,
        type, // 'add' or 'edit'
        catId: catId ? parseInt(catId) : null,
        timestamp: Date.now(),
        data
      };

      suggestionsCache.push(newSug);
      await safeWriteJsonAsync(SUGGESTIONS_FILE, suggestionsCache);
      return { success: true, message: 'Proposition envoyée à l\'administrateur pour validation.', suggestion: newSug };
    });

    res.json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to save suggestion' });
  }
});

// POST /api/suggestions/:id/approve - Approve a suggestion (Admin only)
app.post('/api/suggestions/:id/approve', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit.' });
  }
  try {
    const sugId = req.params.id;

    const result = await dbLock.acquire(async () => {
      const index = suggestionsCache.findIndex(s => s.id === sugId);
      if (index === -1) {
        return { notFound: true };
      }

      const sug = suggestionsCache[index];

      if (sug.type === 'add') {
        const nextId = catsCache.reduce((max, cat) => cat.id > max ? cat.id : max, 0) + 1;
        const newCat = {
          id: nextId,
          category: sug.data.category,
          title: sug.data.title,
          summary: sug.data.summary || '',
          red_flags: sug.data.red_flags || '',
          ordonnance: sug.data.ordonnance || '',
          pdf_keywords: sug.data.pdf_keywords || []
        };
        catsCache.push(newCat);
        await safeWriteJsonAsync(DB_FILE, catsCache);
      } else if (sug.type === 'edit') {
        const cat = catsCache.find(c => c.id === parseInt(sug.catId));
        if (cat) {
          if (sug.data.summary !== undefined) cat.summary = sug.data.summary;
          if (sug.data.ordonnance !== undefined) cat.ordonnance = sug.data.ordonnance;
          if (sug.data.category !== undefined) cat.category = sug.data.category;
          if (sug.data.title !== undefined) cat.title = sug.data.title;
          if (sug.data.red_flags !== undefined) cat.red_flags = sug.data.red_flags;
          await safeWriteJsonAsync(DB_FILE, catsCache);
        } else {
          return { notFound: true, message: 'Fiche CAT d\'origine introuvable.' };
        }
      }

      // Remove from queue
      suggestionsCache.splice(index, 1);
      await safeWriteJsonAsync(SUGGESTIONS_FILE, suggestionsCache);
      
      return { success: true, message: 'Proposition approuvée et intégrée à l\'application.' };
    });

    if (result.notFound) {
      return res.status(404).json({ error: result.message || 'Proposition introuvable.' });
    }
    res.json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to approve suggestion' });
  }
});

// POST /api/suggestions/:id/reject - Reject a suggestion (Admin only)
app.post('/api/suggestions/:id/reject', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit.' });
  }
  try {
    const sugId = req.params.id;

    const result = await dbLock.acquire(async () => {
      const index = suggestionsCache.findIndex(s => s.id === sugId);
      if (index === -1) {
        return { notFound: true };
      }

      suggestionsCache.splice(index, 1);
      await safeWriteJsonAsync(SUGGESTIONS_FILE, suggestionsCache);
      return { success: true, message: 'Proposition rejetée et supprimée.' };
    });

    if (result.notFound) {
      return res.status(404).json({ error: 'Proposition introuvable.' });
    }
    res.json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to reject suggestion' });
  }
});

// POST /api/suggestions/:id/edit - Update a suggestion's content (Admin only)
app.post('/api/suggestions/:id/edit', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit.' });
  }
  try {
    const sugId = req.params.id;
    const { data } = req.body;

    if (!data) {
      return res.status(400).json({ error: 'Data requis.' });
    }

    const result = await dbLock.acquire(async () => {
      const index = suggestionsCache.findIndex(s => s.id === sugId);
      if (index === -1) {
        return { notFound: true };
      }

      // Update fields dynamically
      const sug = suggestionsCache[index];
      sug.data = { ...sug.data, ...data };

      await safeWriteJsonAsync(SUGGESTIONS_FILE, suggestionsCache);
      return { success: true, message: 'Proposition mise à jour.', suggestion: sug };
    });

    if (result.notFound) {
      return res.status(404).json({ error: 'Proposition introuvable.' });
    }
    res.json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to update suggestion' });
  }
});

// Endpoint to list all actual files in reference-pdfs directory
app.get('/api/pdfs', async (req, res) => {
  try {
    const exists = await fs.promises.access(PDF_DIR).then(() => true).catch(() => false);
    if (!exists) {
      return res.json([]);
    }
    const files = await fs.promises.readdir(PDF_DIR);
    const pdfs = files.filter(f => f.toLowerCase().endsWith('.pdf') || f.toLowerCase().endsWith('.docx'));
    res.json(pdfs);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to read PDF directory' });
  }
});

// PDF content search API (fully in-memory non-blocking lookup)
app.get('/api/search-pdfs', (req, res) => {
  try {
    const query = req.query.q;
    if (!query || query.trim() === '') {
      return res.json({ results: [] });
    }

    const cleanQuery = query.trim().toLowerCase();
    
    if (!pdfIndex || pdfIndex.length === 0) {
      return res.status(503).json({ error: "PDF index not yet built. Please wait a few moments." });
    }

    const results = [];

    // Search across cached in-memory pages
    for (const doc of pdfIndex) {
      if (!doc.pages) continue;
      for (const p of doc.pages) {
        if (!p.text) continue;
        const textLower = p.text.toLowerCase();
        
        let indexMatch = textLower.indexOf(cleanQuery);
        if (indexMatch !== -1) {
          const start = Math.max(0, indexMatch - 60);
          const end = Math.min(p.text.length, indexMatch + cleanQuery.length + 60);
          let snippet = p.text.substring(start, end);
          
          if (start > 0) snippet = '...' + snippet;
          if (end < p.text.length) snippet = snippet + '...';
          
          results.push({
            pdf: doc.pdf,
            page: p.page,
            snippet: snippet
          });

          if (results.length >= 100) {
            break;
          }
        }
      }
      if (results.length >= 100) {
        break;
      }
    }

    res.json({ results });
  } catch (err) {
    console.error("Search error:", err);
    res.status(500).json({ error: "Failed to search PDFs" });
  }
});

// PDF individual index status details API
app.get('/api/pdf-index-status', (req, res) => {
  try {
    const statusMap = {};
    for (const doc of pdfIndex) {
      const totalPages = doc.pages ? doc.pages.length : 0;
      const pagesWithText = doc.pages ? doc.pages.filter(p => p.text && p.text.trim().length > 15).length : 0;
      
      let status = 'red';
      if (totalPages > 0) {
        const ratio = pagesWithText / totalPages;
        if (ratio >= 0.90) {
          status = 'green';
        } else if (ratio >= 0.05) {
          status = 'orange';
        }
      }
      statusMap[doc.pdf] = {
        status,
        pagesWithText,
        totalPages
      };
    }
    res.json(statusMap);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to get PDF index status summary" });
  }
});

// PDF index status API
app.get('/api/search-status', (req, res) => {
  try {
    res.json(getIndexStatus());
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to get indexing status" });
  }
});

// Trigger PDF re-indexing API (Admin only)
app.post('/api/reindex', (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit.' });
  }
  try {
    indexPdfs(true).catch(err => console.error("Error in forced indexing:", err));
    res.json({ success: true, message: "Reindexing started in background" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to trigger reindexing" });
  }
});

// Save Layout CSS Tunings from Browser (Admin only)
app.post('/api/save-css', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit.' });
  }
  try {
    const gap = parseFloat(req.body.gap);
    const maxHeight = parseInt(req.body.maxHeight);
    const ratio = parseFloat(req.body.ratio);
    const padding = parseInt(req.body.padding);
    
    if (isNaN(gap) || isNaN(maxHeight) || isNaN(ratio) || isNaN(padding)) {
      return res.status(400).json({ error: "Layout parameters must be valid numbers" });
    }

    const cssPath = path.join(__dirname, 'public', 'style.css');

    await dbLock.acquire(async () => {
      let cssContent = await fs.promises.readFile(cssPath, 'utf-8');

      const startMarker = '/* BEGIN DEV LAYOUT TUNER STYLES */';
      const endMarker = '/* END DEV LAYOUT TUNER STYLES */';
      
      const newDevStyles = `${startMarker}
.dashboard-container {
  padding: ${padding}px;
}
@media (min-width: 851px) {
  .categories-list {
    max-height: ${maxHeight}px;
  }
}
@media (min-width: 851px) {
  .dashboard-content-split {
    grid-template-columns: 1fr ${ratio}fr;
    gap: ${gap}px;
  }
}
${endMarker}`;

      const startIndex = cssContent.indexOf(startMarker);
      if (startIndex !== -1) {
        const endIndex = cssContent.indexOf(endMarker) + endMarker.length;
        cssContent = cssContent.substring(0, startIndex) + newDevStyles.trim() + cssContent.substring(endIndex);
     } else {
        cssContent += '\n\n' + newDevStyles.trim();
      }

      await safeWriteTextAsync(cssPath, cssContent);
      res.json({ success: true, message: "CSS updated successfully!" });
    });
    
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Failed to update CSS file" });
  }
});

// System diagnostics API endpoints (Admin only)
app.get('/api/diagnostics/system', (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
  }
  try {
    const memory = process.memoryUsage();
    res.json({
      nodeVersion: process.version,
      platform: process.platform,
      arch: process.arch,
      uptimeSeconds: Math.floor(process.uptime()),
      memoryUsage: {
        rss: memory.rss,
        heapTotal: memory.heapTotal,
        heapUsed: memory.heapUsed,
        external: memory.external
      },
      indexingActive: getIndexStatus().isIndexing,
      indexPath: INDEX_FILE
    });
  } catch (err) {
    console.error("System diagnostics error:", err);
    res.status(500).json({ error: "Failed to get system diagnostics" });
  }
});

app.get('/api/diagnostics/db-stats', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
  }
  try {
    const getFileSize = async (filePath) => {
      try {
        const stats = await fs.promises.stat(filePath);
        return stats.size;
      } catch (_) {
        return 0;
      }
    };

    const catsDbSize = await getFileSize(DB_FILE);
    const suggestionsSize = await getFileSize(SUGGESTIONS_FILE);
    const indexSize = await getFileSize(INDEX_FILE);

    const coreCats = catsCache.filter(c => c.id <= 55).length;
    const customCats = catsCache.filter(c => c.id > 55).length;

    res.json({
      totalCats: catsCache.length,
      coreCats,
      customCats,
      totalSuggestions: suggestionsCache.length,
      catsDbSize,
      suggestionsSize,
      indexSize
    });
  } catch (err) {
    console.error("DB stats diagnostics error:", err);
    res.status(500).json({ error: "Failed to get DB stats" });
  }
});

app.get('/api/diagnostics/index-detail', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
  }
  try {
    const totalDocs = pdfIndex.length;
    let totalPages = 0;
    const docs = [];

    for (const doc of pdfIndex) {
      const docPages = doc.pages ? doc.pages.length : 0;
      totalPages += docPages;
      const pagesWithText = doc.pages ? doc.pages.filter(p => p.text && p.text.trim().length > 15).length : 0;

      let status = 'red';
      if (docPages > 0) {
        const ratio = pagesWithText / docPages;
        if (ratio >= 0.90) {
          status = 'green';
        } else if (ratio >= 0.05) {
          status = 'orange';
        }
      }

      docs.push({
        pdf: doc.pdf,
        status,
        pagesWithText,
        totalPages: docPages
      });
    }

    // Read index file timestamp
    let indexedAt = null;
    try {
      const stats = await fs.promises.stat(INDEX_FILE);
      indexedAt = stats.mtime.toISOString();
    } catch (_) {}

    res.json({
      totalDocs,
      totalPages,
      indexedAt,
      docs
    });
  } catch (err) {
    console.error("Index detail diagnostics error:", err);
    res.status(500).json({ error: "Failed to get index details" });
  }
});

app.get('/api/diagnostics/remote-server-url', (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
  }
  res.json({ url: remoteServerUrl });
});

app.post('/api/diagnostics/remote-server-url', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
  }
  try {
    const { urls } = req.body;
    let urlList = [];
    
    if (Array.isArray(urls)) {
      urlList = urls.filter(u => !u || (u.startsWith('http://') || u.startsWith('https://')));
    } else if (typeof urls === 'string' && urls.trim()) {
      urlList = [urls.trim()];
    }
    
    remoteServerUrl = urlList[0] || '';
    configuredRemoteUrls = urlList;
    
    await safeWriteJsonAsync(CONFIG_FILE, { urls: urlList });

    // Also update remote_config.js for client bundles (primary URL only for backward compat)
    await fs.promises.writeFile(
      path.join(__dirname, 'public', 'js', 'remote_config.js'),
      `export const REMOTE_SERVER_URL = ${JSON.stringify(remoteServerUrl)};\nexport const REMOTE_SERVER_URLS = ${JSON.stringify(configuredRemoteUrls)};\n`,
      'utf-8'
    );

    res.json({ success: true, urls: configuredRemoteUrls });
  } catch (err) {
    console.error("Update remote URL error:", err);
    res.status(500).json({ error: "Failed to update remote server URL" });
  }
});

app.get('/api/diagnostics/tunnel-info', async (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
  }
  
  // Return info about all configured tunnel providers
  const providerInfo = configuredRemoteUrls.map(url => {
    const provider = detectProvider(url, serverProviders);
    const mgmt = getManagementEndpoint(provider);
    return {
      url,
      providerId: provider.id,
      providerName: provider.name,
      tunnelLabel: provider.tunnelLabel,
      managementEndpoint: mgmt
    };
  });
  
  res.json({ 
    providers: serverProviders.map(p => ({ id: p.id, name: p.name })),
    configuredTunnels: providerInfo
  });
});

app.get('/api/performance/server-metrics', (req, res) => {
  if (!isAdminRequest(req)) {
    return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de performance.' });
  }
  try {
    const getPercentileLocal = (arr, q) => {
      if (arr.length === 0) return 0;
      const sorted = [...arr].sort((a, b) => a - b);
      const pos = (sorted.length - 1) * q;
      const base = Math.floor(pos);
      const rest = pos - base;
      if (sorted[base + 1] !== undefined) {
        return sorted[base] + rest * (sorted[base + 1] - sorted[base]);
      } else {
        return sorted[base];
      }
    };

    const memory = process.memoryUsage();
    
    // Calculate stats per endpoint
    const endpoints = {};
    for (const [key, data] of endpointTimings.entries()) {
      const samples = data.samples;
      const count = samples.length;
      if (count === 0) continue;
      
      const sum = samples.reduce((a, b) => a + b, 0);
      const avgMs = parseFloat((sum / count).toFixed(1));
      const minMs = Math.min(...samples);
      const maxMs = Math.max(...samples);
      const p95Ms = parseFloat(getPercentileLocal(samples, 0.95).toFixed(1));
      
      endpoints[key] = {
        count,
        minMs,
        avgMs,
        maxMs,
        p95Ms,
        errors: data.errors
      };
    }

    // Calculate PDF parse statistics
    let totalPdfFiles = pdfParseTimes.length;
    let avgParseMs = 0;
    let slowestPdf = '--';
    if (totalPdfFiles > 0) {
      const sumParse = pdfParseTimes.reduce((sum, item) => sum + item.duration, 0);
      avgParseMs = Math.round(sumParse / totalPdfFiles);
      const sortedByDuration = [...pdfParseTimes].sort((a, b) => b.duration - a.duration);
      slowestPdf = `${sortedByDuration[0].file}: ${sortedByDuration[0].duration}ms`;
    }

    // Calculate DB write durations statistics (phase-separated)
    const writeStats = {
      backup: { avgMs: 0, maxMs: 0 },
      write: { avgMs: 0, maxMs: 0 },
      rename: { avgMs: 0, maxMs: 0 }
    };
    const phases = ['backup', 'write', 'rename'];
    phases.forEach(phase => {
      const samples = writePhaseDurations[phase];
      if (samples.length > 0) {
        const sum = samples.reduce((a, b) => a + b, 0);
        writeStats[phase] = {
          avgMs: Math.round(sum / samples.length),
          maxMs: Math.max(...samples)
        };
      }
    });

    // Cache hit rates
    const totalIndexerHits = cacheHits + cacheMisses;
    const cacheHitRate = totalIndexerHits > 0 ? parseFloat((cacheHits / totalIndexerHits).toFixed(4)) : 1.0;

    res.json({
      uptimeSeconds: Math.floor(process.uptime()),
      memoryUsage: {
        rss: memory.rss,
        heapUsed: memory.heapUsed
      },
      endpoints,
      pdfParse: {
        totalFiles: totalPdfFiles,
        avgParseMs,
        slowest: slowestPdf
      },
      writeDurations: {
        backup: writeStats.backup,
        write: writeStats.write,
        rename: writeStats.rename
      },
      lockQueueDepth: dbLock.getQueueDepth(),
      cacheHitRate
    });
  } catch (err) {
    console.error("Server performance metrics error:", err);
    res.status(500).json({ error: "Failed to get server performance metrics" });
  }
});

// Start application after loading caches
initializeData().then(() => {
  app.listen(PORT, '0.0.0.0', () => {
    console.log(`=================================================`);
    console.log(`Medical CAT Learning App is running!`);
    console.log(`Local Access: http://localhost:${PORT}`);
    console.log(`Network Access: http://<your-device-ip>:${PORT}`);
    console.log(`=================================================`);

    // Start indexing PDFs in the background on startup
    indexPdfs().catch(err => console.error("Startup indexing error:", err));
  });
}).catch(err => {
  console.error("Critical: Failed to initialize application data caches:", err);
  process.exit(1);
});
