// Server communication routines for Dr. CAT
// Support for both online (server-backed) mode and offline standalone (Capacitor/static) mode

import { state } from './state.js';

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

function getApiUrl(endpoint) {
  const configuredUrl = localStorage.getItem('dr_cat_remote_server_url') || REMOTE_SERVER_URL;
  if (isOfflineApp && configuredUrl) {
    return `${configuredUrl}${endpoint}`;
  }
  return endpoint;
}

function getHeaders(extraHeaders = {}) {
  const token = localStorage.getItem('dr_cat_admin_token');
  return {
    'Content-Type': 'application/json',
    ...(token ? { 'x-admin-token': token } : {}),
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
  try {
    const res = await fetch('/api/is-admin', {
      headers: getHeaders()
    });
    const data = await res.json();
    return !!data.isAdmin;
  } catch (err) {
    console.error("Failed to check admin status:", err);
    return false;
  }
}

export async function checkIsLocal() {
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
  const res = await fetch('/api/cats', { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch CATs");
  return res.json();
}

export async function fetchPdfs() {
  const res = await fetch('/api/pdfs', { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch PDFs");
  return res.json();
}

export async function saveCatDataToServer(id, data) {
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
  if (isOfflineApp && !state.isOnlineAtStartup) {
    // Offline suggestion is directly merged into local overrides as a shortcut
    return saveCatDataToServer(suggestionData.catId, {
      summary: suggestionData.summary,
      ordonnance: suggestionData.ordonnance
    });
  }

  const res = await fetch(getApiUrl('/api/suggestions'), {
    method: 'POST',
    headers: getHeaders(),
    body: JSON.stringify(suggestionData)
  });
  if (!res.ok) throw new Error("Failed to submit suggestion");
  return res.json();
}

export async function fetchSuggestions() {
  const res = await fetch('/api/suggestions', { headers: getHeaders() });
  if (res.status === 403) throw new Error("403 Forbidden");
  if (!res.ok) throw new Error("Failed to fetch suggestions");
  return res.json();
}

export async function approveSuggestionOnServer(id) {
  const res = await fetch(`/api/suggestions/${id}/approve`, { 
    method: 'POST',
    headers: getHeaders()
  });
  if (res.status === 403) throw new Error("403 Forbidden");
  if (!res.ok) throw new Error("Failed to approve suggestion");
  return res.json();
}

export async function rejectSuggestionOnServer(id) {
  const res = await fetch(`/api/suggestions/${id}/reject`, { 
    method: 'POST',
    headers: getHeaders()
  });
  if (res.status === 403) throw new Error("403 Forbidden");
  if (!res.ok) throw new Error("Failed to reject suggestion");
  return res.json();
}

export async function fetchSearchStatus() {
  const res = await fetch('/api/search-status', { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch search status");
  return res.json();
}

export async function searchPdfsContent(query) {
  const res = await fetch(`/api/search-pdfs?q=${encodeURIComponent(query)}`, {
    headers: getHeaders()
  });
  return res;
}

export async function triggerReindexing() {
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
      const id = setTimeout(() => controller.abort(), 2000); // 2s timeout
      const res = await fetch(`${configuredUrl}/api/search-status`, {
        signal: controller.signal
      });
      clearTimeout(id);
      return res.ok;
    } catch (_) {
      return false;
    }
  }

  // WAN connectivity HEAD request ping (avoiding CORS body parsing restrictions)
  try {
    const controller = new AbortController();
    const id = setTimeout(() => controller.abort(), 2000);
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
