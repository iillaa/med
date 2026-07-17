import { state } from '../state.js';

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
