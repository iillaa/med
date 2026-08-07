import { state, getLocalProgress } from './state.js';
import * as api from './api.js';
import { initDebugConsole } from './debug-console.js';
import * as sidebar from './components/sidebar.js';
import * as workspace from './components/workspace.js';
import * as dashboard from './components/dashboard.js';
import { setupHardwareBackButton } from './components/native.js';
import { setupAppLifecycle } from './components/native.js';
import { setupKeyboardHandling } from './components/native.js';
import { showToast, runSuggestionWithUI, prefersReducedMotion, initTapFeedback, closeModalAnimated } from './utils.js';
import { PROVIDERS, getExtraHeaders } from './server-providers.js';
import { isOfflineCat, mergeCatsWithLocalState } from './lib/helpers.js';

// ── Phase 5.2: lazy-loaded feature modules ──
// quiz / diagnostics / performance are route/feature-scoped and not needed
// for first paint, so they're dynamically imported on boot (non-blocking) and
// cached. esbuild emits them as separate chunks via code-splitting.
let _quizMod = null;
const loadQuiz = () => (_quizMod || (_quizMod = import('./components/quiz.js')));

// Tracks app mode (set once on load via api.getAppMode())


// Theme background colors — keep in sync with --bg-app in css/variables.css
const THEME_BG = { light: '#f1f5f9', dark: '#090d16' };

/**
 * Sync browser/PWA chrome and the native Android status bar to the active theme.
 * - Updates the runtime <meta name="theme-color"> so the toolbar/URL bar matches.
 * - If running under Capacitor with the StatusBar plugin available, recolors the
 *   native status bar and picks a legible icon style. Loaded dynamically with a
 *   graceful fallback so the web build (and installs without the plugin) never break.
 */
function applyThemeChrome(isLight) {
  const bg = isLight ? THEME_BG.light : THEME_BG.dark;

  // Runtime theme-color meta (single tag the browser reads live).
  let meta = document.querySelector('meta[name="theme-color"]:not([media])');
  if (!meta) {
    meta = document.createElement('meta');
    meta.name = 'theme-color';
    document.head.appendChild(meta);
  }
  meta.setAttribute('content', bg);

  // Optional native status bar (Capacitor Android). No-op on web.
  try {
    const StatusBar = window.Capacitor?.Plugins?.StatusBar;
    if (StatusBar) {
      StatusBar.setBackgroundColor?.({ color: bg });
      // Capacitor StatusBar.Style semantics (from plugin definitions):
      //   'DARK'  = light text for dark backgrounds
      //   'LIGHT' = dark text for light backgrounds
      StatusBar.setStyle?.({ style: isLight ? 'LIGHT' : 'DARK' });
    }
  } catch (_) { /* StatusBar unavailable — web or plugin not installed */ }
}


// Global administrative error interceptor
window.handleAdminError = async function(err) {
  if (err && (err.message === "403 Forbidden" || err.message === "401 Unauthorized")) {
    const password = prompt("Action réservée aux administrateurs. Saisissez le mot de passe admin pour déverrouiller :");
    if (password) {
      try {
        const res = await api.loginAdmin(password);
        if (res.success && res.token) {
          showToast("Connexion réussie ! L'action va être relancée.", "fa-circle-check", 3000);
          location.reload();
          return true;
        } else {
          showToast("Mot de passe incorrect.", "fa-circle-exclamation", 3000);
        }
      } catch (loginErr) {
        console.error("Login failed:", loginErr);
        showToast("Erreur lors de la connexion.", "fa-circle-exclamation", 4000);
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
  
  // Storage safety is provided by safeGetItem/safeSetItem from safeStorage.js
  // No prototype patching needed — just use the wrapper functions directly.

  // Global Error Interceptor for Verbose Console Logs & Toast Notifications
  window.addEventListener('error', (_event) => {
    showToast("Une erreur d'exécution est survenue. Détails enregistrés dans l'onglet Diagnostic.", "fa-triangle-exclamation", 7000);
  });

  window.addEventListener('unhandledrejection', (_event) => {
    showToast("Erreur réseau ou réponse de base de données non reconnue.", "fa-circle-exclamation", 5000);
  });

  // PWA Service Worker — disable in standalone Capacitor offline app & remote tunnel domains (ngrok) to prevent stale cache deadlocks & white pages
  if ('serviceWorker' in navigator) {
    const isTunnelHost = location.hostname.includes('ngrok') || location.hostname.includes('loca.lt') || location.hostname.includes('trycloudflare.com');
    if (api.isOfflineApp || isTunnelHost) {
      // Always unregister to avoid stale caches/ngrok warning page deadlocks
      navigator.serviceWorker.getRegistrations().then(regs => {
        regs.forEach(reg => reg.unregister());
      });
      caches.keys().then(keys => keys.forEach(k => caches.delete(k)));
      console.log('[Startup] Service worker disabled on standalone app / remote tunnel host to prevent cache deadlocks.');
    } else {
      const isDev = location.hostname === 'localhost' ||
                    location.hostname === '127.0.0.1' ||
                    PROVIDERS.some(p => p.isDevHostname(location.hostname));
      if (!isDev) {
        window.addEventListener('load', () => {
          navigator.serviceWorker.register('/service-worker.js')
            .then((reg) => {
              console.log('PWA SW registered:', reg.scope);
              // Phase 6.2: update flow — when a new SW is waiting, offer a
              // non-intrusive reload toast instead of a hard cache clear.
              if (!reg) return;
              reg.addEventListener('updatefound', () => {
                const installing = reg.installing;
                if (!installing) return;
                installing.addEventListener('statechange', () => {
                  if (installing.state === 'installed' && navigator.serviceWorker.controller) {
                    showToast(
                      'Mise à jour disponible. Rechargez pour l\'appliquer.',
                      'fa-rotate',
                      8000
                    );
                  }
                });
              });
            })
            .catch(err => console.error('PWA SW failed:', err));
        });
      }
    }
  }

 
  // ── Phase 6.3: offline indicator ──
  // Honest, subtle badge when the device loses connectivity. The app already
  // works offline (PWA + local data), so this only sets expectations.
  (function setupOfflineIndicator() {
    try {
      const badge = document.createElement('div');
      badge.className = 'offline-badge';
      badge.setAttribute('role', 'status');
      badge.setAttribute('aria-live', 'polite');
      badge.innerHTML = '<i class="fa-solid fa-wifi" style="transform: rotate(45deg);"></i> Mode hors-ligne';
      document.body.appendChild(badge);
      // Note: navigator.onLine is unreliable in Capacitor/Android WebView, so we
      // drive the badge from the online/offline events (which fire reliably)
      // rather than the initial onLine value — avoids false "offline" flashes.
      window.addEventListener('offline', () => badge.classList.add('show'));
      window.addEventListener('online', () => badge.classList.remove('show'));
    } catch (_) { /* indicator is best-effort */ }
  })();

  // Theme Toggle Initialization
  const themeToggleBtn = document.getElementById('theme-toggle-btn');
  const themeToggleIcon = document.getElementById('theme-toggle-icon');
  const rootEl = document.documentElement;

  // The anti-FOUC head script already applied the correct theme class before
  // paint. Here we just sync the toggle icon + native chrome to that state.
  const bootIsLight = rootEl.classList.contains('light-theme');
  // Ensure the native status bar sits above the web content (not overlapping)
  // before applying the theme color. No-op on web / if plugin missing.
  try {
    const StatusBar = window.Capacitor?.Plugins?.StatusBar;
    StatusBar?.setOverlaysWebView?.({ overlay: false });
  } catch (_) { /* StatusBar unavailable */ }
  applyThemeChrome(bootIsLight);
  if (themeToggleIcon) {
    themeToggleIcon.classList.toggle('fa-sun', bootIsLight);
    themeToggleIcon.classList.toggle('fa-moon', !bootIsLight);
  }
  // Remove the boot transition-suppression once the first frame has settled,
  // so subsequent interactions animate normally.
  requestAnimationFrame(() => {
    requestAnimationFrame(() => rootEl.classList.remove('theme-booting'));
  });

  if (themeToggleBtn) {
    themeToggleBtn.addEventListener('click', () => {
      const swap = () => {
        // Atomic swap: kill all transitions for one frame so the whole UI
        // repaints in the new theme at once (no staggered wipe), then re-enable.
        rootEl.classList.add('theme-switching');

        const isLight = rootEl.classList.toggle('light-theme');
        localStorage.setItem('theme', isLight ? 'light' : 'dark');
        rootEl.style.colorScheme = isLight ? 'light' : 'dark';

        if (themeToggleIcon) {
          themeToggleIcon.classList.toggle('fa-sun', isLight);
          themeToggleIcon.classList.toggle('fa-moon', !isLight);
        }
        applyThemeChrome(isLight);

        // Re-enable transitions after the swap frame has painted.
        requestAnimationFrame(() => {
          requestAnimationFrame(() => rootEl.classList.remove('theme-switching'));
        });
      };

      // Phase 3.5: circular reveal from the toggle button via View Transitions
      // API, with graceful fallback to the instant atomic swap.
      const reduce = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
      const vt = document.startViewTransition && !reduce ? document.startViewTransition : null;
      if (vt) {
        const rect = themeToggleBtn.getBoundingClientRect();
        const x = rect.left + rect.width / 2;
        const y = rect.top + rect.height / 2;
        const endRadius = Math.hypot(Math.max(x, innerWidth - x), Math.max(y, innerHeight - y));
        const style = document.createElement('style');
        style.textContent = `
          ::view-transition-new(root) {
            animation: themeReveal var(--motion-slow) var(--ease-emphasized);
          }
          @keyframes themeReveal {
            from { clip-path: circle(0px at ${x}px ${y}px); }
            to { clip-path: circle(${endRadius}px at ${x}px ${y}px); }
          }
        `;
        document.head.appendChild(style);
        const transition = vt.call(document, swap);
        if (transition) {
          if (transition.finished && typeof transition.finished.catch === 'function') {
            transition.finished.catch(() => {});
          }
          if (transition.ready && typeof transition.ready.catch === 'function') {
            transition.ready.catch(() => {});
          }
          if (transition.updateCallbackDone && typeof transition.updateCallbackDone.catch === 'function') {
            transition.updateCallbackDone.catch(() => {});
          }
        }
        setTimeout(() => style.remove(), 400);
      } else {
        swap();
      }
    });
  }
  
  // About Legal Header toggle (moved from inline onclick)
  const aboutLegalHeader = document.getElementById('about-legal-header');
  if (aboutLegalHeader) {
    aboutLegalHeader.addEventListener('click', () => {
      const content = document.getElementById('about-legal-content');
      const chevron = document.getElementById('about-legal-chevron');
      if (!content || !chevron) return;
      const isExpanded = content.style.maxHeight === '500px';
      content.style.maxHeight = isExpanded ? '0px' : '500px';
      chevron.style.transform = isExpanded ? 'rotate(0deg)' : 'rotate(180deg)';
    });
  }

  // Initialize Components
  sidebar.initSidebar(selectCatWrapper, onFilterTriggered, refreshCatsAndRender);
  workspace.initWorkspace(onStatusChange, onCatDeleted, onProgressReset);
  dashboard.initDashboard(selectCatWrapper, onSuggestionHandled);
  // Lazy, non-blocking init of route/feature-scoped modules (Phase 5.2).
  loadQuiz().then((m) => m.initQuiz(selectCatWrapper)).catch((e) => console.warn('[lazy] quiz init failed', e));
 
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
      if (addCatModal) {
        addCatModal.classList.remove('modal-overlay--sheet');
        addCatModal.style.display = 'flex';
      }
    });
  }
 
  function closeAddCatModal() {
    if (!addCatModal) return;
    if (window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
      addCatModal.style.display = 'none';
      if (addCatForm) addCatForm.reset();
      return;
    }
    addCatModal.classList.add('modal-closing');
    const onEnd = (e) => {
      if (e.target !== addCatModal && e.target !== addCatModal.querySelector('.modal-card')) return;
      addCatModal.removeEventListener('animationend', onEnd);
      addCatModal.classList.remove('modal-closing');
      addCatModal.style.display = 'none';
      if (addCatForm) addCatForm.reset();
    };
    addCatModal.addEventListener('animationend', onEnd);
    setTimeout(() => onEnd({ target: addCatModal }), 600);
  }
  
  if (closeAddCatModalBtn) closeAddCatModalBtn.addEventListener('click', closeAddCatModal);
  if (cancelAddCatBtn) cancelAddCatBtn.addEventListener('click', closeAddCatModal);
 
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
            closeAddCatModal();
            // Clear any stale local overrides for the new CAT ID
            try {
              const localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
              if (localOverrides[result.cat.id]) {
                delete localOverrides[result.cat.id];
                localStorage.setItem('dr_cat_local_overrides', JSON.stringify(localOverrides));
              }
            } catch (_) {
              /* ignore local override purge failure */
            }
            showToast(`La fiche CAT "${title}" a été ajoutée avec succès !`, "fa-circle-check", 3000);
            await refreshCatsAndRender();
            const newCat = state.allCats.find(c => c.id === result.cat.id);
            if (newCat) selectCatWrapper(newCat);
          } else {
            showToast("Erreur : " + result.error, "fa-circle-exclamation", 4000);
          }
        } catch (err) {
          console.error(err);
          if (window.handleAdminError && await window.handleAdminError(err)) {
            return;
          }
          showToast("Erreur lors de l'enregistrement de la nouvelle CAT.", "fa-circle-exclamation", 4000);
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
            closeAddCatModal();
          }
        } catch (err) {
          console.error(err);
          showToast("Erreur lors de l'envoi de la proposition.", "fa-circle-exclamation", 4000);
        }
      }
    });
  }
  
  // Wire up Admin Login Button Event Listener
  const adminLoginBtn = document.getElementById('admin-login-btn');
  if (adminLoginBtn) {
    adminLoginBtn.addEventListener('click', async () => {
      if (state.isAdmin) {
        if (confirm("Voulez-vous vous déconnecter du mode administrateur ?")) {
          await api.logoutAdmin();
          showToast("Déconnexion réussie.", "fa-circle-check", 3000);
          location.reload();
        }
      } else {
        const password = prompt("Veuillez saisir le mot de passe administrateur :");
        if (password) {
          try {
            const res = await api.loginAdmin(password);
            if (res.success && res.token) {
              showToast("Connexion réussie !", "fa-circle-check", 3000);
              location.reload();
            } else {
              showToast(res.error || "Mot de passe incorrect.", "fa-circle-exclamation", 3000);
            }
          } catch (err) {
            console.error("Login error:", err);
            showToast("Erreur lors de la connexion.", "fa-circle-exclamation", 4000);
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
    showToast("Connexion réseau détectée. Synchronisation...", "fa-wifi", 4000);
    runBackgroundSync();
  });
  window.addEventListener('offline', () => {
    showToast("Connexion perdue. Mode hors-ligne activé.", "fa-circle-xmark", 6000);
    if (api.isOfflineApp) {
      api.setAppMode(api.APP_MODES.ANDROID_OFFLINE);
      state.isOnlineAtStartup = false;
    }
  });
  window.addEventListener('drcat-app-mode-changed', () => {
    updateEditButtonsVisibility();
  });

  // --- Legal Modal & Cookie Banner Logic ---
  const legalModal = document.getElementById('legal-modal');
  const openLegalBtns = [document.getElementById('open-legal-modal-btn'), document.getElementById('open-legal-from-banner')];
  const closeLegalBtn = document.getElementById('close-legal-modal-btn');
  const cookieBanner = document.getElementById('legal-consent-banner');
  const acceptCookieBtn = document.getElementById('accept-legal-btn');
  const dismissCookieBtn = document.getElementById('dismiss-legal-btn');

  const hideCookieBanner = () => {
    if (cookieBanner) {
      cookieBanner.classList.add('hidden');
      cookieBanner.style.display = 'none';
    }
  };

  // Check if consent or dismissal was already given
  if (!localStorage.getItem('drcat_legal_consent_v1')) {
    if (cookieBanner) {
      cookieBanner.style.display = 'flex';
      setTimeout(() => cookieBanner.classList.remove('hidden'), 500);
    }
  } else {
    hideCookieBanner();
  }

  if (acceptCookieBtn) {
    acceptCookieBtn.addEventListener('click', () => {
      localStorage.setItem('drcat_legal_consent_v1', 'true');
      hideCookieBanner();
    });
  }

  if (dismissCookieBtn) {
    dismissCookieBtn.addEventListener('click', () => {
      localStorage.setItem('drcat_legal_consent_v1', 'dismissed');
      hideCookieBanner();
    });
  }

  openLegalBtns.forEach(btn => {
    if (btn) {
      btn.addEventListener('click', (e) => {
        e.preventDefault();
        if (legalModal) {
          legalModal.style.display = 'flex';
          legalModal.classList.add('active');
        }
      });
    }
  });

  const closeLegalModal = () => {
    if (legalModal) {
      legalModal.style.display = 'none';
      legalModal.classList.remove('active');
    }
  };

  if (closeLegalBtn) {
    closeLegalBtn.addEventListener('click', closeLegalModal);
  }

  if (legalModal) {
    legalModal.addEventListener('click', (e) => {
      if (e.target === legalModal) {
        closeLegalModal();
      }
    });
  }

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
      const legalModalElem = document.getElementById('legal-modal');
      if (legalModalElem && (legalModalElem.classList.contains('active') || legalModalElem.style.display !== 'none')) {
        closeLegalModal();
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
        targetItem.scrollIntoView({ block: 'nearest', behavior: prefersReducedMotion() ? 'auto' : 'smooth' });
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

let syncIntervalStarted = false;
let syncIntervalId = null;
let syncPaused = false;
 
// App Initialization routine with robust fault-isolation boundaries
async function initApp() {
  const loadingOverlay = document.getElementById('app-loading-overlay');
  const loadingBar = document.getElementById('app-loading-bar');
  if (loadingOverlay) loadingOverlay.classList.remove('hidden');
  if (loadingBar) loadingBar.style.width = '5%';

  const setLoadingProgress = (pct) => {
    if (window.setLoaderProgress) {
      window.setLoaderProgress(pct);
    } else if (loadingBar) {
      loadingBar.style.width = `${pct}%`;
    }
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
      const res = await fetch('data/cats_db.json', { headers: { 'x-app-key': api.APP_DATA_KEY } });
      if (!res.ok) throw new Error("Emergency fallback failed");
      cats = await res.json();
      showToast("Chargement de secours local.", "fa-triangle-exclamation", 4000);
    } catch (fallbackErr) {
      console.error("[Startup Critical] No data available.", fallbackErr);
      showToast("Base de données indisponible.", "fa-circle-exclamation", 9000);
      if (loadingOverlay) loadingOverlay.classList.add('hidden');
      const SplashScreen = window.Capacitor && window.Capacitor.Plugins && window.Capacitor.Plugins.SplashScreen;
      if (SplashScreen && typeof SplashScreen.hide === 'function') { try { SplashScreen.hide(); } catch (_) {
        // no-op: splash screen hide failure is non-critical
      } }
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
    const rawCustom = JSON.parse(localStorage.getItem('dr_cat_custom_created_cats') || '[]');
    customCreatedCats = rawCustom.map(c => ({ ...c, isOffline: true }));
  } catch (_) {
    // no-op: localStorage parse failure leaves defaults intact
  }

  if (api.isOfflineApp) {
    cats = cats.filter(c => !localOverrides[c.id] || !localOverrides[c.id].deleted);
    cats = [...cats, ...customCreatedCats.filter(c => !localOverrides[c.id] || !localOverrides[c.id].deleted)];
  }

  state.allCats = mergeCatsWithLocalState(cats, localProgress, localOverrides);
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

  // ── 8a. Splash handoff (Phase 4.3) ──
  // Fade the web loading overlay out, then dismiss the native Capacitor
  // splash screen (if present) once first meaningful paint is ready.
  if (loadingOverlay) loadingOverlay.classList.add('hidden');
  const SplashScreen = window.Capacitor && window.Capacitor.Plugins && window.Capacitor.Plugins.SplashScreen;
  if (SplashScreen && typeof SplashScreen.hide === 'function') {
    setTimeout(() => { try { SplashScreen.hide(); } catch (_) {
      // no-op: delayed splash hide failure is non-critical
    } }, 350);
  }

  // ── 8b. Tactile tap feedback (Phase 3.2) ──
  initTapFeedback();

  // ── 8c. Hardware back button (Phase 4.2, native Android) ──
  setupHardwareBackButton({
    isModalOpen: () => !!document.querySelector('.modal-overlay:not([style*="display: none"])'),
    closeModal: () => {
      const open = document.querySelector('.modal-overlay:not([style*="display: none"])');
      if (open) {
        // closeAddCatModal is defined at module scope (line 321); ESLint cannot
        // resolve it through the arrow function inside the adminPanel object literal.
        /* eslint-disable-next-line no-undef */
        if (open.id === 'add-cat-modal') closeAddCatModal();
        else closeModalAnimated(open);
      }
    },
    isDrawerOpen: () => {
      const sb = document.querySelector('.sidebar');
      return !!sb && sb.classList.contains('open');
    },
    closeDrawer: () => {
      const sb = document.querySelector('.sidebar');
      if (sb) sb.classList.remove('open');
    },
    isDeepView: () => {
      const ws = document.getElementById('workspace');
      const qs = document.getElementById('quiz-screen');
      return (ws && ws.style.display !== 'none') || (qs && qs.style.display !== 'none');
    },
    goToDashboard: () => dashboard.showDashboard(selectCatWrapper),
    confirmExit: () => {
      // Already at the root; let the native shell handle exit. Show a toast as
      // a gentle hint on first press; a second press within 2s exits.
      if (window.__drCatExitArmed) {
        const App = window.Capacitor && window.Capacitor.Plugins && window.Capacitor.Plugins.App;
        if (App && typeof App.exitApp === 'function') App.exitApp();
        return;
      }
      window.__drCatExitArmed = true;
      showToast("Appuyez encore sur Retour pour quitter.", 'fa-right-from-bracket', 2000);
      setTimeout(() => { window.__drCatExitArmed = false; }, 2000);
    },
  });

  // ── 8. Hide Overlay ──
  // (Automatically handled by window.setLoaderProgress(100) above)

  // ── 9. 🔥 BACKGROUND SYNC FOR ANDROID (NO FREEZE + REMOTE SYNC) 🔥 ──
  if (!syncIntervalStarted) {
    syncIntervalStarted = true;
    setTimeout(() => {
      runBackgroundSync();
      // Periodically run background sync every 30 seconds
      syncIntervalId = setInterval(runBackgroundSync, 30000);
    }, 1000);
  }

  // ── 10. App lifecycle (Phase 4.5) ──
  // Pause periodic polling when the app is backgrounded; resume + refresh on
  // return to the foreground. No-op on web where the App plugin is absent.
  setupAppLifecycle({
    onPause: () => {
      if (syncIntervalId) {
        clearInterval(syncIntervalId);
        syncIntervalId = null;
        syncPaused = true;
      }
    },
    onResume: () => {
      if (syncPaused && !syncIntervalId) {
        syncPaused = false;
        runBackgroundSync();
        syncIntervalId = setInterval(runBackgroundSync, 30000);
      }
    },
  });

  // ── 11. Keyboard handling (Phase 4.6) ──
  // Keep focused inputs visible above the soft keyboard on native Android.
  // No-op on web where the Keyboard plugin is absent.
  setupKeyboardHandling();
}

export async function runBackgroundSync() {
  if (!api.isOfflineApp || !api.hasRemoteServer()) return;

  console.log('[Background Sync] Checking for remote updates...');
  try {
    const remoteUrls = api.getConfiguredRemoteUrls();
    let reachable = false;
    for (const url of remoteUrls) {
      try {
        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), 5000);
        // Merge base headers + provider-specific bypass headers (e.g. ngrok-skip-browser-warning)
        const headers = {
          ...api.getHeaders(),
          ...getExtraHeaders(url)
        };
        const pingUrl = api.getApiUrl('/api/search-status', url);
        const res = await fetch(pingUrl, {
          signal: controller.signal,
          headers
        });
        if (!res.ok) throw new Error('Server returned error status');
        clearTimeout(timeoutId);
        reachable = true;
        break;
      } catch (_) {
        // no-op: individual ping failure is handled by reachable flag
      }
    }

    const wasOffline = (api.getAppMode() === api.APP_MODES.ANDROID_OFFLINE);

    if (reachable) {
      console.log('[Background Sync] Server reachable! Fetching latest data...');
      
      // Update app mode to ANDROID_ONLINE to allow api.fetchCats() to hit the server
      api.setAppMode(api.APP_MODES.ANDROID_ONLINE);
      state.isOnlineAtStartup = true;

      const lastSyncTimeStr = localStorage.getItem('dr_cat_last_sync_time');
      const lastSyncTime = lastSyncTimeStr ? parseInt(lastSyncTimeStr) : null;
      const freshCats = await api.fetchCats(lastSyncTime);

      // Check if any CATs were deleted on the server
      let hasDeletions = false;
      let activeIdsSet = null;
      const customCats = JSON.parse(localStorage.getItem('dr_cat_custom_created_cats') || '[]');
      const customCatIds = new Set(customCats.map(c => c.id));

      if (freshCats.activeIds) {
        activeIdsSet = new Set(freshCats.activeIds.split(',').map(id => parseInt(id)));
        const localServerCats = (state.allCats || []).filter(c => !isOfflineCat(c, customCatIds));
        for (const local of localServerCats) {
          if (!activeIdsSet.has(local.id)) {
            hasDeletions = true;
            break;
          }
        }
      }

      if (freshCats.length === 0 && !hasDeletions) {
        console.log('[Background Sync] Remote database is in sync. No action needed.');
        localStorage.setItem('dr_cat_last_sync_time', Date.now().toString());
        if (wasOffline) {
          showToast('📡 Connexion serveur établie. Données synchronisées !', 'fa-cloud-arrow-up', 4000);
        }
        return;
      }

      // Check if this is a full list or an incremental update
      const localServerCats = (state.allCats || []).filter(c => !isOfflineCat(c, customCatIds));
      const isIncremental = freshCats.length < (localServerCats.length * 0.7);

      let isUpdated = hasDeletions;
      if (!isUpdated) {
        if (isIncremental) {
          // If incremental, we have updates if any card is new or modified
          for (const remote of freshCats) {
            const local = localServerCats.find(c => c.id === remote.id);
            if (!local || local.title !== remote.title || local.summary !== remote.summary || local.ordonnance !== remote.ordonnance) {
              isUpdated = true;
              break;
            }
          }
        } else {
          // If full list (e.g. static fallback), compare counts and contents
          isUpdated = localServerCats.length !== freshCats.length;
          if (!isUpdated) {
            for (const remote of freshCats) {
              const local = localServerCats.find(c => c.id === remote.id);
              if (!local || local.title !== remote.title || local.summary !== remote.summary || local.ordonnance !== remote.ordonnance) {
                isUpdated = true;
                break;
              }
            }
          }
        }
      }

      if (isUpdated) {
        console.log('[Background Sync] Server changes detected! Offering update...');

        // Build the action button via DOM methods (safe — no innerHTML with user data)
        const updateBtn = document.createElement('span');
        updateBtn.id = 'update-app-toast-btn';
        updateBtn.style.cssText = 'color:#06b6d4;font-weight:700;text-decoration:underline;cursor:pointer;';
        updateBtn.textContent = 'Actualiser ?';
        updateBtn.addEventListener('click', (event) => {
          event.preventDefault();
          applySyncUpdates(freshCats, isIncremental, activeIdsSet);
          const toast = document.getElementById('drcat-toast');
          if (toast) toast.remove();
          showToast('Mise \u00e0 jour appliqu\u00e9e avec succ\u00e8s !', 'fa-circle-check', 3000);
        });

        showToast(
          'Nouvelles fiches ou modifications disponibles \u2014',
          'fa-arrows-rotate',
          15000,
          updateBtn
        );
      } else {
        console.log('[Background Sync] Remote database is in sync. No action needed.');
        localStorage.setItem('dr_cat_last_sync_time', Date.now().toString());
      }

      if (wasOffline) {
        showToast('📡 Connexion serveur établie. Données synchronisées !', 'fa-cloud-arrow-up', 4000);
      }
    } else {
      console.log('[Background Sync] Server not reachable, staying offline.');
      api.setAppMode(api.APP_MODES.ANDROID_OFFLINE);
      state.isOnlineAtStartup = false;
    }
  } catch (err) {
    console.warn('[Background Sync] Failed:', err.message);
  }
}

// Helper to safely apply background sync updates to the UI
function applySyncUpdates(freshCats, isIncremental, activeIdsSet) {
  const localProgress = getLocalProgress();
  const localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');

  if (isIncremental) {
    // Incremental merge: update or insert fiches inside state.allCats
    freshCats.forEach(remote => {
      const idx = state.allCats.findIndex(c => c.id === remote.id);
      const localEntry = localProgress[remote.id] || {};
      const overrides = localOverrides[remote.id] || {};
      const merged = {
        ...remote,
        status: localEntry.status || 'todo',
        notes: localEntry.notes || '',
        summary: overrides.customSummary || remote.summary,
        customSummary: overrides.customSummary || remote.summary,
        ordonnance: overrides.customOrdonnance || remote.ordonnance,
        customOrdonnance: overrides.customOrdonnance || remote.ordonnance
      };
      if (idx !== -1) {
        state.allCats[idx] = merged;
      } else {
        state.allCats.push(merged);
      }
    });

    // Handle deletions if we have the list of active IDs from the server
    if (activeIdsSet) {
      const customCats = JSON.parse(localStorage.getItem('dr_cat_custom_created_cats') || '[]');
      const customCatIds = new Set(customCats.map(c => c.id));
      state.allCats = state.allCats.filter(c => {
        // Keep custom offline created cats
        if (isOfflineCat(c, customCatIds)) return true;
        // Only keep if the ID is active on the server
        return activeIdsSet.has(c.id);
      });
    }
  } else {
    // Full replacement merge
    const existingIds = new Set(freshCats.map(c => c.id));
    const customCats = JSON.parse(localStorage.getItem('dr_cat_custom_created_cats') || '[]')
      .filter(c => !existingIds.has(c.id))
      .map(c => ({ ...c, isOffline: true }));

    state.allCats = mergeCatsWithLocalState([...freshCats, ...customCats], localProgress, localOverrides);
  }

  localStorage.setItem('dr_cat_last_sync_time', Date.now().toString());
  sidebar.renderCatList(state.allCats, selectCatWrapper);
  calculateStats();
  dashboard.renderDashboard(selectCatWrapper);

  // If the user has a fiche open, refresh it or go to dashboard if it was deleted
  if (state.activeCat) {
    const activeId = state.activeCat.id;
    const updatedCat = state.allCats.find(c => c.id === activeId);
    if (updatedCat) {
      workspace.selectCat(updatedCat, true);
    } else {
      dashboard.showDashboard(selectCatWrapper);
    }
  }
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

// Helper to perform hot refresh of CAT database and sync to sidebar/dashboard
async function refreshCatsAndRender() {
  let cats = [];
  try {
    cats = await api.fetchCats();
  } catch (err) {
    console.error("[Refresh Error] Fetch CATs failed, using emergency fallback.", err);
    try {
      const res = await fetch('data/cats_db.json', { headers: { 'x-app-key': api.APP_DATA_KEY } });
      if (!res.ok) throw new Error("Emergency fallback failed");
      cats = await res.json();
    } catch (fallbackErr) {
      console.error("[Refresh Critical] No data available.", fallbackErr);
      return;
    }
  }

  const localProgress = getLocalProgress();
  let localOverrides = {};
  let customCreatedCats = [];
  try {
    localOverrides = JSON.parse(localStorage.getItem('dr_cat_local_overrides') || '{}');
    const rawCustom = JSON.parse(localStorage.getItem('dr_cat_custom_created_cats') || '[]');
    customCreatedCats = rawCustom.map(c => ({ ...c, isOffline: true }));
  } catch (_) {
    // no-op: localStorage parse failure leaves defaults intact
  }

  if (api.isOfflineApp) {
    cats = cats.filter(c => !localOverrides[c.id] || !localOverrides[c.id].deleted);
    cats = [...cats, ...customCreatedCats.filter(c => !localOverrides[c.id] || !localOverrides[c.id].deleted)];
  }

  state.allCats = mergeCatsWithLocalState(cats, localProgress, localOverrides);

  sidebar.populateCategoryFilter(state.allCats);
  sidebar.renderCatList(state.allCats, selectCatWrapper);
  calculateStats();
  dashboard.renderDashboard(selectCatWrapper);
  
  // If the user has a fiche open, refresh it or go to dashboard if it was deleted
  if (state.activeCat) {
    const activeId = state.activeCat.id;
    const updatedCat = state.allCats.find(c => c.id === activeId);
    if (updatedCat) {
      workspace.selectCat(updatedCat, true);
    } else {
      dashboard.showDashboard(selectCatWrapper);
    }
  }
}

// Side-effect callback when a CAT is deleted
async function onCatDeleted() {
  await refreshCatsAndRender();
  dashboard.showDashboard(selectCatWrapper);
}

// Side-effect callback when progress resets
async function onProgressReset() {
  await refreshCatsAndRender();
  dashboard.showDashboard(selectCatWrapper);
}

// Side-effect callback when a pending suggestion is approved or rejected
async function onSuggestionHandled() {
  await refreshCatsAndRender();
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
}

export function updateEditButtonsVisibility() {
  const addCatBtn = document.getElementById('add-cat-btn');
  const adminLoginBtn = document.getElementById('admin-login-btn');
  
  const mode = api.getAppMode();
  const isAdminLocal = mode === api.APP_MODES.ADMIN_LOCAL;
  const isWebOrAndroidOnline = [api.APP_MODES.WEB_CLIENT, api.APP_MODES.ANDROID_ONLINE].includes(mode);

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

  // ── Specialty Export Container: ONLY for Admin ──
  const specialtyExportContainer = document.querySelector('.specialty-export-container');
  if (specialtyExportContainer) {
    if (isAdminLocal && state.isAdmin) {
      specialtyExportContainer.style.display = 'flex';
    } else {
      specialtyExportContainer.style.display = 'none';
    }
  }

  // ── PDF Reindex Button: ONLY for Admin ──
  const pdfReindexBtn = document.getElementById('pdf-reindex-btn');
  if (pdfReindexBtn) {
    pdfReindexBtn.style.display = (isAdminLocal && state.isAdmin) ? 'inline-flex' : 'none';
  }
}

