// Single source of truth for the server-provider list (remote_server_config.json).
//
// The server owns the list of remote servers (primary + failover + pools).
// The client only LEARNS this list via GET /api/server-providers; it never
// authors it. This replaces the previous 3-source mess (disk file / compiled
// remote_config.js / localStorage override).
//
// Config shape (new, explicit):
//   { "primaryProvider": "ngrok",
//     "servers": [ { "url": "...", "provider": "ngrok", "priority": 1 }, ... ] }
// Backward compatible with the old { "urls": [...], "primaryProvider" } and
// { "url": "..." } shapes.
const fs = require('fs');
const path = require('path');
const { detectProvider } = require('../config/providers');

const CONFIG_FILE = path.join(__dirname, '..', '..', 'remote_server_config.json');

let config = { primaryProvider: null, servers: [] };
// url -> { ok, latencyMs, lastCheck }  (populated by Phase 2 health tracking)
const health = new Map();

function normalize(raw) {
  raw = raw || {};
  const out = { primaryProvider: raw.primaryProvider || null, servers: [] };

  if (Array.isArray(raw.servers) && raw.servers.length) {
    out.servers = raw.servers
      .map((s, i) => {
        const url = typeof s === 'string' ? s : (s && s.url);
        if (!url || typeof url !== 'string') return null;
        const provider = (typeof s === 'object' && s.provider) || detectProvider(url).id;
        const priority = (typeof s === 'object' && Number.isFinite(s.priority)) ? s.priority : (i + 1);
        return { url: String(url).trim(), provider, priority };
      })
      .filter(Boolean);
  } else if (Array.isArray(raw.urls)) {
    out.servers = raw.urls
      .map((u, i) => ({ url: String(u).trim(), provider: detectProvider(u).id, priority: i + 1 }))
      .filter(s => s.url);
  } else if (raw.url) {
    out.servers = [{ url: String(raw.url).trim(), provider: detectProvider(raw.url).id, priority: 1 }];
  }

  if (!out.primaryProvider && out.servers.length) {
    out.primaryProvider = out.servers[0].provider;
  }
  return out;
}

function loadConfig() {
  try {
    if (fs.existsSync(CONFIG_FILE)) {
      config = normalize(JSON.parse(fs.readFileSync(CONFIG_FILE, 'utf-8')));
    }
  } catch (err) {
    console.error('[ServerProviders] Failed to load config:', err.message);
  }
  return config;
}

function saveConfig(next) {
  config = normalize(next);
  const payload = {
    primaryProvider: config.primaryProvider,
    servers: config.servers.map(s => ({ url: s.url, provider: s.provider, priority: s.priority }))
  };
  fs.writeFileSync(CONFIG_FILE, JSON.stringify(payload, null, 2) + '\n', 'utf-8');
  return config;
}

function getConfig() { return config; }
function getServers() { return config.servers.slice().sort((a, b) => a.priority - b.priority); }
function getConfiguredUrls() { return getServers().map(s => s.url); }
function getPrimaryProviderId() { return config.primaryProvider; }

function recordHealth(url, ok, latencyMs) {
  if (!url) return;
  health.set(url, { ok, latencyMs: latencyMs || 0, lastCheck: Date.now() });
}
function getHealth(url) { return health.get(url); }

module.exports = {
  CONFIG_FILE,
  loadConfig,
  saveConfig,
  getConfig,
  getServers,
  getConfiguredUrls,
  getPrimaryProviderId,
  recordHealth,
  getHealth
};
