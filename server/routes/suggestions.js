const { state: cache } = require('../services/cache');
const { isAdminRequest: checkIsAdmin } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');
const { safeWriteJsonAsync, logAuditEvent, dbLock } = require('../services/data-store');
const { z } = require('zod');

const suggestionSchema = z.object({
  type: z.enum(['add', 'edit']),
  catId: z.preprocess(
    v => (v === null || v === '' || v === undefined ? undefined : v),
    z.coerce.number().int().positive().optional()
  ),
  data: z.object({
    title: z.string().max(300).optional(),
    summary: z.string().max(20000).optional(),
    red_flags: z.string().max(5000).optional(),
    ordonnance: z.string().max(20000).optional(),
    category: z.string().max(120).optional(),
    originalTitle: z.string().max(300).optional()
  }).passthrough()
});

const SUGGESTIONS_FILE = require('path').join(__dirname, '..', '..', 'suggestions.json');
const DB_FILE = process.env.CATS_DB_PATH || require('path').join(__dirname, '..', '..', 'cats_db.json');

function registerSuggestionRoutes(app) {
  app.get('/api/suggestions', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const { syncCloudflareSuggestions } = require('../services/sync-suggestions');
      await syncCloudflareSuggestions();
    } catch (_) { /* sync is best-effort */ }
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
      const parsed = suggestionSchema.safeParse(req.body);
      if (!parsed.success) {
        return res.status(400).json({
          error: 'Proposition invalide.',
          details: parsed.error.issues.map(i => `${i.path.join('.') || 'body'}: ${i.message}`)
        });
      }
      const { type, catId, data } = parsed.data;

      // Guard against oversized payloads that could bloat the suggestions file.
      const dataSize = Buffer.byteLength(JSON.stringify(data), 'utf8');
      if (dataSize > 20000) {
        return res.status(413).json({ error: 'Données trop volumineuses (max 20 Ko).' });
      }

      const targetCatId = catId ?? null;
      
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

        // Smart matching: locate existing CAT by catId or by title to prevent duplicate creation
        let existingCat = null;
        if (sug.catId) {
          existingCat = cache.catsCache.find(c => String(c.id) === String(sug.catId));
        }
        if (!existingCat && sug.data && sug.data.title) {
          existingCat = cache.catsCache.find(c => 
            c.title.trim().toLowerCase() === sug.data.title.trim().toLowerCase() ||
            (sug.data.originalTitle && c.title.trim().toLowerCase() === String(sug.data.originalTitle).trim().toLowerCase())
          );
        }

        if (sug.type === 'edit' || existingCat) {
          const cat = existingCat || cache.catsCache.find(c => String(c.id) === String(sug.catId));
          if (cat) {
            const previousState = {};
            if (sug.data.summary !== undefined && cat.summary !== sug.data.summary) previousState.summary = cat.summary;
            if (sug.data.ordonnance !== undefined && cat.ordonnance !== sug.data.ordonnance) previousState.ordonnance = cat.ordonnance;
            if (sug.data.category !== undefined && cat.category !== sug.data.category) previousState.category = cat.category;
            if (sug.data.title !== undefined && cat.title !== sug.data.title) previousState.title = cat.title;
            if (sug.data.red_flags !== undefined && cat.red_flags !== sug.data.red_flags) previousState.red_flags = cat.red_flags;
            if (sug.data.sub_cats !== undefined && JSON.stringify(cat.sub_cats) !== JSON.stringify(sug.data.sub_cats)) previousState.sub_cats = cat.sub_cats;

            if (sug.data.summary !== undefined) cat.summary = sug.data.summary;
            if (sug.data.ordonnance !== undefined) cat.ordonnance = sug.data.ordonnance;
            if (sug.data.category !== undefined) cat.category = sug.data.category;
            if (sug.data.title !== undefined) cat.title = sug.data.title;
            if (sug.data.red_flags !== undefined) cat.red_flags = sug.data.red_flags;
            if (sug.data.sub_cats !== undefined) cat.sub_cats = Array.isArray(sug.data.sub_cats) ? sug.data.sub_cats : undefined;

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
        } else if (sug.type === 'add') {
          const nextId = cache.catsCache.reduce((max, cat) => cat.id > max ? cat.id : max, 0) + 1;
          const newCat = {
            id: nextId,
            category: sug.data.category || 'Général',
            title: sug.data.title,
            summary: sug.data.summary || '',
            red_flags: sug.data.red_flags || '',
            ordonnance: sug.data.ordonnance || '',
            sub_cats: Array.isArray(sug.data.sub_cats) ? sug.data.sub_cats : undefined,
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
        }

        cache.suggestionsCache.splice(index, 1);
        await safeWriteJsonAsync(SUGGESTIONS_FILE, cache.suggestionsCache);
        
        return { success: true, message: 'Proposition approuvée et intégrée à l\'application.' };
      });

      if (result.notFound) {
        return res.status(404).json({ error: result.message || 'Proposition introuvable.' });
      }
      try {
        const { purgeCloudflareSuggestion } = require('../services/sync-suggestions');
        purgeCloudflareSuggestion(sugId).catch(() => {});
      } catch (_) { /* purge is best-effort */ }
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
      try {
        const { purgeCloudflareSuggestion } = require('../services/sync-suggestions');
        purgeCloudflareSuggestion(sugId).catch(() => {});
      } catch (_) { /* purge is best-effort */ }
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
