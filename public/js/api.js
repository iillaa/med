// Server communication routines for Dr. CAT

function getHeaders(extraHeaders = {}) {
  const token = localStorage.getItem('dr_cat_admin_token');
  return {
    'Content-Type': 'application/json',
    ...(token ? { 'x-admin-token': token } : {}),
    ...extraHeaders
  };
}

export async function loginAdmin(password) {
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
  const res = await fetch('/api/suggestions', {
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
        if (pagesWithText > 0) {
          status = (pagesWithText === totalPages) ? 'green' : 'orange';
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
