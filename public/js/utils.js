// Global utility methods for Dr. CAT

/**
 * Show a non-intrusive toast notification in the top-right corner.
 * @param {string} message - The text to display.
 * @param {string} [icon='fa-circle-info'] - FontAwesome icon class (without fa-solid prefix).
 * @param {number} [duration=5000] - Auto-dismiss delay in ms.
 * @param {HTMLElement|null} [actionEl=null] - Optional DOM element appended safely after the message (e.g. a button).
 */
export function showToast(message, icon = 'fa-circle-info', duration = 5000, actionEl = null) {

  // Remove any existing toast
  const existing = document.getElementById('drcat-toast');
  if (existing) existing.remove();

  const toast = document.createElement('div');
  toast.id = 'drcat-toast';
  toast.setAttribute('role', 'status');
  toast.setAttribute('aria-live', 'polite');

  // Build the toast structure with DOM methods — the message is set via textContent
  // to prevent XSS from server error messages or any user-controlled string.
  const iconEl = document.createElement('i');
  iconEl.className = `fa-solid ${icon} t-icon`;

  const msgEl = document.createElement('span');
  msgEl.className = 't-msg';
  msgEl.textContent = message; // Safe: never interprets HTML

  // Optional safe action element (e.g. a styled link/button built with DOM methods)
  if (actionEl instanceof HTMLElement) {
    msgEl.appendChild(document.createTextNode(' '));
    msgEl.appendChild(actionEl);
  }

  const closeBtn = document.createElement('button');
  closeBtn.className = 't-close';
  closeBtn.setAttribute('aria-label', 'Fermer');
  closeBtn.innerHTML = '<i class="fa-solid fa-xmark"></i>'; // Static markup only, no user data

  toast.appendChild(iconEl);
  toast.appendChild(msgEl);
  toast.appendChild(closeBtn);

  document.body.appendChild(toast);

  // Trigger transition after browser has painted the initial state
  setTimeout(() => toast.classList.add('toast-visible'), 30);

  const dismiss = () => {
    toast.classList.remove('toast-visible');
    setTimeout(() => toast.remove(), 350);
  };

  closeBtn.addEventListener('click', dismiss);

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
 * Format timestamp using native Intl.DateTimeFormat (fr-FR)
 */
export function formatDateFR(dateOrTimestamp, options = {}) {
  if (!dateOrTimestamp) return '';
  const date = new Date(dateOrTimestamp);
  if (isNaN(date.getTime())) return '';
  const defaultOptions = { day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit' };
  return new Intl.DateTimeFormat('fr-FR', { ...defaultOptions, ...options }).format(date);
}

/**
 * Format relative time using native Intl.RelativeTimeFormat (fr)
 */
export function formatRelativeTimeFR(dateOrTimestamp) {
  if (!dateOrTimestamp) return '';
  const date = new Date(dateOrTimestamp);
  if (isNaN(date.getTime())) return '';
  const now = new Date();
  const diffSeconds = Math.round((date.getTime() - now.getTime()) / 1000);
  const rtf = new Intl.RelativeTimeFormat('fr', { numeric: 'auto' });

  if (Math.abs(diffSeconds) < 60) return rtf.format(diffSeconds, 'second');
  const diffMinutes = Math.round(diffSeconds / 60);
  if (Math.abs(diffMinutes) < 60) return rtf.format(diffMinutes, 'minute');
  const diffHours = Math.round(diffMinutes / 60);
  if (Math.abs(diffHours) < 24) return rtf.format(diffHours, 'hour');
  const diffDays = Math.round(diffHours / 24);
  if (Math.abs(diffDays) < 30) return rtf.format(diffDays, 'day');
  const diffMonths = Math.round(diffDays / 30);
  if (Math.abs(diffMonths) < 12) return rtf.format(diffMonths, 'month');
  const diffYears = Math.round(diffDays / 365);
  return rtf.format(diffYears, 'year');
}

/**
 * Escape HTML characters to prevent XSS injection
 */
export function escapeHTML(str) {
  if (str === null || str === undefined) return '';
  return String(str)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

/**
 * Convert line breaks and tables in markdown summaries to HTML elements
 */
/**
 * Formats a block of markdown text into clean HTML (tables, lists, bold, linebreaks)
 */
export function parseMarkdownBlock(text) {
  if (!text) return '';
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
    if (trimmed.startsWith('- ') || trimmed.startsWith('• ')) {
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
 * Returns dynamic theme accent and icon for clinical step headers
 */
function getStepTheme(headerText) {
  const h = (headerText || '').toLowerCase();

  // 0. Stabilisation / ABCDE / Urgence
  if (/^0\./.test(h) || h.includes('stabilisation') || h.includes('abcde') || h.includes('urgence')) {
    return { themeClass: 'step-theme-emergency', icon: 'fa-truck-medical' };
  }

  // 1. Diagnostic / Triage / Bilan / Cadre Légal
  if (/^1\./.test(h) || h.includes('diagnostic') || h.includes('triage') || h.includes('bilan') || h.includes('cadre')) {
    return { themeClass: 'step-theme-diagnostic', icon: 'fa-stethoscope' };
  }

  // 2. Traitement / Posologie / Conduite / Structure
  if (/^2\./.test(h) || h.includes('traitement') || h.includes('posologie') || h.includes('conduite') || h.includes('structure')) {
    return { themeClass: 'step-theme-treatment', icon: 'fa-pills' };
  }

  // 3. / 3bis. Terrain Particulier / Grossesse / Comorbidités / Formules
  if (/^3/.test(h) || h.includes('terrain') || h.includes('grossesse') || h.includes('comorbidit') || h.includes('formule')) {
    return { themeClass: 'step-theme-terrain', icon: 'fa-person-pregnant' };
  }

  // 4. / 5. Critères d'Hospitalisation / Transfert / MDO
  if (/^[456]\./.test(h) || h.includes('crit') || h.includes('hospitalis') || h.includes('transfert') || h.includes('mdo')) {
    return { themeClass: 'step-theme-hospital', icon: 'fa-hospital-user' };
  }

  return { themeClass: 'step-theme-default', icon: 'fa-circle-info' };
}

/**
 * Parses markdown into clean, seamless clinical text with colored clickable retractable step titles.
 * All sections are FULL TEXT (open) by default; clicking any title retracts/collapses its text underneath.
 */
export function parseSummaryMarkdown(text) {
  if (!text) {
    return '<p class="text-muted">Aucune synthèse disponible.</p>';
  }

  const raw = text.trim();

  // Pattern matching: **0. Step Name :** or ### 0. Step Name or 0. Step Name :
  const stepRegex = /(?:^|\n)(?:\*\*|#{2,4}\s*)([0-9]+(?:bis|ter)?\.\s*[^:\n*]+)(?:\*\*)?:?/gi;
  const matches = [...raw.matchAll(stepRegex)];

  // If 2 or more clinical steps are found, render clean retractable title sections
  if (matches.length >= 2) {
    const sections = [];
    let lastIndex = 0;

    for (let i = 0; i < matches.length; i++) {
      const match = matches[i];
      const headerTitle = match[1].trim();
      const matchStart = match.index;

      if (i === 0 && matchStart > 0) {
        const intro = raw.substring(0, matchStart).trim();
        if (intro) sections.push({ header: null, content: intro });
      }

      if (i > 0) {
        sections[sections.length - 1].content = raw.substring(lastIndex, matchStart).trim();
      }

      sections.push({ header: headerTitle, content: '' });
      lastIndex = matchStart + match[0].length;
    }

    if (sections.length > 0) {
      sections[sections.length - 1].content = raw.substring(lastIndex).trim();
    }

    let html = '<div class="cat-steps-flow">';
    sections.forEach(sec => {
      if (!sec.header) {
        html += `<div class="cat-step-intro">${parseMarkdownBlock(sec.content)}</div>`;
        return;
      }

      const { themeClass, icon } = getStepTheme(sec.header);
      const parsedBody = parseMarkdownBlock(sec.content);

      html += `
        <details class="cat-step-section ${themeClass}" open>
          <summary class="cat-step-title-toggle" title="Cliquer pour masquer / afficher cette section">
            <span class="cat-step-icon"><i class="fa-solid ${icon}"></i></span>
            <span class="cat-step-heading">${escapeHTML(sec.header)}</span>
            <span class="cat-step-toggle-caret"><i class="fa-solid fa-chevron-down"></i></span>
          </summary>
          <div class="cat-step-body">
            ${parsedBody}
          </div>
        </details>
      `;
    });
    html += '</div>';

    return html;
  }

  // Fallback for non-step fiches
  return parseMarkdownBlock(raw);
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
    } catch (_) {
      // no-op: clipboard API failure falls through to textarea fallback below
    }
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
    <div class="modal-card modal-card-sm">
      <div class="modal-header">
        <h3><i class="fa-solid fa-circle-check" style="color: var(--color-success)"></i> ${dataTitle} Prêt</h3>
        <button class="close-modal-btn" id="univ-modal-close" aria-label="Fermer"><i class="fa-solid fa-xmark"></i></button>
      </div>
      <div class="modal-body">
        <p style="font-size: 13px; color: var(--text-secondary); margin-bottom: 16px; line-height: 1.4;">
          Fichier : <strong style="color: var(--text-primary); word-break: break-all;">${fileName}</strong>
          <br><span style="font-size: 11.5px;">${jsonStr.length} caractères · Format JSON</span>
        </p>

        <div style="display: flex; flex-direction: column; gap: 10px;">
          ${canShare || isCapacitor ? `
          <button id="univ-btn-share" class="btn-block btn-gradient-primary">
            <i class="fa-solid fa-share-nodes"></i> Partager (Telegram, WhatsApp, Email...)
          </button>
          ` : ''}

          <button id="univ-btn-download" class="btn-block btn-outline-success">
            <i class="fa-solid fa-download"></i> Télécharger en JSON
          </button>

          <button id="univ-btn-copy" class="btn-block btn-outline-indigo">
            <i class="fa-solid fa-copy"></i> Copier dans le presse-papiers
          </button>

          <details style="margin-top: 8px;">
            <summary style="font-size: 12px; color: var(--text-secondary); cursor: pointer; padding: 6px 0;">
              Aperçu (premiers 500 caractères)
            </summary>
            <pre style="font-size: 11px; color: var(--text-secondary); background: var(--bg-input); padding: 8px; border-radius: var(--radius-md); overflow: auto; max-height: 160px; white-space: pre-wrap; word-break: break-all; margin-top: 6px; border: 1px solid var(--border-color);">${jsonStr.slice(0, 500)}...</pre>
          </details>
        </div>
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
          try { await Filesystem.requestPermissions(); } catch (_) {
            // no-op: permission request is best-effort; proceed regardless
          }
            
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
          try { await Filesystem.requestPermissions(); } catch (_) {
            // no-op: permission request is best-effort; proceed regardless
          }
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
      try { if (typeof H.impact === 'function') H.impact({ style: 'light' }); } catch (_) {
        // no-op: haptics are non-critical; tap feedback degrades gracefully
      }
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


