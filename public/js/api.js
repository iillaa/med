// Server communication routines for Dr. CAT
// Support for both online (server-backed) mode and offline standalone (Capacitor/static) mode

import { REMOTE_SERVER_URL, REMOTE_SERVER_URLS } from './remote_config.js';
import { getExtraHeaders } from './server-providers.js';
import { isOfflineCat } from './lib/helpers.js';
import { FETCH_TIMEOUT_MS, PING_TIMEOUT_MS, SYNC_MAX_RETRIES, SYNC_RETRY_DELAY_MS } from './config.js';
import { getInstallId } from './install-id.js';
export { REMOTE_SERVER_URL, getInstallId };


// Transparent wrapper to log API latencies and dispatch debug events
const originalFetch = window.fetch;
window.fetch = async function(...args) {
  const start = performance.now();
  const urlStr = typeof args[0] === 'string' ? args[0] : (args[0]?.url || '');
  const method = (args[1]?.method || 'GET').toUpperCase();
  try {
    const res = await originalFetch(...args);
    const duration = performance.now() - start;
    if (window.perf && window.perf.recordApiCall) {
      if (!urlStr.includes('/api/performance/server-metrics') && !urlStr.includes('/api/search-status')) {
        window.perf.recordApiCall(urlStr, res.status, duration);
      }
    }
    // Dispatch event for debug console (avoids double-patching window.fetch)
    window.dispatchEvent(new CustomEvent('drcat-fetch-event', {
      detail: { url: urlStr, method, status: res.status, duration: Math.round(duration) }
    }));
    return res;
  } catch (err) {
    const duration = performance.now() - start;
    if (window.perf && window.perf.recordApiCall) {
      if (!urlStr.includes('/api/performance/server-metrics') && !urlStr.includes('/api/search-status')) {
        window.perf.recordApiCall(urlStr, 0, duration);
      }
    }
    // Dispatch event for debug console with error info
    window.dispatchEvent(new CustomEvent('drcat-fetch-event', {
      detail: { url: urlStr, method, status: 0, duration: Math.round(duration), error: err.message }
    }));
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




// Module cache for client-side search in offline mode
let offlinePdfIndexCache = null;

/**
 * Returns the configured remote server URL (tunnel or otherwise) if one is set.
 * When this returns a URL, all API calls should go through the server even in Capacitor/offline mode.
 */
// Authoritative server list, learned from the backend via GET /api/server-providers.
// Seeded from the build-baked remote_config.js so the offline APK has a fallback
// before it can reach any server. Never persisted to localStorage (single source of truth).
let serverListCache = null;
// url -> { ok, latencyMs, last }  (health, for failover + load-balancing)
const serverHealth = new Map();

function healthRank(url) {
  const h = serverHealth.get(url);
  if (!h) return 0; // unknown = neutral
  return h.ok ? (1 - Math.min(h.latencyMs || 0, 5000) / 10000) : -1;
}

export function recordServerHealth(url, ok, latencyMs) {
  if (!url) return;
  serverHealth.set(url, { ok, latencyMs: latencyMs || 0, last: Date.now() });
}

export function getConfiguredRemoteUrls() {
  if (serverListCache && serverListCache.servers.length) {
    // Priority first; among equal priority, healthy + low-latency servers win
    // (this is what gives failover + cross-provider load-balancing).
    return serverListCache.servers
      .slice()
      .sort((a, b) => (a.priority - b.priority) || (healthRank(b.url) - healthRank(a.url)))
      .map(s => s.url);
  }
  if (typeof REMOTE_SERVER_URLS !== 'undefined' && Array.isArray(REMOTE_SERVER_URLS) && REMOTE_SERVER_URLS.length > 0) {
    return REMOTE_SERVER_URLS.slice();
  }
  if (REMOTE_SERVER_URL) return [REMOTE_SERVER_URL];
  return [];
}

function getRemoteServerUrl() {
  const urls = getConfiguredRemoteUrls();
  return urls.length ? urls[0] : null;
}

export function hasRemoteServer() {
  return !!getRemoteServerUrl();
}

export async function fetchServerList() {
  try {
    const res = await fetchWithTimeout(getApiUrl('/api/server-providers'), { headers: getHeaders() });
    if (res.ok) {
      const data = await res.json();
      serverListCache = { servers: data.servers || [], primaryProvider: data.primaryProvider || null };
    }
  } catch (_) { /* offline / localhost: keep seed */ }
  return serverListCache;
}

export function getApiUrl(endpoint, overrideUrl) {
  let configuredUrl = overrideUrl || getRemoteServerUrl();
  // On localhost web browser (not standalone Capacitor app), use relative paths to avoid cross-origin requests to the tunnel URL
  const isLocalWebBrowser = !isOfflineApp && (location.hostname === 'localhost' || location.hostname === '127.0.0.1' || location.hostname === '::1');
  if (isLocalWebBrowser) return endpoint;
  if (isOfflineApp && configuredUrl) {
    const cleanUrl = configuredUrl.replace(/\/+$/, '');
    const cleanEndpoint = endpoint.startsWith('/') ? endpoint : `/${endpoint}`;
    return `${cleanUrl}${cleanEndpoint}`;
  }
  return endpoint;
}

// Soft deterrent only: this key ships in the public client bundle (devtools/curl can
// read it), so it is NOT real access control — just friction against casual scraping.
// Genuine protection would require a server-signed per-session token at login.
export const APP_DATA_KEY = 'drcat_pub_2f7a91c4e8';
const STATIC_DATA_HEADERS = { 'x-app-key': APP_DATA_KEY };

export function getHeaders(extraHeaders = {}) {
  const token = localStorage.getItem('dr_cat_admin_token');
  const installId = getInstallId();
  const metaVer = document.querySelector('meta[name="app-version"]')?.content || '1.1.6';
  const configuredUrl = getRemoteServerUrl() || REMOTE_SERVER_URL;
  const isLocalWebBrowser = !isOfflineApp && (location.hostname === 'localhost' || location.hostname === '127.0.0.1' || location.hostname === '::1');
  const providerExtraHeaders = isLocalWebBrowser ? {} : getExtraHeaders(configuredUrl);
  return {
    'Content-Type': 'application/json',
    'x-app-key': APP_DATA_KEY,
    'x-install-id': installId,
    'x-app-version': metaVer,
    ...(token ? { 'x-admin-token': token } : {}),
    ...providerExtraHeaders,
    ...extraHeaders
  };
}
 
export async function loginAdmin(password) {
  if (isOfflineApp) {
    return { success: false, error: 'Connexion administrateur impossible en mode hors-ligne.' };
  }
 
  const res = await fetchWithTimeout(getApiUrl('/api/login'), {
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
    await fetchWithTimeout(getApiUrl('/api/logout'), {
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
 
// Shared fetch helper with strict timeout to prevent indefinite hangs
// Timeout is configured in config.js (FETCH_TIMEOUT_MS)
export async function fetchWithTimeout(url, options = {}) {
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
    const res = await fetchWithTimeout(getApiUrl(`/api/cats${queryParam}`), { headers: getHeaders() });
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
      } catch (_) {
        // no-op: JSON.parse failure on cached DB falls through to static bundle
      }
    }
    console.log('[fetchCats] Offline mode — loading bundled data instantly.');
    const res = await fetchWithTimeout('data/cats_db.json', { headers: STATIC_DATA_HEADERS });
    if (!res.ok) throw new Error('Failed to fetch CATs statically');
    return res.json();
  }

  // 3. ANDROID_ONLINE or WEB_CLIENT: remote try, but bounded tightly to avoid logo freeze
  const remoteUrls = getConfiguredRemoteUrls();

  // Quick ping test (HEAD) with short timeout (PING_TIMEOUT_MS from config).
  // If ping doesn't succeed quickly, fall back immediately to local bundle.
  let reachable = false;
  for (const url of remoteUrls) {
    try {
      const controller = new AbortController();
      const timeoutId = setTimeout(() => controller.abort(), PING_TIMEOUT_MS);
      // For fast check we only care about whether the network path accepts the request.
      const cleanUrl = url.replace(/\/+$/, '');
      await fetch(`${cleanUrl}/api/search-status`, {
        method: 'GET',
        signal: controller.signal,
        headers: getHeaders()
      });
      clearTimeout(timeoutId);
      recordServerHealth(url, true, PING_TIMEOUT_MS);
      reachable = true;
      break;
    } catch (_) {
      recordServerHealth(url, false, PING_TIMEOUT_MS);
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
      } catch (_) {
        // no-op: JSON.parse failure on cached DB falls through to static bundle
      }
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
        recordServerHealth(remoteUrl, true);
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
                if (isOfflineCat(c, customCatIds)) return true;
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
      recordServerHealth(remoteUrl, false);
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
    } catch (_) {
      // no-op: JSON.parse failure on cached DB falls through to static bundle
    }
  }
  const res = await fetchWithTimeout('data/cats_db.json', { headers: STATIC_DATA_HEADERS });
  if (!res.ok) throw new Error('Failed to fetch CATs from fallback');
  return res.json();
}


export async function fetchPdfs() {
  if (isOfflineApp) {
    // Load only the list of filenames instead of the heavy index structure containing all parsed texts
    const res = await fetchWithTimeout('data/pdf_list.json', { headers: STATIC_DATA_HEADERS });
    if (!res.ok) throw new Error("Failed to fetch PDFs list statically");
    return res.json();
  }

  const res = await fetchWithTimeout(getApiUrl('/api/pdfs'), { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch PDFs");
  return res.json();
}

export async function saveCatDataToServer(id, data) {
  // Admin action: always use local server. Admin is localhost-only, never tunnel.
  try {
    const res = await fetchWithTimeout(getApiUrl(`/api/cats/${id}`), {
      method: 'POST',
      headers: getHeaders(),
      body: JSON.stringify(data)
    });
    if (res.ok) {
      // Clear any stale local overrides since server now holds authoritative data
      try {
        const localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
        if (localOverrides[id]) {
          delete localOverrides[id];
          localStorage.setItem('dr_cat_local_overrides', JSON.stringify(localOverrides));
        }
      } catch (_) {
        /* ignore local override purge failure */
      }
      return res.json();
    }
  } catch (err) {
    console.warn('[API] saveCatDataToServer failed:', err.message);
  }

  // Fallback: save to local overrides (persisted to localStorage)
  const localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
  if (!localOverrides[id]) localOverrides[id] = {};
  if (data.summary !== undefined) localOverrides[id].customSummary = data.summary;
  if (data.ordonnance !== undefined) localOverrides[id].customOrdonnance = data.ordonnance;
  localOverrides[id].updatedAt = Date.now();
  localStorage.setItem('dr_cat_local_overrides', JSON.stringify(localOverrides));
  return { success: true, message: "Modifications enregistrées localement." };
}

export async function deleteCatFromServer(id) {
  // Admin action: always use local server. Admin is localhost-only, never tunnel.
  try {
    const res = await fetchWithTimeout(getApiUrl(`/api/cats/${id}`), {
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
    const res = await fetchWithTimeout(getApiUrl('/api/cats'), {
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
    const res = await fetchWithTimeout(getApiUrl('/api/cats/bulk-import'), {
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
  while (attempts < SYNC_MAX_RETRIES) {
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

    if (attempts < SYNC_MAX_RETRIES) {
      await new Promise(resolve => setTimeout(resolve, SYNC_RETRY_DELAY_MS));
    }
  }

  return { 
    success: false, 
    error: "Le serveur est injoignable après 3 tentatives." 
  };
}


export async function fetchSuggestions() {
  // Admin action: always use local server. Admin is localhost-only, never tunnel.
  const res = await fetchWithTimeout(getApiUrl('/api/suggestions'), { headers: getHeaders() });
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
  const result = await res.json();
  if (result.success && result.cat) {
    try {
      const localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
      if (localOverrides[result.cat.id]) {
        delete localOverrides[result.cat.id];
        localStorage.setItem('dr_cat_local_overrides', JSON.stringify(localOverrides));
      }
    } catch (_) {
      /* ignore local override purge failure */
    }
  }
  return result;
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
    } catch (_) {
      // no-op: search-status fetch failure falls through to offline default
    }
  }

  if (isOfflineApp) {
    return { isIndexing: false, totalFiles: 76, indexedFiles: 76, currentFile: '' };
  }

  const res = await fetchWithTimeout(getApiUrl('/api/search-status'), { headers: getHeaders() });
  if (!res.ok) throw new Error('Failed to fetch search status');
  return res.json();
}

export async function searchPdfsContent(query) {
  const cleanQuery = query.trim().toLowerCase();

  if (!isOfflineApp) {
    try {
      const res = await fetchWithTimeout(getApiUrl(`/api/search-pdfs?q=${encodeURIComponent(query)}`), {
        headers: getHeaders()
      });
      if (res.ok) return res;
    } catch (err) {
      console.warn("[Search] Server PDF search failed or offline, using static index fallback.", err);
    }
  }

  // Static Index Search Fallback (Offline, Standalone, or Server Unavailable)
  try {
    if (!offlinePdfIndexCache) {
      const indexRes = await fetch('data/pdf_index.json', { headers: STATIC_DATA_HEADERS });
      if (!indexRes.ok) throw new Error("Failed to load PDF index");
      offlinePdfIndexCache = await indexRes.json();
    }

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
        const textData = p.content || p.text;
        if (!textData || textData.trim() === 'NO_CONTENT_HERE') continue;

        if (results.some(r => r.pdf === doc.pdf && r.page === p.page)) {
          continue;
        }

        const textLower = textData.toLowerCase();
        const indexMatch = textLower.indexOf(cleanQuery);
        if (indexMatch !== -1) {
          const start = Math.max(0, indexMatch - 60);
          const end = Math.min(textData.length, indexMatch + cleanQuery.length + 60);
          let snippet = textData.substring(start, end);
          if (start > 0) snippet = '...' + snippet;
          if (end < textData.length) snippet = snippet + '...';

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
      status: 200,
      ok: true,
      json: async () => ({ results })
    };
  } catch (err) {
    console.error("PDF index search error:", err);
    return {
      status: 500,
      ok: false,
      json: async () => ({ error: "Impossible d'effectuer la recherche dans les PDFs.", results: [] })
    };
  }
}

export async function triggerReindexing() {
  if (isOfflineApp) {
    return { success: true, message: "La ré-indexation n'est pas prise en charge hors-ligne." };
  }

  const res = await fetchWithTimeout(getApiUrl('/api/reindex'), { 
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
      const indexRes = await fetch('data/pdf_index.json', { headers: STATIC_DATA_HEADERS });
      if (!indexRes.ok) throw new Error("Failed to load PDF index for status calculation");
      const index = await indexRes.json();
      
      const statusMap = {};
      for (const doc of index) {
        const totalPages = doc.pages ? doc.pages.length : 0;
        const pagesWithText = doc.pages ? doc.pages.filter(p => {
          const txt = (p.content || p.text || '').trim();
          return txt.length > 15 && txt !== 'NO_CONTENT_HERE';
        }).length : 0;
        
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
    const res = await fetchWithTimeout(getApiUrl('/api/pdf-index-status'), { headers: getHeaders() });
    if (!res.ok) throw new Error("Failed to fetch PDF index status from server");
    return res.json();
  } catch (err) {
    console.error("Error fetching PDF status map from server:", err);
    return {};
  }
}

export async function pingEndpoint(url, timeoutMs = 2500) {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeoutMs);
  try {
    // Determine headers and mode depending on URL type
    const providerHeaders = getExtraHeaders(url);
    const configuredUrls = getConfiguredRemoteUrls();
    const isRemoteUrl = configuredUrls.some(u => u && url.includes(u));
    const isCorsSafePing = url.includes('httpbin.org') || url.includes('localhost') || url.includes('127.0.0.1') || isRemoteUrl;
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
    const ok = res.ok;
    // Only track health for our own configured servers (ignore WAN/httpbin pings).
    if (getConfiguredRemoteUrls().includes(url)) recordServerHealth(url, ok);
    return {
      ok,
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



export async function updateServerProviders(payload) {
  const res = await fetchWithTimeout(getApiUrl('/api/server-providers'), {
    method: 'POST',
    headers: getHeaders({ 'Content-Type': 'application/json' }),
    body: JSON.stringify(payload)
  });
  if (!res.ok) {
    const errData = await res.json().catch(() => ({}));
    throw new Error(errData.error || "Failed to update server providers");
  }
  return res.json();
}

export async function fetchVersionConfigOnServer() {
  const res = await fetchWithTimeout(getApiUrl('/api/version'), {
    method: 'GET',
    headers: getHeaders()
  });
  if (!res.ok) {
    throw new Error("Impossible de récupérer la configuration de version.");
  }
  return res.json();
}

export async function updateVersionConfigOnServer(payload) {
  const res = await fetchWithTimeout(getApiUrl('/api/admin/version'), {
    method: 'PUT',
    headers: getHeaders({
      'Content-Type': 'application/json',
      'x-api-key': 'drcat_secret_api_key_2026'
    }),
    body: JSON.stringify(payload)
  });
  if (!res.ok) {
    const errData = await res.json().catch(() => ({}));
    throw new Error(errData.error || "Échec de la mise à jour de la version.");
  }
  return res.json();
}

// Learn the authoritative server list from the backend. Safe to call anywhere:
// on localhost it returns the same-origin list; on the offline APK it fails
// silently and the build-baked seed remains in use.
if (typeof window !== 'undefined') {
  fetchServerList().catch(() => {});
  window.addEventListener('online', () => { fetchServerList().catch(() => {}); });

  // Periodic health re-ping so a recovered/slow server is promoted/demoted
  // without a full app reload (drives failover + load-balancing).
  setInterval(() => {
    const urls = getConfiguredRemoteUrls();
    for (const url of urls) {
      api_pingHealth(url).catch(() => {});
    }
  }, 60000);
}

// Lightweight health probe (separate from the diagnostics pingEndpoint so it
// can't be clobbered by WAN/httpbin bookkeeping).
async function api_pingHealth(url) {
  try {
    const controller = new AbortController();
    const t = setTimeout(() => controller.abort(), 4000);
    const start = performance.now();
    const cleanUrl = url.replace(/\/+$/, '');
    await fetch(`${cleanUrl}/api/search-status`, {
      method: 'GET',
      signal: controller.signal,
      headers: getHeaders()
    });
    clearTimeout(t);
    recordServerHealth(url, true, performance.now() - start);
  } catch (_) {
    recordServerHealth(url, false);
  }
}




