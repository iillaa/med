const { PROVIDERS: serverProviders, detectProvider } = require('../../public/js/server-providers.cjs');

function getProviderHeaders(provider) {
  return provider.extraHeaders || {};
}

function getManagementEndpoint(provider) {
  if (provider.managementPort && provider.managementPath) {
    return { hostname: '127.0.0.1', port: provider.managementPort, path: provider.managementPath };
  }
  return null;
}

function buildAllowedOrigins(providers, configuredUrls) {
  const origins = new Set([
    'http://localhost:3000',
    'http://127.0.0.1:3000',
    'http://localhost:8080',
    'http://127.0.0.1:8080',
  ]);
  for (const url of configuredUrls) {
    if (!url) continue;
    origins.add(url);
    const provider = detectProvider(url);
    if (provider.isTunnelOrigin) {
      const pattern = provider.urlPattern;
      if (pattern) {
        const urlObj = new URL(url);
        const hostname = urlObj.hostname;
        origins.add(hostname);
      }
    }
  }
  for (const url of configuredUrls) {
    if (!url) continue;
    try {
      const urlObj = new URL(url);
      origins.add(`${urlObj.protocol}//${urlObj.hostname}`);
    } catch (_) { /* no-op */ }
  }
  return origins;
}

function isOriginAllowedDynamic(origin, allowedOrigins) {
  if (!origin) return true;
  if (
    origin === 'http://localhost' || origin === 'https://localhost' ||
    origin === 'capacitor://localhost' ||
    origin.startsWith('http://localhost:') || origin.startsWith('https://localhost:') ||
    origin.startsWith('http://127.0.0.1:') || origin.startsWith('https://127.0.0.1:')
  ) {
    return true;
  }
  if (allowedOrigins.has(origin)) return true;
  for (const allowed of allowedOrigins) {
    if (allowed.includes('*')) {
      const regex = new RegExp('^' + allowed.replace(/\*/g, '.*') + '$');
      if (regex.test(origin)) return true;
    }
  }
  return false;
}

module.exports = {
  serverProviders,
  detectProvider,
  getProviderHeaders,
  getManagementEndpoint,
  buildAllowedOrigins,
  isOriginAllowedDynamic
};
