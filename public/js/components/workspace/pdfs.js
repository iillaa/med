import { state } from '../../state.js';
import * as api from '../../api.js';
import { getCleanPdfName, showToast, escapeHTML } from '../../utils.js';
import { saveAppStateBeforeNavigation } from './print.js';
import { safeGetItem, safeSetItem, safeParseJSON } from '../../lib/safeStorage.js';

export function createPdfCardElement(file, isGlobal = false) {
  if (!file || typeof file !== 'string') return document.createElement('div');
  const cleanName = getCleanPdfName(file);
  const card = document.createElement('a');
  const safeFile = String(file);
  const isDocx = safeFile.toLowerCase().endsWith('.docx');
  card.href = isDocx ? `pdfs/${encodeURIComponent(safeFile)}` : `pdf_viewer.html?file=${encodeURIComponent(safeFile)}&page=1`;
  if (isDocx) {
    card.target = '_blank';
  }
  card.className = 'pdf-card';

  const iconClass = isDocx
    ? 'fa-regular fa-file-word text-primary'
    : (isGlobal ? 'fa-solid fa-book-open-reader' : 'fa-solid fa-file-pdf');

  const statusInfo = (state.pdfIndexStatus && state.pdfIndexStatus[safeFile]) || { status: 'red', pagesWithText: 0, totalPages: 0 };
  const dotColor = isDocx ? '#ef4444' : (statusInfo.status === 'green' ? '#10b981' : (statusInfo.status === 'orange' ? '#f59e0b' : '#ef4444'));
  const dotTitle = isDocx
    ? "Document Word (Non indexable, convertissez en PDF pour la recherche)"
    : (statusInfo.status === 'green'
      ? `Indexation complète (${statusInfo.pagesWithText}/${statusInfo.totalPages} pages indexées)`
      : (statusInfo.status === 'orange'
        ? `Indexation partielle (${statusInfo.pagesWithText}/${statusInfo.totalPages} pages indexées)`
        : `Non indexable (0/${statusInfo.totalPages} pages, PDF scanné sans texte)`));

  card.innerHTML = `
    <i class="${iconClass}" style="${isGlobal && !isDocx ? 'color: var(--color-success);' : ''}"></i>
    <div style="flex-grow: 1; min-width: 0;">
      <h4 style="display: flex; align-items: center; justify-content: space-between; gap: 8px; width: 100%; margin: 0;">
        <span style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${cleanName}</span>
        <span class="pdf-status-dot" style="width: 7px; height: 7px; background-color: ${dotColor}; border-radius: 50%; display: inline-block; flex-shrink: 0;" title="${dotTitle}"></span>
      </h4>
      <span>${isDocx ? 'Document Word' : (isGlobal ? 'Ouvrir le manuel général' : 'Ouvrir le cours PDF')}</span>
    </div>
  `;

  const dot = card.querySelector('.pdf-status-dot');
  if (dot) {
    dot.addEventListener('click', (e) => {
      e.preventDefault();
      e.stopPropagation();
      showToast(dotTitle, "fa-circle-info", 4000);
    });
  }

  return card;
}

export function renderAllPdfsList(allPdfs) {
  const allPdfsList = document.getElementById('all-pdfs-list');
  if (!allPdfsList || !Array.isArray(allPdfs)) return;
  allPdfsList.innerHTML = '';
  allPdfs.forEach(file => {
    if (!file || typeof file !== 'string') return;
    const safeFile = String(file);
    const cleanName = getCleanPdfName(safeFile);
    const li = document.createElement('li');

    const isDocx = safeFile.toLowerCase().endsWith('.docx');
    const iconClass = isDocx ? 'fa-regular fa-file-word' : 'fa-solid fa-file-pdf';
    const href = isDocx ? `pdfs/${encodeURIComponent(safeFile)}` : `pdf_viewer.html?file=${encodeURIComponent(safeFile)}&page=1`;

    const statusInfo = (state.pdfIndexStatus && state.pdfIndexStatus[safeFile]) || { status: 'red', pagesWithText: 0, totalPages: 0 };
    const dotColor = isDocx ? '#ef4444' : (statusInfo.status === 'green' ? '#10b981' : (statusInfo.status === 'orange' ? '#f59e0b' : '#ef4444'));
    const dotTitle = isDocx
      ? "Document Word (Non indexable, convertissez en PDF pour la recherche)"
      : (statusInfo.status === 'green'
        ? `Indexation complète (${statusInfo.pagesWithText}/${statusInfo.totalPages} pages indexées)`
        : (statusInfo.status === 'orange'
          ? `Indexation partielle (${statusInfo.pagesWithText}/${statusInfo.totalPages} pages indexées)`
          : `Non indexable (0/${statusInfo.totalPages} pages, PDF scanné sans texte)`));

    li.innerHTML = `
      <a href="${href}" ${isDocx ? 'target="_blank"' : ''} class="all-pdfs-list-item" style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
        <div style="display: flex; align-items: center; gap: 10px; min-width: 0; flex-grow: 1;">
          <i class="${iconClass}"></i>
          <span style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${cleanName} (${isDocx ? 'Word' : 'PDF'})</span>
        </div>
        <span class="pdf-status-dot" style="width: 8px; height: 8px; background-color: ${dotColor}; border-radius: 50%; flex-shrink: 0; margin-left: 8px;" title="${dotTitle}"></span>
      </a>
    `;

    const dot = li.querySelector('.pdf-status-dot');
    if (dot) {
      dot.addEventListener('click', (e) => {
        e.preventDefault();
        e.stopPropagation();
        showToast(dotTitle, "fa-circle-info", 4000);
      });
    }

    allPdfsList.appendChild(li);
  });
}

export function filterAllPdfsList() {
  const allPdfsList = document.getElementById('all-pdfs-list');
  const pdfSearch = document.getElementById('pdf-search');
  if (!allPdfsList || !pdfSearch) return;
  const query = (pdfSearch.value || '').toLowerCase().trim();
  const items = allPdfsList.querySelectorAll('li');

  items.forEach(item => {
    const text = (item.textContent || '').toLowerCase();
    item.style.display = !query || text.includes(query) ? 'block' : 'none';
  });
}

/**
 * Dynamically categorize PDF filenames using active database specialties and clinical keywords
 */
function categorizePdf(fileName) {
  const f = (fileName || '').toLowerCase();
  const cleanF = getCleanPdfName(fileName).toLowerCase();

  // 1. Dynamic Matching against real Specialties present in cats_db
  if (Array.isArray(state.allCats)) {
    const existingSpecialties = Array.from(new Set(state.allCats.map(c => c.category))).filter(Boolean);
    for (const spec of existingSpecialties) {
      const specLower = spec.toLowerCase();
      // Match exact specialty name or core root in filename
      if (cleanF.includes(specLower) || f.includes(specLower.slice(0, 5))) {
        return spec;
      }
    }
  }

  // 2. Dynamic Clinical Keywords Fallback for Medical Books
  if (f.includes('urgenc') || f.includes('reanimat') || f.includes('choc') || f.includes('ecg') || f.includes('reflex')) return 'Urgences & Réanimation';
  if (f.includes('pediatr') || f.includes('eruptiv') || f.includes('nourrisson')) return 'Pédiatrie';
  if (f.includes('gyneco') || f.includes('grossesse') || f.includes('contracept') || f.includes('femme')) return 'Gynécologie - Obstétrique';
  if (f.includes('gastro') || f.includes('digestif') || f.includes('asp')) return 'Gastro-entérologie';
  if (f.includes('dermato') || f.includes('gale') || f.includes('panaris')) return 'Dermatologie';
  if (f.includes('pneumo') || f.includes('thoracique') || f.includes('poumon')) return 'Pneumologie';
  if (f.includes('cardio') || f.includes('hta') || f.includes('coronaire')) return 'Cardiologie';
  if (f.includes('orl') || f.includes('ophtalmo') || f.includes('blepharite')) return 'ORL & Ophtalmologie';
  if (f.includes('infect') || f.includes('antibiot') || f.includes('inflammatoire')) return 'Infectiologie';
  if (f.includes('neuro') || f.includes('psycho') || f.includes('psychiatr')) return 'Neurologie & Psychiatrie';
  if (f.includes('medicament') || f.includes('ordonnance') || f.includes('posolog') || f.includes('formule')) return 'Thérapeutique & Pharmacologie';
  if (f.includes('radio') || f.includes('bilan') || f.includes('certificat') || f.includes('accident')) return 'Imagerie, Bilans & Législation';
  
  return 'Médecine Générale & Divers';
}

/**
 * Initialize Standalone Library Screen (78 Reference Books + Global PDF Text Search)
 */
export function initLibraryScreen(onReturnDashboard) {
  const libScreen = document.getElementById('library-screen');
  const welcomeScreen = document.getElementById('welcome-screen');
  const workspace = document.getElementById('workspace');
  const quizScreen = document.getElementById('quiz-screen');
  const backBtn = document.getElementById('library-back-dash-btn');

  if (backBtn && onReturnDashboard) {
    backBtn.onclick = () => onReturnDashboard();
  }

  // Retrieve saved accordion states
  let savedAccordionStates = safeParseJSON(safeGetItem('drcat_lib_accordions_state'), {}) || {};

  // Retrieve saved search collapsed state (default: false = full)
  let isSearchCollapsed = safeGetItem('drcat_lib_search_collapsed') === 'true';

  function saveAccordionStates() {
    safeSetItem('drcat_lib_accordions_state', JSON.stringify(savedAccordionStates));
  }

  function renderGroupedSpecialties(filterQuery = '') {
    const container = document.getElementById('lib-specialties-container');
    const countEl = document.getElementById('lib-pdf-count');
    if (!container || !Array.isArray(state.allPdfs)) return;

    const q = filterQuery.toLowerCase().trim();
    const groups = {};

    state.allPdfs.forEach(file => {
      if (!file || typeof file !== 'string') return;
      const cleanName = getCleanPdfName(file);
      const category = categorizePdf(file);
      if (q && !cleanName.toLowerCase().includes(q) && !category.toLowerCase().includes(q)) {
        return;
      }
      if (!groups[category]) groups[category] = [];
      groups[category].push(file);
    });

    const categories = Object.keys(groups).sort();
    let totalVisible = 0;
    categories.forEach(c => { totalVisible += groups[c].length; });
    if (countEl) countEl.textContent = totalVisible;

    if (categories.length === 0) {
      container.innerHTML = `<div style="padding: 24px; text-align: center; color: var(--text-muted);">Aucun manuel ne correspond à votre recherche "${escapeHTML(filterQuery)}".</div>`;
      return;
    }

    container.innerHTML = '';
    categories.forEach((catName, idx) => {
      const pdfsInCat = groups[catName];
      const section = document.createElement('div');
      section.className = 'lib-category-section';
      section.style.background = 'var(--bg-card)';
      section.style.border = '1px solid var(--border-color)';
      section.style.borderRadius = 'var(--radius-md)';
      section.style.overflow = 'hidden';

      // Use saved state if available, or default open for top 3/search
      const isOpen = q.length > 0
        ? true
        : (savedAccordionStates[catName] !== undefined ? savedAccordionStates[catName] : idx < 3);

      section.innerHTML = `
        <div class="lib-cat-header" style="display: flex; justify-content: space-between; align-items: center; padding: 10px 14px; background: rgba(0,0,0,0.18); cursor: pointer; user-select: none;">
          <div style="display: flex; align-items: center; gap: 8px; font-weight: 700; font-size: 13px; color: var(--color-primary);">
            <i class="fa-solid fa-folder"></i> <span>${escapeHTML(catName)}</span>
            <span style="font-size: 11px; padding: 1px 6px; border-radius: 10px; background: rgba(6, 182, 212, 0.15); color: var(--color-primary);">${pdfsInCat.length}</span>
          </div>
          <i class="fa-solid fa-chevron-down lib-cat-chevron" style="font-size: 11px; color: var(--text-muted); transition: transform 0.2s ease; transform: ${isOpen ? 'rotate(180deg)' : 'rotate(0deg)'};"></i>
        </div>
        <div class="lib-cat-body" style="display: ${isOpen ? 'grid' : 'none'}; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 8px; padding: 12px;"></div>
      `;

      const header = section.querySelector('.lib-cat-header');
      const body = section.querySelector('.lib-cat-body');
      const chevron = section.querySelector('.lib-cat-chevron');

      pdfsInCat.forEach(file => {
        const card = createPdfCardElement(file, false);
        body.appendChild(card);
      });

      header.onclick = () => {
        const currentlyOpen = body.style.display !== 'none';
        const nextState = !currentlyOpen;
        body.style.display = nextState ? 'grid' : 'none';
        chevron.style.transform = nextState ? 'rotate(180deg)' : 'rotate(0deg)';
        savedAccordionStates[catName] = nextState;
        saveAccordionStates();
      };

      container.appendChild(section);
    });
  }

  // Filter input in library
  const filterInput = document.getElementById('lib-filter-pdf-input');
  if (filterInput) {
    filterInput.addEventListener('input', () => {
      renderGroupedSpecialties(filterInput.value || '');
    });
  }

  // Deep Full-Text PDF Search in Library
  const searchInput = document.getElementById('lib-deep-search-input');
  const searchBtn = document.getElementById('lib-deep-search-btn');
  const resultsSection = document.getElementById('lib-search-results-section');
  const resultsContainer = document.getElementById('lib-search-results-container');
  const resultsCount = document.getElementById('lib-search-results-count');
  const loading = document.getElementById('lib-search-loading');
  const clearBtn = document.getElementById('lib-clear-search-btn');
  const toggleResultsBtn = document.getElementById('lib-toggle-results-btn');
  const toggleResultsIcon = document.getElementById('lib-toggle-results-icon');
  const toggleResultsText = document.getElementById('lib-toggle-results-text');
  const expandBanner = document.getElementById('lib-search-expand-banner');
  const showAllResultsBtn = document.getElementById('lib-show-all-results-btn');
  const remainingCountEl = document.getElementById('lib-remaining-results-count');

  let currentSearchResults = [];

  function applySearchResultsCollapseState() {
    if (!resultsContainer) return;
    if (isSearchCollapsed && currentSearchResults.length > 4) {
      resultsContainer.className = 'lib-search-container-collapsed';
      if (toggleResultsIcon) toggleResultsIcon.className = 'fa-solid fa-expand';
      if (toggleResultsText) toggleResultsText.textContent = 'Agrandir';
      if (expandBanner) {
        expandBanner.style.display = 'block';
        if (remainingCountEl) remainingCountEl.textContent = currentSearchResults.length - 4;
      }
    } else {
      resultsContainer.className = 'lib-search-container-full';
      if (toggleResultsIcon) toggleResultsIcon.className = 'fa-solid fa-compress';
      if (toggleResultsText) toggleResultsText.textContent = 'Réduire';
      if (expandBanner) expandBanner.style.display = 'none';
    }
  }

  if (toggleResultsBtn) {
    toggleResultsBtn.onclick = () => {
      isSearchCollapsed = !isSearchCollapsed;
      safeSetItem('drcat_lib_search_collapsed', String(isSearchCollapsed));
      applySearchResultsCollapseState();
    };
  }

  if (showAllResultsBtn) {
    showAllResultsBtn.onclick = () => {
      isSearchCollapsed = false;
      safeSetItem('drcat_lib_search_collapsed', 'false');
      applySearchResultsCollapseState();
    };
  }

  if (clearBtn && resultsSection) {
    clearBtn.onclick = () => { resultsSection.style.display = 'none'; };
  }

  async function executeLibrarySearch(query) {
    if (!query) return;
    if (resultsSection) resultsSection.style.display = 'block';
    if (loading) loading.style.display = 'block';
    if (resultsContainer) resultsContainer.innerHTML = '';
    if (expandBanner) expandBanner.style.display = 'none';
    if (resultsCount) resultsCount.textContent = `Recherche pour "${query}"...`;

    try {
      const response = await api.searchPdfsContent(query);
      if (loading) loading.style.display = 'none';
      if (!response.ok) {
        if (resultsContainer) resultsContainer.innerHTML = `<p class="text-warning" style="padding: 12px; text-align: center;">Service de recherche temporairement indisponible.</p>`;
        return;
      }
      const data = await response.json();
      currentSearchResults = data.results || [];
      if (resultsCount) resultsCount.textContent = `${currentSearchResults.length} passage(s) trouvé(s) pour "${query}"`;

      if (currentSearchResults.length === 0) {
        if (resultsContainer) resultsContainer.innerHTML = `<p class="text-muted" style="padding: 16px; text-align: center;">Aucun passage trouvé pour cette expression dans les livres de référence.</p>`;
        return;
      }

      let html = '';
      currentSearchResults.forEach(res => {
        const cleanName = getCleanPdfName(res.pdf);
        const escapedSnippet = escapeHTML(res.snippet);
        const escapedQuery = escapeHTML(query).replace(/[-\\^$*+?.()|[\]{}]/g, '\\$&');
        const highlighted = escapedSnippet.replace(new RegExp(`(${escapedQuery})`, 'gi'), '<mark>$1</mark>');
        html += `
          <div class="pdf-search-result-card" data-pdf="${encodeURIComponent(res.pdf)}" data-page="${res.page}" style="padding: 12px; background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 8px; cursor: pointer; display: flex; flex-direction: column; gap: 6px;">
            <div style="display: flex; justify-content: space-between; font-size: 12px; font-weight: 700; color: var(--color-primary);">
              <span><i class="fa-solid fa-book-open"></i> ${escapeHTML(cleanName)}</span>
              <span style="color: var(--color-warning);">Page ${res.page}</span>
            </div>
            <div style="font-size: 11.5px; color: var(--text-secondary); line-height: 1.4;">${highlighted}</div>
          </div>
        `;
      });

      if (resultsContainer) {
        resultsContainer.innerHTML = html;
        resultsContainer.querySelectorAll('.pdf-search-result-card').forEach(card => {
          card.onclick = () => {
            saveAppStateBeforeNavigation();
            const pdf = decodeURIComponent(card.getAttribute('data-pdf'));
            const page = card.getAttribute('data-page');
            window.location.href = `pdf_viewer.html?file=${encodeURIComponent(pdf)}&page=${page}`;
          };
        });
      }

      applySearchResultsCollapseState();
    } catch (e) {
      if (loading) loading.style.display = 'none';
      if (resultsContainer) resultsContainer.innerHTML = `<p class="text-danger" style="padding: 12px; text-align: center;">Erreur lors de la recherche dans les documents.</p>`;
    }
  }

  if (searchBtn && searchInput) {
    searchBtn.onclick = () => executeLibrarySearch(searchInput.value.trim());
    searchInput.onkeydown = (e) => { if (e.key === 'Enter') executeLibrarySearch(searchInput.value.trim()); };
  }

  // Global Opener Function for Library
  window.openStandaloneLibrary = function(initialQuery = '') {
    state.activeCat = null;
    document.querySelectorAll('.cat-item').forEach(i => i.classList.remove('active'));
    if (workspace) workspace.style.display = 'none';
    if (welcomeScreen) welcomeScreen.style.display = 'none';
    if (quizScreen) quizScreen.style.display = 'none';
    if (libScreen) {
      libScreen.style.display = 'flex';
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    renderGroupedSpecialties(filterInput ? filterInput.value : '');

    if (initialQuery && searchInput) {
      searchInput.value = initialQuery;
      executeLibrarySearch(initialQuery);
    }
  };
}
