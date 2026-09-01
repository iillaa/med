/**
 * PDF Search & Index Status Component
 * Handles searching inside medical reference PDFs, highlighted snippets, and reindexing triggers.
 */

import { state } from '../../state.js';
import * as api from '../../api.js';
import { escapeHTML, showToast, setButtonLoading } from '../../utils.js';
import { createPdfCardElement } from './pdfs.js';
import { saveAppStateBeforeNavigation } from './print.js';

export async function updatePdfIndexStatus() {
  const pdfIndexStatus = document.getElementById('pdf-index-status');
  if (!pdfIndexStatus) return;
  try {
    const status = await api.fetchSearchStatus();
    let html = '';
    if (status.isIndexing) {
      html = `<span class="status-text text-warning"><i class="fa-solid fa-circle-notch fa-spin"></i> Indexation en cours... (${status.indexedFiles}/${status.totalFiles} fichiers)</span>`;
      setTimeout(updatePdfIndexStatus, 2000);
    } else {
      html = `<span class="status-text text-success"><i class="fa-solid fa-circle-check"></i> Indexation terminée (${status.indexedFiles}/${status.totalFiles} fichiers indexés)</span>`;
    }

    const statusTextEl = pdfIndexStatus.querySelector('.status-text');
    if (statusTextEl) {
      statusTextEl.innerHTML = html;
    }
  } catch (err) {
    console.error("Failed to fetch index status:", err);
  }
}

export async function performPdfSearch(pdfContentSearchBtn) {
  const pdfContentSearchInput = document.getElementById('pdf-content-search-input');
  const pdfSearchLoading = document.getElementById('pdf-search-loading');
  const pdfSearchResultsContainer = document.getElementById('pdf-search-results-container');
  if (!pdfContentSearchInput || !pdfSearchLoading || !pdfSearchResultsContainer) return;
  const query = pdfContentSearchInput.value.trim();
  if (!query) return;

  const restoreSearchBtn = setButtonLoading(pdfContentSearchBtn, '<i class="fa-solid fa-magnifying-glass"></i> Rechercher');
  pdfSearchLoading.style.display = 'flex';
  pdfSearchResultsContainer.innerHTML = '';

  try {
    const response = await api.searchPdfsContent(query);
    if (response.status === 503) {
      const errData = await response.json();
      pdfSearchResultsContainer.innerHTML = `<p class="text-warning text-center" style="margin-top: 20px;"><i class="fa-solid fa-triangle-exclamation"></i> ${escapeHTML(errData.error || 'Indexation en cours...')}</p>`;
      return;
    }

    const data = await response.json();
    const results = data.results;

    if (!results || results.length === 0) {
      pdfSearchResultsContainer.innerHTML = `<p class="text-muted text-center" style="margin-top: 30px;">Aucun résultat trouvé pour "${escapeHTML(query)}". Vérifiez l'orthographe.</p>`;
      return;
    }

    let resultsHtml = '';
    results.forEach(res => {
      const escapedSnippet = escapeHTML(res.snippet);
      const escapedQueryVal = escapeHTML(query);
      const escapedQuery = escapedQueryVal.replace(/[-\\^$*+?.()|[\]{}]/g, '\\$&');
      const regex = new RegExp(`(${escapedQuery})`, 'gi');
      const highlightedSnippet = escapedSnippet.replace(regex, '<mark>$1</mark>');

      const displayTitle = escapeHTML(res.pdf.replace(/^[\d\uFE0F\u20E3]+\s*/, '')
                                  .replace(/[\u{1F300}-\u{1F9FF}]/gu, '')
                                  .replace(/_/g, ' ')
                                  .replace(/\.pdf$/i, ''));

      resultsHtml += `
        <div class="pdf-search-result-card" data-pdf="${encodeURIComponent(res.pdf)}" data-page="${res.page}">
          <div class="pdf-search-result-header">
            <span class="pdf-search-result-title"><i class="fa-solid fa-file-pdf"></i> ${displayTitle}</span>
            <span class="pdf-search-result-page">Page ${res.page}</span>
          </div>
          <div class="pdf-search-result-snippet">${highlightedSnippet}</div>
        </div>
      `;
    });

    pdfSearchResultsContainer.innerHTML = resultsHtml;

    document.querySelectorAll('.pdf-search-result-card').forEach(card => {
      card.addEventListener('click', () => {
        saveAppStateBeforeNavigation();
        const pdfFile = decodeURIComponent(card.getAttribute('data-pdf'));
        const page = card.getAttribute('data-page');
        window.location.href = `pdf_viewer.html?file=${encodeURIComponent(pdfFile)}&page=${page}`;
      });
    });

  } catch (err) {
    console.error("PDF search error:", err);
    pdfSearchResultsContainer.innerHTML = '<p class="text-danger text-center" style="margin-top: 20px;">Une erreur est survenue lors de la recherche.</p>';
  } finally {
    pdfSearchLoading.style.display = 'none';
    if (restoreSearchBtn) restoreSearchBtn();
  }
}

export async function triggerPdfReindex() {
  try {
    const data = await api.triggerReindexing();
    if (data.success) {
      updatePdfIndexStatus();
    }
  } catch (err) {
    console.error("Failed to trigger re-index:", err);
    if (window.handleAdminError && await window.handleAdminError(err)) {
      return;
    }
    showToast("Erreur lors de la réindexation.", "fa-circle-exclamation", 4000);
  }
}

export function loadRelatedPdfs(cat) {
  const pdfListContainer = document.getElementById('pdf-list');
  if (!pdfListContainer) return;
  pdfListContainer.innerHTML = '';

  const keywords = Array.isArray(cat?.pdf_keywords) ? cat.pdf_keywords : [];
  const categoryName = cat?.category ? cat.category.toLowerCase() : '';
  const tags = Array.isArray(cat?.tags) ? cat.tags.filter(t => t && typeof t === 'string').map(t => t.toLowerCase()) : [];
  
  const clinicalGenerals = ['urgence', 'urgences', 'traitement', 'thérapeutique', 'ordonnance', 'ordonnances', 'manuel', 'guide'];
  const generalKeywords = [categoryName, ...tags, ...clinicalGenerals].filter(k => k && k.trim().length > 2);

  const matchedFiles = state.allPdfs.filter(filename => {
    if (!filename) return false;
    const lowerName = filename.toLowerCase();
    return keywords.some(kw => kw != null && typeof kw === 'string' && lowerName.includes(kw.toLowerCase()));
  });

  const globalFiles = state.allPdfs.filter(filename => {
    if (!filename) return false;
    const lowerName = filename.toLowerCase();
    const isSpecific = keywords.some(kw => kw != null && typeof kw === 'string' && lowerName.includes(kw.toLowerCase()));
    if (isSpecific) return false;
    return generalKeywords.some(kw => lowerName.includes(kw));
  });

  const specificHeader = document.createElement('h4');
  specificHeader.style.gridColumn = '1 / -1';
  specificHeader.style.color = 'var(--color-primary)';
  specificHeader.style.margin = '10px 0 5px';
  specificHeader.style.fontSize = '14px';
  specificHeader.style.fontWeight = '600';
  specificHeader.innerHTML = '<i class="fa-solid fa-graduation-cap"></i> Cours & Références Spécifiques';
  pdfListContainer.appendChild(specificHeader);

  if (matchedFiles.length === 0) {
    const emptyP = document.createElement('p');
    emptyP.className = 'text-muted';
    emptyP.style.gridColumn = '1 / -1';
    emptyP.style.fontSize = '13px';
    emptyP.style.margin = '5px 0 15px';
    emptyP.textContent = 'Aucun PDF de spécialité spécifique trouvé pour ce sujet dans vos fichiers.';
    pdfListContainer.appendChild(emptyP);
  } else {
    matchedFiles.forEach(file => {
      pdfListContainer.appendChild(createPdfCardElement(file, false));
    });
  }

  if (globalFiles.length > 0) {
    const globalHeader = document.createElement('h4');
    globalHeader.style.gridColumn = '1 / -1';
    globalHeader.style.color = 'var(--color-success)';
    globalHeader.style.margin = '20px 0 5px';
    globalHeader.style.fontSize = '14px';
    globalHeader.style.fontWeight = '600';
    globalHeader.innerHTML = `<i class="fa-solid fa-book-medical"></i> Manuels & Guides (${escapeHTML(cat?.category || 'Généraux')})`;
    pdfListContainer.appendChild(globalHeader);

    globalFiles.forEach(file => {
      pdfListContainer.appendChild(createPdfCardElement(file, true));
    });
  }
}
