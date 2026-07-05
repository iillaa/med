import { state, getLocalProgress } from './state.js';
import * as api from './api.js';
import { initDebugConsole } from './debug-console.js';
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
  // ── START DEBUG CONSOLE (catches everything from the beginning) ──
  initDebugConsole();
  
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

  const setLoadingProgress = (pct) => {
    if (loadingBar) loadingBar.style.width = `${Math.min(pct, 95)}%`;
  };

  setLoadingProgress(10);

  // ── 1. Detect App Mode (Fast, no network) ──
  const mode = api.getAppMode();
  console.log(`[Startup] Mode: ${mode}`);
  setLoadingProgress(20);

  // ── 2. Admin Check (only if local) ──
  try {
    state.isAdmin = await api.checkAdminStatus();
    console.log("Admin mode:", state.isAdmin);
  } catch (err) {
    console.warn("[Startup] Admin status check failed.", err);
    state.isAdmin = false;
  }
  updateEditButtonsVisibility();
  setLoadingProgress(40);

  // ── 3. Fetch CATs (CRITICAL: This must NEVER block on Android) ──
  let cats = [];
  try {
    cats = await api.fetchCats();
    if (window.perf) window.perf.recordMilestone('catsFetched');
  } catch (err) {
    console.error("[Startup Error] Fetch CATs failed, using emergency fallback.", err);
    try {
      const res = await fetch('data/cats_db.json');
      if (!res.ok) throw new Error("Emergency fallback failed");
      cats = await res.json();
      showToast("Chargement de secours local.", "fa-triangle-exclamation", 4000);
    } catch (fallbackErr) {
      console.error("[Startup Critical] No data available.", fallbackErr);
      showToast("Base de données indisponible.", "fa-circle-exclamation", 9000);
      if (loadingOverlay) loadingOverlay.classList.add('hidden');
      return;
    }
  }
  setLoadingProgress(60);

  // ── 4. Merge Data ──
  const localProgress = getLocalProgress();
  let localOverrides = {};
  let customCreatedCats = [];
  try {
    localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
    customCreatedCats = JSON.parse(localStorage.getItem('dr_cat_custom_created_cats') || '[]');
  } catch (_) {}

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
  setLoadingProgress(75);

  // ── 5. Render UI ──
  try {
    sidebar.populateCategoryFilter(state.allCats);
    sidebar.renderCatList(state.allCats, selectCatWrapper);
    calculateStats();
    dashboard.renderDashboard(selectCatWrapper);
  } catch (err) {
    console.error("[Startup Render Error]", err);
  }
  setLoadingProgress(90);

  // ── 6. Restore Navigation State ──
  try {
    workspace.restoreAppState();
  } catch (err) {
    console.error("[Startup Navigation Error]", err);
  }

  // ── 7. Background Tasks (PDFs, Indexes) ──
  setTimeout(() => {
    Promise.all([
      api.fetchPdfs().catch(err => {
        console.warn("[Background] PDF fetch failed, using local list.", err);
        return fetch('data/pdf_list.json').then(r => r.json()).catch(() => []);
      }),
      api.fetchPdfIndexStatus().catch(err => {
        console.warn("[Background] Index status failed.", err);
        return {};
      })
    ]).then(([pdfs, pdfIndexStatus]) => {
      state.allPdfs = pdfs;
      state.pdfIndexStatus = pdfIndexStatus;
      workspace.updatePdfIndexStatus();
      if (state.activeCat) {
        workspace.selectCat(state.activeCat, true);
      }
      console.log("[Background] PDFs loaded.");
    }).catch(err => console.error("[Background] PDF load failed:", err));
  }, 100);

  setLoadingProgress(100);

  // ── 8. Hide Overlay ──
  setTimeout(() => {
    if (loadingOverlay) loadingOverlay.classList.add('hidden');
  }, 350);

  // ── 9. 🔥 BACKGROUND SYNC FOR ANDROID (NO FREEZE + REMOTE SYNC) 🔥 ──
  setTimeout(() => {
    if (api.isOfflineApp && api.hasRemoteServer()) {
      console.log('[Background Sync] Checking for remote updates...');
      (async () => {
        try {
          const remoteUrls = api.getConfiguredRemoteUrls();
          let reachable = false;
          for (const url of remoteUrls) {
            try {
              const controller = new AbortController();
              const timeoutId = setTimeout(() => controller.abort(), 1500);
              await fetch(`${url}/api/search-status`, {
                signal: controller.signal,
                mode: 'no-cors'
              });
              clearTimeout(timeoutId);
              reachable = true;
              break;
            } catch (_) {}
          }

          if (reachable) {
            console.log('[Background Sync] Server reachable! Fetching latest data...');
            const freshCats = await api.fetchCats();

            const localProgress = getLocalProgress();
            const localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
            const existingIds = new Set(freshCats.map(c => c.id));
            const customCats = JSON.parse(localStorage.getItem('dr_cat_custom_created_cats') || '[]')
              .filter(c => !existingIds.has(c.id));

            state.allCats = [...freshCats, ...customCats].map(cat => {
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

            sidebar.renderCatList(state.allCats, selectCatWrapper);
            calculateStats();
            dashboard.renderDashboard(selectCatWrapper);
            showToast('📡 Données mises à jour depuis le serveur!', 'fa-cloud-arrow-up', 3000);
            console.log('[Background Sync] Update complete.');
          } else {
            console.log('[Background Sync] Server not reachable, staying offline.');
          }
        } catch (err) {
          console.warn('[Background Sync] Failed:', err.message);
        }
      })();
    }
  }, 1000);
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
  
  const mode = api.getAppMode();
  const isAdminLocal = mode === api.APP_MODES.ADMIN_LOCAL;
  const isWebOrAndroidOnline = [api.APP_MODES.WEB_CLIENT, api.APP_MODES.ANDROID_ONLINE].includes(mode);
  const isAndroidOffline = mode === api.APP_MODES.ANDROID_OFFLINE;

  // ── Admin Login Button: ONLY on localhost ──
  if (adminLoginBtn) {
    if (isAdminLocal) {
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

  // ── Add CAT Button ──
  if (addCatBtn) {
    if (isAdminLocal) {
      addCatBtn.style.display = 'flex';
      addCatBtn.innerHTML = '<i class="fa-solid fa-plus"></i> CAT';
    } else if (isWebOrAndroidOnline) {
      addCatBtn.style.display = 'flex';
      addCatBtn.innerHTML = '<i class="fa-solid fa-lightbulb"></i> Suggérer CAT';
    } else {
      addCatBtn.style.display = 'none';
    }
  }

  // ── Edit Summary / Prescription / Delete buttons ──
  const editSummaryBtnEl = document.getElementById('edit-summary-btn');
  const editPrescriptionBtnEl = document.getElementById('edit-prescription-btn');
  const deleteBtn = document.getElementById('delete-cat-btn');

  if (isAdminLocal && state.isAdmin) {
    if (editSummaryBtnEl) {
      editSummaryBtnEl.innerHTML = '<i class="fa-solid fa-pen"></i> Modifier la fiche';
      editSummaryBtnEl.style.display = 'inline-flex';
    }
    if (editPrescriptionBtnEl) {
      editPrescriptionBtnEl.innerHTML = '<i class="fa-solid fa-pen"></i> Modifier ordonnance';
      editPrescriptionBtnEl.style.display = 'inline-flex';
    }
    if (deleteBtn) {
      deleteBtn.style.display = (state.activeCat && state.activeCat.id > 55) ? 'inline-flex' : 'none';
    }
  } else if (isWebOrAndroidOnline) {
    if (editSummaryBtnEl) {
      editSummaryBtnEl.innerHTML = '<i class="fa-solid fa-pen-fancy"></i> Proposer modif.';
      editSummaryBtnEl.style.display = 'inline-flex';
    }
    if (editPrescriptionBtnEl) {
      editPrescriptionBtnEl.innerHTML = '<i class="fa-solid fa-pen-fancy"></i> Proposer ordonnance';
      editPrescriptionBtnEl.style.display = 'inline-flex';
    }
    if (deleteBtn) deleteBtn.style.display = 'none';
  } else {
    if (editSummaryBtnEl) editSummaryBtnEl.style.display = 'none';
    if (editPrescriptionBtnEl) editPrescriptionBtnEl.style.display = 'none';
    if (deleteBtn) deleteBtn.style.display = 'none';
  }

  diagnostics.updateDiagnosticsButtonVisibility();
  performanceComponent.updatePerformanceButtonVisibility();
}

