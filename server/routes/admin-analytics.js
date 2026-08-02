const { getDeviceAnalytics, resetDeviceStore } = require('../services/active-devices');
const { isAdminRequest } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');

function registerAdminAnalyticsRoutes(app, cache) {
  app.get('/api/admin/active-devices', (req, res) => {
    const apiKey = req.headers['x-api-key'];
    const expectedApiKey = process.env.ADMIN_API_KEY || 'drcat_secret_api_key_2026';
    const isApiKeyValid = apiKey && apiKey === expectedApiKey;
    const isLocal = isLocalhostConnection(req);
    const isAdmin = cache ? isAdminRequest(req, cache.activeTokens || new Set()) : false;

    if (!isApiKeyValid && !isAdmin && !isLocal) {
      return res.status(401).json({ error: 'Accès non autorisé. Clé API (x-api-key) ou session admin requise.' });
    }

    try {
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

  app.post('/api/admin/active-devices/reset', (req, res) => {
    const apiKey = req.headers['x-api-key'];
    const expectedApiKey = process.env.ADMIN_API_KEY || 'drcat_secret_api_key_2026';
    const isApiKeyValid = apiKey && apiKey === expectedApiKey;
    const isLocal = isLocalhostConnection(req);
    const isAdmin = cache ? isAdminRequest(req, cache.activeTokens || new Set()) : false;

    if (!isApiKeyValid && !isAdmin && !isLocal) {
      return res.status(401).json({ error: 'Accès non autorisé. Clé API (x-api-key) ou session admin requise.' });
    }

    try {
      const result = resetDeviceStore();
      res.json(result);
    } catch (err) {
      console.error('[AdminAnalytics] Error resetting device telemetry store:', err);
      res.status(500).json({ error: 'Erreur lors de la réinitialisation de la télémétrie.' });
    }
  });
}

module.exports = { registerAdminAnalyticsRoutes };
