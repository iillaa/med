const fs = require('fs');
const path = require('path');
const { isAdminRequest } = require('../services/auth-service');
const { safeWriteJsonAsync } = require('../services/data-store');

const VERSION_FILE = path.join(__dirname, '..', 'config', 'version.json');

function registerVersionRoutes(app, cache) {
  // Public GET version check endpoint
  app.get('/api/version', (req, res) => {
    try {
      if (fs.existsSync(VERSION_FILE)) {
        const content = fs.readFileSync(VERSION_FILE, 'utf-8');
        const parsed = JSON.parse(content);
        return res.json(parsed);
      }
    } catch (err) {
      console.error('[VersionRoute] Error reading version.json:', err);
    }
    res.json({
      minVersion: '1.0.0',
      latestVersion: '1.0.0',
      forceUpdateActive: false,
      updateMessage: 'Une mise à jour obligatoire de Dr.CAT est requise.',
      releaseNotes: ['Version 1.0.0 disponible'],
      downloadLinks: {
        uptodownUrl: 'https://dr-cat.en.uptodown.com/android',
        telegramUrl: 'https://t.me/DrCatOfficialApp',
        directServerUrl: '/download/drcat-latest.apk'
      },
      lastUpdated: new Date().toISOString()
    });
  });

  // Protected Admin update endpoint (PUT or POST)
  const handleVersionUpdate = async (req, res) => {
    // Check x-api-key OR admin token / local admin access
    const apiKey = req.headers['x-api-key'];
    // SECURITY: No hardcoded fallback — ADMIN_API_KEY MUST be set in .env.
    // If not set, reject all API-key-based version updates to prevent accidental
    // exposure of the version lock endpoint with a trivially guessable key.
    const expectedApiKey = process.env.ADMIN_API_KEY;
    if (!expectedApiKey) {
      console.error('[VersionRoute] ADMIN_API_KEY is not set in environment. API-key access disabled.');
    }
    const isApiKeyValid = expectedApiKey && apiKey && apiKey === expectedApiKey;
    const isAdmin = cache ? isAdminRequest(req, cache.activeTokens) : false;

    if (!isApiKeyValid && !isAdmin) {
      return res.status(401).json({ error: 'Accès non autorisé. Clé API (x-api-key) ou session admin requise.' });
    }

    try {
      const currentConfig = fs.existsSync(VERSION_FILE) 
        ? JSON.parse(fs.readFileSync(VERSION_FILE, 'utf-8'))
        : {};

      const newConfig = {
        ...currentConfig,
        minVersion: req.body.minVersion || currentConfig.minVersion || '1.0.0',
        latestVersion: req.body.latestVersion || currentConfig.latestVersion || '1.0.0',
        forceUpdateActive: typeof req.body.forceUpdateActive === 'boolean' 
          ? req.body.forceUpdateActive 
          : (currentConfig.forceUpdateActive || false),
        releaseNotes: Array.isArray(req.body.releaseNotes)
          ? req.body.releaseNotes
          : (typeof req.body.releaseNotes === 'string'
              ? req.body.releaseNotes.split('\n').map(s => s.trim()).filter(Boolean)
              : (currentConfig.releaseNotes || [])),
        downloadLinks: {
          ...currentConfig.downloadLinks,
          ...(req.body.downloadLinks || {})
        },
        lastUpdated: new Date().toISOString()
      };

      await safeWriteJsonAsync(VERSION_FILE, newConfig);
      try {
        const { invalidateVersionConfigCache } = require('../middleware/version-guard');
        invalidateVersionConfigCache();
      } catch (_) {}
      console.log(`[VersionRoute] Updated version config: minVersion=${newConfig.minVersion}, forceUpdateActive=${newConfig.forceUpdateActive}`);
      res.json({ success: true, versionConfig: newConfig });
    } catch (err) {
      console.error('[VersionRoute] Error updating version.json:', err);
      res.status(500).json({ error: 'Erreur lors de la sauvegarde de la configuration de version.' });
    }
  };

  app.put('/api/admin/version', handleVersionUpdate);
  app.post('/api/admin/version', handleVersionUpdate);
}

module.exports = { registerVersionRoutes };
