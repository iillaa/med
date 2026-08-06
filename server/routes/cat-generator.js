const fs = require('fs');
const path = require('path');
const { isLocalhostConnection } = require('../utils/request');
const { isAdminRequest: checkIsAdmin } = require('../services/auth-service');
const { state: cache } = require('../services/cache');
const { safeWriteJsonAsync, logAuditEvent, dbLock } = require('../services/data-store');

const { generateCATWithLLM } = require('../../cat_db_generator/lib/llm-engine');
const { validateCAT } = require('../../cat_db_generator/lib/medical-validator');
const { listAvailablePDFs } = require('../../cat_db_generator/lib/pdf-extractor');

const PROD_DB_PATH = path.join(__dirname, '..', '..', 'cats_db.json');
const V2_DB_PATH = path.join(__dirname, '..', '..', 'cat_db_generator', 'cats_db_v2_generated.json');

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

    if (fs.existsSync(V2_DB_PATH)) {
      try { v2Cats = JSON.parse(fs.readFileSync(V2_DB_PATH, 'utf8')); } catch (e) {}
    }

    // Run quick validation checks
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
        v2ValidCount: validCount,
        totalTokensConsumed: totalTokens,
        passRate: v2Cats.length > 0 ? Math.round((validCount / v2Cats.length) * 100) : 0
      },
      v1: v1Cats,
      v2: v2Cats,
      validations: v2Validations
    });
  });

  // POST /api/admin/cat-generator/single
  app.post('/api/admin/cat-generator/single', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { title, category } = req.body || {};
    if (!title) {
      return res.status(400).json({ error: 'Le titre de la CAT est obligatoire.' });
    }

    // Sanitize title to prevent prompt injection — strip backticks, angle brackets,
    // and common override phrases before sending to the LLM.
    const safeTitle = title
      .replace(/[`<>]/g, '')
      .replace(/ignore\s+(all\s+)?(previous|prior|above)\s+instructions?/gi, '')
      .trim()
      .slice(0, 200); // Hard cap to avoid token abuse

    if (!safeTitle) {
      return res.status(400).json({ error: 'Titre invalide après nettoyage.' });
    }

    try {
      console.log(`[CAT Generator Lab] API requested generation for: "${safeTitle}"...`);
      const result = await generateCATWithLLM(safeTitle, category || 'Gastro-entérologie');

      // Update v2 generated file — use async read/write to avoid blocking the event loop
      let db = [];
      if (fs.existsSync(V2_DB_PATH)) {
        try { db = JSON.parse(await fs.promises.readFile(V2_DB_PATH, 'utf8')); } catch (e) {}
      }

      const existingIdx = db.findIndex(c => c.title.toLowerCase() === result.cat.title.toLowerCase());
      if (existingIdx >= 0) {
        result.cat.id = db[existingIdx].id;
        db[existingIdx] = result.cat;
      } else {
        result.cat.id = db.length > 0 ? Math.max(...db.map(c => c.id || 0)) + 1 : 1;
        db.push(result.cat);
      }

      await fs.promises.writeFile(V2_DB_PATH, JSON.stringify(db, null, 2), 'utf8');

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

    if (!fs.existsSync(V2_DB_PATH)) {
      return res.status(404).json({ error: 'Fichier cats_db_v2_generated.json introuvable.' });
    }

    try {
      const v2Content = fs.readFileSync(V2_DB_PATH, 'utf8');
      const v2Data = JSON.parse(v2Content);

      if (!Array.isArray(v2Data) || v2Data.length === 0) {
        return res.status(400).json({ error: 'La base v2 générée est vide.' });
      }

      // Backup existing prod DB
      if (fs.existsSync(PROD_DB_PATH)) {
        fs.copyFileSync(PROD_DB_PATH, `${PROD_DB_PATH}.bak`);
      }

      // Write to production DB
      await safeWriteJsonAsync(PROD_DB_PATH, v2Data);

      // Update in-memory cache
      cache.catsCache = v2Data;

      await logAuditEvent(req, 'PROMOTE_V2_CATS_DATABASE', {
        count: v2Data.length,
        timestamp: new Date().toISOString()
      });

      res.json({
        success: true,
        message: `Base V2 promue avec succès en production (${v2Data.length} fiches).`,
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

      // Ensure backup
      if (fs.existsSync(PROD_DB_PATH)) {
        fs.copyFileSync(PROD_DB_PATH, `${PROD_DB_PATH}.bak`);
      }

      // Check if item already exists by ID or title match
      const cleanTitle = (cat.title || '').toLowerCase().replace(/^cat\s+devant\s+/i, '').trim();
      const existingIdx = prodData.findIndex(c => 
        (c.id && cat.id && String(c.id) === String(cat.id)) ||
        (c.title || '').toLowerCase().replace(/^cat\s+devant\s+/i, '').trim() === cleanTitle
      );

      const updatedCat = {
        ...cat,
        id: cat.id || Date.now(),
        updatedAt: new Date().toISOString()
      };

      if (existingIdx >= 0) {
        prodData[existingIdx] = { ...prodData[existingIdx], ...updatedCat };
      } else {
        prodData.push(updatedCat);
      }

      await safeWriteJsonAsync(PROD_DB_PATH, prodData);
      cache.catsCache = prodData;

      await logAuditEvent(req, 'PROMOTE_SINGLE_CAT', {
        title: updatedCat.title,
        id: updatedCat.id,
        isNew: existingIdx < 0
      });

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

    if (!fs.existsSync(V2_DB_PATH)) {
      return res.status(404).json({ error: 'Fichier v2 introuvable.' });
    }

    try {
      // Async read — avoids blocking the event loop on a large JSON file
      let db = JSON.parse(await fs.promises.readFile(V2_DB_PATH, 'utf8'));
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

      const updatedCat = {
        ...db[catIdx],
        title: title.trim(),
        category: category || db[catIdx].category,
        search_keywords: parsedKeywords,
        summary: summary !== undefined ? summary : db[catIdx].summary,
        red_flags: red_flags !== undefined ? red_flags : db[catIdx].red_flags,
        ordonnance: ordonnance !== undefined ? ordonnance : db[catIdx].ordonnance,
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

    if (!fs.existsSync(V2_DB_PATH)) {
      return res.status(404).json({ error: 'Fichier v2 introuvable.' });
    }

    try {
      let db = JSON.parse(await fs.promises.readFile(V2_DB_PATH, 'utf8'));
      const initialCount = db.length;
      db = db.filter(c => c.id !== parseInt(id, 10));

      if (db.length === initialCount) {
        return res.status(404).json({ error: `Fiche avec l'ID ${id} introuvable.` });
      }

      await fs.promises.writeFile(V2_DB_PATH, JSON.stringify(db, null, 2), 'utf8');
      res.json({ success: true, message: `Fiche #${id} supprimée de la base v2 générée.` });
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
      let v2Db = fs.existsSync(V2_DB_PATH) ? JSON.parse(fs.readFileSync(V2_DB_PATH, 'utf8')) : [];

      for (let i = 0; i < prodDb.length; i++) {
        const cat = prodDb[i];
        progressState.current = i + 1;
        progressState.currentTitle = cat.title;
        progressState.percent = Math.round(((i + 1) / prodDb.length) * 100);

        addProgressLog(`[${i + 1}/${prodDb.length}] Synthèse Dual RAG Gemini 3.6 Flash pour : "${cat.title}"...`, 'info');

        try {
          const resObj = await generateCATWithLLM(cat.title, cat.category);
          const fullCatObj = {
            id: cat.id,
            category: resObj.cat.category,
            title: resObj.cat.title,
            summary: resObj.cat.summary,
            red_flags: resObj.cat.red_flags,
            ordonnance: resObj.cat.ordonnance,
            _execution_metrics: resObj.metrics
          };

          const idx = v2Db.findIndex(c => c.id === cat.id);
          if (idx >= 0) v2Db[idx] = fullCatObj;
          else v2Db.push(fullCatObj);

          fs.writeFileSync(V2_DB_PATH, JSON.stringify(v2Db, null, 2), 'utf8');

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
    const { title, forceRefetch, searchKeywords } = req.body || {};

    if (!title) {
      return res.status(400).json({ error: 'Le titre de la CAT est obligatoire.' });
    }

    try {
      console.log(`[API Step 1 Web Fetch] Fetching live medical guidelines for: "${title}"...`);
      const sources = await fetchAndCacheWebSources(title, { forceRefetch: !!forceRefetch, maxSources: 6, searchKeywords });

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

  // POST /api/admin/cat-generator/pipeline-full (1-Tap All-in-One: Web Fetch -> LLM Synthesis -> Auto Approve)
  app.post('/api/admin/cat-generator/pipeline-full', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { fetchAndCacheWebSources } = require('../../cat_db_generator/lib/web-fetcher');
    const { generateCATWithLLM } = require('../../cat_db_generator/lib/llm-engine');
    const { title, category, forceRefetch, autoApprove } = req.body || {};

    if (!title) {
      return res.status(400).json({ error: 'Le titre de la CAT est obligatoire.' });
    }

    try {
      console.log(`⚡ [1-Tap Full Pipeline] Running 1-Tap Dual RAG pipeline for: "${title}"...`);

      // 1. Step 1: Web Fetch
      const sources = await fetchAndCacheWebSources(title, { forceRefetch: !!forceRefetch, maxSources: 6 }).catch(() => []);

      // 2. Step 2: Dual RAG LLM Synthesis
      const genResult = await generateCATWithLLM(title, category || 'Médecine Générale');
      const cat = genResult.cat;

      // 3. Step 3: Auto-Approve if requested
      if (autoApprove) {
        if (fs.existsSync(V2_DB_PATH)) {
          const v2Db = JSON.parse(fs.readFileSync(V2_DB_PATH, 'utf8'));
          const idx = v2Db.findIndex(c => c.id === cat.id || c.title.toLowerCase() === cat.title.toLowerCase());
          if (idx !== -1) v2Db[idx] = cat;
          else v2Db.push(cat);
          fs.writeFileSync(V2_DB_PATH, JSON.stringify(v2Db, null, 2), 'utf8');
        }

        const prodDb = JSON.parse(fs.readFileSync(PROD_DB_PATH, 'utf8'));
        const pIdx = prodDb.findIndex(c => c.id === cat.id || c.title.toLowerCase() === cat.title.toLowerCase());
        if (pIdx !== -1) prodDb[pIdx] = cat;
        else prodDb.push(cat);
        fs.writeFileSync(PROD_DB_PATH, JSON.stringify(prodDb, null, 2), 'utf8');
      }

      res.json({
        success: true,
        message: `Fiche "${title}" générée avec succès via l'IA Dual RAG.`,
        cat: cat,
        sourcesCount: sources.length,
        metrics: genResult.metrics
      });
    } catch (err) {
      console.error('[API 1-Tap Pipeline Error]', err);
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
}

module.exports = {
  registerCatGeneratorRoutes
};
