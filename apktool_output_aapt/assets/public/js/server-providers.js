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
export const PROVIDERS = [
  {
    id: 'ngrok',
    name: 'ngrok',
    // Matches any ngrok domain URL (e.g. rendition-duchess-dry.ngrok-free.dev, .ngrok.app, .ngrok.io)
    urlPattern: /ngrok(-free)?\.(app|dev|io)/i,
    // ngrok serves an HTML warning page that must be bypassed
    extraHeaders: { 'ngrok-skip-browser-warning': 'true' },
    // ngrok exposes a local management API on this port
    managementPort: 4040,
    managementPath: '/api/tunnels',
    isDevHostname: (h) => /ngrok(-free)?\.(app|dev|io)/i.test(h),
    isTunnelOrigin: (o) => o.includes('ngrok'),
    tunnelLabel: 'Tunnel',
  },
  {
    id: 'localtunnel',
    name: 'localtunnel',
    urlPattern: /loca\.lt/i,
    extraHeaders: {},
    managementPort: null,
    managementPath: null,
    isDevHostname: (h) => h.endsWith('.loca.lt'),
    isTunnelOrigin: (o) => o.includes('.loca.lt'),
    tunnelLabel: 'Tunnel',
  },
  {
    id: 'cloudflare',
    name: 'Cloudflare Tunnel',
    urlPattern: /trycloudflare\.com/i,
    extraHeaders: {},
    managementPort: null,
    managementPath: null,
    isDevHostname: (h) => h.endsWith('.trycloudflare.com'),
    isTunnelOrigin: (o) => o.includes('.trycloudflare.com'),
    tunnelLabel: 'Tunnel',
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
export function detectProvider(url) {
  if (!url) return PROVIDERS[3]; // direct
  for (const provider of PROVIDERS) {
    if (provider.urlPattern && provider.urlPattern.test(url)) {
      return provider;
    }
  }
  return PROVIDERS[3]; // direct
}

export function isTunnelUrl(url) {
  return detectProvider(url).id !== 'direct';
}

export function getExtraHeaders(url) {
  return detectProvider(url).extraHeaders || {};
}

export function isDevHostname(hostname) {
  return PROVIDERS.some(p => p.isDevHostname(hostname));
}

export function isTunnelOrigin(origin) {
  return PROVIDERS.some(p => p.isTunnelOrigin(origin));
}

export function getTunnelLabel(url) {
  return detectProvider(url).tunnelLabel;
}

// ── Primary / Fallback Provider Ordering ───────────────────
export function sortUrlsByProviderPriority(urls, primaryProviderId) {
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

export function getPrimaryProviderId(rawConfig) {
  if (!rawConfig) return null;
  if (rawConfig.primaryProvider) return rawConfig.primaryProvider;
  // Backward compat: infer from first URL if no explicit primary
  if (rawConfig.urls && rawConfig.urls.length > 0) {
    return detectProvider(rawConfig.urls[0]).id;
  }
  return null;
}
