// Helper to sync pending suggestions from Cloudflare KV storage into local Termux suggestions.json
const https = require('https');
const path = require('path');
const { state: cache } = require('./cache');
const { safeWriteJsonAsync } = require('./data-store');

const SUGGESTIONS_FILE = path.join(__dirname, '..', '..', 'suggestions.json');
const CLOUDFLARE_URL = 'https://drcat.is-an-app.workers.dev/api/suggestions';

// Shared secret for worker server-to-server routes (set in .env AND Cloudflare Worker vars)
function syncHeaders(extra = {}) {
  const headers = { 'User-Agent': 'Node-Termux-Sync', ...extra };
  if (process.env.SYNC_SECRET) {
    headers['x-sync-secret'] = process.env.SYNC_SECRET;
  }
  return headers;
}

async function ackCloudflareSuggestions(syncedIds) {
  if (!Array.isArray(syncedIds) || syncedIds.length === 0) return;
  return new Promise((resolve) => {
    const payload = JSON.stringify({ ids: syncedIds });
    const req = https.request(`${CLOUDFLARE_URL}/ack`, {
      method: 'POST',
      timeout: 10000,
      headers: syncHeaders({
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(payload)
      })
    }, () => resolve());
    req.setTimeout(10000, () => { req.destroy(); resolve(); });
    req.on('error', () => resolve());
    req.write(payload);
    req.end();
  });
}

async function syncCloudflareSuggestions() {
  if (!process.env.SYNC_SECRET) {
    console.warn('[CloudSync] SYNC_SECRET non défini — le worker refusera la synchronisation (503/403). Ajoutez-le dans .env et dans les variables du Worker.');
  }
  return new Promise((resolve) => {
    const req = https.get(CLOUDFLARE_URL, { headers: syncHeaders(), timeout: 10000 }, (res) => {
      let rawData = '';
      res.on('data', chunk => rawData += chunk);
      res.on('end', async () => {
        try {
          if (res.statusCode === 200) {
            const cloudSuggestions = JSON.parse(rawData);
            if (Array.isArray(cloudSuggestions) && cloudSuggestions.length > 0) {
              let addedCount = 0;
              const syncedIds = [];
              for (const cs of cloudSuggestions) {
                if (!cs || !cs.id) continue;
                syncedIds.push(cs.id);
                const exists = cache.suggestionsCache.some(ls => ls.id === cs.id);
                if (!exists) {
                  cache.suggestionsCache.unshift(cs);
                  addedCount++;
                }
              }
              if (addedCount > 0) {
                await safeWriteJsonAsync(SUGGESTIONS_FILE, cache.suggestionsCache);
                console.log(`[CloudSync] Synced ${addedCount} new suggestion(s) from Cloudflare KV.`);
              }
              if (syncedIds.length > 0) {
                await ackCloudflareSuggestions(syncedIds);
              }
            }
          }
        } catch (e) {
          // Ignore sync errors gracefully
        }
        resolve();
      });
    });
    req.setTimeout(10000, () => { req.destroy(); resolve(); });
    req.on('error', () => resolve());
  });
}

async function purgeCloudflareSuggestion(id) {
  if (!id) return;
  return new Promise((resolve) => {
    const req = https.request(`${CLOUDFLARE_URL}/${encodeURIComponent(id)}`, {
      method: 'DELETE',
      timeout: 10000,
      headers: syncHeaders()
    }, () => resolve());
    req.setTimeout(10000, () => { req.destroy(); resolve(); });
    req.on('error', () => resolve());
    req.end();
  });
}

const CLOUDFLARE_TELEMETRY_URL = 'https://drcat.is-an-app.workers.dev/api/telemetry';
const TELEMETRY_FILE = path.join(__dirname, '..', 'data', 'telemetry_reports.json');

function getCloudflareBaseUrl() {
  try {
    const { getServers } = require('./server-providers-config');
    const servers = getServers();
    const cf = servers.find(s => s.provider === 'cloudflare') || servers.find(s => s.url && (s.url.includes('workers.dev') || s.url.includes('pages.dev')));
    if (cf && cf.url) return cf.url.replace(/\/+$/, '');
  } catch (_) {}
  return 'https://drcat.is-an-app.workers.dev';
}

async function syncCloudflareActiveDevices() {
  if (!process.env.SYNC_SECRET || process.env.NODE_ENV === 'test') return { success: false, synced: 0 };
  const base = getCloudflareBaseUrl();
  const url = `${base}/api/active-devices`;
  return new Promise((resolve) => {
    const req = https.get(url, { headers: syncHeaders(), timeout: 10000 }, (res) => {
      let rawData = '';
      res.on('data', chunk => rawData += chunk);
      res.on('end', async () => {
        try {
          if (res.statusCode === 200) {
            const parsed = JSON.parse(rawData);
            const devices = parsed.devices || {};
            const { recordExternalCloudDevices } = require('./active-devices');
            const count = recordExternalCloudDevices(devices);
            if (count > 0) {
              console.log(`[CloudSync] Synced ${count} active device(s) from Cloudflare Edge KV.`);
            }
            resolve({ success: true, synced: count });
            return;
          }
        } catch (_) {}
        resolve({ success: false, synced: 0 });
      });
    });
    req.setTimeout(10000, () => { req.destroy(); resolve({ success: false, synced: 0 }); });
    req.on('error', () => resolve({ success: false, synced: 0 }));
  });
}

async function resetCloudflareActiveDevices() {
  if (!process.env.SYNC_SECRET) return { success: false };
  const base = getCloudflareBaseUrl();
  const url = `${base}/api/active-devices/reset`;
  return new Promise((resolve) => {
    const req = https.request(url, { method: 'POST', headers: syncHeaders(), timeout: 10000 }, (res) => {
      resolve({ success: res.statusCode === 200 });
    });
    req.setTimeout(10000, () => { req.destroy(); resolve({ success: false }); });
    req.on('error', () => resolve({ success: false }));
    req.end();
  });
}

async function syncCloudflareTelemetry() {
  if (!process.env.SYNC_SECRET || process.env.NODE_ENV === 'test') return;
  return new Promise((resolve) => {
    const req = https.get(CLOUDFLARE_TELEMETRY_URL, { headers: syncHeaders(), timeout: 10000 }, (res) => {
      let rawData = '';
      res.on('data', chunk => rawData += chunk);
      res.on('end', async () => {
        try {
          if (res.statusCode === 200) {
            const cloudReports = JSON.parse(rawData);
            if (Array.isArray(cloudReports) && cloudReports.length > 0) {
              const { getReports, saveReports } = require('../routes/telemetry');
              const localReports = getReports();
              let addedCount = 0;
              for (const cr of cloudReports) {
                if (!cr || !cr.id) continue;
                const exists = localReports.some(lr => lr.id === cr.id);
                if (!exists) {
                  localReports.unshift(cr);
                  addedCount++;
                }
              }
              if (addedCount > 0) {
                if (localReports.length > 100) localReports.length = 100;
                await saveReports(localReports);
                console.log(`[CloudSync] Synced ${addedCount} telemetry report(s) from Cloudflare KV.`);
              }
            }
          }
        } catch (_) {}
        resolve();
      });
    });
    req.setTimeout(10000, () => { req.destroy(); resolve(); });
    req.on('error', () => resolve());
  });
}

module.exports = {
  syncCloudflareSuggestions,
  purgeCloudflareSuggestion,
  ackCloudflareSuggestions,
  syncCloudflareTelemetry,
  syncCloudflareActiveDevices,
  resetCloudflareActiveDevices
};
