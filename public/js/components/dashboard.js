import { state } from '../state.js';
import * as api from '../api.js';
import { escapeHTML, exportDataFile, showToast } from '../utils.js';

// DOM Elements
let welcomeScreen, workspace, sidebar;
let dashMasteryRate, dashCountDone, dashCountDoing, dashCountTodo;
let resumeList, categoriesDiv, adminPanel, suggestionsList;
let suggestionCallback = null;

export function initDashboard(onSelectCat, onSuggestionHandled) {
  suggestionCallback = onSuggestionHandled;
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

  // Back to dashboard logo click listeners
  const brandLogo = document.getElementById('brand-logo');
  const mobileBrandLogo = document.getElementById('mobile-brand-logo');

  if (brandLogo) {
    brandLogo.addEventListener('click', () => showDashboard(onSelectCat));
  }
  if (mobileBrandLogo) {
    mobileBrandLogo.addEventListener('click', () => showDashboard(onSelectCat));
  }

  // --- Admin Tabbed Navigation Controller ---
  const adminTabBtns = document.querySelectorAll('.admin-tab-btn');
  adminTabBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      const targetId = btn.getAttribute('data-target');
      if (!targetId) return;

      // Block suggestions tab when dev-unlocked in offline mode
      if (targetId === 'admin-pane-suggestions' && window.__drCatDevDiagnosticsUnlocked) {
        return;
      }

      // Toggle buttons
      adminTabBtns.forEach(b => {
        b.classList.remove('active');
        b.style.color = 'var(--text-secondary)';
        b.style.backgroundColor = 'transparent';
      });
      btn.classList.add('active');
      btn.style.color = 'var(--color-primary)';
      btn.style.backgroundColor = 'rgba(6, 182, 212, 0.1)';

      // Toggle panes
      const panes = document.querySelectorAll('.admin-pane-content');
      panes.forEach(pane => {
        pane.style.display = 'none';
      });
      const activePane = document.getElementById(targetId);
      if (activePane) {
        activePane.style.display = 'block';
      }

      // Dispatch global tab changed event so components can activate/deactivate loops
      window.dispatchEvent(new CustomEvent('drcat-admin-tab-changed', {
        detail: { activePaneId: targetId }
      }));
    });
  });

  // Apply default styles to the active tab button on load
  const activeTabBtn = document.querySelector('.admin-tab-btn.active');
  if (activeTabBtn) {
    activeTabBtn.style.color = 'var(--color-primary)';
    activeTabBtn.style.backgroundColor = 'rgba(6, 182, 212, 0.1)';
  }

  // Register global window functions for inline onclick handlers in suggestions
  window.handleApproveSuggestion = async function(id) {
    if (!confirm("Voulez-vous vraiment accepter cette suggestion et l'intégrer à la base de données ?")) return;
    try {
      const result = await api.approveSuggestionOnServer(id);
      if (result.success) {
        showToast("Proposition approuvée !", "fa-circle-check", 3000);
        if (onSuggestionHandled) await onSuggestionHandled();
      } else {
        showToast("Erreur: " + result.error, "fa-circle-exclamation", 4000);
      }
    } catch (err) {
      console.error(err);
      if (window.handleAdminError && await window.handleAdminError(err)) {
        return;
      }
      showToast("Erreur lors de la validation.", "fa-circle-exclamation", 4000);
    }
  };

  window.handleRejectSuggestion = async function(id) {
    if (!confirm("Voulez-vous vraiment rejeter et supprimer cette proposition ?")) return;
    try {
      const result = await api.rejectSuggestionOnServer(id);
      if (result.success) {
        showToast("Proposition rejetée.", "fa-circle-xmark", 3000);
        if (onSuggestionHandled) await onSuggestionHandled();
      } else {
        showToast("Erreur: " + result.error, "fa-circle-exclamation", 4000);
      }
    } catch (err) {
      console.error(err);
      if (window.handleAdminError && await window.handleAdminError(err)) {
        return;
      }
      showToast("Erreur lors du rejet.", "fa-circle-exclamation", 4000);
    }
  };

  window.handleReviewSuggestion = async function(id) {
    try {
      showToast("Chargement des détails...", "fa-spinner fa-spin", 1500);
      const list = await api.fetchSuggestions();
      const sug = list.find(s => s.id === id);
      if (!sug) {
        showToast("Proposition introuvable.", "fa-circle-exclamation", 3000);
        return;
      }

      // Create review modal dynamically
      const modal = document.createElement('div');
      modal.id = 'suggestion-review-modal';
      modal.style.cssText = `
        position: fixed; top: 0; left: 0; width: 100%; height: 100%;
        background: rgba(0,0,0,0.85); z-index: 99999;
        display: flex; align-items: center; justify-content: center;
        padding: 20px; box-sizing: border-box;
      `;

      let fieldsHtml = '';
      if (sug.type === 'add') {
        fieldsHtml = `
          <div style="margin-bottom: 14px;">
            <label for="review-sug-title" style="display:block; font-size:11.5px; font-weight:600; color:var(--text-secondary); margin-bottom:6px; text-transform:uppercase; letter-spacing:0.5px;">Titre de la fiche</label>
            <input type="text" id="review-sug-title" value="${escapeHTML(sug.data.title || '')}" style="width:100%; padding:10px 12px; background:var(--bg-body); border:1px solid var(--border-color); border-radius:6px; color:var(--text-primary); font-size:13px; outline:none;">
          </div>
          <div style="margin-bottom: 14px;">
            <label for="review-sug-category" style="display:block; font-size:11.5px; font-weight:600; color:var(--text-secondary); margin-bottom:6px; text-transform:uppercase; letter-spacing:0.5px;">Spécialité</label>
            <input type="text" id="review-sug-category" value="${escapeHTML(sug.data.category || '')}" style="width:100%; padding:10px 12px; background:var(--bg-body); border:1px solid var(--border-color); border-radius:6px; color:var(--text-primary); font-size:13px; outline:none;">
          </div>
          <div style="margin-bottom: 14px;">
            <label for="review-sug-redflags" style="display:block; font-size:11.5px; font-weight:600; color:var(--text-secondary); margin-bottom:6px; text-transform:uppercase; letter-spacing:0.5px;">Red Flags (signes de gravité)</label>
            <textarea id="review-sug-redflags" rows="3" style="width:100%; padding:10px 12px; background:var(--bg-body); border:1px solid var(--border-color); border-radius:6px; color:var(--text-primary); font-size:13px; font-family:inherit; resize:vertical; outline:none;">${escapeHTML(sug.data.red_flags || '')}</textarea>
          </div>
        `;
      }

      fieldsHtml += `
        <div style="margin-bottom: 14px;">
          <label for="review-sug-summary" style="display:block; font-size:11.5px; font-weight:600; color:var(--text-secondary); margin-bottom:6px; text-transform:uppercase; letter-spacing:0.5px;">Synthèse de Conduite à Tenir</label>
          <textarea id="review-sug-summary" rows="12" style="width:100%; padding:12px; background:var(--bg-body); border:1px solid var(--border-color); border-radius:6px; color:var(--text-primary); font-family:monospace; font-size:12px; line-height:1.5; resize:vertical; outline:none;">${escapeHTML(sug.data.summary || '')}</textarea>
        </div>
        <div style="margin-bottom: 14px;">
          <label for="review-sug-ordonnance" style="display:block; font-size:11.5px; font-weight:600; color:var(--text-secondary); margin-bottom:6px; text-transform:uppercase; letter-spacing:0.5px;">Ordonnance Type</label>
          <textarea id="review-sug-ordonnance" rows="8" style="width:100%; padding:12px; background:var(--bg-body); border:1px solid var(--border-color); border-radius:6px; color:var(--text-primary); font-family:monospace; font-size:12px; line-height:1.5; resize:vertical; outline:none;">${escapeHTML(sug.data.ordonnance || '')}</textarea>
        </div>
      `;

      modal.innerHTML = `
        <div style="background: var(--bg-card); border: 1px solid var(--color-primary); border-radius: 12px; padding: 22px; max-width: 650px; width: 100%; max-height: 90vh; display: flex; flex-direction: column; box-shadow: var(--shadow-xl); font-family: inherit;">
          <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px; border-bottom: 1px solid var(--border-color); padding-bottom: 12px; flex-shrink: 0;">
            <h3 style="color: var(--color-primary); margin: 0; font-size: 15px; display: flex; align-items: center; gap: 8px; font-weight: 600;">
              <i class="fa-solid fa-pen-to-square"></i> Réviser & Éditer la proposition
            </h3>
            <button id="review-modal-close" style="background: none; border: none; color: var(--text-muted); cursor: pointer; font-size: 18px; display: flex; align-items: center;">
              <i class="fa-solid fa-xmark"></i>
            </button>
          </div>
          
          <div style="flex-grow: 1; overflow-y: auto; padding-right: 6px; margin-bottom: 18px;">
            ${fieldsHtml}
          </div>

          <div style="display: flex; gap: 12px; justify-content: flex-end; border-top: 1px solid var(--border-color); padding-top: 12px; flex-shrink: 0;">
            <button id="review-btn-cancel" style="padding: 10px 18px; background: none; border: 1px solid var(--border-color); border-radius: 6px; color: var(--text-secondary); cursor: pointer; font-size: 13px; font-weight: 500;">
              Annuler
            </button>
            <button id="review-btn-save" style="padding: 10px 18px; background: var(--color-success); border: none; border-radius: 6px; color: white; cursor: pointer; font-size: 13px; font-weight: 600; display:flex; align-items:center; gap:8px; box-shadow: 0 4px 12px rgba(16, 185, 129, 0.2);">
              <i class="fa-solid fa-floppy-disk"></i> Enregistrer les corrections
            </button>
          </div>
        </div>
      `;

      document.body.appendChild(modal);

      // Event listeners for close
      const closeModal = () => modal.remove();
      document.getElementById('review-modal-close').addEventListener('click', closeModal);
      document.getElementById('review-btn-cancel').addEventListener('click', closeModal);

      // Save listener
      document.getElementById('review-btn-save').addEventListener('click', async () => {
        try {
          const updatedData = {};
          if (sug.type === 'add') {
            updatedData.title = document.getElementById('review-sug-title').value;
            updatedData.category = document.getElementById('review-sug-category').value;
            updatedData.red_flags = document.getElementById('review-sug-redflags').value;
          }
          
          const summaryTextarea = document.getElementById('review-sug-summary');
          const ordonnanceTextarea = document.getElementById('review-sug-ordonnance');
          
          if (summaryTextarea) updatedData.summary = summaryTextarea.value;
          if (ordonnanceTextarea) updatedData.ordonnance = ordonnanceTextarea.value;

          const result = await api.updateSuggestionOnServer(id, updatedData);
          if (result.success) {
            showToast("Corrections enregistrées avec succès !", "fa-circle-check", 3000);
            modal.remove();
            await loadPendingSuggestions();
          } else {
            showToast("Erreur: " + result.error, "fa-circle-exclamation", 4000);
          }
        } catch (err) {
          console.error(err);
          showToast("Erreur lors de l'enregistrement.", "fa-circle-exclamation", 4000);
        }
      });
    } catch (err) {
      console.error(err);
      showToast("Impossible de charger les détails de cette proposition.", "fa-circle-exclamation", 4000);
    }
  };

  // Export progress handler
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

  // Import progress handlers
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
          // Simple validation check: ensure it is a key-value object containing status fields
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

  // --- Bulk Import Event Listeners ---
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
          showToast(`${result.count} fiches importées, ${result.skippedCount} ignorées (déjà existantes).`, 'fa-circle-check', 5000);
        } else if (result.count === 0 && result.skippedCount > 0) {
          showToast(`Aucune nouvelle fiche. Les ${result.skippedCount} fiches existaient déjà.`, 'fa-circle-exclamation', 5000);
        } else {
          showToast(`${result.count} fiches importées avec succès !`, 'fa-circle-check', 4000);
        }
        
        // Clear state
        importData = null;
        if (bulkImportInput) bulkImportInput.value = '';
        if (bulkImportFileName) bulkImportFileName.textContent = 'Aucun fichier sélectionné';
        bulkImportSubmitBtn.disabled = true;
        bulkImportSubmitBtn.style.opacity = '0.5';
        bulkImportSubmitBtn.style.cursor = 'not-allowed';
        bulkImportSubmitBtn.innerHTML = '<i class="fa-solid fa-cloud-arrow-up"></i> Importer';
        
        // Trigger app reload/sync dynamically
        if (suggestionCallback) await suggestionCallback();
      } catch (err) {
        showToast(`Échec de l'importation: ${err.message}`, 'fa-triangle-exclamation', 4000);
        bulkImportSubmitBtn.disabled = false;
        bulkImportSubmitBtn.innerHTML = '<i class="fa-solid fa-cloud-arrow-up"></i> Importer';
      }
    });
  }

  // --- Export Specialty Button Event Listener ---
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

  // --- PDF Uploader Event Listeners ---
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
        
        // Reset state
        pdfBase64Data = null;
        pdfFileObject = null;
        if (pdfInput) pdfInput.value = '';
        if (pdfFilename) pdfFilename.textContent = 'Aucun fichier sélectionné';
        pdfSubmitBtn.disabled = true;
        pdfSubmitBtn.style.opacity = '0.5';
        pdfSubmitBtn.style.cursor = 'not-allowed';
        pdfSubmitBtn.innerHTML = '<i class="fa-solid fa-cloud-arrow-up"></i> Uploader';
        
        // Trigger app reload/sync dynamically to fetch index updates
        if (suggestionCallback) await suggestionCallback();
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
  // Remove active styling from list items
  document.querySelectorAll('.cat-item').forEach(item => item.classList.remove('active'));
  
  if (workspace) workspace.style.display = 'none';
  if (welcomeScreen) welcomeScreen.style.display = 'flex';
  const quizScreen = document.getElementById('quiz-screen');
  if (quizScreen) quizScreen.style.display = 'none';
  
  // Close sidebar on mobile
  if (window.innerWidth <= 850 && sidebar) {
    sidebar.classList.remove('open');
  }

  renderDashboard(onSelectCat);
}

export function renderDashboard(onSelectCat) {
  if (window.perf) window.perf.startMeasure('dashboard.renderDashboard');
  if (!welcomeScreen || welcomeScreen.style.display === 'none') return;

  // Populate Export Specialty Dropdown
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

  // 1. Calculate stats and update values
  let todo = 0, doing = 0, done = 0;
  state.allCats.forEach(cat => {
    if (cat.status === 'done') done++;
    else if (cat.status === 'doing') doing++;
    else todo++;
  });

  const total = state.allCats.length;
  const totalCatsCountEl = document.getElementById('total-cats-count');
  if (totalCatsCountEl) {
    totalCatsCountEl.textContent = total;
  }
  const percent = total > 0 ? Math.round((done / total) * 100) : 0;

  if (dashMasteryRate) {
    dashMasteryRate.textContent = `${percent}%`;
    const ring = document.getElementById('dash-mastery-ring');
    if (ring) {
      const radius = 22;
      const circumference = 2 * Math.PI * radius; // 138.23
      const offset = circumference - (percent / 100) * circumference;
      ring.style.strokeDashoffset = offset;
    }
  }
  if (dashCountDone) dashCountDone.textContent = `${done} / ${total}`;
  if (dashCountDoing) dashCountDoing.textContent = `${doing} / ${total}`;
  if (dashCountTodo) dashCountTodo.textContent = `${todo} / ${total}`;

  let streakCount = 0;
  try {
    const streakInfo = JSON.parse(localStorage.getItem('dr_cat_streak') || '{"count": 0}');
    streakCount = (streakInfo && typeof streakInfo.count === 'number') ? streakInfo.count : 0;
  } catch (e) {
    console.warn("Failed to parse study streak info", e);
  }
  const streakCountEl = document.getElementById('dash-streak-count');
  if (streakCountEl) {
    streakCountEl.textContent = `${streakCount} jour${streakCount > 1 ? 's' : ''}`;
  }

  // 2. Populate "Reprendre la révision" (Resume list)
  if (resumeList) {
    resumeList.innerHTML = '';
    
    // Sort active cats by last read timestamp
    const activeCats = state.allCats
      .filter(c => c.status === 'doing' || c.status === 'done')
      .sort((a, b) => (b.lastRead || 0) - (a.lastRead || 0));

    if (activeCats.length === 0) {
      resumeList.innerHTML = '<li class="empty-state">Aucun cours en cours. Sélectionnez un cours dans la barre latérale pour commencer !</li>';
    } else {
      activeCats.slice(0, 3).forEach(cat => {
        const li = document.createElement('li');
        li.innerHTML = `
          <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
            <div>
              <span class="resume-title" style="font-weight: 500; cursor: pointer; color: var(--color-primary);">${cat.id}. ${cat.title}</span>
              <span style="font-size: 11px; color: var(--text-muted); display: block;">Spécialité : ${cat.category}</span>
            </div>
            <span class="badge ${cat.status === 'done' ? 'badge-success' : 'badge-warning'}" style="font-size: 11px; padding: 2px 8px; border-radius: 4px;">
              ${cat.status === 'done' ? 'Maîtrisé' : 'En cours'}
            </span>
          </div>
        `;
        li.querySelector('.resume-title').addEventListener('click', () => onSelectCat(cat));
        resumeList.appendChild(li);
      });
    }
  }

  // 3. Populate Categories progress breakdown
  if (categoriesDiv) {
    categoriesDiv.innerHTML = '';

    // Group cats by category
    const categoriesMap = {};
    state.allCats.forEach(cat => {
      if (!categoriesMap[cat.category]) {
        categoriesMap[cat.category] = { total: 0, done: 0 };
      }
      categoriesMap[cat.category].total++;
      if (cat.status === 'done') {
        categoriesMap[cat.category].done++;
      }
    });

    Object.keys(categoriesMap).forEach(catName => {
      const info = categoriesMap[catName];
      const catPercent = info.total > 0 ? Math.round((info.done / info.total) * 100) : 0;
      
      const item = document.createElement('div');
      item.className = 'category-progress-item';
      item.innerHTML = `
        <div class="category-progress-info">
          <span>${catName}</span>
          <span>${info.done}/${info.total} (${catPercent}%)</span>
        </div>
        <div class="progress-bar-bg">
          <div class="progress-bar-fill" style="width: ${catPercent}%"></div>
        </div>
      `;
      categoriesDiv.appendChild(item);
    });
  }

  // 4. Update the callout first-run banner if needed
  const firstRunBanner = document.getElementById('dash-first-run-banner');
  if (firstRunBanner) {
    const hasStarted = state.allCats.some(c => c.status !== 'todo' || c.notes);
    firstRunBanner.style.display = hasStarted ? 'none' : 'flex';
  }

  // 5. Load Admin suggestions panel
  const devUnlocked = !!window.__drCatDevDiagnosticsUnlocked;
  if (adminPanel) {
    adminPanel.style.display = (state.isAdmin || devUnlocked) ? 'block' : 'none';
  }

  if (state.isAdmin) {
    loadPendingSuggestions();
  } else if (devUnlocked) {
    // Dev unlock: show panel but do NOT load suggestions or enable admin CRUD
    autoSelectDevTab();
  }

  if (window.perf) {
    window.perf.endMeasure('dashboard.renderDashboard');
    window.perf.recordMilestone('dashboardReady');
  }
}

function autoSelectDevTab() {
  const diagTab = document.querySelector('.admin-tab-btn[data-target="admin-pane-diagnostics"]');
  if (diagTab) {
    diagTab.click();
  }
  disableAdminTabsForDev();
}

function disableAdminTabsForDev() {
  const sugTab = document.querySelector('.admin-tab-btn[data-target="admin-pane-suggestions"]');
  if (sugTab) {
    sugTab.style.opacity = '0.4';
    sugTab.style.pointerEvents = 'none';
    sugTab.style.filter = 'grayscale(1)';
  }
}

export async function loadPendingSuggestions() {
  if (!state.isAdmin || !suggestionsList) return;

  try {
    const list = await api.fetchSuggestions();

    if (list.length === 0) {
      suggestionsList.innerHTML = '<p class="text-muted text-center" style="padding: 10px 0;">Aucune proposition en attente.</p>';
      return;
    }

    let html = '';
    list.forEach(sug => {
      const formattedDate = new Date(sug.timestamp).toLocaleString('fr-FR');
      const badgeClass = sug.type === 'add' ? 'add' : 'edit';
      const badgeText = sug.type === 'add' ? 'Ajout de fiche' : `Modif de fiche (ID: ${sug.catId})`;
      
      let diffHtml = '';
      if (sug.type === 'add') {
        diffHtml = `<strong>Titre :</strong> ${escapeHTML(sug.data.title)}<br>
                    <strong>Spécialité :</strong> ${escapeHTML(sug.data.category)}<br>
                    <strong>Red Flags :</strong> ${escapeHTML(sug.data.red_flags) || 'Aucun'}<br>
                    <strong>Synthèse (extrait) :</strong> ${sug.data.summary ? escapeHTML(sug.data.summary.substring(0, 150)) + '...' : 'Aucune'}<br>
                    <strong>Ordonnance (extrait) :</strong> ${sug.data.ordonnance ? escapeHTML(sug.data.ordonnance.substring(0, 100)) + '...' : 'Aucune'}`;
      } else if (sug.type === 'edit') {
        const parentCat = state.allCats.find(c => c.id === parseInt(sug.catId));
        const originalTitle = parentCat ? parentCat.title : `Fiche ${sug.catId}`;
        
        diffHtml = `<strong>Fiche ciblée :</strong> ${escapeHTML(originalTitle)}<br>`;
        if (sug.data.summary) {
          const previewText = sug.data.summary.length > 200 ? escapeHTML(sug.data.summary.substring(0, 200)) + '...' : escapeHTML(sug.data.summary);
          diffHtml += `<strong>Proposition Synthèse (extrait) :</strong><div class="suggestion-diff-container" style="max-height: 90px; overflow: hidden; text-overflow: ellipsis; white-space: pre-wrap; font-family: monospace; font-size:12px; background: rgba(0,0,0,0.15); padding: 8px; border-radius: 4px; margin-top: 4px;">${previewText}</div>`;
        }
        if (sug.data.ordonnance) {
          const previewText = sug.data.ordonnance.length > 150 ? escapeHTML(sug.data.ordonnance.substring(0, 150)) + '...' : escapeHTML(sug.data.ordonnance);
          diffHtml += `<strong>Proposition Ordonnance (extrait) :</strong><div class="suggestion-diff-container" style="max-height: 80px; overflow: hidden; text-overflow: ellipsis; white-space: pre-wrap; font-family: monospace; font-size:12px; background: rgba(0,0,0,0.15); padding: 8px; border-radius: 4px; margin-top: 4px;">${previewText}</div>`;
        }
      }

      html += `
        <div class="suggestion-card" data-sug-id="${escapeHTML(sug.id)}">
          <div class="suggestion-header">
            <span class="suggestion-badge ${badgeClass}">${badgeText}</span>
            <span class="suggestion-time">${formattedDate}</span>
          </div>
          <div class="suggestion-body" style="margin-bottom: 12px;">
            <div style="font-size: 13px; line-height: 1.5;">${diffHtml}</div>
          </div>
          <div class="suggestion-actions" style="display: flex; gap: 8px;">
            <button class="suggestion-btn btn-reject" data-action="reject" style="flex: 1;">
              <i class="fa-solid fa-xmark"></i> Rejeter
            </button>
            <button class="suggestion-btn btn-review" data-action="review" style="flex: 1; background: rgba(99, 102, 241, 0.15); color: #a5b4fc; border: 1px solid rgba(99, 102, 241, 0.3);">
              <i class="fa-solid fa-pen-to-square"></i> Réviser
            </button>
            <button class="suggestion-btn btn-approve" data-action="approve" style="flex: 1;">
              <i class="fa-solid fa-check"></i> Accepter
            </button>
          </div>
        </div>
      `;
    });

    suggestionsList.innerHTML = html;

    // Event delegation for approve/reject/review buttons
    suggestionsList.querySelectorAll('[data-action="approve"]').forEach(btn => {
      btn.addEventListener('click', async (e) => {
        const card = e.target.closest('.suggestion-card');
        if (!card) return;
        const id = card.getAttribute('data-sug-id');
        if (id && window.handleApproveSuggestion) {
          await window.handleApproveSuggestion(id);
        }
      });
    });
    suggestionsList.querySelectorAll('[data-action="review"]').forEach(btn => {
      btn.addEventListener('click', async (e) => {
        const card = e.target.closest('.suggestion-card');
        if (!card) return;
        const id = card.getAttribute('data-sug-id');
        if (id && window.handleReviewSuggestion) {
          await window.handleReviewSuggestion(id);
        }
      });
    });
    suggestionsList.querySelectorAll('[data-action="reject"]').forEach(btn => {
      btn.addEventListener('click', async (e) => {
        const card = e.target.closest('.suggestion-card');
        if (!card) return;
        const id = card.getAttribute('data-sug-id');
        if (id && window.handleRejectSuggestion) {
          await window.handleRejectSuggestion(id);
        }
      });
    });
  } catch (err) {
    console.error("Failed to load suggestions:", err);
    suggestionsList.innerHTML = '<p class="text-danger text-center" style="padding: 10px 0;">Erreur lors du chargement des propositions.</p>';
  }
}
