const express = require('express');
const path = require('path');
const fs = require('fs');
const { indexPdfs, onIndexUpdated } = require('../index_pdfs');
const { serverProviders } = require('./config/providers');
const { state: cache } = require('./services/cache');
const { initAdminPassword } = require('./services/auth-service');
const { safeWriteJsonAsync, runDatabaseBackup, dbLock } = require('./services/data-store');
const { corsMiddleware } = require('./middleware/cors');
const { rateLimitMiddleware } = require('./middleware/rate-limit');
const { registerAuthRoutes } = require('./routes/auth');
const { registerCatRoutes } = require('./routes/cats');
const { registerSuggestionRoutes } = require('./routes/suggestions');
const { registerSearchRoutes } = require('./routes/search');
const { registerServerProviderRoutes } = require('./routes/server-providers');
const allowedOriginsSvc = require('./services/allowed-origins');
const spc = require('./services/server-providers-config');

const INDEX_FILE = path.join(__dirname, '..', 'pdf_index.json');
const SUGGESTIONS_FILE = path.join(__dirname, '..', 'suggestions.json');
const DB_FILE = path.join(__dirname, '..', 'cats_db.json');
// APP_DATA_KEY is public (shipped in the client bundle) — server-side
// validation has been removed. The key remains in the client for legacy
// compatibility with Capacitor's static data fetch.

const app = express();
const PORT = process.env.PORT || 3000;
const configuredRemoteUrls = [];

async function initializeProviders() {
  // Single source of truth: remote_server_config.json (loaded once here).
  spc.loadConfig();
  configuredRemoteUrls.push(...spc.getConfiguredUrls());
  cache.remoteServerUrl = spc.getConfiguredUrls()[0] || '';
  if (spc.getPrimaryProviderId()) {
    console.log('[Providers] Primary provider:', spc.getPrimaryProviderId());
  }

  allowedOriginsSvc.recompute(spc.getConfiguredUrls());
  console.log('[Providers] Loaded', serverProviders.length, 'providers:', serverProviders.map(p => p.id).join(', '));
  console.log('[Providers] Configured URLs:', configuredRemoteUrls.length > 0 ? configuredRemoteUrls : '(none)');

  if (configuredRemoteUrls.length === 0 && process.stdout.isTTY) {
    console.log('[Providers] No remote server configured. Set one with: node set_server_provider.js');
  }
}

async function initializeData() {
  await initAdminPassword();
  await initializeProviders();
  
  try {
      const buildModule = require('../build.js');
    if (typeof buildModule.rebuildClientAssets === 'function') {
      setImmediate(() => {
        try {
          buildModule.rebuildClientAssets();
          console.log('[Startup] Auto-build completed successfully.');
        } catch (err) {
          console.warn('[Startup] Auto-build failed in background:', err.message);
        }
      });
      console.log('[Startup] Background rebuild scheduled.');
    }
  } catch (err) {
    console.warn('[Startup] Auto-build module unavailable:', err.message);
  }

  try {
    const exists = await fs.promises.access(DB_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(DB_FILE, 'utf-8');
      const parsed = JSON.parse(content);
      if (!Array.isArray(parsed)) {
        throw new Error("Database content is not an array");
      }
      for (const item of parsed) {
        if (typeof item.id !== 'number' || !item.title || !item.category) {
          throw new Error(`Invalid CAT structure for item ID: ${item.id}`);
        }
      }
      cache.catsCache = parsed;
    } else {
      console.warn(`Database file not found at: ${DB_FILE}`);
    }
  } catch (err) {
    console.error("Error reading or validating cats_db.json cache:", err);
    try {
      const backupExists = await fs.promises.access(DB_FILE + '.bak').then(() => true).catch(() => false);
      if (backupExists) {
        console.warn("Attempting to restore database from backup cats_db.json.bak...");
        const backupContent = await fs.promises.readFile(DB_FILE + '.bak', 'utf-8');
        const backupParsed = JSON.parse(backupContent);
        if (Array.isArray(backupParsed)) {
          cache.catsCache = backupParsed;
          console.log("[Backup] Successfully restored database cache from backup file.");
        }
      }
    } catch (backupErr) {
      console.error("Failed to restore from backup:", backupErr);
    }
  }

  try {
    const exists = await fs.promises.access(SUGGESTIONS_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(SUGGESTIONS_FILE, 'utf-8');
      cache.suggestionsCache = JSON.parse(content);
    } else {
      cache.suggestionsCache = [];
      await safeWriteJsonAsync(SUGGESTIONS_FILE, []);
    }
  } catch (err) {
    console.error("Error reading suggestions.json cache:", err);
  }

  try {
    const exists = await fs.promises.access(INDEX_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(INDEX_FILE, 'utf-8');
      cache.pdfIndex = JSON.parse(content);
    }
  } catch (err) {
    console.error("Error loading pdf_index.json cache:", err);
  }

  try {
    // Config is already loaded by initializeProviders(); keep CORS + cache in
    // sync with the authoritative list (handles the {url}/{urls} legacy shapes).
    cache.remoteServerUrl = spc.getConfiguredUrls()[0] || '';
    allowedOriginsSvc.recompute(spc.getConfiguredUrls());
  } catch (err) {
    console.error("Error syncing remote_server_config.json:", err);
  }
  
  await runDatabaseBackup(DB_FILE);
  setInterval(() => runDatabaseBackup(DB_FILE), 12 * 60 * 60 * 1000);
}

onIndexUpdated(async () => {
  try {
    const exists = await fs.promises.access(INDEX_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(INDEX_FILE, 'utf-8');
      cache.pdfIndex = JSON.parse(content);
      cache.searchCache.clear();
      console.log("[Cache] PDF Index cache and search cache reloaded/cleared.");
    }
  } catch (err) {
    console.error("Error updating PDF index in memory cache:", err);
  }
});

app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ limit: '50mb', extended: true }));

app.use((err, req, res, next) => {
  if (err instanceof SyntaxError && err.status === 400 && 'body' in err) {
    return res.status(400).json({ error: "Malformed JSON payload: Invalid syntax." });
  }
  next(err);
});

app.use(rateLimitMiddleware);
app.use(corsMiddleware(allowedOriginsSvc.allowedOrigins, serverProviders));

// Content Security Policy — mitigates XSS and data injection risks.
// This is a restrictive baseline; adjust as needed for specific endpoints.
app.use((req, res, next) => {
  res.set(
    'Content-Security-Policy',
    [
      "default-src 'self'",
      "script-src 'self' 'unsafe-inline' 'unsafe-eval'",  // unsafe-inline needed for inline scripts; unsafe-eval for esbuild
      "style-src 'self' 'unsafe-inline'",
      "img-src 'self' data: blob:",
      "font-src 'self' data:",
      "connect-src 'self' http://localhost:* https://*.ngrok.io https://*.ngrok-free.app https://*.trycloudflare.com wss:",
      "frame-src 'self'",
      "object-src 'none'",
      "base-uri 'self'",
      "form-action 'self'"
    ].join('; ')
  );
  next();
});

app.use((req, res, next) => {
  const start = Date.now();
  res.on('finish', () => {
    if (req.path.startsWith('/api')) {
      const duration = Date.now() - start;
      global.perfServer.recordRequest(req.path, req.method, duration, res.statusCode);
    }
  });
  next();
});

app.get('/capacitor.js', (req, res) => {
  res.setHeader('Content-Type', 'application/javascript');
  res.send('// Capacitor bridge mock for web browser\n');
});

// Data file access is guarded by the CORS middleware and admin auth.
// The x-app-key header is a public client token (visible in the bundle)
// and provides no real security — it's been removed to avoid a false
// sense of protection. Real access control is handled by admin tokens.

app.get('/favicon.ico', (req, res) => {
  res.sendFile(path.join(__dirname, '..', 'public', 'drcat_logo.png'));
});

app.use(express.static(path.join(__dirname, '..', 'public'), {
  etag: false,
  lastModified: false,
  setHeaders: (res, filePath) => {
    if (filePath.endsWith('.html') || filePath.endsWith('.js') || filePath.endsWith('.css')) {
      res.setHeader('Cache-Control', 'no-store, no-cache, must-revalidate');
    } else if (filePath.endsWith('.pdf')) {
      res.setHeader('Cache-Control', 'public, max-age=604800, immutable');
    }
  }
}));

app.get('/health', (req, res) => {
  const memory = process.memoryUsage();
  res.json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    uptime: Math.floor(process.uptime()),
    database: {
      loaded: cache.catsCache.length > 0,
      records: cache.catsCache.length,
    },
    system: {
      memoryUsage: {
        rss: `${Math.round(memory.rss / 1024 / 1024)} MB`,
        heapUsed: `${Math.round(memory.heapUsed / 1024 / 1024)} MB`
      }
    }
  });
});

registerAuthRoutes(app);
registerCatRoutes(app);
registerSuggestionRoutes(app);
registerSearchRoutes(app);
registerServerProviderRoutes(app);

let serverInstance = null;

initializeData().then(() => {
  serverInstance = app.listen(PORT,  () => {
    console.log(`=================================================`);
    console.log(`Medical CAT Learning App is running!`);
    console.log(`Local Access: http://localhost:${PORT}`);
    console.log(`Network Access: http://<your-device-ip>:${PORT}`);
    console.log(`=================================================`);

    indexPdfs().catch(err => console.error("Startup indexing error:", err));
  });
}).catch(err => {
  console.error("Critical: Failed to initialize application data caches:", err);
  process.exit(1);
});

function gracefulShutdown(signal) {
  console.log(`Received ${signal}. Shutting down gracefully...`);
  if (serverInstance) {
    serverInstance.close(async () => {
      console.log('HTTP server closed.');
      try {
        await dbLock.acquire(() => Promise.resolve());
        console.log('Database locks cleared.');
      } catch (err) {
        console.error('Error clearing database locks during shutdown:', err);
      }
      process.exit(0);
    });
    setTimeout(() => {
      console.error('Graceful shutdown timed out, force exiting...');
      process.exit(1);
    }, 10000);
  } else {
    process.exit(0);
  }
}

process.on('SIGTERM', () => gracefulShutdown('SIGTERM'));
process.on('SIGINT', () => gracefulShutdown('SIGINT'));

process.on('uncaughtException', (err) => {
  console.error('[CRITICAL] Uncaught Exception:', err);
  try {
    fs.appendFileSync(path.join(__dirname, '..', 'server.log'), `[${new Date().toISOString()}] Uncaught Exception: ${err.stack || err}\n`);
  } catch (_) { /* no-op */ }
});

process.on('unhandledRejection', (reason, promise) => {
  console.error('[CRITICAL] Unhandled Rejection at:', promise, 'reason:', reason);
  try {
    fs.appendFileSync(path.join(__dirname, '..', 'server.log'), `[${new Date().toISOString()}] Unhandled Rejection: ${reason}\n`);
  } catch (_) { /* no-op */ }
});

setInterval(() => {
  const now = Date.now();
  for (const [token, entry] of cache.activeTokens.entries()) {
    if (now > entry.expiresAt) {
      cache.activeTokens.delete(token);
    }
  }
}, 60 * 60 * 1000);
