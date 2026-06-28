// Server communication routines for Dr. CAT
// Support for both online (server-backed) mode and offline standalone (Capacitor/static) mode

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
    // Standalone app local admin bypass: accept any password for friction-free local customizations
    localStorage.setItem('dr_cat_admin_token', 'local-token');
    return { success: true, token: 'local-token' };
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
  if (isOfflineApp) {
    const token = localStorage.getItem('dr_cat_admin_token');
    return token === 'local-token';
  }

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
  if (isOfflineApp) {
    const res = await fetch('data/cats_db.json');
    if (!res.ok) throw new Error("Failed to fetch CATs statically");
    return res.json();
  }

  const res = await fetch('/api/cats', { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch CATs");
  return res.json();
}

export async function fetchPdfs() {
  if (isOfflineApp) {
    // Dynamically retrieve PDF filenames from indexed pdfs index
    const res = await fetch('data/pdf_index.json');
    if (!res.ok) throw new Error("Failed to fetch PDFs index statically");
    const index = await res.json();
    return index.map(doc => doc.pdf);
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
  if (isOfflineApp) {
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

  const res = await fetch('/api/cats', {
    method: 'POST',
    headers: getHeaders(),
    body: JSON.stringify(catData)
  });
  if (res.status === 403) throw new Error("403 Forbidden");
  if (!res.ok) throw new Error("Failed to create CAT");
  return res.json();
}

export async function submitSuggestion(suggestionData) {
  if (isOfflineApp) {
    // Offline suggestion is directly merged into local overrides as a shortcut
    return saveCatDataToServer(suggestionData.catId, {
      summary: suggestionData.summary,
      ordonnance: suggestionData.ordonnance
    });
  }

  const res = await fetch('/api/suggestions', {
    method: 'POST',
    headers: getHeaders(),
    body: JSON.stringify(suggestionData)
  });
  if (!res.ok) throw new Error("Failed to submit suggestion");
  return res.json();
}

export async function fetchSuggestions() {
  if (isOfflineApp) {
    return []; // No admin suggestions view in offline mode
  }

  const res = await fetch('/api/suggestions', { headers: getHeaders() });
  if (res.status === 403) throw new Error("403 Forbidden");
  if (!res.ok) throw new Error("Failed to fetch suggestions");
  return res.json();
}

export async function approveSuggestionOnServer(id) {
  if (isOfflineApp) return { success: true };
  const res = await fetch(`/api/suggestions/${id}/approve`, { 
    method: 'POST',
    headers: getHeaders()
  });
  if (res.status === 403) throw new Error("403 Forbidden");
  if (!res.ok) throw new Error("Failed to approve suggestion");
  return res.json();
}

export async function rejectSuggestionOnServer(id) {
  if (isOfflineApp) return { success: true };
  const res = await fetch(`/api/suggestions/${id}/reject`, { 
    method: 'POST',
    headers: getHeaders()
  });
  if (res.status === 403) throw new Error("403 Forbidden");
  if (!res.ok) throw new Error("Failed to reject suggestion");
  return res.json();
}

export async function fetchSearchStatus() {
  if (isOfflineApp) {
    return {
      isIndexing: false,
      totalFiles: 76,
      indexedFiles: 76,
      currentFile: ''
    };
  }

  const res = await fetch('/api/search-status', { headers: getHeaders() });
  if (!res.ok) throw new Error("Failed to fetch search status");
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
