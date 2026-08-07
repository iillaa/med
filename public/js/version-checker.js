/**
 * Dr.CAT App Version Checker & Security Lock Gate (Hardened IIFE Scope)
 */

(function () {
  'use strict';

  const LOCK_STORAGE_KEY = 'dr_cat_app_lock_state';
  const isNativeApk = !!window.Capacitor || (window.Capacitor && window.Capacitor.isNativePlatform && window.Capacitor.isNativePlatform()) || (navigator.userAgent && navigator.userAgent.toLowerCase().includes('capacitor'));

  // ── Localhost & Admin Exemption (Only for Web Browser development, NOT native Android APK) ──
  const isLocalhost = !isNativeApk && (location.hostname === 'localhost' || location.hostname === '127.0.0.1' || location.hostname === '::1');
  const isAdmin = !isNativeApk && !!localStorage.getItem('dr_cat_admin_token');
  if (isLocalhost || isAdmin) {
    console.log('[VersionChecker] Web browser developer/admin session detected. Version lock screen bypassed.');
    return;
  }

  // ── Private IIFE State (Inaccessible from DevTools Console) ──
  let isLocked = false;
  let currentVersionConfig = null;

  // Retrieve client app version from meta or default 1.0.0
  const CLIENT_VERSION = (function () {
    const metaVer = document.querySelector('meta[name="app-version"]')?.content;
    const metaBuild = document.querySelector('meta[name="app-build-version"]')?.content;
    return metaVer || '1.0.0';
  })();

  // Semantic versioning & Kill Switch is strictly for standalone Android APK native builds.
  if (!isNativeApk) {
    return;
  }

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
   * Safely purge ONLY stale network DB caches on lock without EVER touching user notes or revision progress.
   */
  function purgeStaleNetworkCacheOnLock() {
    try {
      localStorage.removeItem('dr_cat_synced_db');
    } catch (err) {
      console.warn('[VersionChecker] Error clearing network cache on lock:', err);
    }
  }

  /**
   * Render Soft Top Banner for Web/PWA mode (Non-intrusive)
   */
  function renderSoftPwaBanner(config) {
    let banner = document.getElementById('pwa-update-soft-banner');
    if (!banner) {
      banner = document.createElement('div');
      banner.id = 'pwa-update-soft-banner';
      banner.style.cssText = `
        position: fixed; top: 0; left: 0; width: 100%; z-index: 9999;
        background: linear-gradient(135deg, #06b6d4, #0284c7); color: #fff;
        padding: 10px 16px; font-size: 13px; font-weight: 600; text-align: center;
        display: flex; align-items: center; justify-content: center; gap: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.3); font-family: sans-serif;
      `;
      document.body.prepend(banner);
    }
    banner.innerHTML = `
      <span>🔔 Une nouvelle version de Dr.CAT (${config.latestVersion || 'v1.1.0'}) est disponible.</span>
      <button id="pwa-soft-banner-refresh-btn" style="background: #fff; color: #0284c7; border: none; padding: 4px 12px; border-radius: 6px; font-weight: 700; font-size: 12px; cursor: pointer;">
        🔄 Rafraîchir le site
      </button>
    `;
    document.getElementById('pwa-soft-banner-refresh-btn')?.addEventListener('click', async () => {
      if ('serviceWorker' in navigator) {
        const regs = await navigator.serviceWorker.getRegistrations();
        for (let reg of regs) await reg.unregister();
      }
      if ('caches' in window) {
        const keys = await caches.keys();
        await Promise.all(keys.map(k => caches.delete(k)));
      }
      window.location.reload(true);
    });
  }

  /**
   * Render Hard Lock Screen for Android APK Native App
   */
  function renderLockScreen(options = {}) {
    isLocked = true;

    // Instantly hide the normal boot loading splash overlay to prevent visual flashes
    const bootSplash = document.getElementById('app-loading-overlay');
    if (bootSplash) {
      bootSplash.style.setProperty('display', 'none', 'important');
    }

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

    // Resolve the direct download URL: prefer server-provided absolute URL, then
    // build one from the active tunnel so it works in Capacitor (localhost origin).
    const rawDirectUrl = links.directServerUrl;
    let directDownloadUrl;
    if (rawDirectUrl && rawDirectUrl.startsWith('http')) {
      directDownloadUrl = rawDirectUrl;
    } else {
      // In Capacitor the origin is https://localhost — build absolute URL from tunnel.
      const remoteBase = (typeof window !== 'undefined' && window.__DRCAT_REMOTE_URLS__ && window.__DRCAT_REMOTE_URLS__[0]) || '';
      directDownloadUrl = remoteBase
        ? `${remoteBase.replace(/\/+$/, '')}/download/drcat-latest.apk`
        : (rawDirectUrl || '/download/drcat-latest.apk');
    }

    const buttonsHtml = `
      <a href="${links.uptodownUrl || 'https://dr-cat.en.uptodown.com/android'}" target="_blank" rel="noopener" class="btn-update uptodown" data-update-link="uptodown">
        <i class="fa-solid fa-cloud-arrow-down"></i> Télécharger via Uptodown
      </a>
      <a href="${links.telegramUrl || 'https://t.me/DrCatOfficialApp'}" target="_blank" rel="noopener" class="btn-update telegram" data-update-link="telegram">
        <i class="fa-brands fa-telegram"></i> Canal Telegram Officiel
      </a>
      <a href="${directDownloadUrl}" target="_blank" rel="noopener" class="btn-update direct" data-update-link="direct">
        <i class="fa-solid fa-globe"></i> Lien Direct (Serveur Web)
      </a>
    `;

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
            ${buttonsHtml}
          </div>
        </div>
      </div>
    `;

    root.innerHTML = html;

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
        const link = e.target.closest('a, button, [data-update-link], .btn-update');
        if (link) {
          const href = link.getAttribute('href');
          if (href && (href.startsWith('http://') || href.startsWith('https://'))) {
            if (window.Capacitor && window.Capacitor.Commands && typeof window.Capacitor.Commands.openUrl === 'function') {
              window.Capacitor.Commands.openUrl({ url: href });
            } else {
              window.open(href, '_system');
            }
          }
          return;
        }
        e.stopImmediatePropagation();
        e.preventDefault();
      }
    };

    window.addEventListener('click', blockEvent, true);
    window.addEventListener('touchstart', blockEvent, true);
  }

  /**
   * Early Startup Lock Check (only for native Android APK)
   */
  if (isNativeApk) {
    try {
      const cachedRaw = localStorage.getItem(LOCK_STORAGE_KEY);
      if (cachedRaw) {
        const cached = JSON.parse(cachedRaw);
        if (cached.forceUpdateActive && compareVersions(CLIENT_VERSION, cached.minVersion) < 0) {
          currentVersionConfig = cached;
          renderLockScreen();
        }
      }
    } catch (_) { /* ignore early storage read error */ }
  }

  /**
   * Main Version Check Procedure
   */
  async function checkVersion() {
    try {
      const getVersionEndpoint = () => {
        if (window.api && typeof window.api.getApiUrl === 'function') {
          return window.api.getApiUrl('/api/version');
        }
        const configuredUrl = localStorage.getItem('dr_cat_remote_server_url') || (window.REMOTE_SERVER_URLS && window.REMOTE_SERVER_URLS[0]) || 'https://rendition-duchess-dry.ngrok-free.dev';
        if (!window.__DRCAT_REMOTE_URLS__) {
          window.__DRCAT_REMOTE_URLS__ = [configuredUrl];
        }
        const cleanUrl = String(configuredUrl).replace(/\/+$/, '');
        return `${cleanUrl}/api/version`;
      };

      const rawVersionUrl = getVersionEndpoint();
      const versionUrl = rawVersionUrl.includes('?')
        ? `${rawVersionUrl}&ngrok-skip-browser-warning=true`
        : `${rawVersionUrl}?ngrok-skip-browser-warning=true`;

      const res = await fetch(versionUrl, {
        headers: {
          'X-App-Version': CLIENT_VERSION,
          'x-app-key': 'drcat_pub_2f7a91c4e8',
          'ngrok-skip-browser-warning': 'true'
        },
        cache: 'no-store'
      });

      if (!res.ok) {
        throw new Error(`HTTP ${res.status}`);
      }

      const config = await res.json();
      currentVersionConfig = config;

      if (config.forceUpdateActive && compareVersions(CLIENT_VERSION, config.minVersion) < 0) {
        try {
          localStorage.setItem(LOCK_STORAGE_KEY, JSON.stringify({
            minVersion: config.minVersion,
            latestVersion: config.latestVersion,
            forceUpdateActive: true,
            updateMessage: config.updateMessage,
            releaseNotes: config.releaseNotes,
            downloadLinks: config.downloadLinks,
            lastChecked: Date.now()
          }));
        } catch (_) { /* no-op */ }

        if (isNativeApk) {
          console.warn(`[VersionChecker] Force update active on Android APK! Client (v${CLIENT_VERSION}) < Min (v${config.minVersion})`);
          purgeStaleNetworkCacheOnLock();
          renderLockScreen();
        } else {
          console.log('[VersionChecker] Soft update banner shown for Web/PWA mode.');
          renderSoftPwaBanner(config);
        }
      } else {
        console.log(`[VersionChecker] Version check passed. Client v${CLIENT_VERSION} is authorized.`);
        try {
          localStorage.removeItem(LOCK_STORAGE_KEY);
        } catch (_) {}

        if (isLocked) {
          isLocked = false;
          console.log('[VersionChecker] Kill switch disabled on server. Reloading app to restore active UI...');
          window.location.reload();
          return;
        }
      }
    } catch (err) {
      console.warn('[VersionChecker] Remote version check unreachable, using offline rules:', err.message || err);
      if (isNativeApk) {
        try {
          const cachedRaw = localStorage.getItem(LOCK_STORAGE_KEY);
          if (cachedRaw) {
            const cached = JSON.parse(cachedRaw);
            if (cached.forceUpdateActive && compareVersions(CLIENT_VERSION, cached.minVersion) < 0) {
              currentVersionConfig = cached;
              purgeStaleNetworkCacheOnLock();
              renderLockScreen();
            } else {
              console.log('[VersionChecker] Version check passed. Client v' + CLIENT_VERSION + ' is authorized.');
            }
          } else {
            console.log('[VersionChecker] Version check passed. Client v' + CLIENT_VERSION + ' is authorized.');
          }
        } catch (cacheErr) {
          console.error('[VersionChecker] Offline fallback evaluation error:', cacheErr);
        }
      }
    }
  }

  setupMutationObserver();
  setupGlobalEventLockdown();

  const safeCheck = () => checkVersion().catch(e => console.warn('[VersionChecker] Async check notice:', e.message || e));

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', safeCheck);
  } else {
    safeCheck();
  }

  window.addEventListener('online', safeCheck);
})();
