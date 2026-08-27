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

function registerTelemetryRoutes(app) {
  // Public endpoint for crash & log reporting
  app.post('/api/telemetry', async (req, res) => {
    try {
      const body = req.body || {};
      const reportId = `tel_${Date.now()}_${Math.random().toString(36).substring(2, 9)}`;
      
      const newReport = {
        id: reportId,
        timestamp: Date.now(),
        type: body.type || 'unhandled_error',
        error: String(body.error || 'Erreur non spécifiée').substring(0, 1000),
        stack: String(body.stack || '').substring(0, 5000),
        device: typeof body.device === 'object' && body.device !== null ? body.device : {},
        appVersion: String(body.appVersion || 'inconnu').substring(0, 20),
        installId: String(body.installId || '').substring(0, 50),
        logs: Array.isArray(body.logs) ? body.logs.slice(-50) : [],
        userNote: String(body.userNote || '').substring(0, 500),
        ip: req.ip || req.headers['x-forwarded-for'] || 'unknown'
      };

      const reports = getReports();
      reports.unshift(newReport);
      
      if (reports.length > MAX_REPORTS) {
        reports.length = MAX_REPORTS;
      }

      await saveReports(reports);

      return res.status(200).json({
        success: true,
        id: reportId,
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
