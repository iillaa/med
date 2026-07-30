const { getDeviceAnalytics } = require('../services/active-devices');
const { isAdminRequest } = require('../services/auth-service');

function registerAdminAnalyticsRoutes(app, cache) {
  app.get('/api/admin/active-devices', (req, res) => {
    const apiKey = req.headers['x-api-key'];
    const expectedApiKey = process.env.ADMIN_API_KEY || 'drcat_secret_api_key_2026';
    const isApiKeyValid = apiKey && apiKey === expectedApiKey;
    const isAdmin = cache ? isAdminRequest(req, cache.activeTokens) : false;

    if (!isApiKeyValid && !isAdmin) {
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
}

module.exports = { registerAdminAnalyticsRoutes };
