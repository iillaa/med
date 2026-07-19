// Debug Console — automatic capture & floating UI for Android/mobile
import { isOfflineApp } from './api.js';
import { showToast } from './utils.js';
let logBuffer = [];
const MAX_LOGS = 200;
let isViewerOpen = false;
let originalConsole = {};
let devUnlockClickCount = 0;
const DEV_UNLOCK_THRESHOLD = 3;
let devUnlockCooldown = false;

// ── Capture Helpers ──────────────────────────────────────────
function addLog(level, args, meta = {}) {
  const timestamp = new Date().toLocaleTimeString('fr-FR', { hour12: false });
  const message = args.map(arg => {
    if (arg instanceof Error) return arg.message + '\n' + arg.stack;
    if (typeof arg === 'object') {
      try { return JSON.stringify(arg); } catch (_) { return String(arg); }
    }
    return String(arg);
  }).join(' ');

  logBuffer.push({ timestamp, level, message, ...meta });
  if (logBuffer.length > MAX_LOGS) logBuffer.shift();

  // If viewer is open, refresh the UI
  if (isViewerOpen) renderLogs();
}

// ── Override Console Methods ─────────────────────────────────
export function startDebugConsole() {
  if (originalConsole.log) return; // Already initialized

  // Save originals
  originalConsole = {
    log: console.log,
    warn: console.warn,
    error: console.error,
    info: console.info
  };

  console.log = (...args) => {
    addLog('LOG', args);
    originalConsole.log.apply(console, args);
  };
  console.warn = (...args) => {
    addLog('WARN', args);
    originalConsole.warn.apply(console, args);
  };
  console.error = (...args) => {
    addLog('ERROR', args);
    originalConsole.error.apply(console, args);
  };
  console.info = (...args) => {
    addLog('INFO', args);
    originalConsole.info.apply(console, args);
  };

  // Global errors & rejections
  window.addEventListener('error', (event) => {
    addLog('ERROR', [`${event.message} at ${event.filename}:${event.lineno}:${event.colno}`, event.error]);
  });
  window.addEventListener('unhandledrejection', (event) => {
    addLog('ERROR', [`Unhandled Promise Rejection: ${event.reason}`]);
  });

  // Network interception (fetch)
  const originalFetch = window.fetch;
  window.fetch = async (...args) => {
    const url = typeof args[0] === 'string' ? args[0] : (args[0]?.url || '');
    const method = (args[1]?.method || 'GET').toUpperCase();
    const start = performance.now();
    try {
      const res = await originalFetch(...args);
      const duration = Math.round(performance.now() - start);
      addLog('NETWORK', [`${method} ${url} → ${res.status} (${duration}ms)`], {
        network: { url, method, status: res.status, duration }
      });
      return res;
    } catch (err) {
      const duration = Math.round(performance.now() - start);
      addLog('ERROR', [`${method} ${url} → FAILED (${duration}ms): ${err.message}`], {
        network: { url, method, status: 0, duration }
      });
      throw err;
    }
  };

  // Startup breadcrumbs
  addLog('INFO', ['🚀 Debug Console initialized.']);
}

// ── UI ───────────────────────────────────────────────────────
function getLogColor(level) {
  switch(level) {
    case 'ERROR': return '#f87171';
    case 'WARN': return '#fbbf24';
    case 'INFO': return '#38bdf8';
    case 'NETWORK': return '#a78bfa';
    default: return '#94a3b8';
  }
}

function escapeHtml(s) {
  return String(s || '').replace(/[&<>"']/g, c => ({
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;'
  }[c]));
}

function renderLogs() {
  const container = document.getElementById('debug-console-content');
  if (!container) return;

  if (logBuffer.length === 0) {
    container.innerHTML = '<div style="color: #64748b; padding: 20px; text-align: center;">Aucun log pour le moment.</div>';
    return;
  }

  container.innerHTML = logBuffer.map(log => {
    const levelClass = (log.level || 'info').toLowerCase();
    return `<div class="log-row ${levelClass}" style="padding: 4px 8px; font-family: monospace; font-size: 11px; line-height: 1.4; display: flex; gap: 8px;">
      <span class="log-time" style="white-space: nowrap;">[${escapeHtml(log.timestamp)}]</span>
      <span class="log-level" style="font-weight: bold; min-width: 50px;">${escapeHtml(log.level)}</span>
      <span class="log-message" style="word-break: break-all;">${escapeHtml(log.message)}</span>
    </div>`;
  }).join('');

  // Auto-scroll to bottom without forced reflow
  setTimeout(() => {
    container.scrollTop = container.scrollHeight;
  }, 0);
}

function toggleViewer() {
  const panel = document.getElementById('debug-console-panel');
  isViewerOpen = !isViewerOpen;
  panel.style.display = isViewerOpen ? 'flex' : 'none';
  if (isViewerOpen) renderLogs();
}

function attemptDevUnlock() {
  if (devUnlockCooldown) return;

  devUnlockClickCount++;
  if (devUnlockClickCount >= DEV_UNLOCK_THRESHOLD) {
    devUnlockClickCount = 0;
    devUnlockCooldown = true;
    window.__drCatDevDiagnosticsUnlocked = true;
    localStorage.setItem('drCatDevDiagnosticsUnlocked', 'true');
    showToast("🔓 Diagnostics/Performance déverrouillés !", "fa-unlock", 4000);
    
    // Automatically close the log viewer overlay so the user sees the dashboard
    const panel = document.getElementById('debug-console-panel');
    if (panel) {
      panel.style.display = 'none';
      isViewerOpen = false;
    }

    document.dispatchEvent(new CustomEvent('dr-cat-dev-unlocked'));
    setTimeout(() => { devUnlockCooldown = false; }, 5000);
  }
}

function createUI() {
  // Inject styles if not already present
  if (!document.getElementById('debug-console-styles')) {
    const style = document.createElement('style');
    style.id = 'debug-console-styles';
    style.textContent = `
      #debug-toggle-btn {
        position: fixed;
        bottom: 20px;
        right: 20px;
        width: 48px;
        height: 48px;
        border-radius: 50%;
        background: #0f172a;
        border: 2px solid #06b6d4;
        color: #06b6d4;
        font-size: 22px;
        z-index: 999999;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        box-shadow: 0 4px 20px rgba(6, 182, 212, 0.4);
        transition: transform 0.2s ease;
        font-family: sans-serif;
        user-select: none;
        -webkit-tap-highlight-color: transparent;
      }
      #debug-toggle-btn:hover {
        transform: scale(1.1);
      }
      #debug-toggle-btn .badge {
        position: absolute;
        top: -4px;
        right: -4px;
        background: #ef4444;
        color: white;
        font-size: 9px;
        font-weight: 700;
        width: 18px;
        height: 18px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 2px solid #0f172a;
        display: none;
      }
      #debug-toggle-btn .badge.show {
        display: flex;
      }

      #debug-console-panel {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(9, 13, 22, 0.95);
        backdrop-filter: blur(8px);
        z-index: 999998;
        display: none;
        flex-direction: column;
        padding: 16px;
        box-sizing: border-box;
      }
      #debug-console-panel .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-bottom: 12px;
        border-bottom: 1px solid #334155;
        flex-shrink: 0;
      }
      #debug-console-panel .header h3 {
        color: #06b6d4;
        margin: 0;
        font-size: 16px;
        display: flex;
        align-items: center;
        gap: 10px;
        font-family: sans-serif;
      }
      #debug-console-panel .header .actions {
        display: flex;
        gap: 10px;
      }
      #debug-console-panel .header .actions button {
        background: #1e293b;
        border: 1px solid #334155;
        color: #94a3b8;
        padding: 6px 12px;
        border-radius: 6px;
        font-size: 11px;
        font-weight: 600;
        cursor: pointer;
        font-family: sans-serif;
      }
      #debug-console-panel .header .actions button:hover {
        background: #334155;
        color: #f8fafc;
      }
      #debug-console-panel .header .actions button.close-btn {
        background: rgba(239, 68, 68, 0.15);
        border-color: rgba(239, 68, 68, 0.3);
        color: #f87171;
      }
      #debug-console-content {
        flex-grow: 1;
        overflow-y: auto;
        margin-top: 12px;
        background: rgba(0,0,0,0.3);
        border-radius: 8px;
        padding: 8px 0;
        font-family: monospace;
        font-size: 11px;
        line-height: 1.4;
        color: #e2e8f0;
        scroll-behavior: smooth;
      }
      #debug-console-content::-webkit-scrollbar {
        width: 4px;
      }
      #debug-console-content::-webkit-scrollbar-thumb {
        background: #334155;
        border-radius: 4px;
      }
      .light-theme #debug-toggle-btn {
        background: #ffffff;
        border-color: #0891b2;
        color: #0891b2;
        box-shadow: 0 4px 20px rgba(8, 145, 178, 0.2);
      }
      .light-theme #debug-console-panel {
        background: rgba(241, 245, 249, 0.95);
      }
      .light-theme #debug-console-panel .header h3 {
        color: #0891b2;
      }
      .light-theme #debug-console-content {
        color: #0f172a;
        background: rgba(0,0,0,0.03);
      }
      .light-theme #debug-console-content div {
        border-bottom-color: rgba(0,0,0,0.05);
      }

      /* Dynamic high-contrast theme-friendly log text colors */
      #debug-console-content .log-row {
        border-bottom: 1px solid rgba(255,255,255,0.03);
      }
      .light-theme #debug-console-content .log-row {
        border-bottom-color: rgba(0,0,0,0.05);
      }
      #debug-console-content .log-time {
        color: #64748b;
      }
      .light-theme #debug-console-content .log-time {
        color: #475569;
      }
      #debug-console-content .log-message {
        color: #e2e8f0;
      }
      .light-theme #debug-console-content .log-message {
        color: #0f172a;
      }

      /* Dark Theme Log Colors (Vibrant/Light) */
      #debug-console-content .log-row.error .log-level { color: #f87171; }
      #debug-console-content .log-row.warn .log-level { color: #fbbf24; }
      #debug-console-content .log-row.info .log-level { color: #38bdf8; }
      #debug-console-content .log-row.network .log-level { color: #a78bfa; }
      #debug-console-content .log-row .log-level { color: #94a3b8; }

      /* Light Theme Log Colors (High Contrast/Darker) */
      .light-theme #debug-console-content .log-row.error .log-level { color: #dc2626; }
      .light-theme #debug-console-content .log-row.warn .log-level { color: #b45309; }
      .light-theme #debug-console-content .log-row.info .log-level { color: #0891b2; }
      .light-theme #debug-console-content .log-row.network .log-level { color: #6d28d9; }
      .light-theme #debug-console-content .log-row .log-level { color: #475569; }
    `;
    document.head.appendChild(style);
  }

  // Toggle Button
  if (!document.getElementById('debug-toggle-btn')) {
    const btn = document.createElement('div');
    btn.id = 'debug-toggle-btn';
    btn.innerHTML = '🐛<span class="badge" id="debug-badge"></span>';
    
    // Hidden by default, unless developer mode is enabled in localStorage
    const isVisible = localStorage.getItem('drCatDebugConsoleVisible') === 'true';
    btn.style.display = isVisible ? 'flex' : 'none';
    
    document.body.appendChild(btn);
    btn.addEventListener('click', () => {
      attemptDevUnlock();
      toggleViewer();
    });
  }

  // Panel
  if (!document.getElementById('debug-console-panel')) {
    const panel = document.createElement('div');
    panel.id = 'debug-console-panel';
    panel.innerHTML = `
      <div class="header">
        <h3>🐛 Debug Console <span style="font-size: 11px; color: #64748b; font-weight:400;">(${MAX_LOGS} max)</span></h3>
        <div class="actions">
          <button id="debug-copy-btn">📋 Copier</button>
          <button id="debug-clear-btn">🗑 Vider</button>
          <button class="close-btn" id="debug-close-btn">✕ Fermer</button>
        </div>
      </div>
      <div id="debug-console-content"></div>
    `;
    document.body.appendChild(panel);
    panel.style.display = 'none';

    document.getElementById('debug-close-btn').addEventListener('click', toggleViewer);
    document.getElementById('debug-clear-btn').addEventListener('click', () => {
      logBuffer = [];
      renderLogs();
    });
    document.getElementById('debug-copy-btn').addEventListener('click', () => {
      const text = logBuffer.map(l => `[${l.timestamp}] [${l.level}] ${l.message}`).join('\n');
      navigator.clipboard?.writeText(text).then(() => {
        alert('Logs copiés dans le presse-papier !');
      }).catch(() => {
        // fallback
        const ta = document.createElement('textarea');
        ta.value = text;
        document.body.appendChild(ta);
        ta.select();
        document.execCommand('copy');
        document.body.removeChild(ta);
        alert('Logs copiés !');
      });
    });
  }
}

// ── Init ──────────────────────────────────────────────────────
export function initDebugConsole() {
  // Read saved diagnostic unlock status
  window.__drCatDevDiagnosticsUnlocked = localStorage.getItem('drCatDevDiagnosticsUnlocked') === 'true';

  startDebugConsole();
  createUI();

  // 10 click Easter Egg on brand logo to toggle debug console button visibility
  let logoClicks = 0;
  let logoClickTimeout = null;

  const handleLogoClick = () => {
    logoClicks++;
    
    if (logoClickTimeout) clearTimeout(logoClickTimeout);
    logoClickTimeout = setTimeout(() => {
      logoClicks = 0;
    }, 4000); // reset count if inactive for 4 seconds

    if (logoClicks >= 10) {
      logoClicks = 0;
      clearTimeout(logoClickTimeout);
      
      const btn = document.getElementById('debug-toggle-btn');
      if (btn) {
        // Toggle visibility
        const currentlyVisible = btn.style.display === 'flex';
        if (currentlyVisible) {
          btn.style.display = 'none';
          localStorage.removeItem('drCatDebugConsoleVisible');
          // Also lock diagnostics when hiding
          localStorage.removeItem('drCatDevDiagnosticsUnlocked');
          window.__drCatDevDiagnosticsUnlocked = false;
          document.dispatchEvent(new CustomEvent('dr-cat-dev-unlocked'));
          showToast("🐛 Mode Débogage désactivé.", "fa-bug", 3000);
        } else {
          btn.style.setProperty('display', 'flex', 'important');
          localStorage.setItem('drCatDebugConsoleVisible', 'true');
          showToast("🐛 Mode Débogage activé ! Tapotez 3 fois sur l'icône 🐛 pour déverrouiller les diagnostics.", "fa-bug", 5000);
        }
      }
    }
  };

  const registerLogoListeners = () => {
    const desktopLogo = document.getElementById('brand-logo');
    const mobileLogo = document.getElementById('mobile-brand-logo');

    if (desktopLogo) {
      desktopLogo.removeEventListener('click', handleLogoClick);
      desktopLogo.addEventListener('click', handleLogoClick);
    }
    if (mobileLogo) {
      mobileLogo.removeEventListener('click', handleLogoClick);
      mobileLogo.addEventListener('click', handleLogoClick);
    }
  };

  // Register immediately and again after 500ms (to cover all runtime layouts)
  registerLogoListeners();
  setTimeout(registerLogoListeners, 500);

  // Log startup info
  console.log('📱 Dr.CAT Debug Console active.');
}

