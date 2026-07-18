import type { AppModeType } from '../types/cat';
import { APP_MODES } from '../types/cat';
import { getItem, STORAGE_KEYS } from '../utils/storage';

export const APP_DATA_KEY = 'drcat_pub_2f7a91c4e8';
const STATIC_DATA_HEADERS: Record<string, string> = { 'x-app-key': APP_DATA_KEY };

const APP_BUILD_VERSION = (document.querySelector('meta[name="app-build-version"]')?.getAttribute('content') || '0') as string;
const SYNC_CACHE_KEY = `dr_cat_synced_database_v${APP_BUILD_VERSION}`;

function getRemoteServerUrl(): string | null {
  const storedOverride = localStorage.getItem('dr_cat_remote_server_url');
  const lastCompiledUrl = localStorage.getItem('dr_cat_last_compiled_url');
  const globalUrl = typeof globalThis !== 'undefined' ? (globalThis as any).REMOTE_SERVER_URL : undefined;
  const builtUrl = typeof globalUrl === 'string' ? globalUrl : '';
  const globalUrls = typeof globalThis !== 'undefined' ? (globalThis as any).REMOTE_SERVER_URLS : undefined;
  const builtUrls = Array.isArray(globalUrls) ? globalUrls : [];

  if (builtUrl && lastCompiledUrl !== builtUrl) {
    localStorage.removeItem('dr_cat_remote_server_url');
    localStorage.setItem('dr_cat_last_compiled_url', builtUrl);
    return builtUrl;
  }

  if (builtUrl && !lastCompiledUrl) {
    localStorage.setItem('dr_cat_last_compiled_url', builtUrl);
  }

  const result = storedOverride || builtUrl;
  return result ?? null;
}

export function getConfiguredRemoteUrls(): string[] {
  const stored = localStorage.getItem('dr_cat_remote_server_url');
  if (stored) return [stored];

  const globalUrl = typeof globalThis !== 'undefined' ? (globalThis as any).REMOTE_SERVER_URL : undefined;
  const builtUrl = typeof globalUrl === 'string' ? globalUrl : '';
  const globalUrls = typeof globalThis !== 'undefined' ? (globalThis as any).REMOTE_SERVER_URLS : undefined;
  const builtUrls = Array.isArray(globalUrls) ? globalUrls : [];

  if (builtUrls.length > 0) {
    return [...builtUrls];
  }

  if (builtUrl) {
    return [builtUrl];
  }

  return [];
}

function detectCapacitor(): boolean {
  return !!window.Capacitor || navigator.userAgent.toLowerCase().includes('capacitor');
}

function isLocalhost(): boolean {
  const host = window.location.hostname;
  return host === 'localhost' || host === '127.0.0.1' || host === '::1';
}

export const isOfflineApp: boolean =
  window.location.protocol === 'file:' ||
  window.location.protocol.startsWith('capacitor') ||
  window.location.hostname === '' ||
  (window.location.hostname === 'localhost' && window.location.port !== '3000' && window.location.port !== '8080') ||
  !!window.Capacitor ||
  navigator.userAgent.toLowerCase().includes('capacitor') ||
  localStorage.getItem('dr_cat_force_offline') === 'true';

let _cachedAppMode: AppModeType | null = null;

export function getAppMode(): AppModeType {
  if (_cachedAppMode) return _cachedAppMode;

  const isCapacitor = detectCapacitor();

  if (isCapacitor) {
    _cachedAppMode = APP_MODES.ANDROID_OFFLINE;
    console.log(`[App Mode] Detected (Capacitor): ${_cachedAppMode} (Host: ${window.location.hostname}). navigator.onLine ignored.`);
    return _cachedAppMode;
  }

  if (isLocalhost()) {
    _cachedAppMode = APP_MODES.ADMIN_LOCAL;
  } else {
    _cachedAppMode = APP_MODES.WEB_CLIENT;
  }

  console.log(`[App Mode] Detected: ${_cachedAppMode} (Host: ${window.location.hostname}).`);
  return _cachedAppMode;
}

export function setAppMode(mode: AppModeType): void {
  const oldMode = _cachedAppMode;
  _cachedAppMode = mode;
  if (oldMode !== mode) {
    console.log(`[API] App Mode changed from ${oldMode} to ${mode}`);
    window.dispatchEvent(new CustomEvent('drcat-app-mode-changed', { detail: { oldMode, mode } }));
  }
}

export function canEditDirectly(): boolean {
  return getAppMode() === APP_MODES.ADMIN_LOCAL;
}

export function canSuggest(): boolean {
  const mode = getAppMode();
  return mode === APP_MODES.WEB_CLIENT || mode === APP_MODES.ANDROID_ONLINE;
}

export function canSync(): boolean {
  const mode = getAppMode();
  return mode === APP_MODES.WEB_CLIENT || mode === APP_MODES.ANDROID_ONLINE;
}

export function isAdminMode(): boolean {
  return getAppMode() === APP_MODES.ADMIN_LOCAL;
}

export function hasRemoteServer(): boolean {
  return !!getPrimaryRemoteUrl();
}

export function hasRemoteServerConfigured(): boolean {
  const url = getRemoteServerUrl();
  return typeof url === 'string' && url.trim().length > 0;
}

function getPrimaryRemoteUrl(): string | null {
  const urls = getConfiguredRemoteUrls();
  return urls.length > 0 ? (urls[0] as string) : null;
}

function getApiUrl(endpoint: string, overrideUrl?: string | null): string {
  const configuredUrl = overrideUrl || getRemoteServerUrl();
  const isLocalWebBrowser = !isOfflineApp && isLocalhost();
  if (isLocalWebBrowser) return endpoint;
  if (isOfflineApp && configuredUrl) {
    return `${configuredUrl}${endpoint}`;
  }
  return endpoint;
}

function getHeaders(extraHeaders: Record<string, string> = {}): Record<string, string> {
  const token = localStorage.getItem('dr_cat_admin_token');
  const globalUrl = typeof globalThis !== 'undefined' ? (globalThis as any).REMOTE_SERVER_URL : undefined;
  const builtUrl = typeof globalUrl === 'string' ? globalUrl : '';
  const configuredUrl = localStorage.getItem('dr_cat_remote_server_url') || builtUrl || '';
  const isLocalWebBrowser = !isOfflineApp && isLocalhost();
  const providerExtraHeaders = isLocalWebBrowser ? {} : (typeof getExtraHeaders === 'function' ? getExtraHeaders(configuredUrl) : {});
  return {
    'Content-Type': 'application/json',
    'x-app-key': APP_DATA_KEY,
    ...(token ? { 'x-admin-token': token } : {}),
    ...providerExtraHeaders,
    ...extraHeaders
  };
}

const isCapacitorForTimeout = detectCapacitor();
const FETCH_TIMEOUT_MS = isCapacitorForTimeout ? 3000 : 8000;

async function fetchWithTimeout(url: string, options: RequestInit = {}): Promise<Response> {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), FETCH_TIMEOUT_MS);
  try {
    const res = await fetch(url, { ...options, signal: controller.signal });
    clearTimeout(timeoutId);
    return res;
  } catch (err) {
    clearTimeout(timeoutId);
    if (err instanceof Error && err.name === 'AbortError') {
      throw new Error(`Request timed out after ${FETCH_TIMEOUT_MS}ms: ${url}`);
    }
    throw err;
  }
}

export async function loginAdmin(password: string): Promise<{ success: boolean; error?: string; token?: string }> {
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

export async function logoutAdmin(): Promise<void> {
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

export async function checkAdminStatus(): Promise<boolean> {
  if (isOfflineApp) return false;
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

export async function checkIsLocal(): Promise<boolean> {
  if (isOfflineApp) {
    return true;
  }

  try {
    const res = await fetchWithTimeout('/api/is-local', { headers: getHeaders() });
    const data = await res.json();
    return !!data.isLocal;
  } catch (err) {
    console.error("Failed to check local status:", err);
    const host = window.location.hostname;
    return host === 'localhost' || host === '127.0.0.1' || host === '::1';
  }
}

export async function fetchCats(since?: number): Promise<any[]> {
  const mode = getAppMode();
  const queryParam = (typeof since === 'number' && !isNaN(since)) ? `?since=${since}` : '';

  if (mode === APP_MODES.ADMIN_LOCAL) {
    const res = await fetchWithTimeout(`/api/cats${queryParam}`, { headers: getHeaders() });
    if (!res.ok) throw new Error('Failed to fetch CATs from local server');
    const data = await res.json();
    const activeIds = res.headers.get('X-Active-Cat-IDs');
    if (activeIds) (data as any).activeIds = activeIds;
    return data;
  }

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

  const remoteUrls = getConfiguredRemoteUrls();
  const isCapacitor = detectCapacitor();
  const remoteTimeout = isCapacitor ? 1500 : 3000;

  let reachable = false;
  for (const url of remoteUrls) {
    try {
      const controller = new AbortController();
      const timeoutId = setTimeout(() => controller.abort(), remoteTimeout);
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

  for (const remoteUrl of remoteUrls) {
    try {
      const res = await fetchWithTimeout(getApiUrl(`/api/cats${queryParam}`, remoteUrl), { headers: getHeaders() });
      if (res.ok) {
        const data = await res.json();
        const activeIds = res.headers.get('X-Active-Cat-IDs');
        if (activeIds) (data as any).activeIds = activeIds;
        console.log('[API] fetchCats: loaded from remote server', remoteUrl, data.length);

        try {
          if (since === undefined || since === null) {
            localStorage.setItem(SYNC_CACHE_KEY, JSON.stringify(data));
          } else {
            let currentCached: any[] = [];
            const cachedDb = localStorage.getItem(SYNC_CACHE_KEY);
            if (cachedDb) {
              currentCached = JSON.parse(cachedDb);
            } else {
              const fallbackRes = await fetchWithTimeout('data/cats_db.json', { headers: STATIC_DATA_HEADERS });
              if (fallbackRes.ok) currentCached = await fallbackRes.json();
            }

            data.forEach((remote: any) => {
              const idx = currentCached.findIndex((c: any) => c.id === remote.id);
              if (idx !== -1) {
                currentCached[idx] = remote;
              } else {
                currentCached.push(remote);
              }
            });

            if (activeIds) {
              const activeSet = new Set(activeIds.split(',').map(id => parseInt(id)));
              const customCats = getItem<any[]>('dr_cat_custom_created_cats', []);
              const customCatIds = new Set(customCats.map((cc: any) => cc.id));
              currentCached = currentCached.filter((c: any) => {
                if ((c.id < 0 || c.isOffline === true || c.source === 'offline' || (typeof c.id === 'string' && c.id.startsWith('offline-')) || customCatIds.has(c.id))) {
                  return true;
                }
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

export async function fetchPdfs(): Promise<any[]> {
  if (isOfflineApp) {
    const res = await fetchWithTimeout('data/pdf_list.json', { headers: STATIC_DATA_HEADERS });
    if (!res.ok) throw new Error("Failed to fetch PDFs list statically");
    return res.json();
  }

  const res = await fetchWithTimeout('/api/pdfs', { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch PDFs");
  return res.json();
}

export async function saveCatDataToServer(id: number, data: any): Promise<any> {
  try {
    const res = await fetchWithTimeout(`/api/cats/${id}`, {
      method: 'POST',
      headers: getHeaders(),
      body: JSON.stringify(data)
    });
    if (res.ok) return res.json();
  } catch (err) {
    console.warn('[API] saveCatDataToServer failed:', err);
  }

  const localOverrides = getItem<any>('dr_cat_local_overrides', {});
  if (!localOverrides[id]) localOverrides[id] = {};
  if (data.summary !== undefined) localOverrides[id].customSummary = data.summary;
  if (data.ordonnance !== undefined) localOverrides[id].customOrdonnance = data.ordonnance;
  localStorage.setItem('dr_cat_local_overrides', JSON.stringify(localOverrides));
  return { success: true, message: "Modifications enregistrées localement." };
}

export async function deleteCatFromServer(id: number): Promise<any> {
  try {
    const res = await fetchWithTimeout(`/api/cats/${id}`, {
      method: 'DELETE',
      headers: getHeaders()
    });
    if (res.ok) return res.json();
  } catch (err) {
    console.warn('[API] deleteCatFromServer failed:', err);
  }

  const localOverrides = getItem<any>('dr_cat_local_overrides', {});
  if (!localOverrides[id]) localOverrides[id] = {};
  localOverrides[id].deleted = true;
  localStorage.setItem('dr_cat_local_overrides', JSON.stringify(localOverrides));
  return { success: true, message: "Fiche supprimée localement." };
}

export async function createCatOnServer(catData: any): Promise<any> {
  try {
    const res = await fetchWithTimeout('/api/cats', {
      method: 'POST',
      headers: getHeaders(),
      body: JSON.stringify(catData)
    });
    if (res.ok) return res.json();
  } catch (err) {
    console.warn('[API] createCatOnServer failed:', err);
  }
  return { success: false, error: "Failed to create CAT" };
}

export async function bulkImportCats(importList: any[]): Promise<any> {
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
    console.warn('[API] bulkImportCats failed:', err);
    throw err;
  }
}

export async function updateCatOverrides(id: number, data: any): Promise<any> {
  const localOverrides = getItem<any>('dr_cat_local_overrides', {});
  if (!localOverrides[id]) localOverrides[id] = {};
  if (data.summary !== undefined) localOverrides[id].customSummary = data.summary;
  if (data.ordonnance !== undefined) localOverrides[id].customOrdonnance = data.ordonnance;
  localStorage.setItem('dr_cat_local_overrides', JSON.stringify(localOverrides));
  return { success: true, message: "Modifications enregistrées localement." };
}

export async function submitSuggestion(suggestionData: any, onAttempt?: (attempt: number) => void): Promise<any> {
  const mode = getAppMode();

  if (mode === APP_MODES.ANDROID_OFFLINE) {
    return {
      success: false,
      error: 'Mode hors-ligne. Connexion Internet requise pour envoyer des suggestions.'
    };
  }

  if (mode === APP_MODES.ADMIN_LOCAL) {
    return {
      success: false,
      error: 'Les administrateurs modifient directement les fiches. Utilisez le bouton "Modifier".'
    };
  }

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
      console.warn(`[API] submitSuggestion: attempt ${attempts} failed.`, err);
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

export async function fetchSuggestions(): Promise<any[]> {
  const res = await fetchWithTimeout('/api/suggestions', { headers: getHeaders() });
  if (res.status === 403) throw new Error('403 Forbidden');
  if (!res.ok) throw new Error('Failed to fetch suggestions');
  return res.json();
}

export async function approveSuggestionOnServer(id: string): Promise<any> {
  const res = await fetchWithTimeout(getApiUrl(`/api/suggestions/${id}/approve`), {
    method: 'POST',
    headers: getHeaders()
  });
  if (res.status === 403) throw new Error('403 Forbidden');
  if (!res.ok) throw new Error('Failed to approve suggestion');
  return res.json();
}

export async function rejectSuggestionOnServer(id: string): Promise<any> {
  const res = await fetchWithTimeout(getApiUrl(`/api/suggestions/${id}/reject`), {
    method: 'POST',
    headers: getHeaders()
  });
  if (res.status === 403) throw new Error('403 Forbidden');
  if (!res.ok) throw new Error('Failed to reject suggestion');
  return res.json();
}

export async function updateSuggestionOnServer(id: string, updatedData: any): Promise<any> {
  const res = await fetchWithTimeout(getApiUrl(`/api/suggestions/${id}/edit`), {
    method: 'POST',
    headers: getHeaders({ 'Content-Type': 'application/json' }),
    body: JSON.stringify({ data: updatedData })
  });
  if (res.status === 403) throw new Error('403 Forbidden');
  if (!res.ok) throw new Error('Failed to update suggestion');
  return res.json();
}

export async function fetchSearchStatus(): Promise<any> {
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

export async function searchPdfsContent(query: string): Promise<any> {
  if (isOfflineApp) {
    try {
      const indexRes = await fetch('data/pdf_index.json', { headers: STATIC_DATA_HEADERS });
      if (!indexRes.ok) throw new Error("Failed to load PDF index");
      const offlinePdfIndexCache = await indexRes.json();

      const cleanQuery = query.trim().toLowerCase();
      const results: any[] = [];

      for (const doc of offlinePdfIndexCache) {
        if (doc.pdf.toLowerCase().includes(cleanQuery)) {
          results.push({
            pdf: doc.pdf,
            page: 1,
            snippet: "[Titre du fichier correspond] Document de référence disponible."
          });
        }
      }

      for (const doc of offlinePdfIndexCache) {
        if (!doc.pages) continue;
        for (const p of doc.pages) {
          if (!p.text) continue;

          if (results.some((r: any) => r.pdf === doc.pdf && r.page === p.page)) {
            continue;
          }

          const textLower = p.text.toLowerCase();
          const indexMatch = textLower.indexOf(cleanQuery);
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

export async function triggerReindexing(): Promise<any> {
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

export async function fetchPdfIndexStatus(): Promise<Record<string, any>> {
  if (isOfflineApp) {
    try {
      const indexRes = await fetch('data/pdf_index.json', { headers: STATIC_DATA_HEADERS });
      if (!indexRes.ok) throw new Error("Failed to load PDF index for status calculation");
      const index = await indexRes.json();

      const statusMap: Record<string, any> = {};
      for (const doc of index) {
        const totalPages = doc.pages ? doc.pages.length : 0;
        const pagesWithText = doc.pages ? doc.pages.filter((p: any) => p.text && p.text.trim().length > 15).length : 0;

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

  try {
    const res = await fetchWithTimeout('/api/pdf-index-status', { headers: getHeaders() });
    if (!res.ok) throw new Error("Failed to fetch PDF index status from server");
    return res.json();
  } catch (err) {
    console.error("Error fetching PDF status map from server:", err);
    return {};
  }
}

export async function checkRealConnection(): Promise<boolean> {
  const isLocalWebBrowser = !isOfflineApp && isLocalhost();
  if (isLocalWebBrowser) {
    return navigator.onLine;
  }

  const configuredUrls = getConfiguredRemoteUrls();

  for (const configuredUrl of configuredUrls) {
    try {
      const controller = new AbortController();
      const id = setTimeout(() => controller.abort(), 3000);
      const providerHeaders = typeof getExtraHeaders === 'function' ? getExtraHeaders(configuredUrl) : {};
      const res = await fetch(`${configuredUrl}/api/search-status`, {
        signal: controller.signal,
        headers: { ...getHeaders(), ...providerHeaders }
      });
      clearTimeout(id);
      if (res.ok) return true;
    } catch (_) {
      // Connection failed, try next configured URL
    }
  }

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

export async function pingEndpoint(url: string, timeoutMs = 2500): Promise<any> {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeoutMs);
  try {
    const provider = typeof detectProvider === 'function' ? detectProvider(url) : null;
    const providerHeaders = typeof getExtraHeaders === 'function' ? getExtraHeaders(url) : {};
    const configuredUrls = getConfiguredRemoteUrls();
    const isRemoteUrl = configuredUrls.some(u => u && url.includes(u));
    const isCorsSafePing = url.includes('httpbin.org') || url.includes('localhost') || url.includes('127.0.0.1') || isRemoteUrl;
    const fetchOpts: RequestInit = {
      method: 'GET',
      signal: controller.signal,
      headers: {
        ...(isCorsSafePing ? getHeaders() : {}),
        ...providerHeaders
      }
    };

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
    let message = err instanceof Error ? err.message : 'Unknown network error';
    if (err instanceof Error && err.name === 'AbortError') {
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

export async function fetchDiagnosticsSystem(): Promise<any> {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/system'), { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch system diagnostics");
  return res.json();
}

export async function fetchDiagnosticsDbStats(): Promise<any> {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/db-stats'), { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch DB stats");
  return res.json();
}

export async function fetchDiagnosticsIndexDetail(): Promise<any> {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/index-detail'), { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch index details");
  return res.json();
}

export async function fetchDiagnosticsRemoteUrl(): Promise<any> {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/remote-server-url'), { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch remote server URL");
  return res.json();
}

export async function updateDiagnosticsRemoteUrl(url: string): Promise<any> {
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

export async function fetchTunnelInfo(): Promise<any> {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/tunnel-info'), { headers: getHeaders() });
  if (!res.ok) {
    const errData = await res.json().catch(() => ({}));
    throw new Error(errData.error || "Failed to fetch tunnel info");
  }
  return res.json();
}

export async function fetchServerMetrics(): Promise<any> {
  const res = await fetchWithTimeout(getApiUrl('/api/performance/server-metrics'), { headers: getHeaders() });
  if (!res.ok) {
    const errData = await res.json().catch(() => ({}));
    throw new Error(errData.error || "Failed to fetch server metrics");
  }
  return res.json();
}

export async function fetchRateLimits(): Promise<any> {
  const res = await fetchWithTimeout(getApiUrl('/api/diagnostics/rate-limits'), { headers: getHeaders() });
  if (!res.ok) {
    const errData = await res.json().catch(() => ({}));
    throw new Error(errData.error || "Failed to fetch rate limits");
  }
  return res.json();
}

export async function uploadPdf(filename: string, base64Data: string): Promise<any> {
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
