const crypto = require('crypto');
const { getDeviceAnalytics, resetDeviceStore, toggleAdminDevice } = require('../services/active-devices');
const { isAdminRequest } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');

function isValidApiKey(provided) {
  const expected = process.env.ADMIN_API_KEY;
  if (!expected || typeof provided !== 'string' || provided.length !== expected.length) return false;
  try {
    return crypto.timingSafeEqual(Buffer.from(provided), Buffer.from(expected));
  } catch (_) {
    return false;
  }
}

const { syncCloudflareActiveDevices, resetCloudflareActiveDevices } = require('../services/sync-suggestions');

function registerAdminAnalyticsRoutes(app, cache) {
  // Public Heartbeat Ping endpoint (Local / Tunnel fallback)
  app.post(['/api/active-devices/ping', '/api/telemetry/heartbeat'], (req, res) => {
    try {
      let installId = req.body?.installId || req.headers['x-install-id'];
      if (typeof installId === 'string' && installId.includes(',')) {
        installId = installId.split(',')[0].trim();
      }
      if (!installId || !installId.startsWith('drcat-inst-')) {
        return res.status(400).json({ error: "Identifiant d'installation invalide." });
      }
      res.json({ success: true, message: 'Heartbeat enregistré.' });
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  });

  app.get('/api/admin/active-devices', async (req, res) => {
    const isApiKeyValid = isValidApiKey(req.headers['x-api-key']);
    const isLocal = isLocalhostConnection(req);
    const isAdmin = cache ? isAdminRequest(req, cache.activeTokens || new Set()) : false;

    if (!isApiKeyValid && !isAdmin && !isLocal) {
      return res.status(401).json({ error: 'Accès non autorisé. Clé API (x-api-key) ou session admin requise.' });
    }

    try {
      // Auto-sync from Cloudflare KV if requested or in production mode
      if (req.query.sync === 'true' || req.headers['x-sync-cloud'] === 'true') {
        await syncCloudflareActiveDevices();
      }

      const analytics = getDeviceAnalytics();
      res.json({
        success: true,
        analytics
      });
    } catch (err) {
      console.error('[AdminAnalytics] Error generating active device analytics:', err);
      res.status(500).json({ error: 'Erreur lors de la génération des statistiques d\'utilisateurs actifs.' });
    }
  });

  app.post('/api/admin/active-devices/sync-now', async (req, res) => {
    const isApiKeyValid = isValidApiKey(req.headers['x-api-key']);
    const isLocal = isLocalhostConnection(req);
    const isAdmin = cache ? isAdminRequest(req, cache.activeTokens || new Set()) : false;

    if (!isApiKeyValid && !isAdmin && !isLocal) {
      return res.status(401).json({ error: 'Accès non autorisé. Clé API (x-api-key) ou session admin requise.' });
    }

    try {
      const result = await syncCloudflareActiveDevices();
      const analytics = getDeviceAnalytics();
      res.json({
        success: true,
        syncedCount: result.synced || 0,
        message: `Synchronisation réussie avec Cloudflare Edge (${result.synced || 0} appareils synchronisés).`,
        analytics
      });
    } catch (err) {
      console.error('[AdminAnalytics] Error syncing active devices from Cloudflare:', err);
      res.status(500).json({ error: 'Erreur lors de la synchronisation avec Cloudflare.' });
    }
  });

  app.post('/api/admin/active-devices/reset', async (req, res) => {
    const isApiKeyValid = isValidApiKey(req.headers['x-api-key']);
    const isLocal = isLocalhostConnection(req);
    const isAdmin = cache ? isAdminRequest(req, cache.activeTokens || new Set()) : false;

    if (!isApiKeyValid && !isAdmin && !isLocal) {
      return res.status(401).json({ error: 'Accès non autorisé. Clé API (x-api-key) ou session admin requise.' });
    }

    try {
      const result = resetDeviceStore();
      await resetCloudflareActiveDevices();
      res.json(result);
    } catch (err) {
      console.error('[AdminAnalytics] Error resetting device telemetry store:', err);
      res.status(500).json({ error: 'Erreur lors de la réinitialisation de la télémétrie.' });
    }
  });

  app.post('/api/admin/active-devices/toggle-admin', (req, res) => {
    const isApiKeyValid = isValidApiKey(req.headers['x-api-key']);
    const isLocal = isLocalhostConnection(req);
    const isAdmin = cache ? isAdminRequest(req, cache.activeTokens || new Set()) : false;

    if (!isApiKeyValid && !isAdmin && !isLocal) {
      return res.status(401).json({ error: 'Accès non autorisé. Clé API (x-api-key) ou session admin requise.' });
    }

    try {
      const { installId, isAdmin: newAdminStatus } = req.body || {};
      if (!installId) return res.status(400).json({ error: 'installId requis.' });
      const result = toggleAdminDevice(installId, newAdminStatus);
      res.json(result);
    } catch (err) {
      console.error('[AdminAnalytics] Error toggling device admin status:', err);
      res.status(500).json({ error: 'Erreur lors de la modification du statut.' });
    }
  });
}

module.exports = { registerAdminAnalyticsRoutes };
