const { state: cache } = require('../services/cache');
const { isAdminRequest: checkIsAdmin } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');
const { safeWriteJsonAsync, logAuditEvent, dbLock } = require('../services/data-store');

const SUGGESTIONS_FILE = require('path').join(__dirname, '..', '..', 'suggestions.json');
const DB_FILE = require('path').join(__dirname, '..', '..', 'cats_db.json');

function registerSuggestionRoutes(app) {
  app.get('/api/suggestions', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    res.json(cache.suggestionsCache);
  });

  app.post('/api/suggestions', async (req, res) => {
    // Require x-app-key so anonymous bots cannot spam the suggestion queue.
    const { APP_DATA_KEY } = require('../config/constants');
    const requestKey = req.headers['x-app-key'];
    if (!requestKey || requestKey !== APP_DATA_KEY) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }

    try {
      const { type, catId, data } = req.body;
      if (!type || !data) {
        return res.status(400).json({ error: 'Type (add/edit) et Data sont requis.' });
      }

      // Guard against oversized payloads that could bloat the suggestions file.
      const dataSize = Buffer.byteLength(JSON.stringify(data), 'utf8');
      if (dataSize > 5000) {
        return res.status(413).json({ error: 'Données trop volumineuses (max 5 Ko).' });
      }

      const targetCatId = catId ? parseInt(catId) : null;
      
      const duplicate = cache.suggestionsCache.find(s => 
        s.type === type && 
        s.catId === targetCatId &&
        s.data.title === data.title &&
        s.data.summary === data.summary &&
        (Date.now() - s.timestamp) < 5 * 60 * 1000
      );

      if (duplicate) {
        return res.json({ success: true, message: 'Proposition déjà reçue (doublon ignoré).', suggestion: duplicate });
      }

      const result = await dbLock.acquire(async () => {
        const suggestionId = 'sug_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9);
        const newSug = {
          id: suggestionId,
          type,
          catId: targetCatId,
          timestamp: Date.now(),
          data
        };

        cache.suggestionsCache.push(newSug);
        await safeWriteJsonAsync(SUGGESTIONS_FILE, cache.suggestionsCache);
        return { success: true, message: 'Proposition envoyée à l\'administrateur pour validation.', suggestion: newSug };
      });

      res.json(result);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Failed to save suggestion' });
    }
  });

  app.post('/api/suggestions/:id/approve', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const sugId = req.params.id;

      const result = await dbLock.acquire(async () => {
        const index = cache.suggestionsCache.findIndex(s => s.id === sugId);
        if (index === -1) {
          return { notFound: true };
        }

        const sug = cache.suggestionsCache[index];

        if (sug.type === 'add') {
          const nextId = cache.catsCache.reduce((max, cat) => cat.id > max ? cat.id : max, 0) + 1;
          const newCat = {
            id: nextId,
            category: sug.data.category,
            title: sug.data.title,
            summary: sug.data.summary || '',
            red_flags: sug.data.red_flags || '',
            ordonnance: sug.data.ordonnance || '',
            pdf_keywords: sug.data.pdf_keywords || [],
            updatedAt: Date.now(),
            history: [{
              timestamp: Date.now(),
              action: 'create',
              detail: 'Créé via approbation d\'une proposition de fiche'
            }]
          };
          cache.catsCache.push(newCat);
          await safeWriteJsonAsync(DB_FILE, cache.catsCache);
        } else if (sug.type === 'edit') {
          const cat = cache.catsCache.find(c => c.id === parseInt(sug.catId));
          if (cat) {
            const previousState = {};
            if (sug.data.summary !== undefined && cat.summary !== sug.data.summary) previousState.summary = cat.summary;
            if (sug.data.ordonnance !== undefined && cat.ordonnance !== sug.data.ordonnance) previousState.ordonnance = cat.ordonnance;
            if (sug.data.category !== undefined && cat.category !== sug.data.category) previousState.category = cat.category;
            if (sug.data.title !== undefined && cat.title !== sug.data.title) previousState.title = cat.title;
            if (sug.data.red_flags !== undefined && cat.red_flags !== sug.data.red_flags) previousState.red_flags = cat.red_flags;

            if (sug.data.summary !== undefined) cat.summary = sug.data.summary;
            if (sug.data.ordonnance !== undefined) cat.ordonnance = sug.data.ordonnance;
            if (sug.data.category !== undefined) cat.category = sug.data.category;
            if (sug.data.title !== undefined) cat.title = sug.data.title;
            if (sug.data.red_flags !== undefined) cat.red_flags = sug.data.red_flags;

            cat.updatedAt = Date.now();
            if (!cat.history) cat.history = [];
            cat.history.push({
              timestamp: Date.now(),
              action: 'edit',
              detail: 'Modifié via approbation d\'une proposition de modification',
              previousState: Object.keys(previousState).length > 0 ? previousState : undefined
            });

            await safeWriteJsonAsync(DB_FILE, cache.catsCache);
          } else {
            return { notFound: true, message: 'Fiche CAT d\'origine introuvable.' };
          }
        }

        cache.suggestionsCache.splice(index, 1);
        await safeWriteJsonAsync(SUGGESTIONS_FILE, cache.suggestionsCache);
        
        return { success: true, message: 'Proposition approuvée et intégrée à l\'application.' };
      });

      if (result.notFound) {
        return res.status(404).json({ error: result.message || 'Proposition introuvable.' });
      }
      logAuditEvent('suggestion_approve', { id: sugId }, req);
      res.json(result);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Failed to approve suggestion' });
    }
  });

  app.post('/api/suggestions/:id/reject', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const sugId = req.params.id;

      const result = await dbLock.acquire(async () => {
        const index = cache.suggestionsCache.findIndex(s => s.id === sugId);
        if (index === -1) {
          return { notFound: true };
        }

        cache.suggestionsCache.splice(index, 1);
        await safeWriteJsonAsync(SUGGESTIONS_FILE, cache.suggestionsCache);
        return { success: true, message: 'Proposition rejetée et supprimée.' };
      });

      if (result.notFound) {
        return res.status(404).json({ error: 'Proposition introuvable.' });
      }
      logAuditEvent('suggestion_reject', { id: sugId }, req);
      res.json(result);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Failed to reject suggestion' });
    }
  });

  app.post('/api/suggestions/:id/edit', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const sugId = req.params.id;
      const { data } = req.body;

      if (!data) {
        return res.status(400).json({ error: 'Data requis.' });
      }

      const result = await dbLock.acquire(async () => {
        const index = cache.suggestionsCache.findIndex(s => s.id === sugId);
        if (index === -1) {
          return { notFound: true };
        }

        const sug = cache.suggestionsCache[index];
        sug.data = { ...sug.data, ...data };

        await safeWriteJsonAsync(SUGGESTIONS_FILE, cache.suggestionsCache);
        return { success: true, message: 'Proposition mise à jour.', suggestion: sug };
      });

      if (result.notFound) {
        return res.status(404).json({ error: 'Proposition introuvable.' });
      }
      logAuditEvent('suggestion_edit', { id: sugId }, req);
      res.json(result);
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Failed to update suggestion' });
    }
  });
}

module.exports = { registerSuggestionRoutes };
