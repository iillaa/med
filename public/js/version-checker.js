/**
 * Dr.CAT App Version Checker & Security Lock Gate (Hardened IIFE Scope)
 */

(function () {
  'use strict';

  const LOCK_STORAGE_KEY = 'dr_cat_app_lock_state';
  const isNativeApk = !!window.Capacitor || (window.Capacitor && window.Capacitor.isNativePlatform && window.Capacitor.isNativePlatform()) || (navigator.userAgent && navigator.userAgent.toLowerCase().includes('capacitor'));

  function storageGet(key) {
    try {
      return (typeof window !== 'undefined' && window.localStorage) ? window.localStorage.getItem(key) : null;
    } catch (_) {
      return null;
    }
  }

  function storageSet(key, val) {
    try {
      if (typeof window !== 'undefined' && window.localStorage) window.localStorage.setItem(key, val);
    } catch (_) {}
  }

  function storageRemove(key) {
    try {
      if (typeof window !== 'undefined' && window.localStorage) window.localStorage.removeItem(key);
    } catch (_) {}
  }

  // ── Localhost & Admin Exemption (Only for Web Browser development, NOT native Android APK) ──
  const isLocalhost = !isNativeApk && (location.hostname === 'localhost' || location.hostname === '127.0.0.1' || location.hostname === '::1');
  const isAdmin = !isNativeApk && !!storageGet('dr_cat_admin_token');
  if (isLocalhost || isAdmin) {
    console.log('[VersionChecker] Web browser developer/admin session detected. Version lock screen bypassed.');
    return;
  }

  // ── Private IIFE State (Inaccessible from DevTools Console) ──
  let isLocked = false;
  let currentVersionConfig = null;

  function escapeHTML(str) {
    return String(str == null ? '' : str)
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;')
      .replace(/'/g, '&#39;');
  }

  // Retrieve client app version from meta or default 1.0.0
  const CLIENT_VERSION = (function () {
    const metaVer = document.querySelector('meta[name="app-version"]')?.content;
    const metaBuild = document.querySelector('meta[name="app-build-version"]')?.content;
    return metaVer || '1.0.0';
  })();

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
      storageRemove('dr_cat_synced_db');
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
      <span>🔔 Une nouvelle version de Dr.CAT (${escapeHTML(config.latestVersion || 'v1.1.0')}) est disponible.</span>
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

    // Prevent duplicate re-renders / recursive loops
    if (document.getElementById('app-update-lock-overlay')) {
      return;
    }

    const config = currentVersionConfig || {};
    const links = config.downloadLinks || {};
    const notes = config.releaseNotes || [
      'Correction de la barre de navigation Android',
      'Optimisation des performances et de la sécurité',
      'Mise à jour des conduites à tenir cliniques'
    ];

    const isOffline = !!options.offlineMode;

    // Only allow http(s) or root-relative URLs from the version config into href attributes
    function safeUrl(url, fallback) {
      const value = typeof url === 'string' ? url.trim() : '';
      return (/^https?:\/\//i.test(value) || /^\//.test(value)) ? escapeHTML(value) : fallback;
    }

    const notesHtml = (Array.isArray(notes) ? notes : []).map(n => `<li>${escapeHTML(n)}</li>`).join('');

    const storeUrl = safeUrl(links.storeUrl || links.apkpureUrl || links.uptodownUrl, '/download.html');
    const telegramUrl = safeUrl(links.telegramUrl, 'https://t.me/DrCatOfficialApp');
    const directUrl = safeUrl(links.directServerUrl, '/download.html');

    const buttonsHtml = `
      <a href="${storeUrl}" target="_blank" rel="noopener" class="btn-update store" data-update-link="store" id="lock-btn-store">
        <i class="fa-solid fa-cloud-arrow-down"></i> Télécharger via App Store
      </a>
      <a href="${telegramUrl}" target="_blank" rel="noopener" class="btn-update telegram" data-update-link="telegram" id="lock-btn-telegram">
        <i class="fa-brands fa-telegram"></i> Canal Telegram Officiel
      </a>
      <a href="${directUrl}" target="_blank" rel="noopener" class="btn-update direct" data-update-link="direct" id="lock-btn-direct">
        <i class="fa-solid fa-globe"></i> Lien Direct (Mise à jour Web)
      </a>
    `;

    const html = `
      <div class="update-lock-screen" id="app-update-lock-overlay">
        <div class="update-lock-card">
          <img src="drcat_logo.webp" alt="Dr.CAT" class="update-brand-logo" onerror="this.src='drcat_logo.png'">
          <h2 class="update-lock-title">Dr.CAT — Mise à jour requise</h2>

          <div class="update-badge-container">
            <span class="update-badge-old">Installé: v${escapeHTML(CLIENT_VERSION)}</span>
            <span class="update-badge-arrow">➔</span>
            <span class="update-badge-new">Requis: v${escapeHTML(config.minVersion || '1.1.0')}</span>
          </div>

          ${isOffline ? `
            <div class="update-offline-notice">
              <i class="fa-solid fa-triangle-exclamation"></i>
              ${options.message ? escapeHTML(options.message) : 'Mode hors-ligne : Une mise à jour obligatoire a été détectée. Veuillez vous connecter à Internet pour mettre à jour l\'application.'}
            </div>
          ` : `
            <p class="update-message-box">
              ${config.updateMessage ? escapeHTML(config.updateMessage) : 'Une mise à jour importante est requise pour continuer à utiliser Dr.CAT.'}
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

    // Attach active event listeners to buttons for guaranteed Android browser launching
    const attachBtnHandler = (id, url) => {
      const btn = document.getElementById(id);
      if (btn) {
        btn.addEventListener('click', (e) => {
          e.preventDefault();
          e.stopPropagation();
          try {
            if (window.Capacitor && window.Capacitor.Plugins && window.Capacitor.Plugins.Browser) {
              window.Capacitor.Plugins.Browser.open({ url });
            } else {
              window.open(url, '_system');
            }
          } catch (_) {
            window.open(url, '_system');
          }
        });
      }
    };

    attachBtnHandler('lock-btn-store', storeUrl);
    attachBtnHandler('lock-btn-telegram', telegramUrl);
    attachBtnHandler('lock-btn-direct', directUrl);

    const skipBtn = document.getElementById('skip-loading-btn');
    if (skipBtn) {
      skipBtn.style.display = 'none';
    }
  }

  /**
   * Early Startup Lock Check (only for native Android APK)
   */
  if (isNativeApk) {
    try {
      const cachedRaw = storageGet(LOCK_STORAGE_KEY);
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
      const getCandidateUrls = () => {
        if (window.api && typeof window.api.getConfiguredRemoteUrls === 'function') {
          const list = window.api.getConfiguredRemoteUrls();
          if (list && list.length) return list;
        }
        if (window.REMOTE_SERVER_URLS && Array.isArray(window.REMOTE_SERVER_URLS) && window.REMOTE_SERVER_URLS.length) {
          return window.REMOTE_SERVER_URLS;
        }
        if (typeof REMOTE_SERVER_URLS !== 'undefined' && Array.isArray(REMOTE_SERVER_URLS)) {
          return REMOTE_SERVER_URLS;
        }
        return ['https://rendition-duchess-dry.ngrok-free.dev', 'https://drcat.is-an-app.workers.dev'];
      };

      const candidateUrls = getCandidateUrls();
      let versionCheckedOk = false;
      let lastError = null;

      for (const serverBase of candidateUrls) {
        try {
          const cleanUrl = String(serverBase).replace(/\/+$/, '');
          const endpoint = `${cleanUrl}/api/version`;
          const versionUrl = (endpoint.includes('ngrok-free.dev') || endpoint.includes('ngrok'))
            ? (endpoint.includes('?') ? `${endpoint}&ngrok-skip-browser-warning=true` : `${endpoint}?ngrok-skip-browser-warning=true`)
            : endpoint;

          const controller = new AbortController();
          const timeoutId = setTimeout(() => controller.abort(), 4000);

          const installId = storageGet('dr_cat_install_id') || 'drcat-inst-boot-check';
          const isStandalone = typeof window !== 'undefined' && (window.matchMedia?.('(display-mode: standalone)')?.matches || window.navigator?.standalone === true);
          const clientPlatform = isNativeApk ? 'android_apk' : (isStandalone ? 'web_pwa' : 'web_browser');

          const res = await fetch(versionUrl, {
            headers: {
              'X-App-Version': CLIENT_VERSION,
              'X-Install-ID': installId,
              'x-install-id': installId,
              'x-device-platform': clientPlatform,
              'x-app-key': 'drcat_pub_2f7a91c4e8',
              'ngrok-skip-browser-warning': 'true'
            },
            cache: 'no-store',
            signal: controller.signal
          });
          clearTimeout(timeoutId);

          if (!res.ok) {
            continue;
          }

          const config = await res.json();
          currentVersionConfig = config;
          versionCheckedOk = true;

          if (config.forceUpdateActive && compareVersions(CLIENT_VERSION, config.minVersion) < 0) {
            try {
              storageSet(LOCK_STORAGE_KEY, JSON.stringify({
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
            return;
          } else {
            console.log(`[VersionChecker] Version check passed via ${serverBase}. Client v${CLIENT_VERSION} is authorized.`);
            try {
              storageRemove(LOCK_STORAGE_KEY);
            } catch (_) {}

            if (isLocked) {
              isLocked = false;
              console.log('[VersionChecker] Kill switch disabled on server. Restoring active UI...');
              const secRoot = document.getElementById('security-root');
              if (secRoot) secRoot.innerHTML = '';
              const lockOverlay = document.getElementById('app-update-lock-overlay');
              if (lockOverlay) lockOverlay.remove();
              window.location.reload();
              return;
            }
            return;
          }
        } catch (err) {
          lastError = err;
        }
      }

      if (!versionCheckedOk && lastError) {
        throw lastError;
      }
    } catch (err) {
      console.warn('[VersionChecker] Remote version check unreachable, using offline rules:', err.message || err);
      if (isNativeApk) {
        try {
          const cachedRaw = storageGet(LOCK_STORAGE_KEY);
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
            console.log('[VersionChecker] Offline mode active without prior lock. Client v' + CLIENT_VERSION + ' is authorized.');
          }
        } catch (_) {
          console.log('[VersionChecker] Offline check error ignored. Client v' + CLIENT_VERSION + ' is authorized.');
        }
      }
    }
  }

  const safeCheck = () => checkVersion().catch(e => console.warn('[VersionChecker] Async check notice:', e.message || e));

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', safeCheck);
  } else {
    safeCheck();
  }

  window.addEventListener('online', safeCheck);

  // ── Smart Adaptive Polling Loop (5s when locked for instant unfreeze, 15s during normal use) ──
  function scheduleNextCheck() {
    const delay = isLocked ? 5000 : 15000;
    setTimeout(async () => {
      await safeCheck();
      scheduleNextCheck();
    }, delay);
  }

  scheduleNextCheck();
})();
