// Global utility methods for Dr. CAT

/**
 * Show a non-intrusive toast notification in the top-right corner.
 * @param {string} message - The text to display.
 * @param {string} [icon='fa-circle-info'] - FontAwesome icon class (without fa-solid prefix).
 * @param {number} [duration=5000] - Auto-dismiss delay in ms.
 */
export function showToast(message, icon = 'fa-circle-info', duration = 5000) {
  // Remove existing toast of same type if still visible
  const existing = document.getElementById('drcat-toast');
  if (existing) existing.remove();

  const toast = document.createElement('div');
  toast.id = 'drcat-toast';
  toast.className = 'drcat-toast';
  toast.innerHTML = `
    <i class="fa-solid ${icon} drcat-toast-icon"></i>
    <span class="drcat-toast-msg">${message}</span>
    <button class="drcat-toast-close" aria-label="Fermer"><i class="fa-solid fa-xmark"></i></button>
  `;

  document.body.appendChild(toast);

  // Animate in
  requestAnimationFrame(() => toast.classList.add('drcat-toast--visible'));

  // Close button
  toast.querySelector('.drcat-toast-close').addEventListener('click', () => {
    toast.classList.remove('drcat-toast--visible');
    setTimeout(() => toast.remove(), 350);
  });

  // Auto-dismiss
  const timer = setTimeout(() => {
    toast.classList.remove('drcat-toast--visible');
    setTimeout(() => toast.remove(), 350);
  }, duration);

  // Pause on hover
  toast.addEventListener('mouseenter', () => clearTimeout(timer));
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
