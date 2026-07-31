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
  // Guard helper: Require localhost OR valid admin token
  function verifyAdminAccess(req, res) {
    if (!isLocalhostConnection(req) && !checkIsAdmin(req, cache.activeTokens)) {
      res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur local peut utiliser le laboratoire V2.' });
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

    try {
      console.log(`[CAT Generator Lab] API requested generation for: "${title}"...`);
      const result = await generateCATWithLLM(title, category || 'Gastro-entérologie');
      
      // Update v2 generated file
      let db = [];
      if (fs.existsSync(V2_DB_PATH)) {
        try { db = JSON.parse(fs.readFileSync(V2_DB_PATH, 'utf8')); } catch (e) {}
      }

      const existingIdx = db.findIndex(c => c.title.toLowerCase() === result.cat.title.toLowerCase());
      if (existingIdx >= 0) {
        result.cat.id = db[existingIdx].id;
        db[existingIdx] = result.cat;
      } else {
        result.cat.id = db.length > 0 ? Math.max(...db.map(c => c.id || 0)) + 1 : 1;
        db.push(result.cat);
      }

      fs.writeFileSync(V2_DB_PATH, JSON.stringify(db, null, 2), 'utf8');

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

  // POST /api/admin/cat-generator/update (Manual Human Edit)
  app.post('/api/admin/cat-generator/update', (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { id, title, category, summary, red_flags, ordonnance } = req.body || {};
    if (!id || !title) {
      return res.status(400).json({ error: 'ID et Titre obligatoires.' });
    }

    if (!fs.existsSync(V2_DB_PATH)) {
      return res.status(404).json({ error: 'Fichier v2 introuvable.' });
    }

    try {
      let db = JSON.parse(fs.readFileSync(V2_DB_PATH, 'utf8'));
      const catIdx = db.findIndex(c => c.id === parseInt(id, 10));

      if (catIdx === -1) {
        return res.status(404).json({ error: `Fiche #${id} introuvable.` });
      }

      // Preserve existing metadata / execution metrics while updating user edits
      const updatedCat = {
        ...db[catIdx],
        title: title.trim(),
        category: category || db[catIdx].category,
        summary: summary !== undefined ? summary : db[catIdx].summary,
        red_flags: red_flags !== undefined ? red_flags : db[catIdx].red_flags,
        ordonnance: ordonnance !== undefined ? ordonnance : db[catIdx].ordonnance,
        _human_edited: true,
        _last_edited_at: new Date().toISOString()
      };

      const validation = validateCAT(updatedCat);

      db[catIdx] = updatedCat;
      fs.writeFileSync(V2_DB_PATH, JSON.stringify(db, null, 2), 'utf8');

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
  app.post('/api/admin/cat-generator/delete', (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { id } = req.body || {};
    if (!id) {
      return res.status(400).json({ error: 'L\'ID de la fiche est obligatoire.' });
    }

    if (!fs.existsSync(V2_DB_PATH)) {
      return res.status(404).json({ error: 'Fichier v2 introuvable.' });
    }

    try {
      let db = JSON.parse(fs.readFileSync(V2_DB_PATH, 'utf8'));
      const initialCount = db.length;
      db = db.filter(c => c.id !== parseInt(id, 10));

      if (db.length === initialCount) {
        return res.status(404).json({ error: `Fiche avec l'ID ${id} introuvable.` });
      }

      fs.writeFileSync(V2_DB_PATH, JSON.stringify(db, null, 2), 'utf8');
      res.json({ success: true, message: `Fiche #${id} supprimée de la base v2 générée.` });
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  });

  // POST /api/admin/cat-generator/batch
  app.post('/api/admin/cat-generator/batch', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { spawn } = require('child_process');
    const scriptPath = path.join(__dirname, '..', '..', 'cat_db_generator', 'generate_cat_db_v2.js');

    try {
      console.log('[CAT Generator Lab] Spawning batch generation process via Gemini 3.6 Flash...');
      const child = spawn('node', [scriptPath, '--batch'], { detached: true, stdio: 'ignore' });
      child.unref();

      res.json({
        success: true,
        message: 'Génération Batch lancée en arrière-plan avec Gemini 3.6 Flash. Utilisez Refresh pour suivre la progression.'
      });
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  });

  // POST /api/admin/cat-generator/fetch-web (Step 1 Live Web Fetching)
  app.post('/api/admin/cat-generator/fetch-web', async (req, res) => {
    if (!verifyAdminAccess(req, res)) return;

    const { fetchAndCacheWebSources } = require('../../cat_db_generator/lib/web-fetcher');
    const { title, forceRefetch } = req.body || {};

    if (!title) {
      return res.status(400).json({ error: 'Le titre de la CAT est obligatoire.' });
    }

    try {
      console.log(`[API Step 1 Web Fetch] Fetching live medical guidelines for: "${title}"...`);
      const sources = await fetchAndCacheWebSources(title, { forceRefetch: !!forceRefetch, maxSources: 4 });

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
