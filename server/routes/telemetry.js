const fs = require('fs');
const path = require('path');
const { isAdminRequest: checkIsAdmin } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');
const { state: cache } = require('../services/cache');
const { safeWriteJsonAsync } = require('../services/data-store');

const TELEMETRY_FILE = path.join(__dirname, '..', 'data', 'telemetry_reports.json');
const MAX_REPORTS = 100;

function getReports() {
  try {
    if (!fs.existsSync(TELEMETRY_FILE)) {
      return [];
    }
    const raw = fs.readFileSync(TELEMETRY_FILE, 'utf8');
    const list = JSON.parse(raw);
    return Array.isArray(list) ? list : [];
  } catch (err) {
    console.error('[Telemetry] Failed to read reports:', err.message);
    return [];
  }
}

async function saveReports(reports) {
  try {
    const dir = path.dirname(TELEMETRY_FILE);
    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir, { recursive: true });
    }
    await safeWriteJsonAsync(TELEMETRY_FILE, reports);
    return true;
  } catch (err) {
    console.error('[Telemetry] Failed to save reports:', err.message);
    return false;
  }
}

function computeFingerprint(error = '', stack = '') {
  const cleanError = String(error).trim().split('\n')[0].replace(/:\d+:\d+/g, '');
  const firstStackLine = String(stack).split('\n').find(l => l.includes('.js') || l.includes('at ')) || '';
  const cleanStack = firstStackLine.replace(/https?:\/\/[^\/]+\//g, '').replace(/:\d+:\d+/g, '').trim();
  const raw = `${cleanError}::${cleanStack}`.toLowerCase();
  
  let hash = 0;
  for (let i = 0; i < raw.length; i++) {
    hash = ((hash << 5) - hash) + raw.charCodeAt(i);
    hash |= 0;
  }
  return 'fp_' + Math.abs(hash).toString(36);
}

function registerTelemetryRoutes(app) {
  // Public endpoint for crash & log reporting with Incident Aggregation
  app.post('/api/telemetry', async (req, res) => {
    try {
      const body = req.body || {};
      const now = Date.now();
      const fingerprint = body.fingerprint || computeFingerprint(body.error, body.stack);
      const dev = typeof body.device === 'object' && body.device !== null ? body.device : {};
      const devModel = dev.model || 'Inconnu';
      
      const reports = getReports();
      const existingIdx = reports.findIndex(r => r && (r.fingerprint === fingerprint || r.id === fingerprint));

      let reportId;

      if (existingIdx !== -1) {
        // Incident already exists -> Aggregate & Bump Occurrences
        const item = reports[existingIdx];
        item.occurrences = (item.occurrences || 1) + 1;
        item.lastSeen = now;
        
        // Severity Switch based on frequency
        if (item.occurrences >= 20) {
          item.severity = 'critical'; // 🔴 Global Outage / Mass Crash
        } else if (item.occurrences >= 5) {
          item.severity = 'warning';  // 🟠 Recurring
        } else {
          item.severity = 'info';     // 🟡 Minor
        }

        // Track affected device models
        if (!item.affectedDevices || typeof item.affectedDevices !== 'object') {
          item.affectedDevices = {};
        }
        item.affectedDevices[devModel] = (item.affectedDevices[devModel] || 0) + 1;

        if (body.stack && (!item.stack || item.stack.length < body.stack.length)) {
          item.stack = String(body.stack).substring(0, 1500);
        }
        if (body.logs && Array.isArray(body.logs) && body.logs.length > 0) {
          item.logs = body.logs.slice(-20);
        }

        reportId = item.id;
        // Move to top of active feed
        reports.splice(existingIdx, 1);
        reports.unshift(item);
      } else {
        // New Incident Group
        reportId = `tel_${now}_${Math.random().toString(36).substring(2, 9)}`;
        const newIncident = {
          id: reportId,
          fingerprint,
          firstSeen: now,
          lastSeen: now,
          occurrences: 1,
          severity: 'info',
          type: body.type || 'unhandled_error',
          error: String(body.error || 'Erreur non spécifiée').substring(0, 500),
          stack: String(body.stack || '').substring(0, 1500),
          device: dev,
          affectedDevices: { [devModel]: 1 },
          appVersion: String(body.appVersion || '1.16.0').substring(0, 20),
          installId: String(body.installId || '').substring(0, 50),
          logs: Array.isArray(body.logs) ? body.logs.slice(-20) : [],
          userNote: String(body.userNote || '').substring(0, 500)
        };
        reports.unshift(newIncident);
      }

      if (reports.length > MAX_REPORTS) {
        reports.length = MAX_REPORTS;
      }

      await saveReports(reports);

      return res.status(200).json({
        success: true,
        id: reportId,
        fingerprint,
        message: 'Rapport de diagnostic transmis au Dr. Ali.'
      });
    } catch (err) {
      console.error('[Telemetry POST Error]', err);
      return res.status(500).json({ success: false, error: 'Erreur interne lors de la réception du rapport.' });
    }
  });

  // Admin endpoint: List all telemetry reports
  app.get('/api/admin/telemetry', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    res.set({
      'Cache-Control': 'no-store, no-cache, must-revalidate, proxy-revalidate',
      'Pragma': 'no-cache',
      'Expires': '0'
    });
    try {
      try {
        const { syncCloudflareTelemetry } = require('../services/sync-suggestions');
        await syncCloudflareTelemetry();
      } catch (_) {}

      const reports = getReports();
      return res.status(200).json({ success: true, reports });
    } catch (err) {
      console.error('[Telemetry GET Error]', err);
      return res.status(500).json({ success: false, error: err.message });
    }
  });

  // Admin endpoint: Delete specific telemetry report
  app.delete('/api/admin/telemetry/:id', async (req, res) => {
    if (!isLocalhostConnection(req) || !checkIsAdmin(req, cache.activeTokens)) {
      return res.status(403).json({ error: 'Accès interdit.' });
    }
    try {
      const targetId = req.params.id;
      let reports = getReports();
      
      if (targetId === 'all') {
        reports = [];
      } else {
        reports = reports.filter(r => r && r.id !== targetId);
      }

      await saveReports(reports);

      // Purge from Cloudflare KV Edge to prevent background sync resurrection
      try {
        const { purgeCloudflareTelemetry } = require('../services/sync-suggestions');
        await purgeCloudflareTelemetry(targetId);
      } catch (cfErr) {
        console.warn('[Telemetry] Cloudflare telemetry purge warning:', cfErr.message);
      }

      return res.status(200).json({ success: true, message: 'Rapport supprimé.' });
    } catch (err) {
      console.error('[Telemetry DELETE Error]', err);
      return res.status(500).json({ success: false, error: err.message });
    }
  });
}

module.exports = {
  registerTelemetryRoutes,
  getReports,
  saveReports
};
