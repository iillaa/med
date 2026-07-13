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

const APP_BUILD_VERSION = document.querySelector('meta[name="app-build-version"]')?.content || '0';
const SYNC_CACHE_KEY = `dr_cat_synced_database_v${APP_BUILD_VERSION}`;



export const isOfflineApp = 
  window.location.protocol === 'file:' || 
  window.location.protocol.startsWith('capacitor') ||
  window.location.hostname === '' ||
  (window.location.hostname === 'localhost' && window.location.port !== '3000' && window.location.port !== '8080') ||
  !!window.Capacitor ||
  navigator.userAgent.toLowerCase().includes('capacitor') ||
  localStorage.getItem('dr_cat_force_offline') === 'true';

console.log("[API] Offline Standalone Mode:", isOfflineApp);

// ── Clean App Mode Detection ──────────────────────────────
export const APP_MODES = {
  ADMIN_LOCAL: 'admin_local',
  WEB_CLIENT: 'web_client',
  ANDROID_ONLINE: 'android_online',
  ANDROID_OFFLINE: 'android_offline'
};

let _cachedAppMode = null;

export function getAppMode() {
  if (_cachedAppMode) return _cachedAppMode;

  const isCapacitor = !!window.Capacitor || navigator.userAgent.includes('Capacitor');
  const hostname = window.location.hostname;
  const isLocalhost = hostname === 'localhost' || hostname === '127.0.0.1' || hostname === '::1';

  // In Capacitor/Android WebView, navigator.onLine is often unreliable.
  // Default to ANDROID_OFFLINE and let actual fetch attempts determine reachability.
  if (isCapacitor) {
    _cachedAppMode = APP_MODES.ANDROID_OFFLINE;
    console.log(`[App Mode] Detected (Capacitor): ${_cachedAppMode} (Host: ${hostname}). navigator.onLine ignored.`);
    return _cachedAppMode;
  }

  if (isLocalhost) {
    _cachedAppMode = APP_MODES.ADMIN_LOCAL;
  } else {
    _cachedAppMode = APP_MODES.WEB_CLIENT;
  }

  console.log(`[App Mode] Detected: ${_cachedAppMode} (Host: ${hostname}).`);
  return _cachedAppMode;
}

export function setAppMode(mode) {
  const oldMode = _cachedAppMode;
  _cachedAppMode = mode;
  if (oldMode !== mode) {
    console.log(`[API] App Mode changed from ${oldMode} to ${mode}`);
    window.dispatchEvent(new CustomEvent('drcat-app-mode-changed', { detail: { oldMode, mode } }));
  }
}




// Permission helpers
export function canEditDirectly() {
  return getAppMode() === APP_MODES.ADMIN_LOCAL;
}
export function canSuggest() {
  return [APP_MODES.WEB_CLIENT, APP_MODES.ANDROID_ONLINE].includes(getAppMode());
}
export function canSync() {
  return [APP_MODES.WEB_CLIENT, APP_MODES.ANDROID_ONLINE].includes(getAppMode());
}
export function isAdminMode() {
  return getAppMode() === APP_MODES.ADMIN_LOCAL;
}


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
  // On localhost web browser (not standalone Capacitor app), use relative paths to avoid cross-origin requests to the tunnel URL
  const isLocalWebBrowser = !isOfflineApp && (location.hostname === 'localhost' || location.hostname === '127.0.0.1' || location.hostname === '::1');
  if (isLocalWebBrowser) return endpoint;
  if (isOfflineApp && configuredUrl) {
    return `${configuredUrl}${endpoint}`;
  }
  return endpoint;
}

export function getConfiguredRemoteUrls() {
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

export const APP_DATA_KEY = 'drcat_pub_2f7a91c4e8';
const STATIC_DATA_HEADERS = { 'x-app-key': APP_DATA_KEY };

export function getHeaders(extraHeaders = {}) {
  const token = localStorage.getItem('dr_cat_admin_token');
  const configuredUrl = localStorage.getItem('dr_cat_remote_server_url') || REMOTE_SERVER_URL;
  // Only add provider headers if we are not on localhost or if explicitly hitting a remote URL
  const isLocalWebBrowser = !isOfflineApp && (location.hostname === 'localhost' || location.hostname === '127.0.0.1' || location.hostname === '::1');
  const providerExtraHeaders = isLocalWebBrowser ? {} : getExtraHeaders(configuredUrl);
  return {
    'Content-Type': 'application/json',
    'x-app-key': APP_DATA_KEY,
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
  if (isOfflineApp) return false; // No admin for Android app
  const token = localStorage.getItem('dr_cat_admin_token');
  if (!token) return false;
  if (isOfflineApp && navigator.onLine === false) return false;
 
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

// Fast-fail fetch with a short timeout for connectivity tests
async function quickPing(url, timeoutMs = 1500) {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeoutMs);
  try {
    const res = await fetch(url, {
      method: 'HEAD',
      signal: controller.signal,
      mode: 'no-cors'
    });
    clearTimeout(timeoutId);
    return !!res;
  } catch (_) {
    clearTimeout(timeoutId);
    return false;
  }
}

// Shared fetch helper with strict timeout to prevent indefinite hangs
// For Android, we want very fast timeouts to avoid freezing
const isCapacitorForTimeout = !!window.Capacitor || navigator.userAgent.includes('Capacitor');
const FETCH_TIMEOUT_MS = isCapacitorForTimeout ? 3000 : 8000;
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

export async function fetchCats(since) {
  const mode = getAppMode();
  const queryParam = (typeof since === 'number' && !isNaN(since)) ? `?since=${since}` : '';

  // 1. ADMIN_LOCAL: Fast local server load
  if (mode === APP_MODES.ADMIN_LOCAL) {
    const res = await fetchWithTimeout(`/api/cats${queryParam}`, { headers: getHeaders() });
    if (!res.ok) throw new Error('Failed to fetch CATs from local server');
    const data = await res.json();
    const activeIds = res.headers.get('X-Active-Cat-IDs');
    if (activeIds) data.activeIds = activeIds;
    return data;
  }

  // 2. ANDROID_OFFLINE: Load cached synced database or static fallback instantly
  if (mode === APP_MODES.ANDROID_OFFLINE) {
    const cachedDb = localStorage.getItem(SYNC_CACHE_KEY);
    if (cachedDb && !queryParam) {
      try {
        const parsed = JSON.parse(cachedDb);
        if (Array.isArray(parsed) && parsed.length >= 40) {
          console.log('[fetchCats] Offline mode — loading cached synced database.');
          return parsed;
        }
        console.warn('[fetchCats] Cached database looks corrupted or incomplete (length < 40). Falling back to static bundle.');
      } catch (_) {}
    }
    console.log('[fetchCats] Offline mode — loading bundled data instantly.');
    const res = await fetchWithTimeout('data/cats_db.json', { headers: STATIC_DATA_HEADERS });
    if (!res.ok) throw new Error('Failed to fetch CATs statically');
    return res.json();
  }

  // 3. ANDROID_ONLINE or WEB_CLIENT: remote try, but bounded tightly to avoid logo freeze
  const remoteUrls = getConfiguredRemoteUrls();

  // In Capacitor/Android: never block UI for more than ~1.5s.
  const isCapacitor = !!window.Capacitor || navigator.userAgent.includes('Capacitor');
  const remoteTimeout = isCapacitor ? 1500 : 3000;

  // Quick ping test (HEAD) with short timeout.
  // If ping doesn't succeed quickly, fall back immediately to local bundle.
  let reachable = false;
  for (const url of remoteUrls) {
    try {
      const controller = new AbortController();
      const timeoutId = setTimeout(() => controller.abort(), remoteTimeout);
      // For fast check we only care about whether the network path accepts the request.
      await fetch(`${url}/api/search-status`, {
        method: 'HEAD',
        signal: controller.signal,
        mode: 'no-cors'
      });
      clearTimeout(timeoutId);
      reachable = true;
      break;
    } catch (_) {
      // keep trying other URLs
    }
  }

  if (!reachable) {
    console.log('[fetchCats] No remote server reachable within timeout — falling back to local bundle instantly.');
    const cachedDb = localStorage.getItem(SYNC_CACHE_KEY);
    if (cachedDb && !queryParam) {
      try {
        const parsed = JSON.parse(cachedDb);
        if (Array.isArray(parsed) && parsed.length >= 40) {
          console.log('[fetchCats] Loaded cached synced database on unreachable remote.');
          return parsed;
        }
      } catch (_) {}
    }
    const res = await fetchWithTimeout('data/cats_db.json', { headers: STATIC_DATA_HEADERS });
    if (!res.ok) throw new Error('Failed to fetch CATs from fallback');
    return res.json();
  }

  // Reachable: attempt to fetch remote cats with the short global timeout.
  // (fetchWithTimeout is capped to FETCH_TIMEOUT_MS=3000; for Android this is fine.)
  for (const remoteUrl of remoteUrls) {
    try {
      const res = await fetchWithTimeout(getApiUrl(`/api/cats${queryParam}`, remoteUrl), { headers: getHeaders() });
      if (res.ok) {
        const data = await res.json();
        const activeIds = res.headers.get('X-Active-Cat-IDs');
        if (activeIds) {
          data.activeIds = activeIds;
        }
        console.log('[API] fetchCats: loaded from remote server', remoteUrl, data.length);
        
        // Cache updates locally in localStorage for offline availability!
        try {
          if (since === undefined || since === null) {
            // Full database fetch: overwrite cache
            localStorage.setItem(SYNC_CACHE_KEY, JSON.stringify(data));
          } else {
            // Incremental fetch: merge with existing cache
            let currentCached = [];
            const cachedDb = localStorage.getItem(SYNC_CACHE_KEY);
            if (cachedDb) {
              currentCached = JSON.parse(cachedDb);
            } else {
              // Load static bundled data as baseline if cache is empty
              const fallbackRes = await fetchWithTimeout('data/cats_db.json', { headers: STATIC_DATA_HEADERS });
              if (fallbackRes.ok) currentCached = await fallbackRes.json();
            }
            
            // Merge updates
            data.forEach(remote => {
              const idx = currentCached.findIndex(c => c.id === remote.id);
              if (idx !== -1) {
                currentCached[idx] = remote;
              } else {
                currentCached.push(remote);
              }
            });

            // Prune deleted items from the local cache
            if (activeIds) {
              const activeSet = new Set(activeIds.split(',').map(id => parseInt(id)));
              const customCats = JSON.parse(localStorage.getItem('dr_cat_custom_created_cats') || '[]');
              const customCatIds = new Set(customCats.map(cc => cc.id));
              currentCached = currentCached.filter(c => {
                // Keep custom offline created cats
                if (customCatIds.has(c.id) || c.isOffline === true || c.source === 'offline' || c.id.toString().startsWith('offline-') || (typeof c.id === 'number' && c.id < 0)) return true;
                return activeSet.has(c.id);
              });
            }
            
            localStorage.setItem(SYNC_CACHE_KEY, JSON.stringify(currentCached));
          }
        } catch (cacheErr) {
          console.error('[API] Failed to cache synced database:', cacheErr);
        }

        return data;
      }
    } catch (err) {
      console.warn('[API] fetchCats: remote server', remoteUrl, 'unreachable');
    }
  }

  // Ultimate fallback
  console.warn('[API] fetchCats: all remote attempts failed, using local bundle.');
  const cachedDb = localStorage.getItem(SYNC_CACHE_KEY);
  if (cachedDb && !queryParam) {
    try {
      const parsed = JSON.parse(cachedDb);
      if (Array.isArray(parsed) && parsed.length >= 40) {
        console.log('[fetchCats] Loaded cached synced database on ultimate fallback.');
        return parsed;
      }
    } catch (_) {}
  }
  const res = await fetchWithTimeout('data/cats_db.json', { headers: STATIC_DATA_HEADERS });
  if (!res.ok) throw new Error('Failed to fetch CATs from fallback');
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
  return { success: false, error: "Failed to create CAT" };
}

export async function bulkImportCats(importList) {
  try {
    const res = await fetchWithTimeout('/api/cats/bulk-import', {
      method: 'POST',
      headers: getHeaders({ 'Content-Type': 'application/json' }),
      body: JSON.stringify(importList)
    });
    if (!res.ok) {
      const errData = await res.json().catch(() => ({}));
      throw new Error(errData.error || "Failed to bulk import CATs");
    }
    return res.json();
  } catch (err) {
    console.warn('[API] bulkImportCats failed:', err.message);
    throw err;
  }
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
  const mode = getAppMode();

  // Offline Android: strictly read-only, no suggestions
  if (mode === APP_MODES.ANDROID_OFFLINE) {
    return { 
      success: false, 
      error: 'Mode hors-ligne. Connexion Internet requise pour envoyer des suggestions.' 
    };
  }

  // Admin local: we don't use suggestions here; admins edit directly.
  if (mode === APP_MODES.ADMIN_LOCAL) {
    return { 
      success: false, 
      error: 'Les administrateurs modifient directement les fiches. Utilisez le bouton "Modifier".' 
    };
  }

  // WEB_CLIENT or ANDROID_ONLINE: Try to send to remote server with retries
  let attempts = 0;
  const maxAttempts = 3;
  const delayBetweenAttempts = 1200;

  while (attempts < maxAttempts) {
    attempts++;
    if (onAttempt) onAttempt(attempts);

    try {
      const res = await fetchWithTimeout(getApiUrl('/api/suggestions'), {
        method: 'POST',
        headers: getHeaders(),
        body: JSON.stringify(suggestionData)
      });
      if (res.ok) return await res.json();
      const errorData = await res.json().catch(() => ({}));
      if (res.status >= 400 && res.status < 500) {
        return { success: false, error: errorData.error || "Erreur client." };
      }
    } catch (err) {
      console.warn(`[API] submitSuggestion: attempt ${attempts} failed.`, err.message);
    }

    if (attempts < maxAttempts) {
      await new Promise(resolve => setTimeout(resolve, delayBetweenAttempts));
    }
  }

  return { 
    success: false, 
    error: "Le serveur est injoignable après 3 tentatives." 
  };
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

      // 1. Filename matches first (High Relevance)
      for (const doc of offlinePdfIndexCache) {
        if (doc.pdf.toLowerCase().includes(cleanQuery)) {
          results.push({
            pdf: doc.pdf,
            page: 1,
            snippet: "[Titre du fichier correspond] Document de référence disponible."
          });
        }
      }
      
      // 2. Text page content matches
      for (const doc of offlinePdfIndexCache) {
        if (!doc.pages) continue;
        for (const p of doc.pages) {
          if (!p.text) continue;
          
          // Avoid duplicate results for the same page (e.g. if page 1 matched filename)
          if (results.some(r => r.pdf === doc.pdf && r.page === p.page)) {
            continue;
          }

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
  const isLocalWebBrowser = !isOfflineApp && (location.hostname === 'localhost' || location.hostname === '127.0.0.1' || location.hostname === '::1');
  if (isLocalWebBrowser) {
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

  // WAN connectivity fallback ping — check multiple endpoints to verify internet access
  const wanUrls = ['https://www.cloudflare.com/cdn-cgi/trace', 'https://httpbin.org/get'];
  for (const url of wanUrls) {
    try {
      const controller = new AbortController();
      const id = setTimeout(() => controller.abort(), 3000);
      await fetchWithTimeout(url, {
        method: 'HEAD',
        mode: 'no-cors',
        signal: controller.signal
      });
      clearTimeout(id);
      return true;
    } catch (_) {
      // try next URL
    }
  }
  return false;
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

export async function fetchRateLimits() {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/rate-limits'), { headers: getHeaders() });
  if (!res.ok) {
    const errData = await res.json().catch(() => ({}));
    throw new Error(errData.error || "Failed to fetch rate limits");
  }
  return res.json();
}

export async function uploadPdf(filename, base64Data) {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/upload-pdf'), {
    method: 'POST',
    headers: getHeaders({ 'Content-Type': 'application/json' }),
    body: JSON.stringify({ filename, base64Data })
  });
  if (!res.ok) {
    const errData = await res.json().catch(() => ({}));
    throw new Error(errData.error || "Failed to upload PDF file");
  }
  return res.json();
}


