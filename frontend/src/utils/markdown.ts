function escapeHTML(str: string): string {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

export function parseSummaryMarkdown(text: string): string {
  if (!text) {
    return '<p class="text-muted">Aucune synthèse disponible.</p>';
  }

  let html = escapeHTML(text);

  html = html.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');

  if (html.includes('|')) {
    const lines = html.split('\n');
    let inTable = false;
    let tableHtml = '<table>';
    let isFirstRow = true;

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i]?.trim() ?? '';
      if (line.startsWith('|') && line.endsWith('|')) {
        if (!inTable) {
          inTable = true;
          isFirstRow = true;
        }
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
          tableHtml = '<table>';
        }
      }
    }
    if (inTable) {
      tableHtml += '</table>';
      lines.push(tableHtml);
    }
    html = lines.join('\n');
  }

  html = html.split('\n').filter(line => {
    const trimmed = line.trim();
    return !(trimmed.startsWith('|') && trimmed.endsWith('|'));
  }).join('\n');

  html = html.split('\n').map(line => {
    const trimmed = line.trim();
    if (trimmed.startsWith('- ')) {
      return `<li>${trimmed.substring(2)}</li>`;
    }
    return line;
  }).join('\n');

  html = html.replace(/(<li>.*?<\/li>\s*)+/gs, (match) => `<ul>${match}</ul>`);

  html = html.replace(/\n\n/g, '</p><p>').replace(/\n/g, '<br>');
  html = `<p>${html}</p>`;

  html = html.replace(/<p>\s*<\/p>/g, '').replace(/<p>\s*<ul>/g, '<ul>').replace(/<\/ul>\s*<\/p>/g, '</ul>');

  return html;
}

export function buildPrintableText(cat: {
  id: number
  title: string
  category: string
  red_flags?: string
  customSummary?: string
  summary?: string
  customOrdonnance?: string
  ordonnance?: string
  notes?: string
}): string {
  const lines = [
    `Dr.CAT — ${cat.id}. ${cat.title}`,
    `Catégorie : ${cat.category}`,
    '-------------------------------------------'
  ];
  if (cat.red_flags && cat.red_flags.trim()) {
    lines.push(`\nRED FLAGS:\n${cat.red_flags}`);
  }
  const summary = cat.customSummary || cat.summary;
  if (summary && summary.trim()) {
    lines.push(`\nCONDUCTE À TENIR:\n${summary}`);
  }
  const prescription = cat.customOrdonnance || cat.ordonnance;
  if (prescription && prescription.trim()) {
    lines.push(`\nORDONNANCE TYPE:\n${prescription}`);
  }
  if (cat.notes && cat.notes.trim()) {
    lines.push(`\nNOTES:\n${cat.notes}`);
  }
  lines.push(`\nLe : ${new Date().toLocaleDateString('fr-FR')}`);
  return lines.join('\n');
}

export function getCleanPdfName(filename: string): string {
  return filename
    .replace(/^\d+_/, '')
    .replace(/_/g, ' ')
    .replace(/\.pdf$/i, '')
    .replace(/\.docx$/i, '')
    .trim();
}

export function parsePrescriptionText(text: string): string {
  if (!text) return ''
  return text
    .replace(/\r\n/g, '\n')
    .replace(/\r/g, '\n')
    .split('\n')
    .map(line => line.trim())
    .filter(line => line.length > 0)
    .join('\n')
}

export function formatBytes(bytes: number, decimals = 2): string {
  if (bytes === 0) return '0 Bytes'
  const k = 1024
  const dm = decimals < 0 ? 0 : decimals
  const sizes = ['Bytes', 'KB', 'MB', 'GB']
  const i = Math.floor(Math.log(bytes) / Math.log(k))
  return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i]
}

export function formatDuration(ms: number): string {
  const seconds = Math.floor(ms / 1000)
  const minutes = Math.floor(seconds / 60)
  const hours = Math.floor(minutes / 60)
  if (hours > 0) return `${hours}h ${minutes % 60}m`
  if (minutes > 0) return `${minutes}m ${seconds % 60}s`
  return `${seconds}s`
}

export function formatPercent(val: number): string {
  return `${Math.round(val)}%`
}
