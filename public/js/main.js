import { state, getLocalProgress } from './state.js';
import * as api from './api.js';
import * as sidebar from './components/sidebar.js';
import * as workspace from './components/workspace.js';
import * as dashboard from './components/dashboard.js';
import * as quiz from './components/quiz.js';
import * as diagnostics from './components/diagnostics.js';
import * as performanceComponent from './components/performance.js';
import { showToast, runSuggestionWithUI } from './utils.js';
import { PROVIDERS } from './server-providers.js';

// Tracks whether the current physical device is localhost (set once on load)
let isLocalDevice = false;


// Global administrative error interceptor
window.handleAdminError = async function(err) {
  if (err && (err.message === "403 Forbidden" || err.message === "401 Unauthorized")) {
    const password = prompt("Action réservée aux administrateurs. Saisissez le mot de passe admin pour déverrouiller :");
    if (password) {
      try {
        const res = await api.loginAdmin(password);
        if (res.success && res.token) {
          alert("Connexion réussie ! L'action va être relancée.");
          location.reload();
          return true;
        } else {
          alert("Mot de passe incorrect.");
        }
      } catch (loginErr) {
        console.error("Login failed:", loginErr);
        alert("Erreur lors de la connexion.");
      }
    }
    return true; // request handled
  }
  return false;
};

// DOM Elements
let addCatBtn, addCatModal, closeAddCatModalBtn, cancelAddCatBtn, addCatForm;

// Entry Point
async function bootstrapApp() {
  // Protect all localStorage reads from crashing the app
  const origLocalStorageGetItem = Storage.prototype.getItem;
  Storage.prototype.getItem = function(key) {
    try { return origLocalStorageGetItem.call(this, key); }
    catch (_) { return null; }
  };

  // Global Error Interceptor for Verbose Console Logs & Toast Notifications
  window.onerror = function(message, source, lineno, colno, error) {
    const errorStr = `[Runtime Error] ${message} at ${source}:${lineno}:${colno}`;
    console.error(errorStr, error);
    showToast("Une erreur d'exécution est survenue. Détails enregistrés dans l'onglet Diagnostic.", "fa-triangle-exclamation", 7000);
    return false; // Let browser default log run as well
  };

  window.onunhandledrejection = function(event) {
    const errorStr = `[Promise Rejection] ${event.reason}`;
    console.error(errorStr, event.reason);
    showToast("Erreur réseau ou réponse de base de données non reconnue.", "fa-circle-exclamation", 5000);
  };

  // PWA Service Worker — only register on production, unregister on dev to avoid stale caches
  if ('serviceWorker' in navigator) {
    const isDev = location.hostname === 'localhost' ||
                  location.hostname === '127.0.0.1' ||
                  PROVIDERS.some(p => p.isDevHostname(location.hostname));
   
    if (isDev) {
      // Development: aggressively unregister all service workers and clear caches
      navigator.serviceWorker.getRegistrations().then(regs => {
        regs.forEach(reg => reg.unregister());
      });
      caches.keys().then(keys => keys.forEach(k => caches.delete(k)));
    } else {
      // Production: register the service worker for offline PWA support
      window.addEventListener('load', () => {
        navigator.serviceWorker.register('/service-worker.js')
          .then(reg => console.log('PWA SW registered:', reg.scope))
          .catch(err => console.error('PWA SW failed:', err));
      });
    }
  }
 
  // Theme Toggle Initialization
  const themeToggleBtn = document.getElementById('theme-toggle-btn');
  const themeToggleIcon = document.getElementById('theme-toggle-icon');
  
  const currentTheme = localStorage.getItem('theme') || (window.matchMedia('(prefers-color-scheme: light)').matches ? 'light' : 'dark');
  if (currentTheme === 'light') {
    document.body.classList.add('light-theme');
    if (themeToggleIcon) {
      themeToggleIcon.classList.remove('fa-moon');
      themeToggleIcon.classList.add('fa-sun');
    }
  }
 
  if (themeToggleBtn) {
    themeToggleBtn.addEventListener('click', () => {
      document.body.classList.toggle('light-theme');
      const isLight = document.body.classList.contains('light-theme');
      localStorage.setItem('theme', isLight ? 'light' : 'dark');
      
      if (themeToggleIcon) {
        if (isLight) {
          themeToggleIcon.classList.remove('fa-moon');
          themeToggleIcon.classList.add('fa-sun');
        } else {
          themeToggleIcon.classList.remove('fa-sun');
          themeToggleIcon.classList.add('fa-moon');
        }
      }
    });
  }
 
  // Initialize Components
  sidebar.initSidebar(selectCatWrapper, onFilterTriggered);
  workspace.initWorkspace(onStatusChange, onCatDeleted, onProgressReset);
  dashboard.initDashboard(selectCatWrapper, onSuggestionHandled);
  quiz.initQuiz(selectCatWrapper);
  diagnostics.initDiagnostics();
  performanceComponent.initPerformance();
 
  // Modal DOM Elements
  addCatBtn = document.getElementById('add-cat-btn');
  addCatModal = document.getElementById('add-cat-modal');
  closeAddCatModalBtn = document.getElementById('close-add-cat-modal-btn');
  cancelAddCatBtn = document.getElementById('cancel-add-cat-btn');
  addCatForm = document.getElementById('add-cat-form');
 
  // Wire up Modal Event Listeners
  if (addCatBtn) {
    addCatBtn.addEventListener('click', () => {
      const selectEl = document.getElementById('new-cat-category-select');
      const inputEl = document.getElementById('new-cat-category');
      
      if (selectEl) {
        const categories = [...new Set(state.allCats.map(c => c.category))].filter(Boolean).sort();
        selectEl.innerHTML = `
          <option value="">-- Sélectionner une spécialité existante --</option>
          ${categories.map(cat => `<option value="${cat}">${cat}</option>`).join('')}
        `;
        
        selectEl.onchange = () => {
          if (selectEl.value && inputEl) {
            inputEl.value = selectEl.value;
          }
        };
      }
      if (addCatModal) addCatModal.style.display = 'flex';
    });
  }
 
  const closeModal = () => {
    if (addCatModal) addCatModal.style.display = 'none';
    if (addCatForm) addCatForm.reset();
  };
 
  if (closeAddCatModalBtn) closeAddCatModalBtn.addEventListener('click', closeModal);
  if (cancelAddCatBtn) cancelAddCatBtn.addEventListener('click', closeModal);
 
  if (addCatForm) {
    addCatForm.addEventListener('submit', async (e) => {
      e.preventDefault();
      
      const title = document.getElementById('new-cat-title').value.trim();
      const category = document.getElementById('new-cat-category').value.trim();
      const red_flags = document.getElementById('new-cat-red-flags').value.trim();
      const summary = document.getElementById('new-cat-summary').value.trim();
      const ordonnance = document.getElementById('new-cat-ordonnance').value.trim();
      
      const rawKeywords = document.getElementById('new-cat-pdf-keywords').value;
      const pdf_keywords = rawKeywords ? rawKeywords.split(',').map(kw => kw.trim()).filter(kw => kw) : [];
 
      if (state.isAdmin) {
        try {
          const result = await api.createCatOnServer({ title, category, red_flags, summary, ordonnance, pdf_keywords });
          if (result.success) {
            closeModal();
            alert(`La fiche CAT "${title}" a été ajoutée avec succès !`);
            await initApp();
            const newCat = state.allCats.find(c => c.id === result.cat.id);
            if (newCat) selectCatWrapper(newCat);
          } else {
            alert("Erreur : " + result.error);
          }
        } catch (err) {
          console.error(err);
          if (window.handleAdminError && await window.handleAdminError(err)) {
            return;
          }
          alert("Erreur lors de l'enregistrement de la nouvelle CAT.");
        }
      } else {
        // Confirmation dialog for suggestions
        const confirmSubmit = confirm(
          "Attention : Cette nouvelle fiche ne sera pas ajoutée directement. Elle sera envoyée à l'administrateur du site pour relecture et validation avant d'être intégrée.\n\nSouhaitez-vous envoyer cette proposition ?"
        );
        if (!confirmSubmit) return;
 
        try {
          const success = await runSuggestionWithUI(
            api.submitSuggestion,
            {
              type: 'add',
              data: { title, category, red_flags, summary, ordonnance, pdf_keywords }
            },
            `Votre proposition de nouvelle fiche "${title}" a été envoyée à l'administrateur pour validation.`
          );
          if (success) {
            closeModal();
          }
        } catch (err) {
          console.error(err);
          alert("Erreur lors de l'envoi de la proposition.");
        }
      }
    });
  }
 
  // Wire up Admin Login Button Event Listener
  let adminLoginBtn = document.getElementById('admin-login-btn');
  if (adminLoginBtn) {
    adminLoginBtn.addEventListener('click', async () => {
      if (state.isAdmin) {
        if (confirm("Voulez-vous vous déconnecter du mode administrateur ?")) {
          await api.logoutAdmin();
          alert("Déconnexion réussie.");
          location.reload();
        }
      } else {
        const password = prompt("Veuillez saisir le mot de passe administrateur :");
        if (password) {
          try {
            const res = await api.loginAdmin(password);
            if (res.success && res.token) {
              alert("Connexion réussie !");
              location.reload();
            } else {
              alert(res.error || "Mot de passe incorrect.");
            }
          } catch (err) {
            console.error("Login error:", err);
            alert("Erreur lors de la connexion.");
          }
        }
      }
    });
  }
 
  // --- Localhost-only Admin Button Visibility ---
  if (adminLoginBtn) {
    adminLoginBtn.style.display = 'none';
  }
 
  // Handle Online/Offline Status Events
  window.addEventListener('online', () => {
    showToast("Connexion rétablie ! L'application fonctionne en ligne.", "fa-wifi", 4000);
  });
  window.addEventListener('offline', () => {
    showToast("Connexion perdue. Les modifications locales seront enregistrées sur ce navigateur.", "fa-circle-xmark", 6000);
  });
 
  // Handle keyboard shortcuts
  window.addEventListener('keydown', (e) => {
    const isEditing = document.activeElement.tagName === 'INPUT' || document.activeElement.tagName === 'TEXTAREA';
    if (e.key.toLowerCase() === 's' && !isEditing) {
      e.preventDefault();
      const searchBox = document.getElementById('search-input');
      if (searchBox) {
        searchBox.focus();
        searchBox.select();
      }
    }
 
    if (e.key === 'Escape') {
      const modal = document.getElementById('add-cat-modal');
      if (modal && modal.style.display !== 'none') {
        modal.style.display = 'none';
        const form = document.getElementById('add-cat-form');
        if (form) form.reset();
      }
    }
 
    if ((e.key === 'ArrowDown' || e.key === 'ArrowUp') && !isEditing) {
      e.preventDefault();
      const activeItem = document.querySelector('.cat-item.active');
      const items = Array.from(document.querySelectorAll('.cat-item'));
      if (items.length === 0) return;
 
      let nextIndex = 0;
      if (activeItem) {
        const currentIndex = items.indexOf(activeItem);
        if (e.key === 'ArrowDown') {
          nextIndex = (currentIndex + 1) % items.length;
        } else {
          nextIndex = (currentIndex - 1 + items.length) % items.length;
        }
      }
      
      const targetItem = items[nextIndex];
      if (targetItem) {
        targetItem.click();
        targetItem.scrollIntoView({ block: 'nearest', behavior: 'smooth' });
      }
    }
  });
 
  // Load Initial App State
  await initApp();
 
  // Fetch initial PDF indexing status
  workspace.updatePdfIndexStatus();
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', bootstrapApp);
} else {
  bootstrapApp();
}
 
// App Initialization routine with robust fault-isolation boundaries
async function initApp() {
  const loadingOverlay = document.getElementById('app-loading-overlay');
  const loadingBar = document.getElementById('app-loading-bar');
  if (loadingOverlay) loadingOverlay.classList.remove('hidden');
  if (loadingBar) loadingBar.style.width = '5%';

  // Update loading bar helper
  const setLoadingProgress = (pct) => {
    if (loadingBar) loadingBar.style.width = `${Math.min(pct, 95)}%`;
  };

  setLoadingProgress(10);

  // Startup breadcrumbs — helps diagnose where time is spent
  const mark = (label) => { console.time('[Startup] ' + label); return label; };
  const endMark = (label) => console.timeEnd('[Startup] ' + label);
  const phase1 = mark('connection-check');

  // Perform robust connection ping test at boot
  // On localhost: skip remote URL ping to avoid useless cross-origin noise
  const isLocal = location.hostname === 'localhost' || location.hostname === '127.0.0.1' || isLocalDevice;
  if (isLocal) {
    state.isOnlineAtStartup = navigator.onLine;
    console.log("[Startup] Localhost detected, skipping remote connectivity ping. Online:", state.isOnlineAtStartup);
  } else {
    try {
      state.isOnlineAtStartup = await api.checkRealConnection();
      console.log("[Startup] Real connection check status:", state.isOnlineAtStartup);
    } catch (err) {
      console.warn("[Startup] Real connection check failed, assuming offline mode.", err);
      state.isOnlineAtStartup = false;
    }
  }
  endMark(phase1);
  setLoadingProgress(25);

  // Start background network check interval to alert transitions
  let lastState = state.isOnlineAtStartup;
  async function checkNetworkPeriodically() {
    // On localhost, only use navigator.onLine — avoid cross-origin pings to the tunnel URL
    if (location.hostname === 'localhost' || location.hostname === '127.0.0.1' || isLocalDevice) {
      const current = navigator.onLine;
      if (lastState !== current) {
        if (current) {
          showToast("Connexion rétablie ! L'application fonctionne en ligne.", "fa-wifi", 4000);
        } else {
          showToast("Connexion perdue. Mode hors-ligne activé.", "fa-circle-xmark", 6000);
        }
        state.isOnlineAtStartup = current;
        lastState = current;
        updateEditButtonsVisibility();
      }
      setTimeout(checkNetworkPeriodically, 8000);
      return;
    }
  }
  setTimeout(checkNetworkPeriodically, 8000);

  // Check if current connection is local
  const phase2 = mark('localhost-check');
  try {
    isLocalDevice = await api.checkIsLocal();
  } catch (err) {
    console.warn("[Startup] Localhost check failed, assuming non-local.", err);
    isLocalDevice = false;
  }
  endMark(phase2);
  setLoadingProgress(40);

  // 1. Check Admin status
  const phase3 = mark('admin-check');
  try {
    state.isAdmin = await api.checkAdminStatus();
    console.log("Admin mode:", state.isAdmin);
  } catch (err) {
    console.warn("[Startup] Admin status check failed.", err);
    state.isAdmin = false;
  }
  endMark(phase3);

  updateEditButtonsVisibility();
  setLoadingProgress(55);

  // 2. Fetch CATs with isolated fallback (Auto-recovery Boundary)
  const phase4 = mark('fetch-cats');
  const fetchStart = performance.now();
  let cats = [];
  try {
    cats = await api.fetchCats();
    console.log('[Startup] fetchCats duration:', Math.round(performance.now() - fetchStart), 'ms');
    if (window.perf) window.perf.recordMilestone('catsFetched');
  } catch (err) {
    console.error("[Startup Error Boundary] Failed to fetch CATs from server. Retrying local bundled database...", err);
    console.log('[Startup] fetchCats FAILED after:', Math.round(performance.now() - fetchStart), 'ms');
    try {
      // Automatic fallback to local bundled file to keep the app working
      const res = await fetch('data/cats_db.json');
      if (!res.ok) throw new Error("Local fallback CAT database missing");
      cats = await res.json();
      showToast("Serveur injoignable. Chargement de la base de secours locale.", "fa-triangle-exclamation", 6000);
    } catch (fallbackErr) {
      console.error("[Startup Error Boundary] Critical: Local fallback database failed to load.", fallbackErr);
      showToast("Base de données indisponible. Vérifiez votre connexion.", "fa-circle-exclamation", 9000);
      if (loadingOverlay) loadingOverlay.classList.add('hidden');
      return; // Exit boot if both server and local files are completely dead
    }
  }
  endMark(phase4);

  // 3. Merge server CATs with local progress and local offline overrides
  const phase5 = mark('merge-cats');
  const localProgress = getLocalProgress();
  let localOverrides = {};
  let customCreatedCats = [];
  try {
    localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
    customCreatedCats = JSON.parse(localStorage.getItem('dr_cat_custom_created_cats') || '[]');
  } catch (_) {}

  // Combine standard CATs with custom ones created offline
  if (api.isOfflineApp) {
    cats = cats.filter(c => !localOverrides[c.id] || !localOverrides[c.id].deleted);
    cats = [...cats, ...customCreatedCats.filter(c => !localOverrides[c.id] || !localOverrides[c.id].deleted)];
  }

  state.allCats = cats.map(cat => {
    const localEntry = localProgress[cat.id] || {};
    const overrides = localOverrides[cat.id] || {};
    return {
      ...cat,
      status: localEntry.status || 'todo',
      notes: localEntry.notes || '',
      summary: overrides.customSummary || cat.summary,
      customSummary: overrides.customSummary || cat.summary,
      ordonnance: overrides.customOrdonnance || cat.ordonnance,
      customOrdonnance: overrides.customOrdonnance || cat.ordonnance
    };
  });
  endMark(phase5);

  // 4. Instantly render UI Components
  const phase6 = mark('render-ui');
  try {
    sidebar.populateCategoryFilter(state.allCats);
    sidebar.renderCatList(state.allCats, selectCatWrapper);
    calculateStats();
    dashboard.renderDashboard(selectCatWrapper);
  } catch (err) {
    console.error("[Startup Render Error] Failed rendering initial layout:", err);
  }
  endMark(phase6);
  setLoadingProgress(75);

  // 5. Restore saved navigation state (if returning from PDF reader)
  try {
    workspace.restoreAppState();
  } catch (err) {
    console.error("[Startup Navigation Error] Failed restoring previous state:", err);
  }

  // 6. Fetch PDFs and index status asynchronously in the background to speed up initial load
  // If this fails, the app stays fully operational for CAT reading.
  setTimeout(() => {
    if (navigator.onLine === false) {
      // Offline: load from local files directly without attempting remote API pings
      fetch('data/pdf_list.json')
        .then(r => r.json())
        .then(pdfs => {
          state.allPdfs = pdfs;
          workspace.updatePdfIndexStatus();
          console.log("[Background] PDFs loaded from local cache (offline).");
        }).catch(err => console.error("Failed loading local PDF list:", err));
      return;
    }

    Promise.all([
      api.fetchPdfs().catch(err => {
        console.warn("[Background Boundary] PDF retrieval failed, falling back to local list.", err);
        return fetch('data/pdf_list.json').then(r => r.json()).catch(() => []);
      }),
      api.fetchPdfIndexStatus().catch(err => {
        console.warn("[Background Boundary] Index status retrieval failed.", err);
        return {};
      })
    ]).then(([pdfs, pdfIndexStatus]) => {
      state.allPdfs = pdfs;
      state.pdfIndexStatus = pdfIndexStatus;
      workspace.updatePdfIndexStatus();
      if (state.activeCat) {
        workspace.selectCat(state.activeCat, true);
      }
      console.log("[Background] PDFs and index status loaded successfully.");
    }).catch(err => {
      console.error("[Background Critical] Async startup block failed:", err);
    });
  }, 1500);

  setLoadingProgress(100);

  // Brief delay so the user sees 100% fill, then hide overlay
  setTimeout(() => {
    if (loadingOverlay) loadingOverlay.classList.add('hidden');
  }, 350);
}
// Select CAT wrapper that delegates to workspace component
function selectCatWrapper(cat) {
  workspace.selectCat(cat);
}

// Side-effect callback when status updates
function onStatusChange(cat) {
  sidebar.updateSidebarItemUI(cat);
  calculateStats();
}

// Side-effect callback when active status filter triggers search
function onFilterTriggered(filteredCats) {
  sidebar.renderCatList(filteredCats, selectCatWrapper);
}

// Side-effect callback when a CAT is deleted
async function onCatDeleted() {
  await initApp();
  dashboard.showDashboard(selectCatWrapper);
}

// Side-effect callback when progress resets
async function onProgressReset() {
  await initApp();
  dashboard.showDashboard(selectCatWrapper);
}

// Side-effect callback when a pending suggestion is approved or rejected
async function onSuggestionHandled() {
  await initApp();
}

// Helper to compute counts and update overall progress bar UI elements
export function calculateStats() {
  let todo = 0, doing = 0, done = 0;
  
  state.allCats.forEach(cat => {
    if (cat.status === 'done') done++;
    else if (cat.status === 'doing') doing++;
    else todo++;
  });

  const countTodo = document.getElementById('count-todo');
  const countDoing = document.getElementById('count-doing');
  const countDone = document.getElementById('count-done');
  const progressPercent = document.getElementById('progress-percent');
  const progressFill = document.getElementById('progress-fill');

  if (countTodo) countTodo.textContent = todo;
  if (countDoing) countDoing.textContent = doing;
  if (countDone) countDone.textContent = done;

  const total = state.allCats.length;
  const percent = total > 0 ? Math.round((done / total) * 100) : 0;
  
  if (progressPercent) progressPercent.textContent = `${percent}%`;
  if (progressFill) progressFill.style.width = `${percent}%`;

  // If dashboard is active, refresh stats displays inside dashboard
  dashboard.renderDashboard(selectCatWrapper);
}

export function updateEditButtonsVisibility() {
  const addCatBtn = document.getElementById('add-cat-btn');
  const adminLoginBtn = document.getElementById('admin-login-btn');
  
  if (adminLoginBtn) {
    // Strictly restrict Admin login button to localhost browser environment (hide on Capacitor)
    if (!api.isOfflineApp && (isLocalDevice || state.isAdmin)) {
      adminLoginBtn.style.display = 'flex';
      if (state.isAdmin) {
        adminLoginBtn.innerHTML = '<i class="fa-solid fa-lock-open"></i> Déconnexion Admin';
        adminLoginBtn.style.backgroundColor = 'rgba(16, 185, 129, 0.15)';
        adminLoginBtn.style.color = 'var(--color-success)';
      } else {
        adminLoginBtn.innerHTML = '<i class="fa-solid fa-lock"></i> Connexion Admin';
        adminLoginBtn.style.backgroundColor = 'var(--bg-card)';
        adminLoginBtn.style.color = 'var(--text-primary)';
      }
    } else {
      adminLoginBtn.style.display = 'none';
    }
  }

  // Set edit buttons and add button text/icons dynamically based on Admin mode
  const editSummaryBtnEl = document.getElementById('edit-summary-btn');
  const editPrescriptionBtnEl = document.getElementById('edit-prescription-btn');
  const deleteBtn = document.getElementById('delete-cat-btn');

  if (state.isAdmin) {
    if (addCatBtn) {
      addCatBtn.style.display = 'flex';
      addCatBtn.innerHTML = '<i class="fa-solid fa-plus"></i> CAT';
    }
    if (editSummaryBtnEl) {
      editSummaryBtnEl.innerHTML = '<i class="fa-solid fa-pen"></i> Modifier la fiche';
      editSummaryBtnEl.style.display = 'inline-flex';
    }
    if (editPrescriptionBtnEl) {
      editPrescriptionBtnEl.innerHTML = '<i class="fa-solid fa-pen"></i> Modifier ordonnance';
      editPrescriptionBtnEl.style.display = 'inline-flex';
    }
    if (deleteBtn) {
      // Core CATs cannot be deleted, custom CATs (id > 55) can be deleted by admin
      if (state.activeCat && state.activeCat.id > 55) {
        deleteBtn.style.display = 'inline-flex';
      } else {
        deleteBtn.style.display = 'none';
      }
    }
  } else {
    // Non-admin mode (suggestions only)
    if (api.isOfflineApp) {
      // In offline mode with no server connection, hide server-side suggestions buttons
      if (addCatBtn) {
        addCatBtn.style.display = state.isOnlineAtStartup ? 'flex' : 'none';
        addCatBtn.innerHTML = '<i class="fa-solid fa-lightbulb"></i> Suggérer CAT';
      }
      const displayStyle = state.isOnlineAtStartup ? 'inline-flex' : 'none';
      if (editSummaryBtnEl) {
        editSummaryBtnEl.innerHTML = '<i class="fa-solid fa-pen-fancy"></i> Proposer modif.';
        editSummaryBtnEl.style.display = displayStyle;
      }
      if (editPrescriptionBtnEl) {
        editPrescriptionBtnEl.innerHTML = '<i class="fa-solid fa-pen-fancy"></i> Proposer ordonnance';
        editPrescriptionBtnEl.style.display = displayStyle;
      }
      if (deleteBtn) deleteBtn.style.display = 'none';
    } else {
      // Remote server connected web client (default view)
      if (addCatBtn) {
        addCatBtn.style.display = 'flex';
        addCatBtn.innerHTML = '<i class="fa-solid fa-lightbulb"></i> Suggérer CAT';
      }
      if (editSummaryBtnEl) {
        editSummaryBtnEl.innerHTML = '<i class="fa-solid fa-pen-fancy"></i> Proposer modif.';
        editSummaryBtnEl.style.display = 'inline-flex';
      }
      if (editPrescriptionBtnEl) {
        editPrescriptionBtnEl.innerHTML = '<i class="fa-solid fa-pen-fancy"></i> Proposer ordonnance';
        editPrescriptionBtnEl.style.display = 'inline-flex';
      }
      if (deleteBtn) deleteBtn.style.display = 'none';
    }
  }

  // Ensure diagnostics button visibility is synced
  diagnostics.updateDiagnosticsButtonVisibility();
  performanceComponent.updatePerformanceButtonVisibility();
}
