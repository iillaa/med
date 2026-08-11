const { state: cache } = require('../services/cache');
const { isAdminRequest: checkIsAdmin } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');
const { safeWriteJsonAsync, logAuditEvent, dbLock } = require('../services/data-store');

const DB_FILE = require('path').join(__dirname, '..', '..', 'cats_db.json');

const { APP_DATA_KEY } = require('../config/constants');

function registerCatRoutes(app) {
  app.get('/api/cats', (req, res) => {
    // Simple x-app-key check to stop casual data grabs (the client always sends this)
    const requestKey = req.headers['x-app-key'];
    if (!requestKey || requestKey !== APP_DATA_KEY) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }

    const isAdmin = checkIsAdmin(req, cache.activeTokens);
    const since = parseInt(req.query.since);

    res.setHeader('Access-Control-Expose-Headers', 'X-Active-Cat-IDs');
    res.setHeader('X-Active-Cat-IDs', cache.catsCache.map(c => c.id).join(','));

    let result = cache.catsCache;
    if (!isNaN(since)) {
      result = cache.catsCache.filter(c => {
        if (!c.updatedAt) return false;
        const catTime = typeof c.updatedAt === 'number' ? c.updatedAt : new Date(c.updatedAt).getTime();
        return !isNaN(catTime) && catTime > since;
      });
    }

    if (!isAdmin) {
      result = result.map(c => {
        const rest = { ...c };
        delete rest.history;
        return rest;
      });
    }

    res.json(result);
  });

  app.post('/api/cats/bulk-import', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const importList = req.body;
      if (!Array.isArray(importList)) {
        return res.status(400).json({ error: 'L\'importation doit être un tableau de fiches.' });
      }

      for (const item of importList) {
        if (!item.title || !item.category) {
          return res.status(400).json({ error: 'Chaque fiche doit contenir au moins un titre et une spécialité.' });
        }
      }

      const result = await dbLock.acquire(async () => {
        let importedCount = 0;
        let skippedCount = 0;
        const skippedTitles = [];
        let nextId = cache.catsCache.reduce((max, cat) => cat.id > max ? cat.id : max, 0) + 1;

        for (const item of importList) {
          const normTitle = item.title.trim().toLowerCase();
          const normCat = item.category.trim().toLowerCase();
          const exists = cache.catsCache.some(c => c.title.trim().toLowerCase() === normTitle && c.category.trim().toLowerCase() === normCat);

          if (exists) {
            skippedCount++;
            skippedTitles.push(item.title);
            continue;
          }

          const newCat = {
            id: nextId++,
            category: item.category.trim(),
            title: item.title.trim(),
            summary: item.summary || '',
            red_flags: item.red_flags || '',
            ordonnance: item.ordonnance || '',
            sub_cats: Array.isArray(item.sub_cats) ? item.sub_cats : undefined,
            pdf_keywords: item.pdf_keywords || [],
            updatedAt: Date.now(),
            history: [{
              timestamp: Date.now(),
              action: 'create',
              detail: 'Importation groupée par l\'administrateur'
            }]
          };
          cache.catsCache.push(newCat);
          importedCount++;
        }

        if (importedCount > 0) {
          await safeWriteJsonAsync(DB_FILE, cache.catsCache);
        }
        return { success: true, count: importedCount, skippedCount, skippedTitles };
      });

      logAuditEvent('cats_bulk_import', { count: result.count }, req);
      res.json(result);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Erreur lors de l\'importation groupée.' });
    }
  });
  app.post('/api/cats/:id', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut modifier directement la base de données.' });
    }
    try {
      const catId = parseInt(req.params.id);
      if (isNaN(catId)) {
        return res.status(400).json({ error: 'Invalid CAT ID' });
      }
      const { summary, ordonnance, category, title, red_flags, sub_cats, pdf_keywords } = req.body;

      const result = await dbLock.acquire(async () => {
        const cat = cache.catsCache.find(c => c.id === catId);
        if (!cat) {
          return { notFound: true };
        }

        const previousState = {};
        if (summary !== undefined && cat.summary !== summary) previousState.summary = cat.summary;
        if (ordonnance !== undefined && cat.ordonnance !== ordonnance) previousState.ordonnance = cat.ordonnance;
        if (category !== undefined && cat.category !== category) previousState.category = cat.category;
        if (title !== undefined && cat.title !== title) previousState.title = cat.title;
        if (red_flags !== undefined && cat.red_flags !== red_flags) previousState.red_flags = red_flags;
        if (sub_cats !== undefined && JSON.stringify(cat.sub_cats) !== JSON.stringify(sub_cats)) previousState.sub_cats = cat.sub_cats;

        if (summary !== undefined) cat.summary = summary;
        if (ordonnance !== undefined) cat.ordonnance = ordonnance;
        if (category !== undefined) cat.category = category;
        if (title !== undefined) cat.title = title;
        if (red_flags !== undefined) cat.red_flags = red_flags;
        if (sub_cats !== undefined) cat.sub_cats = Array.isArray(sub_cats) ? sub_cats : undefined;
        if (pdf_keywords !== undefined) cat.pdf_keywords = pdf_keywords;

        cat.updatedAt = Date.now();
        if (!cat.history) cat.history = [];
        cat.history.push({
          timestamp: Date.now(),
          action: 'edit',
          detail: 'Modifié directement par l\'administrateur',
          previousState: Object.keys(previousState).length > 0 ? previousState : undefined
        });
        // Cap history at 50 entries to prevent unbounded JSON growth
        if (cat.history.length > 50) cat.history = cat.history.slice(-50);

        await safeWriteJsonAsync(DB_FILE, cache.catsCache);
        return { success: true, message: `CAT ${catId} mise à jour directement.` };
      });

      if (result.notFound) {
        return res.status(404).json({ error: 'CAT fiche introuvable.' });
      }
      logAuditEvent('cat_update', { id: catId }, req);
      res.json(result);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Failed to save CAT data' });
    }
  });

  app.post('/api/cats', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut modifier directement la base de données.' });
    }
    try {
      const { title, category, summary, red_flags, ordonnance, pdf_keywords, sub_cats } = req.body;
      if (!title || !category) {
        return res.status(400).json({ error: 'Title and Category are required' });
      }

      const result = await dbLock.acquire(async () => {
        const nextId = cache.catsCache.reduce((max, cat) => cat.id > max ? cat.id : max, 0) + 1;
        const newCat = {
          id: nextId,
          category,
          title,
          summary: summary || '',
          red_flags: red_flags || '',
          ordonnance: ordonnance || '',
          sub_cats: Array.isArray(sub_cats) ? sub_cats : undefined,
          pdf_keywords: pdf_keywords || [],
          updatedAt: Date.now(),
          history: [{
            timestamp: Date.now(),
            action: 'create',
            detail: 'Créé directement par l\'administrateur'
          }]
        };

        cache.catsCache.push(newCat);
        await safeWriteJsonAsync(DB_FILE, cache.catsCache);
        return { success: true, cat: newCat };
      });

      logAuditEvent('cat_create', { id: result.cat.id, title: result.cat.title }, req);
      res.json(result);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Failed to create new CAT' });
    }
  });

  app.delete('/api/cats/:id', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
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
        const initialLength = cache.catsCache.length;
        cache.catsCache = cache.catsCache.filter(cat => cat.id !== catId);

        if (cache.catsCache.length === initialLength) {
          return { notFound: true };
        }

        await safeWriteJsonAsync(DB_FILE, cache.catsCache);
        return { success: true, message: `CAT ${catId} successfully deleted` };
      });

      if (result.notFound) {
        return res.status(404).json({ error: 'CAT fiche not found' });
      }
      logAuditEvent('cat_delete', { id: catId }, req);
      res.json(result);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Failed to delete CAT' });
    }
  });
}

module.exports = { registerCatRoutes };
