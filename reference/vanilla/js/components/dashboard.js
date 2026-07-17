import { state } from '../state.js';
import * as api from '../api.js';
import { exportDataFile, showToast } from '../utils.js';
import { calculateStats, getStreakCount } from './dashboard/stats.js';
import { renderResumeList } from './dashboard/resume.js';
import { renderCategoryProgress } from './dashboard/progress.js';
import { initAdminTabListeners, autoSelectDevTab, loadPendingSuggestions } from './dashboard/admin.js';

let welcomeScreen, workspace, sidebar;
let dashMasteryRate, dashCountDone, dashCountDoing, dashCountTodo;
let resumeList, categoriesDiv, adminPanel, suggestionsList;

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

  const pdfInput = document.getElementById('diag-pdf-upload-input');
  const pdfTriggerBtn = document.getElementById('diag-pdf-upload-trigger-btn');
  const pdfFilename = document.getElementById('diag-pdf-upload-filename');
  const pdfSubmitBtn = document.getElementById('diag-pdf-upload-submit-btn');

  let pdfBase64Data = null;
  let pdfFileObject = null;

  if (pdfTriggerBtn && pdfInput) {
    pdfTriggerBtn.addEventListener('click', () => pdfInput.click());
  }

  if (pdfInput) {
    pdfInput.addEventListener('change', (e) => {
      const file = e.target.files[0];
      if (!file) {
        if (pdfFilename) pdfFilename.textContent = 'Aucun fichier sélectionné';
        if (pdfSubmitBtn) {
          pdfSubmitBtn.disabled = true;
          pdfSubmitBtn.style.opacity = '0.5';
          pdfSubmitBtn.style.cursor = 'not-allowed';
        }
        pdfBase64Data = null;
        pdfFileObject = null;
        return;
      }

      if (pdfFilename) pdfFilename.textContent = file.name;
      pdfFileObject = file;

      const reader = new FileReader();
      reader.onload = (event) => {
        pdfBase64Data = event.target.result.split(',')[1];
        if (pdfSubmitBtn) {
          pdfSubmitBtn.disabled = false;
          pdfSubmitBtn.style.opacity = '1';
          pdfSubmitBtn.style.cursor = 'pointer';
        }
      };
      reader.onerror = () => {
        showToast("Erreur lors de la lecture du fichier PDF", "fa-triangle-exclamation", 4000);
        if (pdfFilename) pdfFilename.textContent = 'Erreur';
        pdfBase64Data = null;
        pdfFileObject = null;
      };
      reader.readAsDataURL(file);
    });
  }

  if (pdfSubmitBtn) {
    pdfSubmitBtn.addEventListener('click', async () => {
      if (!pdfBase64Data || !pdfFileObject) return;

      try {
        pdfSubmitBtn.disabled = true;
        pdfSubmitBtn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Uploader';

        await api.uploadPdf(pdfFileObject.name, pdfBase64Data);
        showToast("Fichier PDF uploadé ! Indexation lancée.", "fa-circle-check", 3000);

        pdfBase64Data = null;
        pdfFileObject = null;
        if (pdfInput) pdfInput.value = '';
        if (pdfFilename) pdfFilename.textContent = 'Aucun fichier sélectionné';
        pdfSubmitBtn.disabled = true;
        pdfSubmitBtn.style.opacity = '0.5';
        pdfSubmitBtn.style.cursor = 'not-allowed';
        pdfSubmitBtn.innerHTML = '<i class="fa-solid fa-cloud-arrow-up"></i> Uploader';

        if (onSuggestionHandled) await onSuggestionHandled();
      } catch (err) {
        showToast(`Échec de l'upload: ${err.message}`, "fa-triangle-exclamation", 4000);
        pdfSubmitBtn.disabled = false;
        pdfSubmitBtn.innerHTML = '<i class="fa-solid fa-cloud-arrow-up"></i> Uploader';
      }
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

  const devUnlocked = !!window.__drCatDevDiagnosticsUnlocked;
  if (adminPanel) {
    adminPanel.style.display = (state.isAdmin || devUnlocked) ? 'block' : 'none';
  }

  if (state.isAdmin) {
    await loadPendingSuggestions(suggestionsList);
  } else if (devUnlocked) {
    autoSelectDevTab();
  }

  if (window.perf) {
    window.perf.endMeasure('dashboard.renderDashboard');
    window.perf.recordMilestone('dashboardReady');
  }
}
