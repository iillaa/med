/**
 * Server Provider Registry
 * 
 * Abstraction layer for public-access providers (ngrok, Cloudflare Tunnel,
 * localtunnel, direct host, etc.). All provider-specific logic — URL patterns,
 * required headers, management API endpoints, dev-mode detection — lives here
 * instead of being scattered across api.js, main.js, server.js, and diagnostics.
 * 
 * To add a new provider: append one object to PROVIDERS. No other file changes.
 */

// ── Provider Definitions ───────────────────────────────────
const PROVIDERS = [
  {
    id: 'ngrok',
    name: 'ngrok',
    urlPattern: /^(?:https?:\/\/)?(?:[^\/]+\.)?ngrok(-free)?\.(app|dev|io)(?:[:\/]|$)/i,
    // ngrok serves an HTML warning page that must be bypassed
    extraHeaders: { 'ngrok-skip-browser-warning': 'true' },
    // ngrok exposes a local management API on this port
    managementPort: 4040,
    managementPath: '/api/tunnels',
    isDevHostname: (h) => /(?:^|\.)ngrok(-free)?\.(app|dev|io)$/i.test(h),
    isTunnelOrigin: (o) => /(?:^|\.)ngrok(-free)?\.(app|dev|io)(?::\d+)?$/i.test(o.replace(/^https?:\/\//, '')),
    tunnelLabel: 'Tunnel',
  },
  {
    id: 'localtunnel',
    name: 'localtunnel',
    urlPattern: /^(?:https?:\/\/)?(?:[^\/]+\.)?loca\.lt(?:[:\/]|$)/i,
    extraHeaders: {},
    managementPort: null,
    managementPath: null,
    isDevHostname: (h) => /(?:^|\.)loca\.lt$/i.test(h),
    isTunnelOrigin: (o) => /(?:^|\.)loca\.lt(?::\d+)?$/i.test(o.replace(/^https?:\/\//, '')),
    tunnelLabel: 'Tunnel',
  },
  {
    id: 'cloudflare',
    name: 'Cloudflare Tunnel',
    urlPattern: /^(?:https?:\/\/)?(?:[^\/]+\.)?(?:trycloudflare\.com|cfargotunnel\.com|pages\.dev|is-an\.app|is-a\.dev)(?:[:\/]|$)/i,
    extraHeaders: {},
    managementPort: null,
    managementPath: null,
    isDevHostname: (h) => /(?:^|\.)(?:trycloudflare\.com|cfargotunnel\.com|pages\.dev|is-an\.app|is-a\.dev)$/i.test(h),
    isTunnelOrigin: (o) => /(?:^|\.)(?:trycloudflare\.com|cfargotunnel\.com|pages\.dev|is-an\.app|is-a\.dev)(?::\d+)?$/i.test(o.replace(/^https?:\/\//, '')),
    tunnelLabel: 'Cloudflare',
  },
  {
    id: 'direct',
    name: 'Direct Host',
    urlPattern: null, // matches everything else
    extraHeaders: {},
    managementPort: null,
    managementPath: null,
    isDevHostname: () => false,
    isTunnelOrigin: () => false,
    tunnelLabel: 'Serveur direct',
  }
];

// ── Detection Helpers ──────────────────────────────────────
function detectProvider(url) {
  if (!url) return PROVIDERS[3]; // direct
  for (const provider of PROVIDERS) {
    if (provider.urlPattern && provider.urlPattern.test(url)) {
      return provider;
    }
  }
  return PROVIDERS[3]; // direct
}

function isTunnelUrl(url) {
  return detectProvider(url).id !== 'direct';
}

function getExtraHeaders(url) {
  return detectProvider(url).extraHeaders || {};
}

function isDevHostname(hostname) {
  return PROVIDERS.some(p => p.isDevHostname(hostname));
}

function isTunnelOrigin(origin) {
  return PROVIDERS.some(p => p.isTunnelOrigin(origin));
}

function getTunnelLabel(url) {
  return detectProvider(url).tunnelLabel;
}

// ── Primary / Fallback Provider Ordering ───────────────────
function sortUrlsByProviderPriority(urls, primaryProviderId) {
  if (!primaryProviderId || !urls || urls.length === 0) return urls || [];
  const primaryPattern = PROVIDERS.find(p => p.id === primaryProviderId)?.urlPattern;
  if (!primaryPattern) return urls;
  
  const primary = [];
  const fallbacks = [];
  for (const url of urls) {
    if (primaryPattern.test(url)) {
      primary.push(url);
    } else {
      fallbacks.push(url);
    }
  }
  return [...primary, ...fallbacks];
}

function getPrimaryProviderId(rawConfig) {
  if (!rawConfig) return null;
  if (rawConfig.primaryProvider) return rawConfig.primaryProvider;
  // Backward compat: infer from first URL if no explicit primary
  if (rawConfig.urls && rawConfig.urls.length > 0) {
    return detectProvider(rawConfig.urls[0]).id;
  }
  return null;
}


module.exports = {
  PROVIDERS,
  detectProvider,
  isTunnelUrl,
  getExtraHeaders,
  isDevHostname,
  isTunnelOrigin,
  getPrimaryProviderId,
  sortUrlsByProviderPriority
};
