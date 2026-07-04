// Server communication routines for Dr. CAT
// Support for both online (server-backed) mode and offline standalone (Capacitor/static) mode

import { state } from './state.js';
import { REMOTE_SERVER_URL, REMOTE_SERVER_URLS } from './remote_config.js';
import { detectProvider, getExtraHeaders, isTunnelUrl, PROVIDERS, getTunnelLabel, sortUrlsByProviderPriority, getPrimaryProviderId } from './server-providers.js';
export { REMOTE_SERVER_URL };


// Transparent wrapper to log API latencies
const originalFetch = window.fetch;
window.fetch = async function(...args) {
  const start = performance.now();
  try {
    const res = await originalFetch(...args);
    const duration = performance.now() - start;
    if (window.perf && window.perf.recordApiCall) {
      const urlStr = typeof args[0] === 'string' ? args[0] : (args[0]?.url || '');
      if (!urlStr.includes('/api/performance/server-metrics') && !urlStr.includes('/api/search-status')) {
        window.perf.recordApiCall(urlStr, res.status, duration);
      }
    }
    return res;
  } catch (err) {
    const duration = performance.now() - start;
    if (window.perf && window.perf.recordApiCall) {
      const urlStr = typeof args[0] === 'string' ? args[0] : (args[0]?.url || '');
      if (!urlStr.includes('/api/performance/server-metrics') && !urlStr.includes('/api/search-status')) {
        window.perf.recordApiCall(urlStr, 0, duration);
      }
    }
    throw err;
  }
};



export const isOfflineApp = 
  window.location.protocol === 'file:' || 
  window.location.protocol.startsWith('capacitor') ||
  window.location.hostname === '' ||
  (window.location.hostname === 'localhost' && window.location.port !== '3000' && window.location.port !== '8080') ||
  !!window.Capacitor ||
  navigator.userAgent.toLowerCase().includes('capacitor') ||
  localStorage.getItem('dr_cat_force_offline') === 'true';

console.log("[API] Offline Standalone Mode:", isOfflineApp);

// Module cache for client-side search in offline mode
let offlinePdfIndexCache = null;

/**
 * Returns the configured remote server URL (tunnel or otherwise) if one is set.
 * When this returns a URL, all API calls should go through the server even in Capacitor/offline mode.
 */
export function getRemoteServerUrl() {
  const storedOverride = localStorage.getItem('dr_cat_remote_server_url');
  const lastCompiledUrl = localStorage.getItem('dr_cat_last_compiled_url');

  if (REMOTE_SERVER_URL && lastCompiledUrl !== REMOTE_SERVER_URL) {
    // New build has a new target server URL! Clear the stale override.
    localStorage.removeItem('dr_cat_remote_server_url');
    localStorage.setItem('dr_cat_last_compiled_url', REMOTE_SERVER_URL);
    return REMOTE_SERVER_URL;
  }

  // Ensure last compiled URL is tracked if we don't have it yet
  if (REMOTE_SERVER_URL && !lastCompiledUrl) {
    localStorage.setItem('dr_cat_last_compiled_url', REMOTE_SERVER_URL);
  }

  return storedOverride || REMOTE_SERVER_URL || null;
}

/**
 * True when a remote server URL is configured — meaning the app should try to
 * sync with the server even if it is running as a Capacitor/standalone app.
 */
export function hasRemoteServer() {
  return !!getPrimaryRemoteUrl();
}

/**
 * Returns the primary remote server URL (the one configured as highest priority).
 * Use this for quick "should we sync?" checks.
 */
export function getPrimaryRemoteUrl() {
  const urls = getConfiguredRemoteUrls();
  return urls.length > 0 ? urls[0] : null;
}

function getApiUrl(endpoint, overrideUrl) {
  const configuredUrl = overrideUrl || getRemoteServerUrl();
  // On localhost, always use relative paths to avoid cross-origin requests to the tunnel URL
  const isLocal = location.hostname === 'localhost' || location.hostname === '127.0.0.1' || location.hostname === '::1';
  if (isLocal) return endpoint;
  if (isOfflineApp && configuredUrl) {
    return `${configuredUrl}${endpoint}`;
  }
  return endpoint;
}

function getConfiguredRemoteUrls() {
  const stored = localStorage.getItem('dr_cat_remote_server_url');
  if (stored) return [stored];
  
  // Load from server-generated config if available
  let config = null;
  if (typeof REMOTE_SERVER_URLS !== 'undefined' && Array.isArray(REMOTE_SERVER_URLS) && REMOTE_SERVER_URLS.length > 0) {
    config = { urls: REMOTE_SERVER_URLS };
  } else if (REMOTE_SERVER_URL) {
    config = { urls: [REMOTE_SERVER_URL] };
  }
  
  if (config && config.urls && config.urls.length > 0) {
    const primaryId = getPrimaryProviderId(config);
    return sortUrlsByProviderPriority(config.urls, primaryId);
  }
  
  return [];
}

function getHeaders(extraHeaders = {}) {
  const token = localStorage.getItem('dr_cat_admin_token');
  const configuredUrl = localStorage.getItem('dr_cat_remote_server_url') || REMOTE_SERVER_URL;
  // Use provider abstraction to determine required headers (e.g. ngrok skip-browser-warning)
  const providerExtraHeaders = getExtraHeaders(configuredUrl);
  return {
    'Content-Type': 'application/json',
    ...(token ? { 'x-admin-token': token } : {}),
    ...providerExtraHeaders,
    ...extraHeaders
  };
}
 
export async function loginAdmin(password) {
  if (isOfflineApp) {
    return { success: false, error: 'Connexion administrateur impossible en mode hors-ligne.' };
  }
 
  const res = await fetchWithTimeout('/api/login', {
    method: 'POST',
    headers: getHeaders(),
    body: JSON.stringify({ password })
  });
  const data = await res.json();
  if (res.ok && data.token) {
    localStorage.setItem('dr_cat_admin_token', data.token);
  }
  return data;
}
 
export async function logoutAdmin() {
  if (isOfflineApp) {
    localStorage.removeItem('dr_cat_admin_token');
    return;
  }
 
  try {
    await fetchWithTimeout('/api/logout', {
      method: 'POST',
      headers: getHeaders()
    });
  } catch (err) {
    console.error("Logout failed:", err);
  }
  localStorage.removeItem('dr_cat_admin_token');
}
 
export async function checkAdminStatus() {
  const token = localStorage.getItem('dr_cat_admin_token');
  if (!token) return false;
 
  try {
    const res = await fetchWithTimeout(getApiUrl('/api/is-admin'), { headers: getHeaders() });
    if (!res.ok) return false;
    const data = await res.json();
    return !!data.isAdmin;
  } catch (err) {
    console.error("Failed to check admin status:", err);
    return false;
  }
}
 
export async function checkIsLocal() {
  if (isOfflineApp) {
    return true; // Standalone app is always "local" to the device
  }
  
  try {
    const res = await fetchWithTimeout('/api/is-local', { headers: getHeaders() });
    const data = await res.json();
    return !!data.isLocal;
  } catch (err) {
    console.error("Failed to check local status:", err);
    // Fallback: check hostname client-side as well
    const host = window.location.hostname;
    return host === 'localhost' || host === '127.0.0.1' || host === '::1';
  }
}

// Shared fetch helper with strict timeout to prevent indefinite hangs
const FETCH_TIMEOUT_MS = 8000;
async function fetchWithTimeout(url, options = {}) {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), FETCH_TIMEOUT_MS);
  try {
    const res = await fetch(url, { ...options, signal: controller.signal });
    clearTimeout(timeoutId);
    return res;
  } catch (err) {
    clearTimeout(timeoutId);
    if (err.name === 'AbortError') {
      throw new Error(`Request timed out after ${FETCH_TIMEOUT_MS}ms: ${url}`);
    }
    throw err;
  }
}

export async function fetchCats() {
  // Try each configured remote server URL in order (failover support)
  const remoteUrls = getConfiguredRemoteUrls();
  for (const remoteUrl of remoteUrls) {
    try {
      const res = await fetchWithTimeout(getApiUrl('/api/cats', remoteUrl), { headers: getHeaders() });
      if (res.ok) {
        const data = await res.json();
        console.log('[API] fetchCats: loaded from remote server ' + remoteUrl + ' (' + data.length + ' CATs)');
        return data;
      }
    } catch (err) {
      console.warn('[API] fetchCats: remote server ' + remoteUrl + ' unreachable, trying next...', err.message);
    }
  }

  // Fallback: use the bundled static database (Capacitor app / no server)
  if (isOfflineApp) {
    const res = await fetchWithTimeout('data/cats_db.json');
    if (!res.ok) throw new Error('Failed to fetch CATs statically');
    return res.json();
  }

  const res = await fetchWithTimeout('/api/cats', { headers: getHeaders() });
  if (!res.ok) throw new Error('Failed to fetch CATs');
  return res.json();
}

export async function fetchPdfs() {
  if (isOfflineApp) {
    // Load only the list of filenames instead of the heavy index structure containing all parsed texts
    const res = await fetchWithTimeout('data/pdf_list.json');
    if (!res.ok) throw new Error("Failed to fetch PDFs list statically");
    return res.json();
  }

  const res = await fetchWithTimeout('/api/pdfs', { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch PDFs");
  return res.json();
}

export async function saveCatDataToServer(id, data) {
  // Admin action: always use local server. Admin is localhost-only, never tunnel.
  try {
    const res = await fetchWithTimeout(`/api/cats/${id}`, {
      method: 'POST',
      headers: getHeaders(),
      body: JSON.stringify(data)
    });
    if (res.ok) return res.json();
  } catch (err) {
    console.warn('[API] saveCatDataToServer failed:', err.message);
  }

  // Fallback: save to local overrides (persisted to localStorage)
  const localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
  if (!localOverrides[id]) localOverrides[id] = {};
  if (data.summary !== undefined) localOverrides[id].customSummary = data.summary;
  if (data.ordonnance !== undefined) localOverrides[id].customOrdonnance = data.ordonnance;
  localStorage.setItem('dr_cat_local_overrides', JSON.stringify(localOverrides));
  return { success: true, message: "Modifications enregistrées localement." };
}

export async function deleteCatFromServer(id) {
  // Admin action: always use local server. Admin is localhost-only, never tunnel.
  try {
    const res = await fetchWithTimeout(`/api/cats/${id}`, {
      method: 'DELETE',
      headers: getHeaders()
    });
    if (res.ok) return res.json();
  } catch (err) {
    console.warn('[API] deleteCatFromServer failed:', err.message);
  }

  // Fallback: mark as deleted in local storage overrides
  const localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
  if (!localOverrides[id]) localOverrides[id] = {};
  localOverrides[id].deleted = true;
  localStorage.setItem('dr_cat_local_overrides', JSON.stringify(localOverrides));
  return { success: true, message: "Fiche supprimée localement." };
}

export async function createCatOnServer(catData) {
  // Admin action: always use local server. Admin is localhost-only, never tunnel.
  try {
    const res = await fetchWithTimeout('/api/cats', {
      method: 'POST',
      headers: getHeaders(),
      body: JSON.stringify(catData)
    });
    if (res.ok) return res.json();
  } catch (err) {
    console.warn('[API] createCatOnServer failed:', err.message);
  }
  return { success: false, error: err?.message || "Failed to create CAT" };
}

export async function updateCatOverrides(id, data) {
  // Fallback: save to local overrides (persisted to localStorage)
  const localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
  if (!localOverrides[id]) localOverrides[id] = {};
  if (data.summary !== undefined) localOverrides[id].customSummary = data.summary;
  if (data.ordonnance !== undefined) localOverrides[id].customOrdonnance = data.ordonnance;
  localStorage.setItem('dr_cat_local_overrides', JSON.stringify(localOverrides));
  return { success: true, message: "Modifications enregistrées localement." };
}

export async function submitSuggestion(suggestionData, onAttempt) {
  if (!isOfflineApp || hasRemoteServer()) {
    let attempts = 0;
    const maxAttempts = 3;
    const delayBetweenAttempts = 1200; // Wait 1.2s between retries

    while (attempts < maxAttempts) {
      attempts++;
      if (onAttempt) onAttempt(attempts);

      try {
        const res = await fetchWithTimeout(getApiUrl('/api/suggestions'), {
          method: 'POST',
          headers: getHeaders(),
          body: JSON.stringify(suggestionData)
        });
        if (res.ok) {
          return await res.json();
        }
        const errorData = await res.json().catch(() => ({}));
        if (res.status >= 400 && res.status < 500) {
          return { success: false, error: errorData.error || "Erreur client lors de l'envoi." };
        }
      } catch (err) {
        console.warn(`[API] submitSuggestion: attempt ${attempts} failed.`, err.message);
      }

      if (attempts < maxAttempts) {
        await new Promise(resolve => setTimeout(resolve, delayBetweenAttempts));
      }
    }

    return { success: false, error: "Le serveur est de garde ou injoignable après 3 tentatives. Proposition annulée." };
  }

  return { success: false, error: "L'application fonctionne en mode hors-ligne. Les propositions de fiches nécessitent une connexion au serveur." };
}

export async function fetchSuggestions() {
  // Admin action: always use local server. Admin is localhost-only, never tunnel.
  const res = await fetchWithTimeout('/api/suggestions', { headers: getHeaders() });
  if (res.status === 403) throw new Error('403 Forbidden');
  if (!res.ok) throw new Error('Failed to fetch suggestions');
  return res.json();
}

export async function approveSuggestionOnServer(id) {
  const res = await fetchWithTimeout(getApiUrl(`/api/suggestions/${id}/approve`), { 
    method: 'POST',
    headers: getHeaders()
  });
  if (res.status === 403) throw new Error('403 Forbidden');
  if (!res.ok) throw new Error('Failed to approve suggestion');
  return res.json();
}

export async function rejectSuggestionOnServer(id) {
  const res = await fetchWithTimeout(getApiUrl(`/api/suggestions/${id}/reject`), { 
    method: 'POST',
    headers: getHeaders()
  });
  if (res.status === 403) throw new Error('403 Forbidden');
  if (!res.ok) throw new Error('Failed to reject suggestion');
  return res.json();
}

export async function updateSuggestionOnServer(id, updatedData) {
  const res = await fetchWithTimeout(getApiUrl(`/api/suggestions/${id}/edit`), { 
    method: 'POST',
    headers: getHeaders({ 'Content-Type': 'application/json' }),
    body: JSON.stringify({ data: updatedData })
  });
  if (res.status === 403) throw new Error('403 Forbidden');
  if (!res.ok) throw new Error('Failed to update suggestion');
  return res.json();
}

export async function fetchSearchStatus() {
  if (hasRemoteServer()) {
    try {
      const res = await fetchWithTimeout(getApiUrl('/api/search-status'), { headers: getHeaders() });
      if (res.ok) return res.json();
    } catch (_) {}
  }

  if (isOfflineApp) {
    return { isIndexing: false, totalFiles: 76, indexedFiles: 76, currentFile: '' };
  }

  const res = await fetchWithTimeout('/api/search-status', { headers: getHeaders() });
  if (!res.ok) throw new Error('Failed to fetch search status');
  return res.json();
}

export async function searchPdfsContent(query) {
  if (isOfflineApp) {
    try {
      if (!offlinePdfIndexCache) {
        const indexRes = await fetch('data/pdf_index.json');
        if (!indexRes.ok) throw new Error("Failed to load PDF index");
        offlinePdfIndexCache = await indexRes.json();
      }
      
      const cleanQuery = query.trim().toLowerCase();
      const results = [];
      
      for (const doc of offlinePdfIndexCache) {
        if (!doc.pages) continue;
        for (const p of doc.pages) {
          if (!p.text) continue;
          const textLower = p.text.toLowerCase();
          let indexMatch = textLower.indexOf(cleanQuery);
          if (indexMatch !== -1) {
            const start = Math.max(0, indexMatch - 60);
            const end = Math.min(p.text.length, indexMatch + cleanQuery.length + 60);
            let snippet = p.text.substring(start, end);
            if (start > 0) snippet = '...' + snippet;
            if (end < p.text.length) snippet = snippet + '...';
            
            results.push({
              pdf: doc.pdf,
              page: p.page,
              snippet: snippet
            });
            if (results.length >= 100) break;
          }
        }
        if (results.length >= 100) break;
      }
      
      return {
        ok: true,
        json: async () => ({ results })
      };
    } catch (err) {
      console.error("Offline search error:", err);
      return {
        ok: false,
        json: async () => ({ error: "Failed to search offline", results: [] })
      };
    }
  }

  const res = await fetchWithTimeout(`/api/search-pdfs?q=${encodeURIComponent(query)}`, {
    headers: getHeaders()
  });
  return res;
}

export async function triggerReindexing() {
  if (isOfflineApp) {
    return { success: true, message: "La ré-indexation n'est pas prise en charge hors-ligne." };
  }

  const res = await fetchWithTimeout('/api/reindex', { 
    method: 'POST',
    headers: getHeaders()
  });
  if (res.status === 403) throw new Error("403 Forbidden");
  if (!res.ok) throw new Error("Failed to trigger reindexing");
  return res.json();
}

export async function fetchPdfIndexStatus() {
  if (isOfflineApp) {
    try {
      const indexRes = await fetch('data/pdf_index.json');
      if (!indexRes.ok) throw new Error("Failed to load PDF index for status calculation");
      const index = await indexRes.json();
      
      const statusMap = {};
      for (const doc of index) {
        const totalPages = doc.pages ? doc.pages.length : 0;
        const pagesWithText = doc.pages ? doc.pages.filter(p => p.text && p.text.trim().length > 15).length : 0;
        
        let status = 'red';
        if (totalPages > 0) {
          const ratio = pagesWithText / totalPages;
          if (ratio >= 0.90) {
            status = 'green';
          } else if (ratio >= 0.05) {
            status = 'orange';
          }
        }
        statusMap[doc.pdf] = {
          status,
          pagesWithText,
          totalPages
        };
      }
      return statusMap;
    } catch (err) {
      console.error("Failed to calculate offline PDF status map:", err);
      return {};
    }
  }

  // Server mode: fetch pre-calculated status from API
  try {
    const res = await fetchWithTimeout('/api/pdf-index-status', { headers: getHeaders() });
    if (!res.ok) throw new Error("Failed to fetch PDF index status from server");
    return res.json();
  } catch (err) {
    console.error("Error fetching PDF status map from server:", err);
    return {};
  }
}

export function hasRemoteServerConfigured() {
  return typeof REMOTE_SERVER_URL === 'string' && REMOTE_SERVER_URL.trim().length > 0;
}

export async function checkRealConnection() {
  // On localhost, skip remote URL ping to avoid unnecessary cross-origin noise
  const isLocal = location.hostname === 'localhost' || location.hostname === '127.0.0.1' || location.hostname === '::1';
  if (isLocal) {
    return navigator.onLine;
  }

  const configuredUrls = getConfiguredRemoteUrls();
  
  for (const configuredUrl of configuredUrls) {
    try {
      const controller = new AbortController();
      const id = setTimeout(() => controller.abort(), 3000);
      const providerHeaders = getExtraHeaders(configuredUrl);
      const res = await fetch(`${configuredUrl}/api/search-status`, {
        signal: controller.signal,
        headers: { ...getHeaders(), ...providerHeaders }
      });
      clearTimeout(id);
      if (res.ok) return true;
      // If we got a response but not ok (e.g. tunnel HTML challenge page) fall through to WAN check
    } catch (_) {
      // Connection failed, try next configured URL
    }
  }

  // WAN connectivity fallback ping — use a simpler endpoint that doesn't require CORS
  try {
    const controller = new AbortController();
    const id = setTimeout(() => controller.abort(), 3000);
    await fetchWithTimeout('https://httpbin.org/get', {
      method: 'HEAD',
      mode: 'no-cors',
      signal: controller.signal
    });
    clearTimeout(id);
    return true;
  } catch (_) {
    return false;
  }
}

export async function pingEndpoint(url, timeoutMs = 2500) {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeoutMs);
  try {
    // Determine headers and mode depending on URL type
    const provider = detectProvider(url);
    const providerHeaders = getExtraHeaders(url);
    const isCorsSafePing = url.includes('httpbin.org') || url.includes('localhost') || url.includes('127.0.0.1');
    const fetchOpts = {
      method: 'GET',
      signal: controller.signal,
      headers: {
        ...(isCorsSafePing ? getHeaders() : {}),
        ...providerHeaders
      }
    };
    
    // For general external domains we want to avoid getting blocked by CORS if they don't support custom headers
    if (!isCorsSafePing) {
      fetchOpts.mode = 'cors';
    }

    const res = await fetch(url, fetchOpts);
    clearTimeout(timeoutId);
    return {
      ok: res.ok,
      status: res.status,
      statusText: res.statusText
    };
  } catch (err) {
    clearTimeout(timeoutId);
    let message = err.message || 'Unknown network error';
    if (err.name === 'AbortError') {
      message = `Request timed out after ${timeoutMs}ms`;
    }
    return {
      ok: false,
      status: 0,
      statusText: 'Error',
      error: err,
      message
    };
  }
}

export async function fetchDiagnosticsSystem() {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/system'), { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch system diagnostics");
  return res.json();
}

export async function fetchDiagnosticsDbStats() {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/db-stats'), { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch DB stats");
  return res.json();
}

export async function fetchDiagnosticsIndexDetail() {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/index-detail'), { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch index details");
  return res.json();
}

export async function fetchDiagnosticsRemoteUrl() {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/remote-server-url'), { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch remote server URL");
  return res.json();
}

export async function updateDiagnosticsRemoteUrl(url) {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/remote-server-url'), {
    method: 'POST',
    headers: getHeaders({ 'Content-Type': 'application/json' }),
    body: JSON.stringify({ url })
  });
  if (!res.ok) {
    const errData = await res.json().catch(() => ({}));
    throw new Error(errData.error || "Failed to update remote server URL");
  }
  return res.json();
}

export async function fetchTunnelInfo() {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/tunnel-info'), { headers: getHeaders() });
  if (!res.ok) {
    const errData = await res.json().catch(() => ({}));
    throw new Error(errData.error || "Failed to fetch tunnel info");
  }
  return res.json();
}

export async function fetchServerMetrics() {
  const res = await fetchWithTimeout(getApiUrl('/api/performance/server-metrics'), { headers: getHeaders() });
  if (!res.ok) {
    const errData = await res.json().catch(() => ({}));
    throw new Error(errData.error || "Failed to fetch server metrics");
  }
  return res.json();
}
