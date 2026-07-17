const { state: cache } = require('../services/cache');
const { checkIsAdmin } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');
const { safeWriteJsonAsync, logAuditEvent, dbLock } = require('../services/data-store');

const DB_FILE = require('path').join(__dirname, '..', '..', 'cats_db.json');

function registerCatRoutes(app) {
  app.post('/api/cats/:id', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut modifier directement la base de données.' });
    }
    try {
      const catId = parseInt(req.params.id);
      if (isNaN(catId)) {
        return res.status(400).json({ error: 'Invalid CAT ID' });
      }
      const { summary, ordonnance, category, title, red_flags } = req.body;

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

        if (summary !== undefined) cat.summary = summary;
        if (ordonnance !== undefined) cat.ordonnance = ordonnance;
        if (category !== undefined) cat.category = category;
        if (title !== undefined) cat.title = title;
        if (red_flags !== undefined) cat.red_flags = red_flags;

        cat.updatedAt = Date.now();
        if (!cat.history) cat.history = [];
        cat.history.push({
          timestamp: Date.now(),
          action: 'edit',
          detail: 'Modifié directement par l\'administrateur',
          previousState: Object.keys(previousState).length > 0 ? previousState : undefined
        });

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
      const { title, category, summary, red_flags, ordonnance, pdf_keywords } = req.body;
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
