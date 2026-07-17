const { state: cache } = require('../services/cache');
const { checkIsAdmin, loginAttempts } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');
const { safeWriteJsonAsync } = require('../services/data-store');
const { getIndexStatus } = require('../../index_pdfs');
const { serverProviders, detectProvider, getManagementEndpoint } = require('../config/providers');
const path = require('path');
const fs = require('fs');

const INDEX_FILE = path.join(__dirname, '..', '..', 'pdf_index.json');
const DB_FILE = path.join(__dirname, '..', '..', 'cats_db.json');
const SUGGESTIONS_FILE = path.join(__dirname, '..', '..', 'suggestions.json');
const CONFIG_FILE = path.join(__dirname, '..', '..', 'remote_server_config.json');

let configuredRemoteUrls = [];

function registerDiagnosticRoutes(app) {
  app.get('/api/diagnostics/system', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.state.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
    }
    try {
      const memory = process.memoryUsage();
      res.json({
        nodeVersion: process.version,
        platform: process.platform,
        arch: process.arch,
        uptimeSeconds: Math.floor(process.uptime()),
        memoryUsage: {
          rss: memory.rss,
          heapTotal: memory.heapTotal,
          heapUsed: memory.heapUsed,
          external: memory.external
        },
        indexingActive: getIndexStatus().isIndexing,
        indexPath: INDEX_FILE
      });
    } catch (err) {
      console.error("System diagnostics error:", err);
      res.status(500).json({ error: "Failed to get system diagnostics" });
    }
  });

  app.get('/api/diagnostics/db-stats', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.state.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
    }
    try {
      const getFileSize = async (filePath) => {
        try {
          const stats = await fs.promises.stat(filePath);
          return stats.size;
        } catch (_) {
          return 0;
        }
      };

      const catsDbSize = await getFileSize(DB_FILE);
      const suggestionsSize = await getFileSize(SUGGESTIONS_FILE);
      const indexSize = await getFileSize(INDEX_FILE);

      const coreCats = cache.state.catsCache.filter(c => c.id <= 55).length;
      const customCats = cache.state.catsCache.filter(c => c.id > 55).length;

      res.json({
        totalCats: cache.state.catsCache.length,
        coreCats,
        customCats,
        totalSuggestions: cache.state.suggestionsCache.length,
        catsDbSize,
        suggestionsSize,
        indexSize
      });
    } catch (err) {
      console.error("DB stats diagnostics error:", err);
      res.status(500).json({ error: "Failed to get DB stats" });
    }
  });

  app.get('/api/diagnostics/index-detail', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.state.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
    }
    try {
      const totalDocs = cache.state.pdfIndex.length;
      let totalPages = 0;
      const docs = [];

      for (const doc of cache.state.pdfIndex) {
        const docPages = doc.pages ? doc.pages.length : 0;
        totalPages += docPages;
        const pagesWithText = doc.pages ? doc.pages.filter(p => p.text && p.text.trim().length > 15).length : 0;

        let status = 'red';
        if (docPages > 0) {
          const ratio = pagesWithText / docPages;
          if (ratio >= 0.90) {
            status = 'green';
          } else if (ratio >= 0.05) {
            status = 'orange';
          }
        }

        docs.push({
          pdf: doc.pdf,
          status,
          pagesWithText,
          totalPages: docPages
        });
      }

      let indexedAt = null;
      try {
        const stats = await fs.promises.stat(INDEX_FILE);
        indexedAt = stats.mtime.toISOString();
      } catch (_) { /* no-op */ }

      res.json({
        totalDocs,
        totalPages,
        indexedAt,
        docs
      });
    } catch (err) {
      console.error("Index detail diagnostics error:", err);
      res.status(500).json({ error: "Failed to get index details" });
    }
  });

  app.get('/api/diagnostics/remote-server-url', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.state.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
    }
    res.json({ url: cache.state.remoteServerUrl });
  });

  app.post('/api/diagnostics/remote-server-url', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.state.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
    }
    try {
      const { urls } = req.body;
      let urlList = [];
      
      if (Array.isArray(urls)) {
        urlList = urls.filter(u => !u || (u.startsWith('http://') || u.startsWith('https://')));
      } else if (typeof urls === 'string' && urls.trim()) {
        urlList = [urls.trim()];
      }
      
      cache.state.remoteServerUrl = urlList[0] || '';
      configuredRemoteUrls = urlList;
      
      await safeWriteJsonAsync(CONFIG_FILE, { urls: urlList });

      await fs.promises.writeFile(
        path.join(__dirname, '..', '..', 'public', 'js', 'remote_config.js'),
        `export const REMOTE_SERVER_URL = ${JSON.stringify(cache.state.remoteServerUrl)};\nexport const REMOTE_SERVER_URLS = ${JSON.stringify(configuredRemoteUrls)};\n`,
        'utf-8'
      );

      res.json({ success: true, urls: configuredRemoteUrls });
    } catch (err) {
      console.error("Update remote URL error:", err);
      res.status(500).json({ error: "Failed to update remote server URL" });
    }
  });

  app.get('/api/diagnostics/tunnel-info', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.state.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
    }
    
    const providerInfo = configuredRemoteUrls.map(url => {
      const provider = detectProvider(url);
      const mgmt = getManagementEndpoint(provider);
      return {
        url,
        providerId: provider.id,
        providerName: provider.name,
        tunnelLabel: provider.tunnelLabel,
        managementEndpoint: mgmt
      };
    });
    
    res.json({ 
      providers: serverProviders.map(p => ({ id: p.id, name: p.name })),
      configuredTunnels: providerInfo
    });
  });

  app.get('/api/diagnostics/rate-limits', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.state.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
    }
    const limits = [];
    loginAttempts.forEach((val, key) => {
      limits.push({ ip: key, count: val.count, lastAttempt: val.lastAttempt });
    });
    res.json(limits);
  });
}

module.exports = { registerDiagnosticRoutes };
