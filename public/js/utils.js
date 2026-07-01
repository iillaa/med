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

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i].trim();
      if (line.startsWith('|') && line.endsWith('|')) {
        if (!inTable) {
          inTable = true;
        }
        // Skip separator line | :--- | :--- |
        if (line.includes('---')) continue;

        const cells = line.split('|').slice(1, -1).map(c => c.trim());
        tableHtml += '<tr>';
        cells.forEach(cell => {
          const cellTag = tableHtml.includes('<tr><tr>') ? 'td' : 'th'; // First row is header
          tableHtml += `<${cellTag}>${cell}</${cellTag}>`;
        });
        tableHtml += '</tr>';
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
  } else {
    if (!originalConsoleWarn) return; // Not capturing
    
    console.warn = originalConsoleWarn;
    console.error = originalConsoleError;
    console.info = originalConsoleInfo;
    
    originalConsoleWarn = null;
    originalConsoleError = null;
    originalConsoleInfo = null;
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
