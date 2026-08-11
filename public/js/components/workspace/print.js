import { state } from '../../state.js';
import { parseSummaryMarkdown, escapeHTML } from '../../utils.js';

export function saveAppStateBeforeNavigation() {
  const activeTabBtn = document.querySelector('.tab-btn.active');
  const activeTab = activeTabBtn ? activeTabBtn.getAttribute('data-tab') : null;

  const searchInput = document.getElementById('pdf-content-search-input');
  const searchResultsContainer = document.getElementById('pdf-search-results-container');

  const stateToSave = {
    activeCatId: state.activeCat ? state.activeCat.id : null,
    activeTab: activeTab,
    pdfSearchQuery: searchInput ? searchInput.value : '',
    pdfSearchResultsHTML: searchResultsContainer ? searchResultsContainer.innerHTML : ''
  };

  localStorage.setItem('dr_cat_navigation_state', JSON.stringify(stateToSave));
}

export function restoreAppState() {
  const saved = localStorage.getItem('dr_cat_navigation_state');
  if (!saved) return;

  try {
    const data = JSON.parse(saved);
    localStorage.removeItem('dr_cat_navigation_state');

    if (data.activeCatId) {
      const catCard = document.querySelector(`.cat-item[data-id="${data.activeCatId}"]`);
      if (catCard) {
        catCard.click();
      }
    }

    if (data.activeTab && data.activeTab !== 'tab-summary') {
      const tabBtn = document.querySelector(`.tab-btn[data-tab="${data.activeTab}"]`);
      if (tabBtn) {
        tabBtn.click();
      }
    }

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
  } catch (err) {
    console.error("Failed to restore app navigation state:", err);
  }
}

/**
 * Doctor-Grade Standalone Document Printer
 * Decoupled from the SPA DOM: Injects a 100% pure, self-contained, beautifully styled
 * medical document into a temporary sandbox iframe to generate a multi-page PDF without UI noise.
 */
export function printCatDocument(cat) {
  if (!cat) return;

  const dateStr = new Date().toLocaleDateString('fr-FR');
  const title = `${cat.id}. ${cat.title}`;
  const category = cat.category || 'Générale';
  const redFlags = cat.red_flags || '';
  const rawSummary = cat.customSummary || cat.summary || '';
  const parsedSummary = parseSummaryMarkdown(rawSummary);
  const rawOrdonnance = cat.customOrdonnance || cat.ordonnance || '';
  const subCats = Array.isArray(cat.sub_cats) ? cat.sub_cats : [];
  const notes = cat.notes || '';

  // Build Sub-CATs HTML
  let subCatsHtml = '';
  if (subCats.length > 0) {
    subCatsHtml = `
      <div class="print-subcats-block">
        <div class="section-title">🔀 Profils Spécifiques & Sous-Fiches Cliniques (${subCats.length})</div>
        ${subCats.map((sub, idx) => `
          <div class="subcat-box">
            <div class="subcat-title"><span class="subcat-num">${idx + 1}</span> ${escapeHTML(sub.label || 'Profil Spécialisé')}</div>
            ${sub.red_flags && sub.red_flags !== redFlags ? `
              <div class="subcat-rf">
                <strong>🚨 Signes de gravité spécifiques :</strong> ${escapeHTML(sub.red_flags)}
              </div>
            ` : ''}
            <div class="subcat-summary">
              ${parseSummaryMarkdown(sub.summary || '')}
            </div>
            ${sub.ordonnance && sub.ordonnance.trim() ? `
              <div class="subcat-rx">
                <div class="subcat-rx-label">💊 Ordonnance Type :</div>
                <pre>${escapeHTML(sub.ordonnance)}</pre>
              </div>
            ` : ''}
          </div>
        `).join('')}
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
      margin: 12mm 15mm 12mm 15mm;
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
      font-size: 12px;
      line-height: 1.5;
    }
    /* Top Clinical Header */
    .doc-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-bottom: 2px solid #0891b2;
      padding-bottom: 8px;
      margin-bottom: 12px;
    }
    .brand-title {
      font-size: 18px;
      font-weight: 800;
      color: #0891b2;
      letter-spacing: -0.3px;
      margin: 0;
    }
    .brand-sub {
      font-size: 10px;
      color: #64748b;
      margin-top: 1px;
    }
    .doc-meta {
      text-align: right;
      font-size: 10.5px;
      color: #64748b;
    }
    .doc-meta .author {
      font-weight: 700;
      color: #0891b2;
      margin-top: 2px;
    }
    /* Main Title Banner */
    .title-banner {
      margin-bottom: 12px;
    }
    .category-pill {
      display: inline-block;
      font-size: 9.5px;
      font-weight: 800;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      color: #0891b2;
      background: #ecfeff;
      border: 1px solid #a5f3fc;
      padding: 2px 7px;
      border-radius: 12px;
      margin-bottom: 4px;
    }
    .main-title {
      font-size: 19px;
      font-weight: 800;
      color: #0f172a;
      margin: 0;
      line-height: 1.25;
    }
    /* Red Flags Box */
    .redflags-box {
      background: #fff5f5;
      border: 1px solid #fecaca;
      border-left: 4px solid #ef4444;
      border-radius: 5px;
      padding: 9px 12px;
      margin-bottom: 14px;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    .redflags-title {
      font-weight: 800;
      font-size: 12px;
      color: #991b1b;
      margin-bottom: 3px;
    }
    .redflags-content {
      font-size: 11.5px;
      font-weight: 600;
      color: #7f1d1d;
      line-height: 1.4;
    }
    /* Section Title */
    .section-title {
      font-size: 13px;
      font-weight: 800;
      color: #0f172a;
      border-bottom: 1px solid #cbd5e1;
      padding-bottom: 3px;
      margin: 16px 0 8px 0;
      display: flex;
      align-items: center;
      gap: 5px;
    }
    /* Summary Content */
    .summary-content {
      margin-bottom: 14px;
    }
    .summary-content p {
      margin: 0 0 6px 0;
    }
    .summary-content ul {
      margin: 4px 0 6px 16px;
      padding: 0;
    }
    .summary-content li {
      margin-bottom: 2px;
    }
    .summary-content strong {
      color: #0f172a;
    }
    .summary-content table {
      width: 100%;
      border-collapse: collapse;
      margin: 6px 0 10px 0;
      font-size: 11px;
    }
    .summary-content th, .summary-content td {
      border: 1px solid #cbd5e1;
      padding: 5px 7px;
      text-align: left;
    }
    .summary-content th {
      background: #f1f5f9;
      font-weight: 700;
    }
    /* Step Section Boxes */
    .cat-step-section {
      border: 1px solid #cbd5e1;
      border-radius: 5px;
      margin-bottom: 8px;
      background: #ffffff;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    .cat-step-title-toggle {
      background: #f8fafc;
      padding: 5px 8px;
      font-weight: 800;
      font-size: 11.5px;
      border-bottom: 1px solid #cbd5e1;
      display: flex;
      align-items: center;
      gap: 5px;
      list-style: none;
    }
    .cat-step-title-toggle::-webkit-details-marker {
      display: none;
    }
    .cat-step-body {
      padding: 7px 9px;
      font-size: 11.5px;
    }
    /* In-Text Subcat Badges */
    .subcat-inline-badge {
      background: #ecfeff;
      border: 1px solid #0891b2;
      color: #0e7490;
      font-weight: 700;
      font-size: 10.5px;
      padding: 1px 5px;
      border-radius: 3px;
      display: inline-block;
    }
    /* Prescription Box */
    .prescription-box {
      border: 1px solid #cbd5e1;
      border-left: 4px solid #0891b2;
      border-radius: 5px;
      padding: 10px 12px;
      background: #f8fafc;
      margin-bottom: 14px;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    .prescription-box pre {
      margin: 0;
      font-family: inherit;
      font-size: 11.5px;
      line-height: 1.45;
      white-space: pre-wrap;
      color: #0f172a;
    }
    /* Sub-CATs Section */
    .print-subcats-block {
      margin-top: 16px;
    }
    .subcat-box {
      border: 1px solid #cbd5e1;
      border-left: 3.5px solid #06b6d4;
      border-radius: 5px;
      padding: 10px 12px;
      margin-bottom: 12px;
      background: #fafafa;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    .subcat-title {
      font-size: 12.5px;
      font-weight: 800;
      color: #0891b2;
      margin: 0 0 5px 0;
    }
    .subcat-num {
      background: #0891b2;
      color: #ffffff;
      font-size: 9.5px;
      padding: 1px 5px;
      border-radius: 8px;
      margin-right: 3px;
    }
    .subcat-rf {
      background: #fff5f5;
      border-left: 2.5px solid #ef4444;
      padding: 5px 7px;
      font-size: 11px;
      color: #991b1b;
      margin-bottom: 6px;
      border-radius: 3px;
    }
    .subcat-summary {
      font-size: 11px;
      line-height: 1.45;
      margin-bottom: 6px;
    }
    .subcat-rx {
      background: #ffffff;
      border: 1px dashed #cbd5e1;
      border-radius: 4px;
      padding: 7px 9px;
      font-size: 11px;
    }
    .subcat-rx-label {
      font-weight: 700;
      color: #0891b2;
      margin-bottom: 3px;
    }
    .subcat-rx pre {
      margin: 0;
      font-family: inherit;
      white-space: pre-wrap;
    }
    /* Personal Notes */
    .notes-box {
      border: 1px solid #e2e8f0;
      border-left: 3.5px solid #8b5cf6;
      border-radius: 5px;
      padding: 8px 10px;
      background: #faf5ff;
      font-style: italic;
      margin-bottom: 14px;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    /* Footer */
    .doc-footer {
      border-top: 1px solid #cbd5e1;
      padding-top: 6px;
      margin-top: 20px;
      display: flex;
      justify-content: space-between;
      font-size: 9.5px;
      color: #64748b;
      page-break-inside: avoid;
      break-inside: avoid;
    }
    .doc-footer .author-credit {
      font-weight: 700;
      color: #0891b2;
    }
  </style>
</head>
<body>
  <div class="doc-header">
    <div>
      <div class="brand-title">Dr.CAT — Rappel Clinique</div>
      <div class="brand-sub">Aide à la Décision Médicale Clinique & Protocoles Thérapeutiques</div>
    </div>
    <div class="doc-meta">
      <div>Le ${dateStr}</div>
      <div class="author">Dr. Kibeche Ali</div>
    </div>
  </div>

  <div class="title-banner">
    <span class="category-pill">${escapeHTML(category)}</span>
    <h1 class="main-title">${escapeHTML(title)}</h1>
  </div>

  ${redFlags && redFlags.trim() ? `
    <div class="redflags-box">
      <div class="redflags-title">🚨 Signes de Gravité (Red Flags)</div>
      <div class="redflags-content">${escapeHTML(redFlags)}</div>
    </div>
  ` : ''}

  <div class="section-title">📑 Conduite à Tenir Principale</div>
  <div class="summary-content">
    ${parsedSummary}
  </div>

  ${rawOrdonnance && rawOrdonnance.trim() ? `
    <div class="section-title">💊 Ordonnance Type & Traitement de Référence</div>
    <div class="prescription-box">
      <pre>${escapeHTML(rawOrdonnance)}</pre>
    </div>
  ` : ''}

  ${subCatsHtml}

  ${notes && notes.trim() ? `
    <div class="section-title">📝 Mes Observations & Protocoles Locaux</div>
    <div class="notes-box">
      ${escapeHTML(notes)}
    </div>
  ` : ''}

  <div class="doc-footer">
    <div>"Primum non nocere." — Aide à la Décision Médicale</div>
    <div class="author-credit">Dr. Kibeche Ali — Dr.CAT Rappel Clinique</div>
  </div>
</body>
</html>`;

  // Create isolated invisible iframe to trigger print with zero browser interference
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
      console.error("Iframe print failed, falling back:", e);
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
