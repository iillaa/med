/**
 * Dr.CAT App Version Checker & Security Lock Gate (Hardened IIFE Scope)
 */

(function () {
  'use strict';

  // ── Private IIFE State (Inaccessible from DevTools Console) ──
  let isLocked = false;
  let currentVersionConfig = null;

  // Retrieve client app version from meta or default 1.0.0
  const CLIENT_VERSION = (function () {
    const metaVer = document.querySelector('meta[name="app-version"]')?.content;
    const metaBuild = document.querySelector('meta[name="app-build-version"]')?.content;
    return metaVer || '1.0.0';
  })();

  const LOCK_STORAGE_KEY = 'dr_cat_version_lock_state';

  /**
   * Compare two semantic version strings numerically.
   * Returns:
   *   -1 if v1 < v2
   *    0 if v1 === v2
   *    1 if v1 > v2
   */
  function compareVersions(v1, v2) {
    if (!v1 || !v2) return 0;
    const parts1 = String(v1).replace(/^v/i, '').split('.').map(n => parseInt(n, 10) || 0);
    const parts2 = String(v2).replace(/^v/i, '').split('.').map(n => parseInt(n, 10) || 0);
    const maxLen = Math.max(parts1.length, parts2.length);
    for (let i = 0; i < maxLen; i++) {
      const p1 = parts1[i] || 0;
      const p2 = parts2[i] || 0;
      if (p1 < p2) return -1;
      if (p1 > p2) return 1;
    }
    return 0;
  }

  /**
   * Wipe non-essential browser caches on hard lock to prevent stale data usage
   */
  async function wipeStorageOnLock() {
    try {
      // Preserve lock state before wiping
      const lockState = localStorage.getItem(LOCK_STORAGE_KEY);
      localStorage.clear();
      sessionStorage.clear();
      if (lockState) {
        localStorage.setItem(LOCK_STORAGE_KEY, lockState);
      }

      // Delete IndexedDB databases if supported
      if (window.indexedDB && typeof window.indexedDB.databases === 'function') {
        const dbs = await window.indexedDB.databases();
        for (const db of dbs) {
          if (db.name) {
            window.indexedDB.deleteDatabase(db.name);
          }
        }
      }
    } catch (err) {
      console.warn('[VersionChecker] Error purging storage on lock:', err);
    }
  }

  /**
   * Render or re-render the lock screen into #security-root
   */
  function renderLockScreen(options = {}) {
    isLocked = true;
    const root = document.getElementById('security-root') || document.body;
    const config = currentVersionConfig || {};
    const links = config.downloadLinks || {};
    const notes = config.releaseNotes || [
      'Correction de la barre de navigation Android',
      'Optimisation des performances et de la sécurité',
      'Mise à jour des conduites à tenir cliniques'
    ];

    const isOffline = !!options.offlineMode;

    const notesHtml = notes.map(n => `<li>${n}</li>`).join('');

    const html = `
      <div class="update-lock-screen" id="app-update-lock-overlay">
        <div class="update-lock-card">
          <img src="drcat_logo.webp" alt="Dr.CAT" class="update-brand-logo" onerror="this.src='drcat_logo.png'">
          <h2 class="update-lock-title">Dr.CAT — Mise à jour requise</h2>

          <div class="update-badge-container">
            <span class="update-badge-old">Installé: v${CLIENT_VERSION}</span>
            <span class="update-badge-arrow">➔</span>
            <span class="update-badge-new">Requis: v${config.minVersion || '1.1.0'}</span>
          </div>

          ${isOffline ? `
            <div class="update-offline-notice">
              <i class="fa-solid fa-triangle-exclamation"></i>
              ${options.message || 'Mode hors-ligne : Une mise à jour obligatoire a été détectée. Veuillez vous connecter à Internet pour mettre à jour l\'application.'}
            </div>
          ` : `
            <p class="update-message-box">
              ${config.updateMessage || 'Une mise à jour importante est requise pour continuer à utiliser Dr.CAT.'}
            </p>
          `}

          <div class="update-notes-container">
            <div class="update-notes-title"><i class="fa-solid fa-sparkles"></i> Nouveautés de la mise à jour</div>
            <ul class="update-notes-list">
              ${notesHtml}
            </ul>
          </div>

          <div class="update-buttons-container">
            <a href="${links.uptodownUrl || 'https://dr-cat.en.uptodown.com/android'}" target="_blank" rel="noopener" class="btn-update uptodown" data-update-link="uptodown">
              <i class="fa-solid fa-cloud-arrow-down"></i> Télécharger via Uptodown
            </a>
            
            <a href="${links.telegramUrl || 'https://t.me/DrCatOfficialApp'}" target="_blank" rel="noopener" class="btn-update telegram" data-update-link="telegram">
              <i class="fa-brands fa-telegram"></i> Canal Telegram Officiel
            </a>

            <a href="${links.directServerUrl || '/download/drcat-latest.apk'}" target="_blank" rel="noopener" class="btn-update direct" data-update-link="direct">
              <i class="fa-solid fa-globe"></i> Lien Direct (Serveur Web)
            </a>

            <button type="button" class="btn-update pwa-refresh" id="pwa-purge-btn" data-update-link="pwa">
              <i class="fa-solid fa-rotate"></i> Rafraîchir le Cache PWA
            </button>
          </div>
        </div>
      </div>
    `;

    root.innerHTML = html;

    // Attach PWA Purge handler
    const pwaBtn = document.getElementById('pwa-purge-btn');
    if (pwaBtn) {
      pwaBtn.addEventListener('click', async (e) => {
        e.preventDefault();
        try {
          if ('serviceWorker' in navigator) {
            const regs = await navigator.serviceWorker.getRegistrations();
            for (let reg of regs) {
              await reg.unregister();
            }
          }
          if ('caches' in window) {
            const keys = await caches.keys();
            await Promise.all(keys.map(k => caches.delete(k)));
          }
          window.location.reload(true);
        } catch (err) {
          console.error('[VersionChecker] PWA Cache purge error:', err);
          window.location.reload(true);
        }
      });
    }

    // Hide original splash skip button if present
    const skipBtn = document.getElementById('skip-loading-btn');
    if (skipBtn) {
      skipBtn.style.display = 'none';
    }
  }

  /**
   * Set up persistent MutationObserver attached to document.documentElement
   */
  function setupMutationObserver() {
    const observer = new MutationObserver(() => {
      if (isLocked) {
        const lockEl = document.getElementById('app-update-lock-overlay');
        if (!lockEl || getComputedStyle(lockEl).display === 'none' || getComputedStyle(lockEl).opacity === '0') {
          console.warn('[VersionChecker] Lock screen DOM tampering detected! Re-locking...');
          renderLockScreen();
        }
      }
    });

    observer.observe(document.documentElement, {
      childList: true,
      subtree: true,
      attributes: true,
      attributeFilter: ['style', 'class', 'hidden']
    });
  }

  /**
   * Set up Global Event Capturing with Whitelist
   */
  function setupGlobalEventLockdown() {
    const blockEvent = (e) => {
      if (isLocked) {
        // Whitelist [data-update-link] and buttons inside lock overlay
        if (e.target.closest('[data-update-link], .btn-update, .update-lock-card a, .update-lock-card button')) {
          return; // Allow interaction with download buttons!
        }
        e.stopImmediatePropagation();
        e.preventDefault();
      }
    };

    window.addEventListener('click', blockEvent, true);
    window.addEventListener('touchstart', blockEvent, true);
    window.addEventListener('keydown', (e) => {
      if (isLocked) {
        if (e.target.closest('[data-update-link], .btn-update, .update-lock-card a, .update-lock-card button')) {
          return;
        }
        e.stopImmediatePropagation();
        e.preventDefault();
      }
    }, true);
  }

  /**
   * Main Version Check Procedure
   */
  async function checkVersion() {
    try {
      const res = await fetch('/api/version', {
        headers: { 'X-App-Version': CLIENT_VERSION },
        cache: 'no-store'
      });

      if (!res.ok) {
        throw new Error(`HTTP ${res.status}`);
      }

      const config = await res.json();
      currentVersionConfig = config;

      // Update fresh server config cache in localStorage
      try {
        localStorage.setItem(LOCK_STORAGE_KEY, JSON.stringify({
          minVersion: config.minVersion,
          latestVersion: config.latestVersion,
          forceUpdateActive: !!config.forceUpdateActive,
          updateMessage: config.updateMessage,
          releaseNotes: config.releaseNotes,
          downloadLinks: config.downloadLinks,
          lastChecked: Date.now()
        }));
      } catch (_) { /* no-op */ }

      // Evaluate lock condition: forceUpdateActive === true AND CLIENT_VERSION < minVersion
      if (config.forceUpdateActive && compareVersions(CLIENT_VERSION, config.minVersion) < 0) {
        console.warn(`[VersionChecker] Force update active! Client (v${CLIENT_VERSION}) < Min (v${config.minVersion})`);
        await wipeStorageOnLock();
        renderLockScreen();
      } else {
        console.log(`[VersionChecker] Version check passed. Client v${CLIENT_VERSION} is authorized.`);
      }
    } catch (err) {
      console.warn('[VersionChecker] Failed to fetch /api/version. Checking cached lock state...', err);

      // Offline fallback: check cached lock state in localStorage
      try {
        const cachedRaw = localStorage.getItem(LOCK_STORAGE_KEY);
        if (cachedRaw) {
          const cached = JSON.parse(cachedRaw);
          currentVersionConfig = cached;

          if (cached.forceUpdateActive && compareVersions(CLIENT_VERSION, cached.minVersion) < 0) {
            console.warn('[VersionChecker] Offline lock triggered from cached config.');
            await wipeStorageOnLock();
            renderLockScreen({
              offlineMode: true,
              message: 'Mode hors-ligne : Une mise à jour obligatoire a été détectée. Veuillez vous connecter à Internet pour valider l\'installation.'
            });
          }
        }
      } catch (cacheErr) {
        console.error('[VersionChecker] Offline fallback evaluation error:', cacheErr);
      }
    }
  }

  // Initialize guards & triggers
  setupMutationObserver();
  setupGlobalEventLockdown();

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', checkVersion);
  } else {
    checkVersion();
  }

  // Re-check on network reconnect
  window.addEventListener('online', checkVersion);
})();
