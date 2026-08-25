import { state } from '../../state.js';
import { getCleanPdfName, showToast } from '../../utils.js';

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

  // Filter input in library
  const filterInput = document.getElementById('lib-filter-pdf-input');
  if (filterInput) {
    filterInput.addEventListener('input', () => {
      const q = (filterInput.value || '').toLowerCase().trim();
      const grid = document.getElementById('lib-all-pdfs-grid');
      if (grid) {
        grid.querySelectorAll('.pdf-card').forEach(card => {
          const title = (card.textContent || '').toLowerCase();
          card.style.display = !q || title.includes(q) ? 'flex' : 'none';
        });
      }
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

  if (clearBtn && resultsSection) {
    clearBtn.onclick = () => { resultsSection.style.display = 'none'; };
  }

  async function executeLibrarySearch(query) {
    if (!query) return;
    if (resultsSection) resultsSection.style.display = 'block';
    if (loading) loading.style.display = 'block';
    if (resultsContainer) resultsContainer.innerHTML = '';
    if (resultsCount) resultsCount.textContent = `Recherche pour "${query}"...`;

    try {
      const response = await api.searchPdfsContent(query);
      if (loading) loading.style.display = 'none';
      if (!response.ok) {
        if (resultsContainer) resultsContainer.innerHTML = `<p class="text-warning" style="padding: 12px; text-align: center;">Service de recherche temporairement indisponible.</p>`;
        return;
      }
      const data = await response.json();
      const results = data.results || [];
      if (resultsCount) resultsCount.textContent = `${results.length} passage(s) trouvé(s) pour "${query}"`;

      if (results.length === 0) {
        if (resultsContainer) resultsContainer.innerHTML = `<p class="text-muted" style="padding: 16px; text-align: center;">Aucun passage trouvé pour cette expression dans les 78 livres.</p>`;
        return;
      }

      let html = '';
      results.forEach(res => {
        const cleanName = getCleanPdfName(res.pdf);
        const highlighted = escapeHTML(res.snippet).replace(new RegExp(`(${query.replace(/[-\\^$*+?.()|[\]{}]/g, '\\$&')})`, 'gi'), '<mark>$1</mark>');
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
            const pdf = decodeURIComponent(card.getAttribute('data-pdf'));
            const page = card.getAttribute('data-page');
            window.location.href = `pdf_viewer.html?file=${encodeURIComponent(pdf)}&page=${page}`;
          };
        });
      }
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

    // Populate grid
    const grid = document.getElementById('lib-all-pdfs-grid');
    const countEl = document.getElementById('lib-pdf-count');
    if (grid && Array.isArray(state.allPdfs)) {
      if (countEl) countEl.textContent = state.allPdfs.length;
      grid.innerHTML = '';
      state.allPdfs.forEach(file => {
        const card = createPdfCardElement(file, true);
        grid.appendChild(card);
      });
    }

    if (initialQuery && searchInput) {
      searchInput.value = initialQuery;
      executeLibrarySearch(initialQuery);
    }
  };
}
