// Server communication routines for Dr. CAT
// Support for both online (server-backed) mode and offline standalone (Capacitor/static) mode

import { state } from './state.js';

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

// If you deploy your server on a hosted address (e.g. Stage 2 of the roadmap),
// write the full URL here (e.g. 'https://med.iillaa.com'). This allows the standalone
// app to send its edits/suggestions when the device is online at startup.
const REMOTE_SERVER_URL = '';

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
 * Returns the configured remote server URL (ngrok or otherwise) if one is set.
 * When this returns a URL, all API calls should go through the server even in Capacitor/offline mode.
 */
export function getRemoteServerUrl() {
  return localStorage.getItem('dr_cat_remote_server_url') || REMOTE_SERVER_URL || null;
}

/**
 * True when a remote server URL is configured — meaning the app should try to
 * sync with the server even if it is running as a Capacitor/standalone app.
 */
export function hasRemoteServer() {
  return !!getRemoteServerUrl();
}

function getApiUrl(endpoint) {
  const configuredUrl = getRemoteServerUrl();
  if (isOfflineApp && configuredUrl) {
    return `${configuredUrl}${endpoint}`;
  }
  return endpoint;
}

function getHeaders(extraHeaders = {}) {
  const token = localStorage.getItem('dr_cat_admin_token');
  const configuredUrl = localStorage.getItem('dr_cat_remote_server_url') || REMOTE_SERVER_URL;
  // Add ngrok bypass header when communicating with ngrok URLs to skip the browser challenge page
  const isNgrokUrl = configuredUrl && configuredUrl.includes('ngrok');
  return {
    'Content-Type': 'application/json',
    ...(token ? { 'x-admin-token': token } : {}),
    ...(isNgrokUrl ? { 'ngrok-skip-browser-warning': 'true' } : {}),
    ...extraHeaders
  };
}

export async function loginAdmin(password) {
  if (isOfflineApp) {
    // Offline mode: store a local PIN hash in localStorage so admin gating
    // still requires authentication rather than accepting any password.
    const STORAGE_KEY = 'dr_cat_offline_admin_hash';
    const storedHash = localStorage.getItem(STORAGE_KEY);
    if (!storedHash) {
      // First-time setup: enforce non-empty password
      if (!password || password.trim().length < 4) {
        return { success: false, error: 'Mot de passe trop court (min 4 caractères).' };
      }
      const hash = Array.from(new TextEncoder().encode(password))
        .reduce((h, b) => ((h << 5) - h + b) | 0, 0).toString(16);
      localStorage.setItem(STORAGE_KEY, hash);
      const token = 'local-' + Array.from(new Uint8Array(16)).map(() => Math.floor(Math.random() * 16).toString(16)).join('');
      localStorage.setItem('dr_cat_admin_token', token);
      return { success: true, token };
    }
    if (!password) {
      return { success: false, error: 'Mot de passe requis.' };
    }
    const inputHash = Array.from(new TextEncoder().encode(password))
      .reduce((h, b) => ((h << 5) - h + b) | 0, 0).toString(16);
    if (inputHash !== storedHash) {
      return { success: false, error: 'Mot de passe incorrect.' };
    }
    const token = localStorage.getItem('dr_cat_admin_token') ||
      ('local-' + Array.from(new Uint8Array(16)).map(() => Math.floor(Math.random() * 16).toString(16)).join(''));
    localStorage.setItem('dr_cat_admin_token', token);
    return { success: true, token };
  }

  const res = await fetch('/api/login', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
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
    await fetch('/api/logout', {
      method: 'POST',
      headers: getHeaders()
    });
  } catch (err) {
    console.error("Logout failed:", err);
  }
  localStorage.removeItem('dr_cat_admin_token');
}

export async function checkAdminStatus() {
  // TODO: TEMPORARY FOR DEVELOPMENT: Make everyone admin by default
  return true;
}

export async function checkIsLocal() {
  if (isOfflineApp) {
    return true; // Standalone app is always "local" to the device
  }

  try {
    const res = await fetch('/api/is-local');
    const data = await res.json();
    return !!data.isLocal;
  } catch (err) {
    console.error("Failed to check local status:", err);
    // Fallback: check hostname client-side as well
    const host = window.location.hostname;
    return host === 'localhost' || host === '127.0.0.1' || host === '::1';
  }
}

export async function fetchCats() {
  // If a remote server is configured, always try it first (even in Capacitor/offline app mode)
  // so users get the latest CATs from the server.
  if (hasRemoteServer()) {
    try {
      const res = await fetch(getApiUrl('/api/cats'), { headers: getHeaders() });
      if (res.ok) {
        const data = await res.json();
        console.log('[API] fetchCats: loaded from remote server (' + data.length + ' CATs)');
        return data;
      }
    } catch (err) {
      console.warn('[API] fetchCats: remote server unreachable, falling back to bundled data.', err.message);
    }
  }

  // Fallback: use the bundled static database (Capacitor app / no server)
  if (isOfflineApp) {
    const res = await fetch('data/cats_db.json');
    if (!res.ok) throw new Error('Failed to fetch CATs statically');
    return res.json();
  }

  const res = await fetch('/api/cats', { headers: getHeaders() });
  if (!res.ok) throw new Error('Failed to fetch CATs');
  return res.json();
}

export async function fetchPdfs() {
  if (isOfflineApp) {
    // Load only the list of filenames instead of the heavy index structure containing all parsed texts
    const res = await fetch('data/pdf_list.json');
    if (!res.ok) throw new Error("Failed to fetch PDFs list statically");
    return res.json();
  }

  const res = await fetch('/api/pdfs', { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch PDFs");
  return res.json();
}

export async function saveCatDataToServer(id, data) {
  if (isOfflineApp) {
    // Save to local overrides (persisted to localStorage)
    const localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
    if (!localOverrides[id]) localOverrides[id] = {};
    if (data.summary !== undefined) localOverrides[id].customSummary = data.summary;
    if (data.ordonnance !== undefined) localOverrides[id].customOrdonnance = data.ordonnance;
    localStorage.setItem('dr_cat_local_overrides', JSON.stringify(localOverrides));
    return { success: true, message: "Modifications enregistrées localement." };
  }

  const res = await fetch(`/api/cats/${id}`, {
    method: 'POST',
    headers: getHeaders(),
    body: JSON.stringify(data)
  });
  if (res.status === 403) throw new Error("403 Forbidden");
  if (!res.ok) throw new Error("Failed to save CAT data");
  return res.json();
}

export async function deleteCatFromServer(id) {
  if (isOfflineApp) {
    // Mark as deleted in local storage overrides
    const localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
    if (!localOverrides[id]) localOverrides[id] = {};
    localOverrides[id].deleted = true;
    localStorage.setItem('dr_cat_local_overrides', JSON.stringify(localOverrides));
    return { success: true, message: "Fiche supprimée localement." };
  }

  const res = await fetch(`/api/cats/${id}`, { 
    method: 'DELETE',
    headers: getHeaders()
  });
  if (res.status === 403) throw new Error("403 Forbidden");
  if (!res.ok) throw new Error("Failed to delete CAT");
  return res.json();
}

export async function createCatOnServer(catData) {
  if (isOfflineApp && !state.isOnlineAtStartup) {
    // Generate new local CAT and save to local storage overrides
    const localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
    const customCats = JSON.parse(localStorage.getItem('dr_cat_custom_created_cats') || '[]');
    
    const nextId = Math.max(100, ...customCats.map(c => c.id), ...Object.keys(localOverrides).map(Number)) + 1;
    const newCat = {
      id: nextId,
      ...catData,
      status: 'todo',
      notes: ''
    };
    
    customCats.push(newCat);
    localStorage.setItem('dr_cat_custom_created_cats', JSON.stringify(customCats));
    return { success: true, cat: newCat };
  }

  const res = await fetch(getApiUrl('/api/cats'), {
    method: 'POST',
    headers: getHeaders(),
    body: JSON.stringify(catData)
  });
  if (res.status === 403) throw new Error("403 Forbidden");
  if (!res.ok) throw new Error("Failed to create CAT");
  return res.json();
}

export async function submitSuggestion(suggestionData) {
  // Always try to send to the server so the admin can review it.
  if (hasRemoteServer()) {
    try {
      const res = await fetch(getApiUrl('/api/suggestions'), {
        method: 'POST',
        headers: getHeaders(),
        body: JSON.stringify(suggestionData)
      });
      if (res.ok) return res.json();
    } catch (err) {
      console.warn('[API] submitSuggestion: server unreachable, saving locally.', err.message);
    }
  }

  // Fallback: save locally if server unreachable
  return saveCatDataToServer(suggestionData.catId, {
    summary: suggestionData.summary,
    ordonnance: suggestionData.ordonnance
  });
}

export async function fetchSuggestions() {
  // Fetch from server (via ngrok in Capacitor mode) so admin can see all user submissions.
  const url = hasRemoteServer() ? getApiUrl('/api/suggestions') : '/api/suggestions';
  const res = await fetch(url, { headers: getHeaders() });
  if (res.status === 403) throw new Error('403 Forbidden');
  if (!res.ok) throw new Error('Failed to fetch suggestions');
  return res.json();
}

export async function approveSuggestionOnServer(id) {
  const base = hasRemoteServer() ? getRemoteServerUrl() : '';
  const res = await fetch(`${base}/api/suggestions/${id}/approve`, { 
    method: 'POST',
    headers: getHeaders()
  });
  if (res.status === 403) throw new Error('403 Forbidden');
  if (!res.ok) throw new Error('Failed to approve suggestion');
  return res.json();
}

export async function rejectSuggestionOnServer(id) {
  const base = hasRemoteServer() ? getRemoteServerUrl() : '';
  const res = await fetch(`${base}/api/suggestions/${id}/reject`, { 
    method: 'POST',
    headers: getHeaders()
  });
  if (res.status === 403) throw new Error('403 Forbidden');
  if (!res.ok) throw new Error('Failed to reject suggestion');
  return res.json();
}

export async function fetchSearchStatus() {
  if (hasRemoteServer()) {
    try {
      const res = await fetch(getApiUrl('/api/search-status'), { headers: getHeaders() });
      if (res.ok) return res.json();
    } catch (_) {}
  }

  if (isOfflineApp) {
    return { isIndexing: false, totalFiles: 76, indexedFiles: 76, currentFile: '' };
  }

  const res = await fetch('/api/search-status', { headers: getHeaders() });
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

  const res = await fetch(`/api/search-pdfs?q=${encodeURIComponent(query)}`, {
    headers: getHeaders()
  });
  return res;
}

export async function triggerReindexing() {
  if (isOfflineApp) {
    return { success: true, message: "La ré-indexation n'est pas prise en charge hors-ligne." };
  }

  const res = await fetch('/api/reindex', { 
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
    const res = await fetch('/api/pdf-index-status', { headers: getHeaders() });
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
  const configuredUrl = localStorage.getItem('dr_cat_remote_server_url') || REMOTE_SERVER_URL;
  
  if (configuredUrl) {
    try {
      const controller = new AbortController();
      const id = setTimeout(() => controller.abort(), 3000);
      const res = await fetch(`${configuredUrl}/api/search-status`, {
        signal: controller.signal,
        headers: { 'ngrok-skip-browser-warning': 'true' }
      });
      clearTimeout(id);
      if (res.ok) return true;
      // If we got a response but not ok (e.g. ngrok HTML challenge page) fall through to WAN check
    } catch (_) {
      // Connection failed, fall through to WAN check
    }
  }

  // WAN connectivity fallback ping
  try {
    const controller = new AbortController();
    const id = setTimeout(() => controller.abort(), 3000);
    await fetch('https://httpbin.org/status/200', {
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
    const isCorsSafePing = url.includes('httpbin.org') || url.includes('localhost') || url.includes('127.0.0.1');
    const isNgrok = url.includes('ngrok');
    const fetchOpts = {
      method: 'GET',
      signal: controller.signal,
      headers: {
        ...(isCorsSafePing ? getHeaders() : {}),
        ...(isNgrok ? { 'ngrok-skip-browser-warning': 'true' } : {})
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
  const res = await fetch(getApiUrl('/api/diagnostics/system'), { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch system diagnostics");
  return res.json();
}

export async function fetchDiagnosticsDbStats() {
  const res = await fetch(getApiUrl('/api/diagnostics/db-stats'), { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch DB stats");
  return res.json();
}

export async function fetchDiagnosticsIndexDetail() {
  const res = await fetch(getApiUrl('/api/diagnostics/index-detail'), { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch index details");
  return res.json();
}

export async function fetchDiagnosticsRemoteUrl() {
  const res = await fetch(getApiUrl('/api/diagnostics/remote-server-url'), { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch remote server URL");
  return res.json();
}

export async function updateDiagnosticsRemoteUrl(url) {
  const res = await fetch(getApiUrl('/api/diagnostics/remote-server-url'), {
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

export async function fetchNgrokTunnels() {
  const res = await fetch(getApiUrl('/api/diagnostics/ngrok-tunnels'), { headers: getHeaders() });
  if (!res.ok) {
    const errData = await res.json().catch(() => ({}));
    throw new Error(errData.error || "Failed to fetch ngrok tunnels");
  }
  return res.json();
}

export async function fetchServerMetrics() {
  const res = await fetch(getApiUrl('/api/performance/server-metrics'), { headers: getHeaders() });
  if (!res.ok) {
    const errData = await res.json().catch(() => ({}));
    throw new Error(errData.error || "Failed to fetch server metrics");
  }
  return res.json();
}
