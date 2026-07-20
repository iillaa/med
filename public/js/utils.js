// Global utility methods for Dr. CAT

/**
 * Show a non-intrusive toast notification in the top-right corner.
 * @param {string} message - The text to display.
 * @param {string} [icon='fa-circle-info'] - FontAwesome icon class (without fa-solid prefix).
 * @param {number} [duration=5000] - Auto-dismiss delay in ms.
 */
export function showToast(message, icon = 'fa-circle-info', duration = 5000) {
  // Inject toast styles once into <head> — bypasses CSS caching entirely
  if (!document.getElementById('drcat-toast-styles')) {
    const style = document.createElement('style');
    style.id = 'drcat-toast-styles';
    style.textContent = `
      #drcat-toast {
        position: fixed !important;
        top: 20px !important;
        right: 20px !important;
        z-index: 999999 !important;
        display: flex !important;
        align-items: flex-start !important;
        gap: 12px !important;
        max-width: 320px !important;
        width: max-content !important;
        padding: 14px 16px !important;
        background: #1e293b !important;
        border: 1px solid #334155 !important;
        border-left: 3px solid #06b6d4 !important;
        border-radius: 10px !important;
        box-shadow: 0 10px 40px rgba(0,0,0,0.5) !important;
         opacity: 0 !important;
         transform: translateX(30px) !important;
         transition: opacity 0.3s ease, transform 0.3s ease !important;
         /* Respect reduced motion: drop the slide/opacity tween when requested */
         ${window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches ? 'transition: none !important; transform: none !important;' : ''}
        pointer-events: auto !important;
        font-family: inherit !important;
      }
      #drcat-toast.toast-visible {
        opacity: 1 !important;
        transform: translateX(0) !important;
      }
      .light-theme #drcat-toast {
        background: #ffffff !important;
        border-color: #e2e8f0 !important;
        border-left-color: #06b6d4 !important;
        box-shadow: 0 10px 40px rgba(0,0,0,0.15) !important;
      }
      #drcat-toast .t-icon {
        color: #06b6d4;
        font-size: 15px;
        flex-shrink: 0;
        margin-top: 2px;
      }
      #drcat-toast .t-msg {
        font-size: 12.5px;
        color: #94a3b8;
        line-height: 1.5;
        flex: 1;
      }
      .light-theme #drcat-toast .t-msg { color: #475569; }
      #drcat-toast .t-close {
        background: none;
        border: none;
        color: #64748b;
        cursor: pointer;
        font-size: 13px;
        padding: 0;
        flex-shrink: 0;
        margin-top: 1px;
        line-height: 1;
      }
      #drcat-toast .t-close:hover { color: #f8fafc; }
      .light-theme #drcat-toast .t-close:hover { color: #0f172a; }
    `;
    document.head.appendChild(style);
  }

  // Remove any existing toast
  const existing = document.getElementById('drcat-toast');
  if (existing) existing.remove();

  const toast = document.createElement('div');
  toast.id = 'drcat-toast';
  toast.setAttribute('role', 'status');
  toast.setAttribute('aria-live', 'polite');
  toast.innerHTML = `
    <i class="fa-solid ${icon} t-icon"></i>
    <span class="t-msg">${message}</span>
    <button class="t-close" aria-label="Fermer"><i class="fa-solid fa-xmark"></i></button>
  `;

  document.body.appendChild(toast);

  // Trigger transition after browser has painted the initial state
  setTimeout(() => toast.classList.add('toast-visible'), 30);

  const dismiss = () => {
    toast.classList.remove('toast-visible');
    setTimeout(() => toast.remove(), 350);
  };

  toast.querySelector('.t-close').addEventListener('click', dismiss);

  let timer = setTimeout(dismiss, duration);
  toast.addEventListener('mouseenter', () => clearTimeout(timer));
  toast.addEventListener('mouseleave', () => { timer = setTimeout(dismiss, 2000); });
}

/**
 * Remove corrupted characters / emoji codes from PDF display name
 */
export function getCleanPdfName(filename) {
  let name = filename.replace(/\.pdf$/i, '').replace(/\.docx$/i, '');
  // Clean emoji remnants (numbers with squares etc)
  name = name.replace(/[^\x20-\x7E\u00C0-\u00FF]/g, ' ').trim();
  // Clean double spaces
  name = name.replace(/\s+/g, ' ');
  return name;
}

/**
 * Parse prescription text into variant sections (e.g. --- Title ---)
 */
export function parsePrescriptionText(text) {
  if (!text) return [];
  
  const lines = text.split('\n');
  const variants = [];
  let currentVariant = null;
  
  lines.forEach(line => {
    const trimmed = line.trim();
    // Match lines like: --- Cas Général ---
    const match = trimmed.match(/^---+\s*(.*?)\s*---+$/);
    if (match) {
      if (currentVariant) {
        variants.push({
          title: currentVariant.title,
          content: currentVariant.content.join('\n').trim()
        });
      }
      currentVariant = {
        title: match[1].trim(),
        content: []
      };
    } else {
      if (!currentVariant) {
        currentVariant = {
          title: "Général",
          content: []
        };
      }
      currentVariant.content.push(line);
    }
  });
  
  if (currentVariant) {
    variants.push({
      title: currentVariant.title,
      content: currentVariant.content.join('\n').trim()
    });
  }
  
  return variants.filter(v => v.content.length > 0 || v.title !== "Général");
}

/**
 * Escape HTML characters to prevent XSS injection
 */
export function escapeHTML(str) {
  if (!str) return '';
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

/**
 * Convert line breaks and tables in markdown summaries to HTML elements
 */
export function parseSummaryMarkdown(text) {
  if (!text) {
    return '<p class="text-muted">Aucune synthèse disponible.</p>';
  }

  let html = escapeHTML(text);

  // Bold markdown
  html = html.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');

  // Parse markdown tables if any
  if (html.includes('|')) {
    const lines = html.split('\n');
    let inTable = false;
    let tableHtml = '<table>';
    let isFirstRow = true;

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i].trim();
      if (line.startsWith('|') && line.endsWith('|')) {
        if (!inTable) {
          inTable = true;
          isFirstRow = true;
        }
        // Skip separator line | :--- | :--- |
        if (line.includes('---')) continue;

        const cells = line.split('|').slice(1, -1).map(c => c.trim());
        const cellTag = isFirstRow ? 'th' : 'td';
        tableHtml += '<tr>';
        cells.forEach(cell => {
          tableHtml += `<${cellTag}>${cell}</${cellTag}>`;
        });
        tableHtml += '</tr>';
        isFirstRow = false;
      } else {
        if (inTable) {
          inTable = false;
          tableHtml += '</table>';
          lines[i] = tableHtml + '\n' + lines[i];
          tableHtml = '<table>'; // Reset
        }
      }
    }
    if (inTable) {
      tableHtml += '</table>';
      lines.push(tableHtml);
    }
    html = lines.join('\n');
  }

  // Remove raw table lines that were already parsed (to prevent double rendering)
  html = html.split('\n').filter(line => {
    const trimmed = line.trim();
    return !(trimmed.startsWith('|') && trimmed.endsWith('|'));
  }).join('\n');

  // Bullet points
  html = html.split('\n').map(line => {
    const trimmed = line.trim();
    if (trimmed.startsWith('- ')) {
      return `<li>${trimmed.substring(2)}</li>`;
    }
    return line;
  }).join('\n');

  // Wrap continuous <li> groups in <ul>
  html = html.replace(/(<li>.*?<\/li>\s*)+/gs, (match) => `<ul>${match}</ul>`);

  // Paragraph line breaks
  html = html.replace(/\n\n/g, '</p><p>').replace(/\n/g, '<br>');
  html = `<p>${html}</p>`;
  
  // Clean empty tags
  html = html.replace(/<p>\s*<\/p>/g, '').replace(/<p>\s*<ul>/g, '<ul>').replace(/<\/ul>\s*<\/p>/g, '</ul>');

  return html;
}

/**
 * Setup Swipe Gestures for Mobile Sidebar
 */
export function setupSwipeGestures(sidebarElement) {
  let touchStartX = 0;
  let touchStartY = 0;
  let touchEndX = 0;
  let touchEndY = 0;

  document.addEventListener('touchstart', (e) => {
    touchStartX = e.changedTouches[0].screenX;
    touchStartY = e.changedTouches[0].screenY;
  }, { passive: true });

  document.addEventListener('touchend', (e) => {
    touchEndX = e.changedTouches[0].screenX;
    touchEndY = e.changedTouches[0].screenY;
    
    const diffX = touchEndX - touchStartX;
    const diffY = touchEndY - touchStartY;
    
    // Check if swipe is mostly horizontal and exceeds 40px
    if (Math.abs(diffX) > Math.abs(diffY) && Math.abs(diffX) > 40) {
      const isSidebarOpen = sidebarElement.classList.contains('open');
      
      if (diffX > 0) {
        // Swipe Right: Open sidebar (only if started from the left edge < 60px)
        if (!isSidebarOpen && touchStartX < 60) {
          sidebarElement.classList.add('open');
        }
      } else {
        // Swipe Left: Close sidebar
        if (isSidebarOpen) {
          sidebarElement.classList.remove('open');
        }
      }
    }
  }, { passive: true });
}

// In-memory buffer for diagnostics console logs
let diagnosticsLogBuffer = [];
let originalConsoleWarn = null;
let originalConsoleError = null;
let originalConsoleInfo = null;
let originalConsoleLog = null;

export function formatBytes(bytes, decimals = 2) {
  if (bytes === 0) return '0 Bytes';
  const k = 1024;
  const dm = decimals < 0 ? 0 : decimals;
  const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
  const i = Math.floor(Math.log(bytes) / Math.log(k));
  return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
}

export async function copyToClipboard(text) {
  if (navigator.clipboard && navigator.clipboard.writeText) {
    try {
      await navigator.clipboard.writeText(text);
      return true;
    } catch (_) {}
  }
  
  try {
    const textArea = document.createElement("textarea");
    textArea.value = text;
    textArea.style.position = "fixed";
    textArea.style.top = "0";
    textArea.style.left = "0";
    textArea.style.width = "2em";
    textArea.style.height = "2em";
    textArea.style.padding = "0";
    textArea.style.border = "none";
    textArea.style.outline = "none";
    textArea.style.boxShadow = "none";
    textArea.style.background = "transparent";
    document.body.appendChild(textArea);
    textArea.focus();
    textArea.select();
    const successful = document.execCommand('copy');
    document.body.removeChild(textArea);
    return successful;
  } catch (err) {
    console.error("Fallback clipboard copy failed:", err);
    return false;
  }
}

export function captureConsoleWarnings(enable) {
  if (enable) {
    if (originalConsoleWarn) return; // Already capturing
    
    originalConsoleWarn = console.warn;
    originalConsoleError = console.error;
    originalConsoleInfo = console.info;
    originalConsoleLog = console.log;
    
    const pushLog = (severity, args) => {
      const msg = args.map(arg => {
        if (arg instanceof Error) return arg.message + '\n' + arg.stack;
        if (typeof arg === 'object') {
          try { return JSON.stringify(arg); } catch (_) { return String(arg); }
        }
        return String(arg);
      }).join(' ');
      
      const time = new Date().toLocaleTimeString('fr-FR', { hour12: false });
      diagnosticsLogBuffer.push({ time, severity, message: msg });
      
      if (diagnosticsLogBuffer.length > 50) {
        diagnosticsLogBuffer.shift();
      }
      
      window.dispatchEvent(new CustomEvent('drcat-log-added'));
    };

    console.warn = function(...args) {
      pushLog('WARN', args);
      originalConsoleWarn.apply(console, args);
    };
    
    console.error = function(...args) {
      pushLog('ERROR', args);
      originalConsoleError.apply(console, args);
    };
    
    console.info = function(...args) {
      pushLog('INFO', args);
      originalConsoleInfo.apply(console, args);
    };

    console.log = function(...args) {
      pushLog('LOG', args);
      originalConsoleLog.apply(console, args);
    };
  } else {
    if (!originalConsoleWarn) return; // Not capturing
    
    console.warn = originalConsoleWarn;
    console.error = originalConsoleError;
    console.info = originalConsoleInfo;
    console.log = originalConsoleLog;
    
    originalConsoleWarn = null;
    originalConsoleError = null;
    originalConsoleInfo = null;
    originalConsoleLog = null;
  }
}

export function getDiagnosticsLogs() {
  return [...diagnosticsLogBuffer];
}

export function clearDiagnosticsLogs() {
  diagnosticsLogBuffer = [];
  window.dispatchEvent(new CustomEvent('drcat-log-added'));
}

export function formatDuration(ms) {
  if (ms === null || ms === undefined || isNaN(ms)) return '--';
  if (ms < 1000) {
    return `${ms.toFixed(0)}ms`;
  }
  return `${(ms / 1000).toFixed(2)}s`;
}

export function formatPercent(val) {
  if (val === null || val === undefined || isNaN(val)) return '--';
  const pct = val <= 1.0 && val > 0 ? val * 100 : val;
  return `${pct.toFixed(1)}%`;
}

/**
 * Animate a modal out, then remove it from the DOM.
 * Adds `.modal-closing` (defined in modal.css) so the card scales/fades and the
 * backdrop fades; the node is removed on animationend (or immediately under
 * reduced-motion / if the browser doesn't fire animationend).
 * @param {HTMLElement} modal - the overlay element to dismiss.
 */
export function closeModalAnimated(modal) {
  if (!modal || !modal.isConnected) return;
  const card = modal.querySelector('.modal-card') || modal.firstElementChild;
  const finish = () => modal.remove();
  const reduce = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  if (reduce || !card) {
    finish();
    return;
  }
  modal.classList.add('modal-closing');
  let done = false;
  const onEnd = (e) => {
    if (e.target !== card && e.target !== modal) return;
    if (done) return;
    done = true;
    modal.removeEventListener('animationend', onEnd);
    finish();
  };
  modal.addEventListener('animationend', onEnd);
  // Safety net in case animationend doesn't fire.
  setTimeout(() => { if (!done) { done = true; finish(); } }, 600);
}

/**
 * Universal export dialog modal for text/JSON files.
 * Handles native sharing, downloading (using Capacitor Filesystem or web download), and copy to clipboard.
 * 
 * @param {string} fileName - File name to write (e.g. 'drcat-performance.json').
 * @param {string} dataTitle - Title for the modal dialog.
 * @param {object|string} payload - JSON object or string payload.
 */
export function exportDataFile(fileName, dataTitle, payload) {
  const jsonStr = typeof payload === 'string' ? payload : JSON.stringify(payload, null, 2);
  const existing = document.getElementById('universal-export-modal');
  if (existing) existing.remove();

  const isCapacitor = !!window.Capacitor;
  const canShare = !!navigator.share;

  const modal = document.createElement('div');
  modal.id = 'universal-export-modal';
  modal.className = 'modal-overlay modal-overlay--sheet';
  modal.setAttribute('role', 'dialog');
  modal.setAttribute('aria-modal', 'true');
  modal.innerHTML = `
    <div class="modal-card" style="border-color: var(--color-primary); max-width: 420px; box-shadow: var(--shadow-xl);">
      <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
        <h3 style="color: var(--color-success); margin: 0; font-size: 15px; display: flex; align-items: center; gap: 8px;">
          <i class="fa-solid fa-circle-check"></i> ${dataTitle} Prêt
        </h3>
        <button id="univ-modal-close" style="background: none; border: none; color: var(--text-muted); cursor: pointer; font-size: 18px;">
          <i class="fa-solid fa-xmark"></i>
        </button>
      </div>
      <p style="font-size: 12.5px; color: var(--text-muted); margin-bottom: 16px; line-height: 1.4;">
        Fichier : <strong style="color: var(--text-primary); word-break: break-all;">${fileName}</strong>
        <br><span style="font-size: 11px;">${jsonStr.length} caractères · Format JSON</span>
      </p>

      <div style="display: flex; flex-direction: column; gap: 10px;">
        ${canShare || isCapacitor ? `
        <button id="univ-btn-share" style="width: 100%; padding: 12px; background: linear-gradient(135deg, #6366f1, #8b5cf6); color: white; border: none; border-radius: 8px; font-size: 13px; font-weight: 600; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 8px;">
          <i class="fa-solid fa-share-nodes"></i> Partager (Telegram, WhatsApp, Email...)
        </button>
        ` : ''}

        <button id="univ-btn-download" style="width: 100%; padding: 12px; background: rgba(16, 185, 129, 0.15); color: var(--color-success); border: 1px solid var(--color-success); border-radius: 8px; font-size: 13px; font-weight: 600; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 8px;">
          <i class="fa-solid fa-download"></i> Télécharger en JSON
        </button>

        <button id="univ-btn-copy" style="width: 100%; padding: 12px; background: rgba(99, 102, 241, 0.1); color: #a5b4fc; border: 1px solid rgba(99, 102, 241, 0.3); border-radius: 8px; font-size: 13px; font-weight: 600; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 8px;">
          <i class="fa-solid fa-copy"></i> Copier dans le presse-papiers
        </button>

        <details style="margin-top: 4px;">
          <summary style="font-size: 11px; color: var(--text-muted); cursor: pointer; padding: 6px 0;">
            Aperçu (premiers 500 caractères)
          </summary>
          <pre style="font-size: 10px; color: var(--text-muted); background: rgba(0,0,0,0.3); padding: 8px; border-radius: 6px; overflow: auto; max-height: 160px; white-space: pre-wrap; word-break: break-all; margin-top: 6px;">${jsonStr.slice(0, 500)}...</pre>
        </details>
      </div>
    </div>
  `;

  document.body.appendChild(modal);

  // Close actions
  document.getElementById('univ-modal-close').addEventListener('click', () => closeModalAnimated(modal));
  modal.addEventListener('click', (e) => { if (e.target === modal) closeModalAnimated(modal); });

  // Share action (native or browser)
  const shareBtn = document.getElementById('univ-btn-share');
  if (shareBtn) {
    shareBtn.addEventListener('click', async () => {
      try {
        if (window.Capacitor && window.Capacitor.isNativePlatform()) {
          const Plugins = window.Capacitor.Plugins;
          const Filesystem = Plugins.Filesystem;
          const Share = Plugins.Share;

          if (Filesystem && Share) {
            try { await Filesystem.requestPermissions(); } catch (_) {}
            
            // Ensure folder exists
            try {
              await Filesystem.stat({ path: 'drcat', directory: 'DOCUMENTS' });
            } catch {
              await Filesystem.mkdir({ path: 'drcat', directory: 'DOCUMENTS', recursive: true });
            }

            // Write temporary file
            const fileUri = `drcat/${fileName}`;
            const writeResult = await Filesystem.writeFile({
              path: fileUri,
              data: jsonStr,
              directory: 'DOCUMENTS',
              encoding: 'utf8'
            });

            // Native Share
            await Share.share({
              title: dataTitle,
              text: `${dataTitle} Dr.CAT - ${new Date().toLocaleString('fr-FR')}`,
              url: writeResult.uri,
              dialogTitle: `Partager - ${dataTitle}`
            });
            showToast("Partage initié avec succès !", "fa-share-nodes", 3000);
            closeModalAnimated(modal);
            return;
          }
        }

        // Web Browser Fallback Share
        const blob = new Blob([jsonStr], { type: 'application/json' });
        const file = new File([blob], fileName, { type: 'application/json' });
        
        if (navigator.canShare && navigator.canShare({ files: [file] })) {
          await navigator.share({
            title: dataTitle,
            text: `${dataTitle} Dr.CAT`,
            files: [file]
          });
          showToast("Partage initié avec succès !", "fa-share-nodes", 3000);
        } else if (navigator.share) {
          await navigator.share({
            title: dataTitle,
            text: jsonStr.slice(0, 5000)
          });
          showToast("Texte partagé !", "fa-share-nodes", 3000);
        }
        closeModalAnimated(modal);
      } catch (err) {
        if (err.name !== 'AbortError') {
          console.error("Partage échoué:", err);
          showToast("Échec du partage.", "fa-triangle-exclamation", 3000);
        }
      }
    });
  }

  // Download action (native documents or browser link)
  document.getElementById('univ-btn-download').addEventListener('click', async () => {
    try {
      if (window.Capacitor && window.Capacitor.isNativePlatform()) {
        const Plugins = window.Capacitor.Plugins;
        const Filesystem = Plugins.Filesystem;

        if (Filesystem) {
          try { await Filesystem.requestPermissions(); } catch (_) {}
          try {
            await Filesystem.stat({ path: 'drcat', directory: 'DOCUMENTS' });
          } catch {
            await Filesystem.mkdir({ path: 'drcat', directory: 'DOCUMENTS', recursive: true });
          }

          await Filesystem.writeFile({
            path: `drcat/${fileName}`,
            data: jsonStr,
            directory: 'DOCUMENTS',
            encoding: 'utf8'
          });

          showToast("Enregistré dans Documents/drcat/ !", "fa-floppy-disk", 5000);
          closeModalAnimated(modal);
          return;
        }
      }

      // Standard browser download
      const blob = new Blob([jsonStr], { type: 'application/json' });
      const url = URL.createObjectURL(blob);
      const link = document.createElement('a');
      link.href = url;
      link.download = fileName;
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
      URL.revokeObjectURL(url);
      showToast("Téléchargement lancé !", "fa-download", 3000);
      closeModalAnimated(modal);
    } catch (err) {
      console.error("Téléchargement échoué:", err);
      showToast("Impossible de télécharger.", "fa-triangle-exclamation", 3000);
    }
  });

  // Copy to clipboard action
  document.getElementById('univ-btn-copy').addEventListener('click', async () => {
    const success = await copyToClipboard(jsonStr);
    if (success) {
      showToast("Copié dans le presse-papiers !", "fa-copy", 4000);
      closeModalAnimated(modal);
    } else {
      showToast("Échec de la copie automatique.", "fa-circle-xmark", 3000);
    }
  });
}

/**
 * Show a modal loading overlay with backdrop blur and spinner.
 * @param {string} initialMessage - The text to display.
 * @returns {object} Controller containing updateMessage(msg) and hide() functions.
 */
function showLoadingOverlay(initialMessage) {
  if (!document.getElementById('drcat-loading-styles')) {
    const style = document.createElement('style');
    style.id = 'drcat-loading-styles';
    style.textContent = `
      #drcat-loading-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        background: rgba(9, 13, 22, 0.7);
        backdrop-filter: blur(8px);
        -webkit-backdrop-filter: blur(8px);
        z-index: 9999999;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 18px;
        opacity: 0;
        transition: opacity 0.3s ease;
        pointer-events: all;
      }
      #drcat-loading-overlay.visible {
        opacity: 1;
      }
      .drcat-spinner {
        width: 46px;
        height: 46px;
        border: 4px solid rgba(6, 182, 212, 0.1);
        border-left-color: #06b6d4;
        border-radius: 50%;
        animation: drcat-spin 1s linear infinite;
      }
      .drcat-loading-text {
        color: #f8fafc;
        font-size: 14.5px;
        font-family: inherit;
        font-weight: 500;
        text-align: center;
        max-width: 290px;
        line-height: 1.5;
        text-shadow: 0 2px 4px rgba(0,0,0,0.5);
      }
      @keyframes drcat-spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
      }
    `;
    document.head.appendChild(style);
  }

  const overlay = document.createElement('div');
  overlay.id = 'drcat-loading-overlay';
  overlay.innerHTML = `
    <div class="drcat-spinner"></div>
    <div class="drcat-loading-text" id="drcat-loading-text-el"></div>
  `;
  document.body.appendChild(overlay);
  
  // Trigger reflow to start transition
  overlay.getBoundingClientRect();
  overlay.classList.add('visible');

  const textEl = document.getElementById('drcat-loading-text-el');
  if (textEl) textEl.textContent = initialMessage;

  return {
    updateMessage(msg) {
      if (textEl) textEl.textContent = msg;
    },
    hide() {
      overlay.classList.remove('visible');
      setTimeout(() => overlay.remove(), 300);
    }
  };
}

/**
 * Executes a suggestion submission showing a spinner overlay with retry counts, guaranteeing a 2s display time.
 */
export async function runSuggestionWithUI(submitFn, suggestionData, successAlertText) {
  const loader = showLoadingOverlay("Envoi de la proposition... (Tentative 1/3)");
  const startTime = Date.now();
  
  try {
    const result = await submitFn(suggestionData, (attempt) => {
      loader.updateMessage(`Envoi de la proposition... (Tentative ${attempt}/3)`);
    });
    
    const elapsed = Date.now() - startTime;
    if (elapsed < 2000) {
      await new Promise(r => setTimeout(r, 2000 - elapsed));
    }
    
    loader.hide();
    
    if (result.success) {
      alert(successAlertText);
      return true;
    } else {
      alert("Erreur : " + result.error);
      return false;
    }
  } catch (err) {
    loader.hide();
    alert("Une erreur inattendue est survenue lors de l'envoi.");
    return false;
  }
}

/**
 * Set a button into loading state (spinner + disabled) and returns a restore function.
 * @param {HTMLElement} btn - The button element
 * @param {string} [originalHTML] - Optional original innerHTML to restore later
 * @returns {function} restore function to call when loading ends
 */
export function setButtonLoading(btn, originalHTML) {
  if (!btn) return () => {};
  const saved = originalHTML || btn.innerHTML;
  btn.disabled = true;
  btn.classList.add('loading');
  btn.innerHTML = `<span class="btn-spinner"></span> ${saved.replace(/<i class="fa-solid[^"]*"[^>]*><\/i>\s*/, '')}`;
  return () => {
    btn.disabled = false;
    btn.classList.remove('loading');
    btn.innerHTML = saved;
  };
}

/**
 * Triggers a haptic vibration feedback.
 * @param {boolean} success - true for a short success pulse, false for a long error pulse.
 */
export function triggerHaptic(success) {
  try {
    if (window.Capacitor && window.Capacitor.Plugins && window.Capacitor.Plugins.Haptics) {
      const Haptics = window.Capacitor.Plugins.Haptics;
      if (success) {
        if (typeof Haptics.impact === 'function') {
          Haptics.impact({ style: 'light' });
        } else if (typeof Haptics.vibrate === 'function') {
          Haptics.vibrate({ duration: 80 });
        }
      } else {
        if (typeof Haptics.vibrate === 'function') {
          Haptics.vibrate({ duration: 400 });
        } else if (typeof Haptics.impact === 'function') {
          Haptics.impact({ style: 'heavy' });
        }
      }
      return;
    }
  } catch (e) {
    console.warn("Capacitor Haptics failed:", e);
  }

  // Fallback to Web Vibrate API
  try {
    if (typeof navigator.vibrate === 'function') {
      if (success) {
        navigator.vibrate(80);
      } else {
        navigator.vibrate([300, 100, 300]);
      }
    }
  } catch (e) {
    console.warn("Web Vibrate API failed:", e);
  }
}

/**
 * Attach tactile tap feedback (ripple highlight + light native haptic) to an
 * element. Spawns a `.tap-ripple` at the pointer position on pointerdown and
 * fires a light haptic on native platforms. No-op under reduced-motion.
 * @param {HTMLElement} el - target element (should be position:relative).
 * @param {{ haptic?: boolean }} [opts]
 */
export function attachTapFeedback(el, opts = {}) {
  if (!el) return;
  if (!el.style.position || el.style.position === 'static') el.style.position = 'relative';
  if (getComputedStyle(el).overflow === 'visible') el.style.overflow = 'hidden';

  el.addEventListener('pointerdown', (e) => {
    if (prefersReducedMotion()) return;
    if (opts.haptic && window.Capacitor && window.Capacitor.Plugins && window.Capacitor.Plugins.Haptics) {
      const H = window.Capacitor.Plugins.Haptics;
      try { if (typeof H.impact === 'function') H.impact({ style: 'light' }); } catch (_) {}
    }
    const rect = el.getBoundingClientRect();
    const size = Math.max(rect.width, rect.height);
    const ripple = document.createElement('span');
    ripple.className = 'tap-ripple';
    ripple.style.width = ripple.style.height = `${size}px`;
    ripple.style.left = `${e.clientX - rect.left}px`;
    ripple.style.top = `${e.clientY - rect.top}px`;
    el.appendChild(ripple);
    ripple.addEventListener('animationend', () => ripple.remove());
    setTimeout(() => ripple.remove(), 500);
  });
}

/**
 * Wire tap feedback to the common interactive controls app-wide.
 * Call once after the DOM is ready.
 */
export function initTapFeedback() {
  const selectors = [
    '.tab-btn', '.status-pill', '.suggestion-btn', '.theme-toggle-btn',
    '.admin-tab-btn', '.action-btn', '.cancel-btn', '.cat-item', '.close-modal-btn'
  ];
  document.querySelectorAll(selectors.join(','))
    .forEach(el => attachTapFeedback(el, { haptic: true }));
}

/**
 * Returns a debounced wrapper that delays `fn` until `wait` ms have elapsed
 * since the last call. Used to keep typing in search/filter inputs smooth.
 * @param {Function} fn
 * @param {number} wait ms
 * @returns {Function}
 */
export function debounce(fn, wait = 150) {
  let t;
  return function (...args) {
    clearTimeout(t);
    t = setTimeout(() => fn.apply(this, args), wait);
  };
}

/**
 * True when the user has requested reduced motion at the OS level
 * (Android: Settings > Accessibility > Remove animations; macOS: Reduce motion).
 * Use it to skip JS-driven animations (smooth scroll, entrance tweens, etc.)
 * that the CSS `prefers-reduced-motion` media rule cannot control (e.g. inline
 * styles or programmatic `scrollIntoView({behavior:'smooth'})`).
 * @returns {boolean}
 */
export function prefersReducedMotion() {
  try {
    return window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  } catch (e) {
    return false;
  }
}

/**
 * Animate a numeric count-up on a DOM element (Phase 3.4).
 * Renders one decimal place to match the quiz score format (e.g. "8.5").
 * Respects reduced-motion (jumps straight to the final value).
 * @param {HTMLElement} el - target element.
 * @param {number} to - final value.
 * @param {number} [duration=700] ms.
 * @param {(v:number)=>string} [format] - custom formatter (defaults to `v.toFixed(1)`).
 */
export function countUp(el, to, duration = 700, format = (v) => v.toFixed(1)) {
  if (!el) return;
  if (prefersReducedMotion()) { el.textContent = format(to); return; }
  const start = performance.now();
  const from = 0;
  const step = (now) => {
    const t = Math.min(1, (now - start) / duration);
    const eased = 1 - Math.pow(1 - t, 3); // easeOutCubic
    el.textContent = format(from + (to - from) * eased);
    if (t < 1) requestAnimationFrame(step);
    else el.textContent = format(to);
  };
  requestAnimationFrame(step);
}


