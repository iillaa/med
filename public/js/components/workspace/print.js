import { state } from '../../state.js';
import { escapeHTML } from '../../utils.js';
import { safeGetItem, safeSetItem, safeRemoveItem, safeParseJSON } from '../../lib/safeStorage.js';

export function saveAppStateBeforeNavigation() {
  const libScreen = document.getElementById('library-screen');
  const quizScreen = document.getElementById('quiz-screen');
  const workspace = document.getElementById('workspace');

  let currentView = 'dashboard';
  if (libScreen && libScreen.style.display !== 'none') {
    currentView = 'library';
  } else if (quizScreen && quizScreen.style.display !== 'none') {
    currentView = 'quiz';
  } else if (workspace && workspace.style.display !== 'none' && state.activeCat) {
    currentView = 'workspace';
  }

  // Active Tab in Workspace
  const activeTabBtn = document.querySelector('.tab-btn.active');
  const activeTab = activeTabBtn ? activeTabBtn.getAttribute('data-tab') : null;

  // Workspace related PDFs search
  const searchInput = document.getElementById('pdf-content-search-input');
  const searchResultsContainer = document.getElementById('pdf-search-results-container');

  // Standalone Library state
  const libSearchInput = document.getElementById('lib-deep-search-input');
  const libFilterInput = document.getElementById('lib-filter-input');
  const libSearchResultsContainer = document.getElementById('lib-search-results-container');
  const libSearchResultsCard = document.getElementById('lib-search-results-card');

  // Omni-search state
  const omniSearchInput = document.getElementById('omni-search-input');
  const omniResults = document.getElementById('omni-search-results');

  const stateToSave = {
    currentView,
    scrollY: window.scrollY || document.documentElement.scrollTop || 0,
    activeCatId: state.activeCat ? state.activeCat.id : null,
    activeSubCatIndex: typeof state.activeSubCatIndex === 'number' ? state.activeSubCatIndex : 0,
    activeTab: activeTab,
    activePrescriptionVariantIndex: state.activePrescriptionVariantIndex || 0,
    pdfSearchQuery: searchInput ? searchInput.value : '',
    pdfSearchResultsHTML: searchResultsContainer ? searchResultsContainer.innerHTML : '',
    libSearchQuery: libSearchInput ? libSearchInput.value : '',
    libFilterQuery: libFilterInput ? libFilterInput.value : '',
    libSearchResultsHTML: libSearchResultsContainer ? libSearchResultsContainer.innerHTML : '',
    libResultsVisible: libSearchResultsCard ? libSearchResultsCard.style.display !== 'none' : false,
    omniQuery: omniSearchInput ? omniSearchInput.value : '',
    omniVisible: omniResults ? omniResults.style.display !== 'none' : false
  };

  safeSetItem('dr_cat_navigation_state', JSON.stringify(stateToSave));
}

export function restoreAppState() {
  const saved = safeGetItem('dr_cat_navigation_state');
  if (!saved) return;

  try {
    const data = safeParseJSON(saved, {});
    safeRemoveItem('dr_cat_navigation_state');

    // ── 1. Restore Standalone Library View ──
    if (data.currentView === 'library') {
      if (typeof window.openStandaloneLibrary === 'function') {
        window.openStandaloneLibrary(data.libSearchQuery || '');
      }

      if (data.libFilterQuery) {
        const filterInput = document.getElementById('lib-filter-input');
        if (filterInput) {
          filterInput.value = data.libFilterQuery;
          filterInput.dispatchEvent(new Event('input', { bubbles: true }));
        }
      }

      if (data.libSearchResultsHTML && data.libSearchResultsHTML.trim().length > 0) {
        const libContainer = document.getElementById('lib-search-results-container');
        const libCard = document.getElementById('lib-search-results-card');
        if (libContainer) {
          libContainer.innerHTML = data.libSearchResultsHTML;
          if (libCard && data.libResultsVisible) {
            libCard.style.display = 'block';
          }
          // Re-bind click handlers on restored PDF search cards in library
          libContainer.querySelectorAll('.pdf-search-result-card, [data-pdf]').forEach(card => {
            card.addEventListener('click', () => {
              saveAppStateBeforeNavigation();
              const pdf = decodeURIComponent(card.getAttribute('data-pdf') || '');
              const page = card.getAttribute('data-page') || '1';
              if (pdf) {
                window.location.href = `pdf_viewer.html?file=${encodeURIComponent(pdf)}&page=${page}`;
              }
            });
          });
        }
      }

      if (typeof data.scrollY === 'number' && data.scrollY > 0) {
        setTimeout(() => window.scrollTo({ top: data.scrollY, behavior: 'instant' }), 60);
      }
      return;
    }

    // ── 2. Restore Workspace CAT Fiche View ──
    if (data.activeCatId) {
      const catCard = document.querySelector(`.cat-item[data-id="${data.activeCatId}"]`);
      if (catCard) {
        catCard.click();
      }

      // Restore Sub-profile pill if active
      if (typeof data.activeSubCatIndex === 'number' && data.activeSubCatIndex > 0) {
        setTimeout(() => {
          const pill = document.querySelector(`.subcat-pill[data-sub-index="${data.activeSubCatIndex}"]`);
          if (pill) pill.click();
        }, 40);
      }

      // Restore Active Tab
      if (data.activeTab && data.activeTab !== 'tab-summary') {
        setTimeout(() => {
          const tabBtn = document.querySelector(`.tab-btn[data-tab="${data.activeTab}"]`);
          if (tabBtn) {
            tabBtn.click();
          }
        }, 60);
      }

      // Restore PDF Search in CAT Workspace
      if (data.pdfSearchQuery) {
        const searchInput = document.getElementById('pdf-content-search-input');
        if (searchInput) {
          searchInput.value = data.pdfSearchQuery;
        }
      }
      if (data.pdfSearchResultsHTML) {
        const resultsContainer = document.getElementById('pdf-search-results-container');
        if (resultsContainer) {
          resultsContainer.innerHTML = data.pdfSearchResultsHTML;

          resultsContainer.querySelectorAll('.pdf-search-result-card').forEach(card => {
            card.addEventListener('click', () => {
              saveAppStateBeforeNavigation();
              const pdfFile = decodeURIComponent(card.getAttribute('data-pdf'));
              const page = card.getAttribute('data-page');
              window.location.href = `pdf_viewer.html?file=${encodeURIComponent(pdfFile)}&page=${page}`;
            });
          });
        }
      }

      if (typeof data.scrollY === 'number' && data.scrollY > 0) {
        setTimeout(() => window.scrollTo({ top: data.scrollY, behavior: 'instant' }), 90);
      }
      return;
    }

    // ── 3. Restore Quiz View ──
    if (data.currentView === 'quiz') {
      const quizNavBtn = document.getElementById('start-quiz-nav-btn');
      if (quizNavBtn) quizNavBtn.click();
    }
  } catch (err) {
    console.error("Failed to restore app navigation state:", err);
  }
}

/**
 * Format markdown text into high-density, compact clinical print typography.
 * Zero interactive web widgets, zero oversized buttons, zero accordion gaps.
 */
function formatMarkdownForPrint(text) {
  if (!text) return '';
  let html = escapeHTML(text);

  // Parse markdown tables if any
  if (html.includes('|')) {
    const lines = html.split('\n');
    let inTable = false;
    let tableHtml = '<table class="print-table">';
    let isFirstRow = true;

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i].trim();
      if (line.startsWith('|') && line.endsWith('|')) {
        if (!inTable) { inTable = true; isFirstRow = true; }
        if (line.includes('---')) continue;
        const cells = line.split('|').slice(1, -1).map(c => c.trim());
        const cellTag = isFirstRow ? 'th' : 'td';
        tableHtml += '<tr>' + cells.map(c => `<${cellTag}>${c}</${cellTag}>`).join('') + '</tr>';
        isFirstRow = false;
      } else if (inTable) {
        inTable = false;
        tableHtml += '</table>';
        lines[i] = tableHtml + '\n' + lines[i];
        tableHtml = '<table class="print-table">';
      }
    }
    if (inTable) { tableHtml += '</table>'; lines.push(tableHtml); }
    html = lines.filter(l => !(l.trim().startsWith('|') && l.trim().endsWith('|'))).join('\n');
  }

  // Format bold
  html = html.replace(/\*\*([^*\n]+)\*\*/g, '<strong>$1</strong>');

  // Convert in-text Sub-CAT links into neat, non-button clinical reference tags
  html = html.replace(/\[(.*?)\]\(subcat:[0-9]+\)/g, '<span class="inline-sub-tag">↳ $1</span>');
  html = html.replace(/\[\[subcat:[0-9]+:(.*?)\]\]/g, '<span class="inline-sub-tag">↳ $1</span>');

  const lines = html.split('\n');
  let inList = false;
  const out = [];

  for (let i = 0; i < lines.length; i++) {
    let l = lines[i].trim();
    if (!l) {
      if (inList) { inList = false; out.push('</ul>'); }
      continue;
    }
    if (l.startsWith('<table') || l.startsWith('</table') || l.startsWith('<tr>')) {
      if (inList) { inList = false; out.push('</ul>'); }
      out.push(l);
      continue;
    }
    if (l.startsWith('- ') || l.startsWith('• ') || l.startsWith('* ')) {
      if (!inList) { inList = true; out.push('<ul>'); }
      out.push('<li>' + l.replace(/^[-•*]\s*/, '') + '</li>');
    } else {
      if (inList) { inList = false; out.push('</ul>'); }
      out.push('<p>' + l + '</p>');
    }
  }
  if (inList) out.push('</ul>');
  return out.join('');
}

/**
 * Parses clinical steps into compact, high-density styled blocks with color-accented headers.
 */
function parseStepsForPrint(rawText) {
  if (!rawText) return '';
  const stepRegex = /(?:^|\n)(?:\*\*|#{2,4}\s*)([0-9]+(?:bis|ter)?\.\s*[^\n]+)(?:\n|$)/gi;
  const matches = [...rawText.matchAll(stepRegex)];
  if (matches.length < 2) return formatMarkdownForPrint(rawText);

  const sections = [];
  let lastIndex = 0;

  for (let i = 0; i < matches.length; i++) {
    const match = matches[i];
    const headerTitle = match[1].trim().replace(/^\*\*|\*\*$/g, '').replace(/:\s*$/, '').replace(/\*\*$/, '').trim();
    const matchStart = match.index;

    if (i === 0 && matchStart > 0) {
      const intro = rawText.substring(0, matchStart).trim();
      if (intro) sections.push({ header: null, content: intro });
    }
    if (i > 0) {
      sections[sections.length - 1].content = rawText.substring(lastIndex, matchStart).trim();
    }
    sections.push({ header: headerTitle, content: '' });
    lastIndex = matchStart + match[0].length;
  }
  if (sections.length > 0) {
    sections[sections.length - 1].content = rawText.substring(lastIndex).trim();
  }

  return sections.map(s => {
    if (!s.header) return `<div class="step-intro">${formatMarkdownForPrint(s.content)}</div>`;
    const num = s.header.charAt(0);
    const themeNum = ['0', '1', '2', '3', '4'].includes(num) ? num : '1';
    return `
      <div class="step-block">
        <div class="step-title step-title-${themeNum}">${escapeHTML(s.header)}</div>
        <div class="step-body">${formatMarkdownForPrint(s.content)}</div>
      </div>
    `;
  }).join('');
}

/**
 * Creative, High-Density Doctor-Grade Document Printer (1-2 pages compact layout)
 * Generates an ultra-clean, elegant medical summary sheet completely isolated from the web SPA.
 */
export function printCatDocument(cat) {
  if (!cat) return;

  const dateStr = new Date().toLocaleDateString('fr-FR');
  const title = `${cat.id}. ${cat.title}`;
  const category = cat.category || 'Médecine Générale';
  const redFlags = cat.red_flags || '';
  const rawSummary = cat.customSummary || cat.summary || '';
  const parsedSummary = parseStepsForPrint(rawSummary);
  const rawOrdonnance = cat.customOrdonnance || cat.ordonnance || '';
  const subCats = Array.isArray(cat.sub_cats) ? cat.sub_cats : [];
  const notes = cat.notes || '';

  // Sub-CATs Mini-Cards
  let subCatsHtml = '';
  if (subCats.length > 0) {
    subCatsHtml = `
      <div class="subcats-section">
        <div class="subcats-header">🔀 PROFILS PARTICULIERS & SOUS-FICHES (${subCats.length})</div>
        <div class="subcat-grid">
          ${subCats.map((sub, idx) => `
            <div class="subcat-card">
              <div class="subcat-card-title"><span class="subcat-badge">${idx + 1}</span> ${escapeHTML(sub.label || 'Profil Spécialisé')}</div>
              ${sub.red_flags && sub.red_flags.trim() && sub.red_flags !== redFlags ? `
                <div class="subcat-rf"><strong>🚨 Alerte :</strong> ${escapeHTML(sub.red_flags)}</div>
              ` : ''}
              <div class="subcat-body">
                ${parseStepsForPrint(sub.summary || '')}
              </div>
              ${sub.ordonnance && sub.ordonnance.trim() ? `
                <div class="subcat-rx-box">
                  <span class="subcat-rx-tag">💊 Rx :</span>
                  <pre class="subcat-rx-text">${escapeHTML(sub.ordonnance)}</pre>
                </div>
              ` : ''}
            </div>
          `).join('')}
        </div>
      </div>
    `;
  }

  const html = `<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Dr.CAT — ${escapeHTML(title)}</title>
  <style>
    @page {
      size: A4 portrait;
      margin: 10mm 12mm 10mm 12mm;
    }
    * {
      box-sizing: border-box;
      -webkit-print-color-adjust: exact !important;
      print-color-adjust: exact !important;
    }
    body {
      margin: 0;
      padding: 0;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
      color: #0f172a;
      background: #ffffff;
      font-size: 10.5pt;
      line-height: 1.45;
    }
    /* Sleek Doctor-Grade Letterhead */
    .doc-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-end;
      border-bottom: 2.5px solid #0891b2;
      padding-bottom: 4px;
      margin-bottom: 8px;
    }
    .brand-title {
      font-size: 13.5pt;
      font-weight: 800;
      color: #0891b2;
      letter-spacing: -0.3px;
    }
    .brand-sub {
      font-size: 9pt;
      color: #64748b;
      font-weight: 500;
      margin-left: 4px;
    }
    .doc-meta {
      text-align: right;
      font-size: 9pt;
      color: #475569;
      line-height: 1.3;
    }
    .author-name {
      font-weight: 800;
      color: #0891b2;
    }
    /* Main Title Strip */
    .title-strip {
      display: flex;
      align-items: center;
      gap: 8px;
      margin-bottom: 8px;
    }
    .cat-badge {
      background: #0891b2;
      color: #ffffff;
      font-size: 8.5pt;
      font-weight: 800;
      text-transform: uppercase;
      padding: 2.5px 7px;
      border-radius: 4px;
      letter-spacing: 0.3px;
      white-space: nowrap;
    }
    .main-title {
      font-size: 14pt;
      font-weight: 800;
      color: #0f172a;
      margin: 0;
      line-height: 1.25;
    }
    /* Compact Red Flags Banner */
    .rf-banner {
      background: #fef2f2;
      border: 1px solid #fecaca;
      border-left: 4px solid #dc2626;
      padding: 5px 9px;
      margin-bottom: 8px;
      border-radius: 4px;
      font-size: 9.5pt;
      color: #991b1b;
      line-height: 1.35;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    .rf-label {
      font-weight: 800;
      color: #b91c1c;
      margin-right: 5px;
    }
    /* Clinical Steps Typography */
    .step-block {
      margin-bottom: 6px;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    .step-title {
      font-size: 10.5pt;
      font-weight: 800;
      padding: 2.5px 7px;
      border-radius: 4px;
      margin-bottom: 3px;
      display: inline-block;
      letter-spacing: 0.2px;
    }
    .step-title-0 { background: #fee2e2; color: #991b1b; border-left: 3px solid #ef4444; }
    .step-title-1 { background: #e0f2fe; color: #0369a1; border-left: 3px solid #0284c7; }
    .step-title-2 { background: #dcfce7; color: #15803d; border-left: 3px solid #16a34a; }
    .step-title-3 { background: #fef3c7; color: #b45309; border-left: 3px solid #d97706; }
    .step-title-4 { background: #f3e8ff; color: #6b21a8; border-left: 3px solid #9333ea; }
    
    .step-body {
      font-size: 10pt;
      line-height: 1.4;
      color: #1e293b;
      padding-left: 6px;
    }
    .step-body p {
      margin: 0 0 4px 0;
    }
    .step-body ul {
      margin: 2px 0 4px 16px;
      padding: 0;
    }
    .step-body li {
      margin-bottom: 2px;
    }
    .step-body strong {
      color: #0f172a;
    }
    /* Tables */
    .print-table {
      width: 100%;
      border-collapse: collapse;
      margin: 6px 0 8px 0;
      font-size: 9pt;
    }
    .print-table th, .print-table td {
      border: 1px solid #cbd5e1;
      padding: 4px 7px;
      text-align: left;
    }
    .print-table th {
      background: #f1f5f9;
      font-weight: 800;
    }
    /* In-Text Subcat References */
    .inline-sub-tag {
      background: #ecfeff;
      border: 1px solid #a5f3fc;
      color: #0891b2;
      font-weight: 700;
      font-size: 9pt;
      padding: 1px 5px;
      border-radius: 3px;
      display: inline-block;
    }
    /* Compact Rx Card */
    .rx-card {
      background: #f8fafc;
      border: 1px solid #cbd5e1;
      border-left: 4px solid #0891b2;
      padding: 7px 10px;
      border-radius: 4px;
      margin: 8px 0;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    .rx-header {
      font-size: 10pt;
      font-weight: 800;
      color: #0891b2;
      margin-bottom: 3px;
    }
    .rx-body {
      font-family: inherit;
      font-size: 9.5pt;
      line-height: 1.4;
      white-space: pre-wrap;
      margin: 0;
      color: #0f172a;
    }
    /* Sub-CATs Section */
    .subcats-section {
      border-top: 1.5px dashed #cbd5e1;
      padding-top: 6px;
      margin-top: 8px;
    }
    .subcats-header {
      font-size: 10.5pt;
      font-weight: 800;
      color: #0891b2;
      margin-bottom: 5px;
    }
    .subcat-grid {
      display: grid;
      grid-template-columns: 1fr;
      gap: 8px;
    }
    .subcat-card {
      background: #fafafa;
      border: 1px solid #e2e8f0;
      border-left: 3.5px solid #06b6d4;
      border-radius: 4px;
      padding: 6px 8px;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    .subcat-card-title {
      font-size: 10pt;
      font-weight: 800;
      color: #0891b2;
      margin-bottom: 3px;
    }
    .subcat-badge {
      background: #0891b2;
      color: #ffffff;
      font-size: 8pt;
      padding: 1px 5px;
      border-radius: 8px;
      margin-right: 3px;
    }
    .subcat-rf {
      background: #fff5f5;
      border-left: 2.5px solid #ef4444;
      padding: 3px 6px;
      font-size: 9pt;
      color: #991b1b;
      margin-bottom: 4px;
      border-radius: 2px;
    }
    .subcat-body {
      font-size: 9.5pt;
      line-height: 1.35;
    }
    .subcat-body p {
      margin: 0 0 3px 0;
    }
    .subcat-rx-box {
      background: #ffffff;
      border: 1px dashed #cbd5e1;
      padding: 4px 7px;
      margin-top: 4px;
      border-radius: 3px;
    }
    .subcat-rx-tag {
      font-weight: 800;
      color: #0891b2;
      font-size: 8.5pt;
      margin-right: 4px;
    }
    .subcat-rx-text {
      margin: 0;
      font-family: inherit;
      font-size: 8.5pt;
      line-height: 1.3;
      white-space: pre-wrap;
      display: inline;
    }
    /* Notes */
    .notes-box {
      border: 1px solid #e2e8f0;
      border-left: 3.5px solid #8b5cf6;
      border-radius: 4px;
      padding: 5px 8px;
      background: #faf5ff;
      font-style: italic;
      font-size: 9.5pt;
      margin-top: 6px;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    /* Footer */
    .doc-footer {
      border-top: 1px solid #cbd5e1;
      padding-top: 4px;
      margin-top: 10px;
      display: flex;
      justify-content: space-between;
      font-size: 8pt;
      color: #64748b;
      page-break-inside: avoid;
      break-inside: avoid;
    }
  </style>
</head>
<body>
  <div class="doc-header">
    <div>
      <span class="brand-title">Dr.CAT 🩺</span>
      <span class="brand-sub">— Aide à la Décision Clinique</span>
    </div>
    <div class="doc-meta">
      <div>Édité le ${dateStr}</div>
      <div class="author-name">Dr. Kibeche Ali</div>
    </div>
  </div>

  <div class="title-strip">
    <span class="cat-badge">${escapeHTML(category)}</span>
    <h1 class="main-title">${escapeHTML(title)}</h1>
  </div>

  ${redFlags && redFlags.trim() ? `
    <div class="rf-banner">
      <span class="rf-label">🚨 RED FLAGS :</span>${escapeHTML(redFlags)}
    </div>
  ` : ''}

  <div class="summary-section">
    ${parsedSummary}
  </div>

  ${rawOrdonnance && rawOrdonnance.trim() ? `
    <div class="rx-card">
      <div class="rx-header">💊 ORDONNANCE TYPE & POSOLOGIES RECOMMANDÉES :</div>
      <pre class="rx-body">${escapeHTML(rawOrdonnance)}</pre>
    </div>
  ` : ''}

  ${subCatsHtml}

  ${notes && notes.trim() ? `
    <div class="notes-box">
      <strong>📝 Notes :</strong> ${escapeHTML(notes)}
    </div>
  ` : ''}

  <div class="doc-footer">
    <div>"Primum non nocere." — Dr.CAT Rappel Clinique (Protocoles Thérapeutiques)</div>
    <div>Auteur : Dr. Kibeche Ali</div>
  </div>
</body>
</html>`;

  // Sandbox iframe generator (Zero browser screenshot artifacts)
  const iframe = document.createElement('iframe');
  iframe.style.position = 'fixed';
  iframe.style.right = '0';
  iframe.style.bottom = '0';
  iframe.style.width = '0';
  iframe.style.height = '0';
  iframe.style.border = 'none';
  iframe.style.opacity = '0';
  iframe.style.pointerEvents = 'none';
  document.body.appendChild(iframe);

  const doc = iframe.contentWindow.document;
  doc.open();
  doc.write(html);
  doc.close();

  setTimeout(() => {
    try {
      iframe.contentWindow.focus();
      iframe.contentWindow.print();
    } catch (e) {
      console.error("Iframe print failed:", e);
      window.print();
    } finally {
      setTimeout(() => {
        if (iframe && iframe.parentNode) {
          iframe.parentNode.removeChild(iframe);
        }
      }, 3000);
    }
  }, 250);
}
