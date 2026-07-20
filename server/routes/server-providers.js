// Server-provider list endpoints.
//
// GET  /api/server-providers        (public)  -> clients learn the authoritative list
// POST /api/server-providers        (admin)   -> update the list (single source of truth)
//
// On update we persist to remote_server_config.json and refresh the live CORS
// allowlist immediately (no server restart needed).
const { isAdminRequest: checkIsAdmin } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');
const { state: cache } = require('../services/cache');
const spc = require('../services/server-providers-config');
const allowedOriginsSvc = require('../services/allowed-origins');

function registerServerProviderRoutes(app) {
  app.get('/api/server-providers', (req, res) => {
    res.json({ primaryProvider: spc.getPrimaryProviderId(), servers: spc.getServers() });
  });

  app.post('/api/server-providers', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut modifier la liste des serveurs.' });
    }
    try {
      const body = req.body || {};
      const { servers, urls, primaryProvider } = body;
      let next;
      if (Array.isArray(servers)) {
        next = { primaryProvider: primaryProvider || null, servers };
      } else if (Array.isArray(urls)) {
        next = { primaryProvider: primaryProvider || null, servers: urls };
      } else {
        return res.status(400).json({ error: 'Fournissez "servers" (array) ou "urls" (array).' });
      }

      const saved = spc.saveConfig(next);
      cache.remoteServerUrl = spc.getConfiguredUrls()[0] || '';
      allowedOriginsSvc.recompute(spc.getConfiguredUrls());

      console.log('[ServerProviders] Updated list:', spc.getConfiguredUrls().join(', ') || '(none)');
      res.json({ success: true, primaryProvider: saved.primaryProvider, servers: saved.servers });
    } catch (err) {
      console.error('Update server providers error:', err);
      res.status(500).json({ error: 'Failed to update server providers' });
    }
  });
}

module.exports = { registerServerProviderRoutes };
