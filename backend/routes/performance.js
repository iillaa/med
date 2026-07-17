const { state: cache } = require('../services/cache');
const { isAdminRequest: checkIsAdmin } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');
const { dbLock } = require('../services/data-store');

function registerPerformanceRoutes(app) {
  app.get('/api/performance/server-metrics', (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit. Seul l\'administrateur peut accéder aux outils de performance.' });
    }
    try {
      const getPercentileLocal = (arr, q) => {
        if (arr.length === 0) return 0;
        const sorted = [...arr].sort((a, b) => a - b);
        const pos = (sorted.length - 1) * q;
        const base = Math.floor(pos);
        const rest = pos - base;
        if (sorted[base + 1] !== undefined) {
          return sorted[base] + rest * (sorted[base + 1] - sorted[base]);
        } else {
          return sorted[base];
        }
      };

      const memory = process.memoryUsage();
      
      const endpoints = {};
      for (const [key, data] of cache.endpointTimings.entries()) {
        const samples = data.samples;
        const count = samples.length;
        if (count === 0) continue;
        
        const sum = samples.reduce((a, b) => a + b, 0);
        const avgMs = parseFloat((sum / count).toFixed(1));
        const minMs = Math.min(...samples);
        const maxMs = Math.max(...samples);
        const p95Ms = parseFloat(getPercentileLocal(samples, 0.95).toFixed(1));
        
        endpoints[key] = {
          count,
          minMs,
          avgMs,
          maxMs,
          p95Ms,
          errors: data.errors
        };
      }

      const totalPdfFiles = cache.pdfParseTimes.length;
      let avgParseMs = 0;
      let slowestPdf = '--';
      if (totalPdfFiles > 0) {
        const sumParse = cache.pdfParseTimes.reduce((sum, item) => sum + item.duration, 0);
        avgParseMs = Math.round(sumParse / totalPdfFiles);
        const sortedByDuration = [...cache.pdfParseTimes].sort((a, b) => b.duration - a.duration);
        slowestPdf = `${sortedByDuration[0].file}: ${sortedByDuration[0].duration}ms`;
      }

      const writeStats = {
        backup: { avgMs: 0, maxMs: 0 },
        write: { avgMs: 0, maxMs: 0 },
        rename: { avgMs: 0, maxMs: 0 }
      };
      const phases = ['backup', 'write', 'rename'];
      phases.forEach(phase => {
        const samples = cache.writePhaseDurations[phase];
        if (samples.length > 0) {
          const sum = samples.reduce((a, b) => a + b, 0);
          writeStats[phase] = {
            avgMs: Math.round(sum / samples.length),
            maxMs: Math.max(...samples)
          };
        }
      });

      const totalIndexerHits = cache.cacheHits + cache.cacheMisses;
      const cacheHitRate = totalIndexerHits > 0 ? parseFloat((cache.cacheHits / totalIndexerHits).toFixed(4)) : 1.0;

      res.json({
        uptimeSeconds: Math.floor(process.uptime()),
        memoryUsage: {
          rss: memory.rss,
          heapUsed: memory.heapUsed
        },
        endpoints,
        pdfParse: {
          totalFiles: totalPdfFiles,
          avgParseMs,
          slowest: slowestPdf
        },
        writeDurations: {
          backup: writeStats.backup,
          write: writeStats.write,
          rename: writeStats.rename
        },
        lockQueueDepth: dbLock.getQueueDepth(),
        cacheHitRate
      });
    } catch (err) {
      console.error("Server performance metrics error:", err);
      res.status(500).json({ error: "Failed to get server performance metrics" });
    }
  });
}

module.exports = { registerPerformanceRoutes };
