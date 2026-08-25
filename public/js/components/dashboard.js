import { state } from '../state.js';
import * as api from '../api.js';
import { exportDataFile, showToast } from '../utils.js';
import { calculateStats, getStreakCount } from './dashboard/stats.js';
import { renderResumeList } from './dashboard/resume.js';
import { renderCategoryProgress } from './dashboard/progress.js';
import { initAdminTabListeners, loadPendingSuggestions } from './dashboard/admin.js';

let welcomeScreen, workspace, sidebar;
let dashMasteryRate, dashCountDone, dashCountDoing, dashCountTodo;
let resumeList, categoriesDiv, adminPanel, suggestionsList;
let lastDashSignature = null;

function computeDashSignature() {
  const total = state.allCats.length;
  const done = state.allCats.filter(c => c.status === 'done').length;
  const doing = state.allCats.filter(c => c.status === 'doing').length;
  const admin = state.isAdmin ? 1 : 0;
  return `${total}|${done}|${doing}|${admin}`;
}

export function initDashboard(onSelectCat, onSuggestionHandled) {
  welcomeScreen = document.getElementById('welcome-screen');
  workspace = document.getElementById('workspace');
  sidebar = document.getElementById('sidebar');

  dashMasteryRate = document.getElementById('dash-mastery-rate');
  dashCountDone = document.getElementById('dash-count-done');
  dashCountDoing = document.getElementById('dash-count-doing');
  dashCountTodo = document.getElementById('dash-count-todo');

  resumeList = document.getElementById('dash-resume-list');
  categoriesDiv = document.getElementById('dash-categories-progress');
  adminPanel = document.getElementById('admin-moderation-panel');
  suggestionsList = document.getElementById('suggestions-list');

  const brandLogo = document.getElementById('brand-logo');
  const mobileBrandLogo = document.getElementById('mobile-brand-logo');

  if (brandLogo) {
    brandLogo.addEventListener('click', () => showDashboard(onSelectCat));
  }
  if (mobileBrandLogo) {
    mobileBrandLogo.addEventListener('click', () => showDashboard(onSelectCat));
  }

  initAdminTabListeners(onSuggestionHandled);

  // Omni-Search Central Handler
  const omniInput = document.getElementById('omni-search-input');
  const omniBtn = document.getElementById('omni-search-btn');
  const omniResults = document.getElementById('omni-search-results');

  async function handleOmniSearch() {
    if (!omniInput || !omniResults) return;
    const query = omniInput.value.trim().toLowerCase();
    if (!query) {
      omniResults.style.display = 'none';
      return;
    }

    const matchedCats = (state.allCats || []).filter(c => {
      const title = (c.title || '').toLowerCase();
      const catg = (c.category || '').toLowerCase();
      const summ = (c.summary || '').toLowerCase();
      const ord = (c.ordonnance || '').toLowerCase();
      const kw = Array.isArray(c.keywords) ? c.keywords.join(' ').toLowerCase() : '';
      return title.includes(query) || catg.includes(query) || summ.includes(query) || ord.includes(query) || kw.includes(query);
    }).slice(0, 8);

    if (matchedCats.length === 0) {
      omniResults.innerHTML = `<div style="padding: 12px; font-size: 12.5px; color: var(--text-muted); text-align: center;">Aucune CAT trouvée pour "${escapeHTML(query)}". <br><a href="#" id="omni-search-pdf-fallback" style="color: var(--color-primary); font-weight: 700; display: inline-block; margin-top: 6px;">🔍 Chercher dans les 78 Livres PDF ➔</a></div>`;
      omniResults.style.display = 'flex';
      const pdfFallback = document.getElementById('omni-search-pdf-fallback');
      if (pdfFallback) {
        pdfFallback.onclick = (e) => {
          e.preventDefault();
          window.openGlobalPdfSearch(query);
        };
      }
      return;
    }

    let html = `<div style="padding: 6px 10px; font-size: 11px; font-weight: 700; color: var(--text-secondary); border-bottom: 1px solid var(--border-color); display: flex; justify-content: space-between;"><span>FICHES CAT TROUVÉES (${matchedCats.length})</span><span style="color: var(--color-primary); cursor: pointer;" id="omni-search-pdf-link"><i class="fa-solid fa-file-pdf"></i> Chercher dans les PDFs ➔</span></div>`;

    matchedCats.forEach(c => {
      html += `
        <div class="omni-result-item" data-cat-id="${c.id}" style="padding: 8px 10px; border-radius: 6px; cursor: pointer; display: flex; align-items: center; justify-content: space-between; gap: 8px; transition: background 0.15s ease;">
          <div style="display: flex; flex-direction: column; gap: 2px; min-width: 0;">
            <strong style="font-size: 12.5px; color: var(--text-primary); text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${escapeHTML(c.title)}</strong>
            <span style="font-size: 10.5px; color: var(--color-primary);">${escapeHTML(c.category || '')}</span>
          </div>
          <span style="font-size: 10px; padding: 2px 6px; border-radius: 12px; background: rgba(255,255,255,0.05); color: var(--text-muted);">${c.status === 'done' ? '✅' : (c.status === 'doing' ? '⏳' : '⚪')}</span>
        </div>
      `;
    });

    omniResults.innerHTML = html;
    omniResults.style.display = 'flex';

    omniResults.querySelectorAll('.omni-result-item').forEach(item => {
      item.onclick = () => {
        const catId = parseInt(item.getAttribute('data-cat-id'), 10);
        const targetCat = (state.allCats || []).find(c => c.id === catId);
        if (targetCat && onSelectCat) {
          omniResults.style.display = 'none';
          onSelectCat(targetCat);
        }
      };
      item.onmouseenter = () => { item.style.background = 'rgba(6, 182, 212, 0.1)'; };
      item.onmouseleave = () => { item.style.background = 'transparent'; };
    });

    const pdfLink = document.getElementById('omni-search-pdf-link');
    if (pdfLink) {
      pdfLink.onclick = () => {
        omniResults.style.display = 'none';
        window.openGlobalPdfSearch(query);
      };
    }
  }

  if (omniInput) {
    omniInput.addEventListener('input', () => {
      clearTimeout(window._omniTimer);
      window._omniTimer = setTimeout(handleOmniSearch, 250);
    });
    omniInput.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') handleOmniSearch();
    });
  }
  if (omniBtn) {
    omniBtn.addEventListener('click', handleOmniSearch);
  }

  // Quick Open Shortcut Function
  window.quickOpenCatSearch = function(searchTerm) {
    const term = searchTerm.toLowerCase();
    const found = (state.allCats || []).find(c => (c.title || '').toLowerCase().includes(term) || (c.keywords || []).some(k => k.toLowerCase().includes(term)));
    if (found && onSelectCat) {
      onSelectCat(found);
    } else {
      if (omniInput) {
        omniInput.value = searchTerm;
        handleOmniSearch();
      }
    }
  };

  // Quick Quiz Shortcut Card
  const quickQuizCard = document.getElementById('dash-quick-quiz-card');
  if (quickQuizCard) {
    quickQuizCard.onclick = () => {
      const quizNavBtn = document.getElementById('start-quiz-nav-btn');
      if (quizNavBtn) quizNavBtn.click();
    };
  }

  // Global PDF Search Opener
  window.openGlobalPdfSearch = function(query = '') {
    if (state.allCats && state.allCats.length > 0 && onSelectCat) {
      const firstCat = state.allCats[0];
      onSelectCat(firstCat);
      const searchTabBtn = document.querySelector('.tab-btn[data-tab="tab-search-pdf"]');
      if (searchTabBtn) searchTabBtn.click();
      const pdfInput = document.getElementById('pdf-content-search-input');
      const pdfBtn = document.getElementById('pdf-content-search-btn');
      if (pdfInput && query) {
        pdfInput.value = query;
        if (pdfBtn) pdfBtn.click();
      }
    }
  };

  const exportBtn = document.getElementById('export-progress-btn');
  if (exportBtn) {
    exportBtn.addEventListener('click', () => {
      const progressData = localStorage.getItem('dr_cat_user_progress');
      if (!progressData || progressData === '{}') {
        showToast("Aucune progression enregistrée à exporter.", "fa-circle-exclamation", 3000);
        return;
      }

      const fileName = `drcat-progression-${new Date().toISOString().slice(0, 10)}.json`;
      exportDataFile(fileName, "Sauvegarde Progression", progressData);
    });
  }

  const importBtn = document.getElementById('import-progress-btn');
  const importFileInput = document.getElementById('import-progress-file');
  if (importBtn && importFileInput) {
    importBtn.addEventListener('click', () => {
      importFileInput.click();
    });

    importFileInput.addEventListener('change', (e) => {
      const file = e.target.files[0];
      if (!file) return;

      const reader = new FileReader();
      reader.onload = async (event) => {
        try {
          const importedData = JSON.parse(event.target.result);
          const keys = Object.keys(importedData);
          if (keys.length > 0 && typeof importedData[keys[0]] === 'object') {
            localStorage.setItem('dr_cat_user_progress', JSON.stringify(importedData));
            showToast("Progression importée avec succès ! L'application va se recharger.", "fa-circle-check", 4000);
            location.reload();
          } else {
            showToast("Format de fichier invalide.", "fa-circle-exclamation", 4000);
          }
        } catch (err) {
          console.error(err);
          showToast("Erreur lors de la lecture du fichier d'importation.", "fa-circle-exclamation", 4000);
        }
      };
      reader.readAsText(file);
    });
  }

  const bulkImportInput = document.getElementById('admin-bulk-import-input');
  const bulkImportTriggerBtn = document.getElementById('admin-bulk-import-trigger-btn');
  const bulkImportFileName = document.getElementById('bulk-import-file-name');
  const bulkImportSubmitBtn = document.getElementById('admin-bulk-import-submit-btn');

  let importData = null;

  if (bulkImportTriggerBtn && bulkImportInput) {
    bulkImportTriggerBtn.addEventListener('click', () => bulkImportInput.click());
  }

  if (bulkImportInput) {
    bulkImportInput.addEventListener('change', (e) => {
      const file = e.target.files[0];
      if (!file) {
        if (bulkImportFileName) bulkImportFileName.textContent = 'Aucun fichier sélectionné';
        if (bulkImportSubmitBtn) {
          bulkImportSubmitBtn.disabled = true;
          bulkImportSubmitBtn.style.opacity = '0.5';
          bulkImportSubmitBtn.style.cursor = 'not-allowed';
        }
        importData = null;
        return;
      }

      if (bulkImportFileName) bulkImportFileName.textContent = file.name;

      const reader = new FileReader();
      reader.onload = (event) => {
        try {
          const parsed = JSON.parse(event.target.result);
          if (!Array.isArray(parsed)) {
            throw new Error("Le fichier JSON doit contenir un tableau de fiches.");
          }
          importData = parsed;
          if (bulkImportSubmitBtn) {
            bulkImportSubmitBtn.disabled = false;
            bulkImportSubmitBtn.style.opacity = '1';
            bulkImportSubmitBtn.style.cursor = 'pointer';
          }
        } catch (err) {
          showToast(`Erreur JSON: ${err.message}`, 'fa-triangle-exclamation', 4000);
          if (bulkImportFileName) bulkImportFileName.textContent = 'Fichier JSON invalide';
          if (bulkImportSubmitBtn) {
            bulkImportSubmitBtn.disabled = true;
            bulkImportSubmitBtn.style.opacity = '0.5';
            bulkImportSubmitBtn.style.cursor = 'not-allowed';
          }
          importData = null;
        }
      };
      reader.readAsText(file);
    });
  }

  if (bulkImportSubmitBtn) {
    bulkImportSubmitBtn.addEventListener('click', async () => {
      if (!importData) return;

      try {
        bulkImportSubmitBtn.disabled = true;
        bulkImportSubmitBtn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Importation...';

        const result = await api.bulkImportCats(importData);
        if (result.count > 0 && result.skippedCount > 0) {
          showToast(`${result.count} fiches importées, ${result.skippedCount} ignorées (déjà existantes).`, "fa-circle-check", 5000);
        } else if (result.count === 0 && result.skippedCount > 0) {
          showToast(`Aucune nouvelle fiche. Les ${result.skippedCount} fiches existaient déjà.`, "fa-circle-exclamation", 4000);
        } else {
          showToast(`${result.count} fiches importées avec succès !`, "fa-circle-check", 4000);
        }

        importData = null;
        if (bulkImportInput) bulkImportInput.value = '';
        if (bulkImportFileName) bulkImportFileName.textContent = 'Aucun fichier sélectionné';
        bulkImportSubmitBtn.disabled = true;
        bulkImportSubmitBtn.style.opacity = '0.5';
        bulkImportSubmitBtn.style.cursor = 'not-allowed';
        bulkImportSubmitBtn.innerHTML = '<i class="fa-solid fa-cloud-arrow-up"></i> Importer';

        if (onSuggestionHandled) await onSuggestionHandled();
      } catch (err) {
        showToast(`Échec de l'importation: ${err.message}`, "fa-triangle-exclamation", 4000);
        bulkImportSubmitBtn.disabled = false;
        bulkImportSubmitBtn.innerHTML = '<i class="fa-solid fa-cloud-arrow-up"></i> Importer';
      }
    });
  }

  const exportSpecialtyBtn = document.getElementById('export-specialty-btn');
  const exportSpecialtySelect = document.getElementById('export-specialty-select');
  if (exportSpecialtyBtn && exportSpecialtySelect) {
    exportSpecialtyBtn.addEventListener('click', () => {
      const specialty = exportSpecialtySelect.value;
      if (!specialty) {
        showToast("Veuillez sélectionner une spécialité.", "fa-triangle-exclamation", 3000);
        return;
      }

      const list = state.allCats.filter(c => c.category === specialty).map(c => {
        return {
          category: c.category,
          title: c.title,
          summary: c.summary,
          red_flags: c.red_flags,
          ordonnance: c.ordonnance,
          pdf_keywords: c.pdf_keywords || []
        };
      });

      exportDataFile(`Fiches_DrCAT_${specialty.replace(/\s+/g, '_')}.json`, 'Export Spécialité', list);
      showToast(`Exportation réussie de ${list.length} fiches !`, "fa-circle-check", 3000);
    });
  }
}

export function showDashboard(onSelectCat) {
  state.activeCat = null;
  document.querySelectorAll('.cat-item').forEach(item => item.classList.remove('active'));

  if (workspace) workspace.style.display = 'none';
  if (welcomeScreen) welcomeScreen.style.display = 'flex';
  const quizScreen = document.getElementById('quiz-screen');
  if (quizScreen) quizScreen.style.display = 'none';

  if (window.innerWidth <= 850 && sidebar) {
    sidebar.classList.remove('open');
  }

  // 1.3 Instant tab transitions: skip re-render when returning to a dashboard
  // that is already visible with unchanged data — avoids innerHTML flash/re-init.
  const sig = computeDashSignature();
  if (lastDashSignature === sig && welcomeScreen && welcomeScreen.dataset.rendered === 'true') {
    return;
  }
  lastDashSignature = sig;

  renderDashboard(onSelectCat);
}

export async function renderDashboard(onSelectCat) {
  if (window.perf) window.perf.startMeasure('dashboard.renderDashboard');
  if (!welcomeScreen || welcomeScreen.style.display === 'none') return;

  const exportSpecialtySelect = document.getElementById('export-specialty-select');
  if (exportSpecialtySelect) {
    const activeCategories = Array.from(new Set(state.allCats.map(c => c.category))).sort();
    const currentValue = exportSpecialtySelect.value;
    exportSpecialtySelect.innerHTML = '<option value="">Choisir spécialité...</option>';
    activeCategories.forEach(cat => {
      const opt = document.createElement('option');
      opt.value = cat;
      opt.textContent = cat;
      if (cat === currentValue) opt.selected = true;
      exportSpecialtySelect.appendChild(opt);
    });
  }

  const stats = calculateStats(state.allCats);
  const total = stats.total;
  const totalCatsCountEl = document.getElementById('total-cats-count');
  if (totalCatsCountEl) {
    totalCatsCountEl.textContent = total;
  }
  const percent = total > 0 ? Math.round((stats.done / total) * 100) : 0;

  if (dashMasteryRate) {
    dashMasteryRate.textContent = `${percent}%`;
    const ring = document.getElementById('dash-mastery-ring');
    if (ring) {
      const radius = 22;
      const circumference = 2 * Math.PI * radius;
      const offset = circumference - (percent / 100) * circumference;
      ring.style.strokeDashoffset = offset;
    }
  }
  if (dashCountDone) dashCountDone.textContent = `${stats.done} / ${total}`;
  if (dashCountDoing) dashCountDoing.textContent = `${stats.doing} / ${total}`;
  if (dashCountTodo) dashCountTodo.textContent = `${stats.todo} / ${total}`;

  const streakCount = getStreakCount();
  const streakCountEl = document.getElementById('dash-streak-count');
  if (streakCountEl) {
    streakCountEl.textContent = `${streakCount} jour${streakCount > 1 ? 's' : ''}`;
  }

  const activeCats = state.allCats.filter(c => c.status === 'doing' || c.status === 'done');
  renderResumeList(resumeList, activeCats, onSelectCat);
  renderCategoryProgress(categoriesDiv, state.allCats);

  const firstRunBanner = document.getElementById('dash-first-run-banner');
  if (firstRunBanner) {
    const hasStarted = state.allCats.some(c => c.status !== 'todo' || c.notes);
    firstRunBanner.style.display = hasStarted ? 'none' : 'flex';
  }

  if (adminPanel) {
    adminPanel.style.display = state.isAdmin ? 'block' : 'none';
  }

  if (state.isAdmin) {
    await loadPendingSuggestions(suggestionsList);
  }

  lastDashSignature = computeDashSignature();
  if (welcomeScreen) welcomeScreen.dataset.rendered = 'true';

  if (window.perf) {
    window.perf.endMeasure('dashboard.renderDashboard');
    window.perf.recordMilestone('dashboardReady');
  }
}
