const { state: cache } = require('../services/cache');
const { isAdminRequest: checkIsAdmin, loginAttempts } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');
const { getIndexStatus } = require('../../index_pdfs');
const { serverProviders, detectProvider, getManagementEndpoint } = require('../config/providers');
const spc = require('../services/server-providers-config');
const path = require('path');

const INDEX_FILE = path.join(__dirname, '..', '..', 'pdf_index.json');
const DB_FILE = path.join(__dirname, '..', '..', 'cats_db.json');
const SUGGESTIONS_FILE = path.join(__dirname, '..', '..', 'suggestions.json');

function registerDiagnosticRoutes(app) {
  app.get('/api/diagnostics/system', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
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
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
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

      const coreCats = cache.catsCache.filter(c => c.id <= 55).length;
      const customCats = cache.catsCache.filter(c => c.id > 55).length;

      res.json({
        totalCats: cache.catsCache.length,
        coreCats,
        customCats,
        totalSuggestions: cache.suggestionsCache.length,
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
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
    }
    try {
      const totalDocs = cache.pdfIndex.length;
      let totalPages = 0;
      const docs = [];

      for (const doc of cache.pdfIndex) {
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

  app.get('/api/diagnostics/tunnel-info', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de diagnostic.' });
    }
    
    const configuredRemoteUrls = spc.getConfiguredUrls();
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
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
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
