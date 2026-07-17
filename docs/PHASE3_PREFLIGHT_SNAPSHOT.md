# Phase 3 Pre-Flight Snapshot

**Generated:** 2026-07-17  
**Commit:** 4b885a2  
**Branch:** stage1

---

## 1. Root Directory Structure

```
total 862
drwx------+                                                              19 root root   3488 Jul 17 15:19 .
drwx------+                                                              28 root root   3488 Jul 11 01:50 ..
drwxr-xr-x+                                                               3 root root   3488 Jun 30 21:59 .cat-med
drwxr-xr-x+                                                               1 root root     56 Jul 14 23:56 .coderabbit.yaml
drwxr-xr-x+                                                               1 root root     88 Jul 17 03:52 .eslintignore
drwxr-xr-x+                                                               1 root root    387 Jul 17 03:52 .eslintrc.json
drwx------+                                                               7 root root   3488 Jul 17 15:13 .git
drwxr-xr-x+                                                               3 root root   3488 Jul  7 00:26 .github
drwxr-xr-x+                                                               1 root root    655 Jul 12 22:25 .gitignore
drwx------+                                                               4 root root   3488 Jul 12 22:29 .kilo
drwxr-xr-x+                                                               1 root root    159 Jul 17 03:52 .prettierrc
drwxr-xr-x+                                                               1 root root   7105 Jul 12 22:25 AUDIT_PROMPTS_REPORT.md
drwxr-xr-x+                                                               1 root root   5585 Jul 12 22:25 AUDIT_REPORT.md
drwxr-xr-x+                                                               1 root root   6228 Jul 12 22:25 AUDIT_REPORT_2.md
drwxr-xr-x+                                                               1 root root   6186 Jul 12 22:25 AUDIT_REPORT_3.md
drwxr-xr-x+                                                               1 root root    986 Jul 17 15:19 New Empty File
drwxr-xr-x+                                                               1 root root   3723 Jul 17 05:29 PHASE1_AUDIT_REPORT.md
drwxr-xr-x+                                                               1 root root   6427 Jul 17 12:10 PHASE2_AUDIT_REPORT.md
drwxr-xr-x+                                                               1 root root  11287 Jul 17 03:52 README.md
drwxr-xr-x+                                                               1 root root   5324 Jul 12 22:25 TODO.md
drwxr-xr-x+                                                               1 root root    161 Jul 17 02:45 admin_password.txt
drwxr-xr-x+                                                               3 root root   3488 Jul 12 22:25 agy-workflow
drwxr-xr-x+                                                               3 root root   3488 Jul 12 22:25 ai-workflow
drwxr-xr-x+                                                               4 root root   3488 Jul 14 23:56 android
drwxr-xr-x+                                                               3 root root   3488 Jul 15 01:49 audit
drwxr-xr-x+                                                               1 root root    714 Jul 17 02:46 audit.log
drwx------+                                                               2 root root   3488 Jul 17 14:41 backups
drwxr-xr-x+                                                               1 root root   5478 Jul 14 23:56 build.js
drwxr-xr-x+                                                               1 root root    189 Jul 12 22:25 capacitor.config.json
drwxr-xr-x+                                                               1 root root 144935 Jul 17 03:52 cats_db.json
drwxr-xr-x+                                                               1 root root 142760 Jul  8 00:55 cats_db.json.bak
drwxr-xr-x+                                                               1 root root  10940 Jul 17 03:52 codemap.md
drwxr-xr-x+                                                               1 root root   8450 Jul 17 03:52 developer_guide.md
drwxr-xr-x+                                                               2 root root   3488 Jul 12 22:25 docs
drwxr-xr-x+                                                               1 root root 103455 Jul 12 22:25 generate_db.js
drwxr-xr-x+                                                               1 root root   2124 Jul 14 23:56 generate_icons.sh
drwxr-xr-x+                                                               1 root root   5119 Jul 14 23:56 index_pdfs.js
drwxr-xr-x+                                                               1 root root  14639 Jul 17 03:52 lessons_learned.md
drwxr-xr-x+                                                               1 root root    652 Jul 17 03:50 masterprompt.md
drwxr-xr-x+                                                               2 root root   3488 Jul  5 21:35 med
drwxr-xr-x+                                                               1 root root  10830 Jul 17 03:52 migration.md
drwxr-xr-x+                                                             254 root root  20480 Jul 17 12:53 node_modules
drwxr-xr-x+                                                               1 root root   848 Jul 17 15:13 package-lock.json
drwxr-xr-x+                                                               1 root root    848 Jul 17 15:13 package.json
drwxr-xr-x+                                                               1 root root  103455 Jul 17 03:52 pdf_index.json
drwxr-xr-x+                                                               1 root root   8103 Jul 17 03:52 plan-progress.md
drwxr-xr-x+                                                               1 root root   18927 Jul 17 15:13 public
drwxr-xr-x+                                                               1 root root    101 Jul  5 03:54 remote_server_config.json.bak
drwx------+                                                               7 root root   3488 Jul 17 11:28 server
drwxr-xr-x+                                                               1 root root     30 Jul 17 14:37 server.js
drwxr-xr-x+                                                               1 root root    554 Jul 17 11:46 server.log
drwxr-xr-x+                                                               1 root root   2428 Jul 17 03:52 set_admin_password.js
drwx------+                                                               2 root root   3488 Jul 11 01:52 shortcuts
drwx------+                                                               4 root root   3488 Jul 17 15:13 src
drwx------+                                                               3 root root   3488 Jul 17 15:13 static
drwxr-xr-x+                                                               1 root root   9652 Jul 17 03:52 technical_architecture.md
drwxr-xr-x+                                                               1 root root  17386 Jul 11 01:52 update_examens.js
drwxr-xr-x+                                                               1 root root  13434 Jul 11 01:52 update_summaries.js
```

---

## 2. Reconstruction Plan

**File:** `audit/kilo_ai/RECONSTRUCTION_PLAN.md`

(Full content retained; 631 lines)

Key sections:
- Phase 0 — Stabilization
- Phase 1 — Frontend Refactor
- Phase 2 — Backend Refactor
- Phase 3 — Vue 3 Migration
- Phase 4 — Testing Strategy

---

## 3. Root package.json

```json
{
  "name": "med",
  "version": "1.0.0",
  "description": "Dr.CAT — Clinical Review App",
  "main": "server/index.js",
  "type": "commonjs",
  "scripts": {
    "start": "node server.js",
    "start:admin": "ADMIN_PASSWORD=admin123 node server.js",
    "test": "echo \"Error: no test specified\" && exit 1",
    "build": "node build.js",
    "reindex": "node index_pdfs.js",
    "cap:sync": "npx cap sync",
    "set:password": "node set_admin_password.js"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "@capacitor/android": "8.4.1",
    "@capacitor/core": "8.4.1",
    "@capacitor/filesystem": "8.1.2",
    "@capacitor/haptics": "8.0.2",
    "@capacitor/share": "8.0.1",
    "express": "^5.2.1",
    "pdf-parse": "2.4.5"
  },
  "devDependencies": {
    "@capacitor/cli": "8.4.1",
    "eslint": "^8.57.1"
  }
}
```

---

## 4. Server Entry Point

**File:** `server.js`

```javascript
require('./server/index.js');
```

**File:** `server/index.js`

```javascript
const express = require('express');
const path = require('path');
const fs = require('fs');
const { indexPdfs, onIndexUpdated } = require('../index_pdfs');
const { serverProviders, buildAllowedOrigins } = require('./config/providers');
const { state: cache } = require('./services/cache');
const { initAdminPassword } = require('./services/auth-service');
const { safeWriteJsonAsync, runDatabaseBackup, dbLock } = require('./services/data-store');
const { corsMiddleware } = require('./middleware/cors');
const { rateLimitMiddleware } = require('./middleware/rate-limit');
const { registerAuthRoutes } = require('./routes/auth');
const { registerCatRoutes } = require('./routes/cats');
const { registerSuggestionRoutes } = require('./routes/suggestions');
const { registerSearchRoutes } = require('./routes/search');
const { registerDiagnosticRoutes } = require('./routes/diagnostics');
const { registerPerformanceRoutes } = require('./routes/performance');

const INDEX_FILE = path.join(__dirname, '..', 'pdf_index.json');
const SUGGESTIONS_FILE = path.join(__dirname, '..', 'suggestions.json');
const DB_FILE = path.join(__dirname, '..', 'cats_db.json');
const APP_DATA_KEY = 'drcat_pub_2f7a91c4e8';
const APP_DATA_KEY_ALT = process.env.APP_DATA_KEY;
const isValidAppKey = (k) => k === APP_DATA_KEY || (!!APP_DATA_KEY_ALT && k === APP_DATA_KEY_ALT);
const CONFIG_FILE = path.join(__dirname, '..', 'remote_server_config.json');

const app = express();
const PORT = process.env.PORT || 3000;
let allowedOrigins = new Set();
let configuredRemoteUrls = [];

async function initializeProviders() {
  try {
    const exists = await fs.promises.access(CONFIG_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(CONFIG_FILE, 'utf-8');
      const parsed = JSON.parse(content);
      configuredRemoteUrls = Array.isArray(parsed.urls) ? parsed.urls : (parsed.url ? [parsed.url] : []);
      cache.remoteServerUrl = configuredRemoteUrls[0] || '';
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
    const exists = await fs.promises.access(CONFIG_FILE).then(() => true).catch(() => false);
    if (exists) {
      const content = await fs.promises.readFile(CONFIG_FILE, 'utf-8');
      const parsed = JSON.parse(content);
      cache.remoteServerUrl = parsed.url || (Array.isArray(parsed.urls) ? parsed.urls[0] : '');
      if (cache.remoteServerUrl) {
        allowedOrigins.add(cache.remoteServerUrl);
        try {
          const urlObj = new URL(cache.remoteServerUrl);
          allowedOrigins.add(`${urlObj.protocol}//${urlObj.host}`);
        } catch (_) { /* no-op */ }
      }
    }
  } catch (err) {
    console.error("Error loading remote_server_config.json:", err);
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
app.use(corsMiddleware(allowedOrigins, serverProviders));

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

const GUARDED_DATA_FILES = ['/data/cats_db.json', '/data/pdf_index.json', '/data/pdf_list.json'];
GUARDED_DATA_FILES.forEach((file) => {
  app.get(file, (req, res, next) => {
    if (!isValidAppKey(req.headers['x-app-key'])) {
      return res.status(403).json({ error: 'Accès interdit: clé applicative manquante.' });
    }
    next();
  });
});

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
registerDiagnosticRoutes(app);
registerPerformanceRoutes(app);

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
```

---

## 5. Current Frontend Status

med-vue does not exist

---

## 6. Notable Current State

- `package.json`: `"type": "commonjs"`
- Frontend: vanilla JS in `public/` with modular structure under `public/js/components/`
- Backend: modular Express app under `server/` (routes, middleware, services)
- No Vue files present
- No Vite config present
- No `src/` frontend source tree
- Server verified running cleanly at `http://localhost:3000`

---

*End of snapshot.*
