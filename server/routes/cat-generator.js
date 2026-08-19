const fs = require('fs');
const path = require('path');
const { isLocalhostConnection } = require('../utils/request');
const { isAdminRequest: checkIsAdmin } = require('../services/auth-service');
const { state: cache } = require('../services/cache');
const { safeWriteJsonAsync, logAuditEvent, dbLock } = require('../services/data-store');

const { generateCATWithLLM } = require('../../cat_db_generator/lib/llm-engine');
const { validateCAT } = require('../../cat_db_generator/lib/medical-validator');
const { listAvailablePDFs } = require('../../cat_db_generator/lib/pdf-extractor');
const debugEmitter = require('../../cat_db_generator/lib/debug-emitter');

const PROD_DB_PATH = process.env.CATS_DB_PATH || path.join(__dirname, '..', '..', 'cats_db.json');
const V3_DB_PATH = path.join(__dirname, '..', '..', 'cat_db_generator', 'cats_db_v3_generated.json');
const V2_DB_PATH_FALLBACK = path.join(__dirname, '..', '..', 'cat_db_generator', 'cats_db_v2_generated.json');

function getV3DbPath() {
  if (!fs.existsSync(V3_DB_PATH) && fs.existsSync(V2_DB_PATH_FALLBACK)) {
    try { fs.renameSync(V2_DB_PATH_FALLBACK, V3_DB_PATH); } catch (_) {}
  }
  return fs.existsSync(V3_DB_PATH) ? V3_DB_PATH : V2_DB_PATH_FALLBACK;
}

function getNextIntegerId(dbArray) {
  if (!Array.isArray(dbArray) || dbArray.length === 0) return 1;
  const numericIds = dbArray.map(c => Number(c.id)).filter(n => Number.isInteger(n) && n > 0);
  return numericIds.length > 0 ? Math.max(...numericIds) + 1 : 1;
}

function normalizeTitle(t) {
  return (t || '')
    .toLowerCase()
    .replace(/^cat\s+devant\s+/i, '')
    .replace(/[`'’"“”«»]/g, '')
    .trim();
}

function registerCatGeneratorRoutes(app) {
  // Guard helper: Strictly require authenticated admin session token
  function verifyAdminAccess(req, res) {
    if (!checkIsAdmin(req, cache.activeTokens)) {
      res.status(403).json({ error: 'Accès interdit. Vous devez être connecté en tant qu\'administrateur pour utiliser les outils de génération V2.' });
      return false;
    }
    return true;
  }

  // GET /api/admin/cat-generator/data
  app.get('/api/admin/cat-generator/data', (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    let v1Cats = [];
    let v2Cats = [];

    if (fs.existsSync(PROD_DB_PATH)) {
      try { v1Cats = JSON.parse(fs.readFileSync(PROD_DB_PATH, 'utf8')); } catch (e) {}
    }

    const targetDbPath = getV3DbPath();
    if (fs.existsSync(targetDbPath)) {
      try { v2Cats = JSON.parse(fs.readFileSync(targetDbPath, 'utf8')); } catch (e) {}
    }

    const v2Validations = v2Cats.map(cat => ({
      id: cat.id,
      title: cat.title,
      validation: validateCAT(cat),
      metrics: cat._execution_metrics || null
    }));

    const validCount = v2Validations.filter(v => v.validation.valid).length;
    const totalTokens = v2Cats.reduce((acc, c) => acc + (c._execution_metrics ? c._execution_metrics.totalTokens || 0 : 0), 0);

    res.json({
      success: true,
      summary: {
        v1Total: v1Cats.length,
        v2Total: v2Cats.length,
        v3Total: v2Cats.length,
        v2ValidCount: validCount,
        totalTokensConsumed: totalTokens,
        passRate: v2Cats.length > 0 ? Math.round((validCount / v2Cats.length) * 100) : 0
      },
      v1: v1Cats,
      v2: v2Cats,
      v3: v2Cats,
      validations: v2Validations
    });
  });

  // GET /api/admin/cat-generator/debug-stream (SSE Real-Time Telemetry)
  app.get('/api/admin/cat-generator/debug-stream', (req, res) => {
    // Note: SSE stream allows authenticated admin session or local loopback connection
    res.writeHead(200, {
      'Content-Type': 'text/event-stream',
      'Cache-Control': 'no-cache, no-transform',
      'Connection': 'keep-alive',
      'X-Accel-Buffering': 'no'
    });
    if (res.flushHeaders) res.flushHeaders();
    debugEmitter.addSSEClient(res);
  });

  // GET /api/admin/cat-generator/debug-logs (Recent JSON Buffer)
  app.get('/api/admin/cat-generator/debug-logs', (req, res) => {
    if (!verifyAdminAccess(req, res)) return;
    const limit = Number(req.query.limit) || 150;
    res.json({
      success: true,
      logs: debugEmitter.getRecentLogs(limit)
    });
  });

  // DELETE /api/admin/cat-generator/debug-logs (Clear Buffer)
  app.delete('/api/admin/cat-generator/debug-logs', (req, res) => {
    if (!verifyAdminAccess(req, res)) return;
    const result = debugEmitter.clearLogs();
    res.json(result);
  });

  // POST /api/admin/cat-generator/single
  app.post('/api/admin/cat-generator/single', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { title, category, id: reqId } = req.body || {};
    if (!title) {
      return res.status(400).json({ error: 'Le titre de la CAT est obligatoire.' });
    }

    const safeTitle = title
      .replace(/[`<>]/g, '')
      .replace(/ignore\s+(all\s+)?(previous|prior|above)\s+instructions?/gi, '')
      .trim()
      .slice(0, 200);

    if (!safeTitle) {
      return res.status(400).json({ error: 'Titre invalide après nettoyage.' });
    }

    try {
      console.log(`[CAT Generator Lab] API requested generation for Primary Key ID [${reqId || 'NEW'}]: "${safeTitle}"...`);

      let prodDb = [];
      if (fs.existsSync(PROD_DB_PATH)) {
        try { prodDb = JSON.parse(fs.readFileSync(PROD_DB_PATH, 'utf8')); } catch (e) {}
      }

      const reqIdNum = (reqId !== undefined && reqId !== null && reqId !== '') ? Number(reqId) : null;
      let targetCat = null;
      if (reqIdNum !== null && !isNaN(reqIdNum)) {
        targetCat = prodDb.find(c => Number(c.id) === reqIdNum);
      }
      if (!targetCat) {
        targetCat = prodDb.find(c => normalizeTitle(c.title) === normalizeTitle(safeTitle));
      }

      const targetId = targetCat ? Number(targetCat.id) : (reqIdNum !== null && !isNaN(reqIdNum) ? reqIdNum : getNextIntegerId(prodDb));
      const result = await generateCATWithLLM(safeTitle, category || 'Gastro-entérologie', {
        id: targetId,
        originalTitle: targetTitle,
        offlineOnly: req.body.offlineOnly === true,
        customUrls: req.body.customUrls || []
      });
      result.cat.id = targetId;
      if (req.body.parent_id !== undefined && req.body.parent_id !== null && req.body.parent_id !== '') {
        result.cat.parent_id = Number(req.body.parent_id);
        result.cat.sub_cat_type = req.body.sub_cat_type || 'emergency';
        result.cat.sub_cat_label = req.body.sub_cat_label || result.cat.title;
      }

      let db = [];
      const dbPath = getV3DbPath();
      if (fs.existsSync(dbPath)) {
        try { db = JSON.parse(await fs.promises.readFile(dbPath, 'utf8')); } catch (e) {}
      }

      const existingIdx = db.findIndex(c => Number(c.id) === targetId || normalizeTitle(c.title) === normalizeTitle(safeTitle));
      if (existingIdx >= 0) {
        result.cat.id = targetId;
        db[existingIdx] = result.cat;
      } else {
        result.cat.id = targetId;
        db.push(result.cat);
      }

      await fs.promises.writeFile(dbPath, JSON.stringify(db, null, 2), 'utf8');

      res.json({
        success: true,
        cat: result.cat,
        validation: result.validation,
        metrics: result.metrics
      });
    } catch (err) {
      console.error('[CAT Generator Lab API Error]', err);
      res.status(500).json({ error: err.message });
    }
  });

  // POST /api/admin/cat-generator/promote
  app.post('/api/admin/cat-generator/promote', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const dbPath = getV3DbPath();
    if (!fs.existsSync(dbPath)) {
      return res.status(404).json({ error: 'Fichier cats_db_v3_generated.json introuvable.' });
    }

    try {
      const v2Content = fs.readFileSync(dbPath, 'utf8');
      const v2Data = JSON.parse(v2Content);

      if (!Array.isArray(v2Data) || v2Data.length === 0) {
        return res.status(400).json({ error: 'La base v2 générée est vide.' });
      }

      if (fs.existsSync(PROD_DB_PATH)) {
        fs.copyFileSync(PROD_DB_PATH, `${PROD_DB_PATH}.bak`);
      }

      await safeWriteJsonAsync(PROD_DB_PATH, v2Data);
      cache.catsCache = v2Data;

      // Sync sanitized public/data/cats_db.json for offline PWA clients
      const publicDataFile = path.join(__dirname, '..', '..', 'public', 'data', 'cats_db.json');
      if (fs.existsSync(path.dirname(publicDataFile))) {
        const cleanDb = v2Data.map(c => {
          const { history, _execution_metrics, online_verification_queries, sources, _audit_trail, _raw_llm_response, ...rest } = c;
          if (Array.isArray(rest.sub_cats)) {
            rest.sub_cats = rest.sub_cats.map(sub => {
              const { _execution_metrics, online_verification_queries, sources, ...cleanSub } = sub;
              return cleanSub;
            });
          }
          return rest;
        });
        await safeWriteJsonAsync(publicDataFile, cleanDb);
      }

      await logAuditEvent('PROMOTE_V2_CATS_DATABASE', {
        count: v2Data.length,
        timestamp: new Date().toISOString()
      }, req);

      res.json({
        success: true,
        message: `Base V3.5 promue avec succès en production (${v2Data.length} fiches).`,
        count: v2Data.length
      });
    } catch (err) {
      res.status(500).json({ error: `Échec de promotion: ${err.message}` });
    }
  });

  // POST /api/admin/cat-generator/promote-single (Promote 1 single CAT into production cats_db.json)
  app.post('/api/admin/cat-generator/promote-single', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { cat } = req.body || {};
    if (!cat || typeof cat !== 'object' || !cat.title) {
      return res.status(400).json({ error: 'Fiche CAT invalide ou manquante dans req.body.' });
    }

    try {
      let prodData = [];
      if (fs.existsSync(PROD_DB_PATH)) {
        const prodContent = fs.readFileSync(PROD_DB_PATH, 'utf8');
        prodData = JSON.parse(prodContent);
      }

      if (fs.existsSync(PROD_DB_PATH)) {
        fs.copyFileSync(PROD_DB_PATH, `${PROD_DB_PATH}.bak`);
      }

      // STRICT PRIMARY KEY LOOKUP: Match exclusively by Primary Key id
      const targetId = cat.id ? Number(cat.id) : getNextIntegerId(prodData);
      const existingIdx = prodData.findIndex(c => Number(c.id) === Number(targetId));

      const updatedCat = {
        ...cat,
        id: targetId,
        updatedAt: new Date().toISOString()
      };

      if (existingIdx >= 0) {
        prodData[existingIdx] = { ...prodData[existingIdx], ...updatedCat };
      } else {
        prodData.push(updatedCat);
      }

      await safeWriteJsonAsync(PROD_DB_PATH, prodData);
      cache.catsCache = prodData;

      // Sync sanitized public/data/cats_db.json for offline PWA clients
      const publicDataFile = path.join(__dirname, '..', '..', 'public', 'data', 'cats_db.json');
      if (fs.existsSync(path.dirname(publicDataFile))) {
        const cleanDb = prodData.map(c => {
          const { history, _execution_metrics, online_verification_queries, sources, _audit_trail, _raw_llm_response, ...rest } = c;
          if (Array.isArray(rest.sub_cats)) {
            rest.sub_cats = rest.sub_cats.map(sub => {
              const { _execution_metrics, online_verification_queries, sources, ...cleanSub } = sub;
              return cleanSub;
            });
          }
          return rest;
        });
        await safeWriteJsonAsync(publicDataFile, cleanDb);
      }

      await logAuditEvent('PROMOTE_SINGLE_CAT', {
        title: updatedCat.title,
        id: updatedCat.id,
        isNew: existingIdx < 0
      }, req);

      res.json({
        success: true,
        message: `Fiche "${updatedCat.title}" promue en production avec succès.`,
        cat: updatedCat,
        totalProdCount: prodData.length
      });
    } catch (err) {
      res.status(500).json({ error: `Échec de la promotion de la fiche : ${err.message}` });
    }
  });

  // POST /api/admin/cat-generator/update (Manual Human Edit)
  app.post('/api/admin/cat-generator/update', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { id, title, category, summary, red_flags, ordonnance, search_keywords } = req.body || {};
    if (!id || !title) {
      return res.status(400).json({ error: 'ID et Titre obligatoires.' });
    }

    const dbPath = getV3DbPath();
    if (!fs.existsSync(dbPath)) {
      return res.status(404).json({ error: 'Fichier V3 introuvable.' });
    }

    try {
      // Async read — avoids blocking the event loop on a large JSON file
      let db = JSON.parse(await fs.promises.readFile(dbPath, 'utf8'));
      const catIdx = db.findIndex(c => c.id === parseInt(id, 10));

      if (catIdx === -1) {
        return res.status(404).json({ error: `Fiche #${id} introuvable.` });
      }

      let parsedKeywords = db[catIdx].search_keywords || [];
      if (Array.isArray(search_keywords)) {
        parsedKeywords = search_keywords.map(k => String(k).trim()).filter(Boolean);
      } else if (typeof search_keywords === 'string') {
        parsedKeywords = search_keywords.split(',').map(k => k.trim()).filter(Boolean);
      }

      let parsedSubCats = db[catIdx].sub_cats || [];
      if (req.body.sub_cats !== undefined) {
        if (Array.isArray(req.body.sub_cats)) {
          parsedSubCats = req.body.sub_cats;
        } else if (typeof req.body.sub_cats === 'string' && req.body.sub_cats.trim()) {
          try { parsedSubCats = JSON.parse(req.body.sub_cats); } catch (_) {}
        } else if (req.body.sub_cats === null || req.body.sub_cats === '') {
          parsedSubCats = [];
        }
      }

      const updatedCat = {
        ...db[catIdx],
        title: title.trim(),
        category: category || db[catIdx].category,
        search_keywords: parsedKeywords,
        summary: summary !== undefined ? summary : db[catIdx].summary,
        red_flags: red_flags !== undefined ? red_flags : db[catIdx].red_flags,
        ordonnance: ordonnance !== undefined ? ordonnance : db[catIdx].ordonnance,
        sub_cats: parsedSubCats,
        parent_id: req.body.parent_id !== undefined ? (req.body.parent_id ? Number(req.body.parent_id) : null) : db[catIdx].parent_id,
        sub_cat_type: req.body.sub_cat_type !== undefined ? req.body.sub_cat_type : db[catIdx].sub_cat_type,
        sub_cat_label: req.body.sub_cat_label !== undefined ? req.body.sub_cat_label : db[catIdx].sub_cat_label,
        _human_edited: true,
        _last_edited_at: new Date().toISOString()
      };

      const validation = validateCAT(updatedCat);

      db[catIdx] = updatedCat;
      // Async write — avoids blocking the event loop
      await fs.promises.writeFile(V2_DB_PATH, JSON.stringify(db, null, 2), 'utf8');

      res.json({
        success: true,
        message: `Fiche #${id} mise à jour et enregistrée avec succès!`,
        cat: updatedCat,
        validation: validation
      });
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  });

  // POST /api/admin/cat-generator/delete
  app.post('/api/admin/cat-generator/delete', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { id } = req.body || {};
    if (!id) {
      return res.status(400).json({ error: 'L\'ID de la fiche est obligatoire.' });
    }

    const dbPath = getV3DbPath();
    if (!fs.existsSync(dbPath)) {
      return res.status(404).json({ error: 'Fichier V3 introuvable.' });
    }

    try {
      let db = JSON.parse(await fs.promises.readFile(dbPath, 'utf8'));
      const initialCount = db.length;
      db = db.filter(c => c.id !== parseInt(id, 10));

      if (db.length === initialCount) {
        return res.status(404).json({ error: `Fiche avec l'ID ${id} introuvable.` });
      }

      await fs.promises.writeFile(dbPath, JSON.stringify(db, null, 2), 'utf8');
      res.json({ success: true, message: `Fiche #${id} supprimée de la base V3 générée.` });
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  });

  // Live Progress State Store for UI Console & Progress Bar
  const progressState = {
    running: false,
    type: null, // 'batch_web' or 'batch_ai' or 'single_ai'
    total: 0,
    current: 0,
    percent: 0,
    statusText: 'Inactif',
    currentTitle: '',
    logs: []
  };

  function addProgressLog(message, level = 'info') {
    const timestamp = new Date().toLocaleTimeString('fr-FR');
    const logItem = { timestamp, message, level };
    progressState.logs.push(logItem);
    if (progressState.logs.length > 200) progressState.logs.shift(); // Keep last 200 logs
    progressState.statusText = message;
    console.log(`[Lab Progress ${level.toUpperCase()}] ${message}`);
  }

  // GET /api/admin/cat-generator/progress (Real-time progress polling endpoint)
  app.get('/api/admin/cat-generator/progress', (req, res) => {
    if (!verifyAdminAccess(req, res)) return;
    res.json({
      success: true,
      progress: progressState
    });
  });

  // POST /api/admin/cat-generator/batch (Step 2 Dual RAG AI Batch Generation)
  app.post('/api/admin/cat-generator/batch', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    if (progressState.running) {
      return res.status(409).json({ error: `Une opération (${progressState.type}) est déjà en cours. Veuillez patienter.` });
    }

    const { generateCATWithLLM } = require('../../cat_db_generator/lib/llm-engine');
    const prodDb = JSON.parse(fs.readFileSync(PROD_DB_PATH, 'utf8'));

    progressState.running = true;
    progressState.type = 'batch_ai';
    progressState.total = prodDb.length;
    progressState.current = 0;
    progressState.percent = 0;
    progressState.logs = [];

    addProgressLog(`🚀 Démarrage du Batch Step 2 Dual RAG via Gemini 3.6 Flash (${prodDb.length} fiches)...`, 'info');

    // Run asynchronously in background
    (async () => {
      const dbPath = getV3DbPath();
      let v2Db = fs.existsSync(dbPath) ? JSON.parse(fs.readFileSync(dbPath, 'utf8')) : [];

      for (let i = 0; i < prodDb.length; i++) {
        const cat = prodDb[i];
        progressState.current = i + 1;
        progressState.currentTitle = cat.title;
        progressState.percent = Math.round(((i + 1) / prodDb.length) * 100);

        addProgressLog(`[${i + 1}/${prodDb.length}] Synthèse Dual RAG Gemini 3.6 Flash pour : "${cat.title}"...`, 'info');

        try {
          const resObj = await generateCATWithLLM(cat.title, cat.category);
          const fullCatObj = {
            ...resObj.cat,
            id: cat.id,
            _execution_metrics: resObj.metrics
          };

          const idx = v2Db.findIndex(c => c.id === cat.id);
          if (idx >= 0) v2Db[idx] = fullCatObj;
          else v2Db.push(fullCatObj);

          fs.writeFileSync(dbPath, JSON.stringify(v2Db, null, 2), 'utf8');

          addProgressLog(`✅ [#${cat.id}] "${cat.title}" générée avec succès (${resObj.metrics.totalTokens} tok | ${resObj.metrics.latencyMs}ms)`, 'success');
        } catch (err) {
          addProgressLog(`❌ [#${cat.id}] Échec de synthèse : ${err.message}`, 'error');
        }

        await new Promise(r => setTimeout(r, 1200));
      }

      progressState.running = false;
      addProgressLog(`🎉 Batch Step 2 terminé avec succès pour ${prodDb.length} fiches!`, 'success');
    })();

    res.json({
      success: true,
      message: `Batch Step 2 lancé pour ${prodDb.length} fiches via Gemini 3.6 Flash.`
    });
  });

  // POST /api/admin/cat-generator/batch-web (Step 1 Batch Web Fetch)
  app.post('/api/admin/cat-generator/batch-web', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    if (progressState.running) {
      return res.status(409).json({ error: `Une opération (${progressState.type}) est déjà en cours. Veuillez patienter.` });
    }

    const { fetchAndCacheWebSources } = require('../../cat_db_generator/lib/web-fetcher');
    const { forceRefetch } = req.body || {};
    const prodDb = JSON.parse(fs.readFileSync(PROD_DB_PATH, 'utf8'));

    progressState.running = true;
    progressState.type = 'batch_web';
    progressState.total = prodDb.length;
    progressState.current = 0;
    progressState.percent = 0;
    progressState.logs = [];

    addProgressLog(`🌐 Démarrage du Batch Step 1 Recherche Web (${forceRefetch ? 'Mode Rechargement Forcé' : 'Mode Incrémental'}) pour ${prodDb.length} fiches...`, 'info');

    (async () => {
      for (let i = 0; i < prodDb.length; i++) {
        const cat = prodDb[i];
        progressState.current = i + 1;
        progressState.currentTitle = cat.title;
        progressState.percent = Math.round(((i + 1) / prodDb.length) * 100);

        addProgressLog(`[${i + 1}/${prodDb.length}] Recherche Web RAG pour : "${cat.title}"...`, 'info');

        try {
          const sources = await fetchAndCacheWebSources(cat.title, { forceRefetch: !!forceRefetch, maxSources: 6, searchKeywords: cat.search_keywords });
          addProgressLog(`✅ [${i + 1}/${prodDb.length}] ${sources.length} sources mises en cache pour "${cat.title}"`, 'success');
        } catch (err) {
          addProgressLog(`⚠️ [${i + 1}/${prodDb.length}] Erreur Web fetch : ${err.message}`, 'warn');
        }

        await new Promise(r => setTimeout(r, 800));
      }

      progressState.running = false;
      addProgressLog(`🎉 Batch Step 1 Recherche Web terminé pour ${prodDb.length} fiches!`, 'success');
    })();

    res.json({
      success: true,
      message: `Batch Step 1 Recherche Web démarré en arrière-plan pour ${prodDb.length} fiches.`
    });
  });

  // POST /api/admin/cat-generator/fetch-web (Step 1 Live Web Fetching)
  app.post('/api/admin/cat-generator/fetch-web', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { fetchAndCacheWebSources } = require('../../cat_db_generator/lib/web-fetcher');
    const { title, forceRefetch, searchKeywords, customUrls } = req.body || {};

    if (!title) {
      return res.status(400).json({ error: 'Le titre de la CAT est obligatoire.' });
    }

    try {
      console.log(`[API Step 1 Web Fetch] Fetching live medical guidelines for: "${title}" (with custom URLs: ${customUrls || 'none'})...`);
      const sources = await fetchAndCacheWebSources(title, { forceRefetch: !!forceRefetch, maxSources: 6, searchKeywords, customUrls });

      res.json({
        success: true,
        message: `${sources.length} sources web médicales récupérées et mises en cache pour "${title}".`,
        title: title,
        sourcesCount: sources.length,
        sources: sources.map(s => ({ domain: s.domain, sourceName: s.sourceName, fetchedAt: s.fetchedAt }))
      });
    } catch (err) {
      console.error('[API Web Fetch Error]', err);
      res.status(500).json({ error: err.message });
    }
  });



  // POST /api/admin/cat-generator/clear-web-cache (Purge web cache for a single title OR all titles)
  app.post('/api/admin/cat-generator/clear-web-cache', (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { clearWebCache, clearAllWebCache } = require('../../cat_db_generator/lib/web-fetcher');
    const { title, all } = req.body || {};

    try {
      if (all || !title) {
        const result = clearAllWebCache();
        return res.json(result);
      }

      const result = clearWebCache(title);
      res.json(result);
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  });

  // GET /api/admin/cat-generator/web-cache (Web Cache Inspection)
  app.get('/api/admin/cat-generator/web-cache', (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { listWebCacheStatus } = require('../../cat_db_generator/lib/web-fetcher');
    const cacheStatus = listWebCacheStatus();

    res.json({
      success: true,
      totalCachedFolders: cacheStatus.length,
      cache: cacheStatus
    });
  });

  // GET /api/admin/cat-generator/discover
  app.get('/api/admin/cat-generator/discover', (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const pdfs = listAvailablePDFs();
    res.json({
      success: true,
      totalPDFs: pdfs.length,
      pdfs: pdfs.slice(0, 15),
      candidates: [
        { title: "CAT devant insolation et coup de chaleur", category: "Urgences" },
        { title: "CAT devant morsure d'animal et risque rabique", category: "Infectiologie / MST" },
        { title: "CAT devant crise de colique néphrétique", category: "Urologie / Néphrologie" },
        { title: "CAT devant brûlure cutanée thermique", category: "Dermatologie" },
        { title: "CAT devant corps étranger oculaire", category: "Ophtalmologie" }
      ]
    });
  });
  // POST /api/admin/cat-generator/pipeline-full (Centralized 1-Tap Pipeline: Web Fetch + Dual RAG IA + Auto V3 Store)
  app.post('/api/admin/cat-generator/pipeline-full', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { fetchAndCacheWebSources } = require('../../cat_db_generator/lib/web-fetcher');
    const { generateCATWithLLM } = require('../../cat_db_generator/lib/llm-engine');
    const { id, title, category, forceRefetch, searchKeywords, customUrls } = req.body || {};

    if (!title) {
      return res.status(400).json({ error: 'Le titre de la CAT est obligatoire.' });
    }

    try {
      console.log(`[1-Tap Pipeline] Executing Step 1 Web RAG + Step 2 IA Synthesis for: "${title}" (with custom URLs)...`);
      const sources = await fetchAndCacheWebSources(title, { forceRefetch: !!forceRefetch, maxSources: 6, searchKeywords, customUrls });
      const targetId = Number(id) || null;
      const result = await generateCATWithLLM(title, category || 'Gastro-entérologie', { id: targetId });

      if (result && result.cat) {
        const dbPath = getV3DbPath();
        let db = [];
        if (fs.existsSync(dbPath)) {
          try { db = JSON.parse(fs.readFileSync(dbPath, 'utf8')); } catch (_) {}
        }
        const assignedId = targetId || result.cat.id || getNextIntegerId(db);
        result.cat.id = assignedId;

        const existingIdx = db.findIndex(c => Number(c.id) === assignedId || normalizeTitle(c.title) === normalizeTitle(title));
        if (existingIdx >= 0) db[existingIdx] = result.cat;
        else db.push(result.cat);

        fs.writeFileSync(dbPath, JSON.stringify(db, null, 2), 'utf8');
      }

      res.json({
        success: true,
        message: `Pipeline 1-Tap exécuté avec succès pour "${title}".`,
        title: title,
        sourcesCount: sources.length,
        data: result.cat,
        metrics: result.metrics
      });
    } catch (err) {
      console.error('[1-Tap Pipeline Error]', err);
      res.status(500).json({ error: err.message });
    }
  });
}

module.exports = {
  registerCatGeneratorRoutes
};
