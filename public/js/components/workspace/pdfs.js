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
