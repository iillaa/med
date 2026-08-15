import { state, getLocalProgress, saveLocalProgress } from '../state.js';
import * as api from '../api.js';
import { parseSummaryMarkdown, escapeHTML, showToast, runSuggestionWithUI, setButtonLoading, triggerHaptic, prefersReducedMotion } from '../utils.js';
import { buildPrintableText } from './workspace/state.js';
import { renderSummary } from './workspace/summary.js';
import { renderPrescription } from './workspace/prescription.js';
import { createPdfCardElement, renderAllPdfsList, filterAllPdfsList } from './workspace/pdfs.js';
import { saveAppStateBeforeNavigation, restoreAppState, printCatDocument } from './workspace/print.js';

let workspace, welcomeScreen;
let wsCategory, wsTitle, wsRedFlags, wsPrescription, notesInput;
let summaryView, summaryEditor, summaryEditorWrapper;
let editSummaryBtn, cancelSummaryEditBtn, saveSummaryBtn;
let saveNotesBtn, saveIndicator, copyPrescriptionBtn;
let currentDateSpan, pdfListContainer;
let allPdfsHeader, allPdfsContent, allPdfsAccordion, pdfSearch;
let pdfContentSearchInput, pdfContentSearchBtn, pdfIndexStatus, pdfReindexBtn;

export function initWorkspace(onStatusChange, onCatDeleted, onProgressReset) {
  workspace = document.getElementById('workspace');
  welcomeScreen = document.getElementById('welcome-screen');

  wsCategory = document.getElementById('workspace-cat-category');
  wsTitle = document.getElementById('workspace-cat-title');
  wsRedFlags = document.getElementById('workspace-red-flags');
  wsPrescription = document.getElementById('workspace-prescription');
  notesInput = document.getElementById('notes-input');

  summaryView = document.getElementById('summary-view');
  summaryEditor = document.getElementById('summary-editor');
  summaryEditorWrapper = document.getElementById('summary-editor-wrapper');
  editSummaryBtn = document.getElementById('edit-summary-btn');
  cancelSummaryEditBtn = document.getElementById('cancel-summary-edit-btn');
  saveSummaryBtn = document.getElementById('save-summary-btn');

  saveNotesBtn = document.getElementById('save-notes-btn');
  saveIndicator = document.getElementById('save-indicator');
  copyPrescriptionBtn = document.getElementById('copy-prescription-btn');
  currentDateSpan = document.getElementById('current-date');
  pdfListContainer = document.getElementById('pdf-list');

  allPdfsHeader = document.getElementById('all-pdfs-header');
  allPdfsContent = document.getElementById('all-pdfs-content');
  allPdfsAccordion = allPdfsHeader ? allPdfsHeader.parentElement : null;
  pdfSearch = document.getElementById('pdf-search');

  pdfContentSearchInput = document.getElementById('pdf-content-search-input');
  pdfContentSearchBtn = document.getElementById('pdf-content-search-btn');
  pdfIndexStatus = document.getElementById('pdf-index-status');
  pdfReindexBtn = document.getElementById('pdf-reindex-btn');

  if (currentDateSpan) {
    const now = new Date();
    currentDateSpan.textContent = now.toLocaleDateString('fr-FR');
  }

  const redFlagsBanner = document.getElementById('red-flags-banner');
  if (redFlagsBanner) {
    redFlagsBanner.addEventListener('click', () => {
      if (window.innerWidth <= 850) {
        redFlagsBanner.classList.toggle('expanded');
      }
    });
  }

  const tabButtons = document.querySelectorAll('.tab-btn');
  tabButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      tabButtons.forEach(b => { b.classList.remove('active'); b.setAttribute('aria-selected', 'false'); });
      document.querySelectorAll('.tab-pane').forEach(p => p.classList.remove('active'));

      btn.classList.add('active');
      btn.setAttribute('aria-selected', 'true');
      try { btn.scrollIntoView({ behavior: 'smooth', inline: 'center', block: 'nearest' }); } catch (_) {}
      const paneId = btn.getAttribute('data-tab');
      const pane = document.getElementById(paneId);
      if (pane) pane.classList.add('active');

      if (paneId === 'tab-pdfs') {
        renderAllPdfsList(state.allPdfs);
        if (state.activeCat) loadRelatedPdfs(state.activeCat);
      } else if (paneId === 'tab-search-pdf') {
        if (pdfContentSearchInput) pdfContentSearchInput.focus();
      }

      const tabContentContainer = document.querySelector('.tab-content-container');
      if (tabContentContainer) {
        tabContentContainer.scrollTop = 0;
      }
    });
  });

  const statusButtons = document.querySelectorAll('.status-btn');
  statusButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      if (!state.activeCat) return;
      const status = btn.getAttribute('data-status');

      statusButtons.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      state.activeCat.status = status;
      state.activeCat.lastRead = Date.now();

      const progress = getLocalProgress();
      if (!progress[state.activeCat.id]) progress[state.activeCat.id] = {};
      progress[state.activeCat.id].status = status;
      progress[state.activeCat.id].notes = state.activeCat.notes || '';
      progress[state.activeCat.id].lastRead = Date.now();
      saveLocalProgress(progress);

      onStatusChange(state.activeCat);

      if (status === 'doing' || status === 'done') {
        const activeCount = Object.values(getLocalProgress())
          .filter(p => p.status === 'doing' || p.status === 'done').length;
        if (activeCount === 20) {
          showToast(
            '<strong>Beau travail, 20 fiches en cours ! 🎉</strong><br>Pensez à exporter votre progression via le tableau de bord pour ne rien perdre.',
            'fa-floppy-disk',
            8000
          );
        }
      }
    });
  });

  if (saveNotesBtn) {
    saveNotesBtn.addEventListener('click', () => {
      if (!state.activeCat) return;
      const restore = setButtonLoading(saveNotesBtn, '<i class="fa-solid fa-floppy-disk"></i> Sauvegarder');

      state.activeCat.notes = notesInput.value;
      state.activeCat.lastRead = Date.now();

      const progress = getLocalProgress();
      if (!progress[state.activeCat.id]) progress[state.activeCat.id] = {};
      progress[state.activeCat.id].status = state.activeCat.status || 'todo';
      progress[state.activeCat.id].notes = state.activeCat.notes;
      progress[state.activeCat.id].lastRead = Date.now();
      saveLocalProgress(progress);

      saveIndicator.classList.add('show');
      setTimeout(() => {
        saveIndicator.classList.remove('show');
      }, 2500);

      triggerHaptic(true);

      setTimeout(() => {
        restore();
        showToast(
          'Notes sauvegardées localement. Exportez régulièrement vos données depuis le <strong>tableau de bord</strong> pour les sécuriser.',
          'fa-cloud-arrow-up',
          6000
        );
      }, 400);
    });
  }

  const backToQuizBtn = document.getElementById('workspace-back-to-quiz-btn');
  if (backToQuizBtn) {
    backToQuizBtn.addEventListener('click', () => {
      state.quizSession.quizViewingCatId = null;
      if (workspace) workspace.style.display = 'none';
      const quizScreen = document.getElementById('quiz-screen');
      if (quizScreen) quizScreen.style.display = 'flex';
      document.querySelectorAll('.cat-item').forEach(item => item.classList.remove('active'));
    });
  }

  const printCatBtn = document.getElementById('print-cat-btn');
  if (printCatBtn) {
    printCatBtn.addEventListener('click', async () => {
      const cat = state.activeCat;
      if (!cat) return;

      // Android Native App / Capacitor Clipboard Copier
      if (typeof window.Capacitor !== 'undefined' || api.isOfflineApp) {
        const text = buildPrintableText(cat);
        if (navigator.clipboard && navigator.clipboard.writeText) {
          try {
            await navigator.clipboard.writeText(text);
            showToast("Fiche complète (avec sous-fiches) copiée dans le presse-papier !", "fa-clipboard-check", 4000);
          } catch (_) {
            showToast("L'impression native n'est pas disponible. Utilisez la version web.", "fa-circle-info", 5000);
          }
        } else {
          showToast("L'impression native n'est pas disponible. Utilisez la version web.", "fa-circle-info", 5000);
        }
      } else {
        // Desktop Web / Browser: Render 100% standalone Doctor-Grade Multi-Page PDF Document
        printCatDocument(cat);
      }
    });
  }

  if (editSummaryBtn) {
    editSummaryBtn.addEventListener('click', () => {
      summaryView.style.display = 'none';
      summaryEditorWrapper.style.display = 'flex';
      const isSub = state.activeSubCatIndex > 0 && Array.isArray(state.activeCat?.sub_cats);
      summaryEditor.value = isSub
        ? (state.activeCat.sub_cats[state.activeSubCatIndex - 1].summary || '')
        : (state.activeCat?.summary || '');
    });
  }

  if (cancelSummaryEditBtn) {
    cancelSummaryEditBtn.addEventListener('click', () => {
      summaryView.style.display = 'block';
      summaryEditorWrapper.style.display = 'none';
    });
  }

  if (saveSummaryBtn) {
    saveSummaryBtn.addEventListener('click', async () => {
      if (!state.activeCat) return;
      const newSummary = summaryEditor.value;

      if (!newSummary.trim()) {
        showToast("La synthèse ne peut pas être vide.", "fa-triangle-exclamation", 3000);
        return;
      }

      const restore = setButtonLoading(saveSummaryBtn);

      try {
        const isSub = state.activeSubCatIndex > 0 && Array.isArray(state.activeCat.sub_cats);
        if (state.isAdmin) {
          let result;
          if (isSub) {
            state.activeCat.sub_cats[state.activeSubCatIndex - 1].summary = newSummary;
            result = await api.saveCatDataToServer(state.activeCat.id, { sub_cats: state.activeCat.sub_cats });
          } else {
            result = await api.saveCatDataToServer(state.activeCat.id, { summary: newSummary });
          }

          if (result.success) {
            if (!isSub) state.activeCat.summary = newSummary;
            const itemInAll = (state.allCats || []).find(c => c.id === state.activeCat.id);
            if (itemInAll) {
              if (isSub) itemInAll.sub_cats = state.activeCat.sub_cats;
              else itemInAll.summary = newSummary;
            }
            const subLabel = isSub ? state.activeCat.sub_cats[state.activeSubCatIndex - 1].label : null;
            renderSummary(newSummary, state.activeCat, subLabel);
            showToast(isSub ? "Sous-fiche mise à jour avec succès !" : "Synthèse mise à jour avec succès !", "fa-circle-check", 2500);
            triggerHaptic(true);
          } else {
            showToast("Erreur: " + result.error, "fa-circle-exclamation", 4000);
            triggerHaptic(false);
          }
        } else {
          const confirmSave = confirm(
            "Attention : Vos modifications ne seront pas appliquées directement dans l'application. Elles seront envoyées à l'administrateur du site pour relecture et validation avant d'être intégrées.\n\nSouhaitez-vous envoyer cette proposition ?"
          );
          if (!confirmSave) {
            restore();
            return;
          }

          const clonedSubCats = isSub ? JSON.parse(JSON.stringify(state.activeCat.sub_cats)) : null;
          if (clonedSubCats) {
            clonedSubCats[state.activeSubCatIndex - 1].summary = newSummary;
          }

          await runSuggestionWithUI(
            api.submitSuggestion,
            {
              type: 'edit',
              catId: state.activeCat.id,
              data: isSub ? { sub_cats: clonedSubCats } : { summary: newSummary }
            },
            "Votre proposition de modification a été envoyée à l'administrateur pour validation."
          );
        }
      } catch (err) {
        console.error(err);
        if (window.handleAdminError && await window.handleAdminError(err)) {
          restore();
          return;
        }
        showToast("Erreur lors de la sauvegarde.", "fa-circle-exclamation", 4000);
        triggerHaptic(false);
      } finally {
        restore();
      }

      summaryView.style.display = 'block';
      summaryEditorWrapper.style.display = 'none';
    });
  }

  if (copyPrescriptionBtn) {
    copyPrescriptionBtn.addEventListener('click', () => {
      let textToCopy = '';
      if (state.prescriptionVariants.length > 0 && state.prescriptionVariants[state.activePrescriptionVariantIndex]) {
        textToCopy = state.prescriptionVariants[state.activePrescriptionVariantIndex].content;
      } else {
        textToCopy = wsPrescription.innerText;
      }
      navigator.clipboard.writeText(textToCopy).then(() => {
        const originalText = copyPrescriptionBtn.innerHTML;
        copyPrescriptionBtn.innerHTML = '<i class="fa-solid fa-check"></i> Copié !';
        setTimeout(() => {
          copyPrescriptionBtn.innerHTML = originalText;
        }, 2000);
      });
    });
  }

  const editPrescriptionBtn = document.getElementById('edit-prescription-btn');
  const cancelPrescriptionEditBtn = document.getElementById('cancel-prescription-edit-btn');
  const savePrescriptionBtn = document.getElementById('save-prescription-btn');
  const prescriptionEditor = document.getElementById('prescription-editor');
  const prescriptionEditorActions = document.getElementById('prescription-editor-actions');

  if (editPrescriptionBtn) {
    editPrescriptionBtn.addEventListener('click', () => {
      wsPrescription.style.display = 'none';
      prescriptionEditor.style.display = 'block';
      prescriptionEditorActions.style.display = 'flex';
      const isSub = state.activeSubCatIndex > 0 && Array.isArray(state.activeCat?.sub_cats);
      prescriptionEditor.value = isSub
        ? (state.activeCat.sub_cats[state.activeSubCatIndex - 1].ordonnance || '')
        : (state.activeCat?.ordonnance || '');
    });
  }

  if (cancelPrescriptionEditBtn) {
    cancelPrescriptionEditBtn.addEventListener('click', () => {
      wsPrescription.style.display = 'block';
      prescriptionEditor.style.display = 'none';
      prescriptionEditorActions.style.display = 'none';
    });
  }

  if (savePrescriptionBtn) {
    savePrescriptionBtn.addEventListener('click', async () => {
      if (!state.activeCat) return;
      const newOrdonnance = prescriptionEditor.value;

      if (!newOrdonnance.trim()) {
        showToast("L'ordonnance ne peut pas être vide.", "fa-triangle-exclamation", 3000);
        return;
      }

      const restore = setButtonLoading(savePrescriptionBtn);

      try {
        const isSub = state.activeSubCatIndex > 0 && Array.isArray(state.activeCat.sub_cats);
        if (state.isAdmin) {
          let result;
          if (isSub) {
            state.activeCat.sub_cats[state.activeSubCatIndex - 1].ordonnance = newOrdonnance;
            result = await api.saveCatDataToServer(state.activeCat.id, { sub_cats: state.activeCat.sub_cats });
          } else {
            result = await api.saveCatDataToServer(state.activeCat.id, { ordonnance: newOrdonnance });
          }

          if (result.success) {
            if (!isSub) state.activeCat.ordonnance = newOrdonnance;
            const itemInAll = (state.allCats || []).find(c => c.id === state.activeCat.id);
            if (itemInAll) {
              if (isSub) itemInAll.sub_cats = state.activeCat.sub_cats;
              else itemInAll.ordonnance = newOrdonnance;
            }
            renderPrescription(newOrdonnance);
            showToast(isSub ? "Ordonnance de la sous-fiche mise à jour !" : "Ordonnance type mise à jour avec succès !", "fa-circle-check", 2500);
            triggerHaptic(true);
          } else {
            showToast("Erreur: " + result.error, "fa-circle-exclamation", 4000);
            triggerHaptic(false);
          }
        } else {
          const confirmSave = confirm(
            "Attention : Vos modifications ne seront pas appliquées directement dans l'application. Elles seront envoyées à l'administrateur du site pour relecture et validation avant d'être intégrées.\n\nSouhaitez-vous envoyer cette proposition ?"
          );
          if (!confirmSave) {
            restore();
            return;
          }

          const clonedSubCats = isSub ? JSON.parse(JSON.stringify(state.activeCat.sub_cats)) : null;
          if (clonedSubCats) {
            clonedSubCats[state.activeSubCatIndex - 1].ordonnance = newOrdonnance;
          }

          await runSuggestionWithUI(
            api.submitSuggestion,
            {
              type: 'edit',
              catId: state.activeCat.id,
              data: isSub ? { sub_cats: clonedSubCats } : { ordonnance: newOrdonnance }
            },
            "Votre proposition de modification de l'ordonnance a été envoyée à l'administrateur pour validation."
          );
        }
      } catch (err) {
        console.error(err);
        if (window.handleAdminError && await window.handleAdminError(err)) {
          restore();
          return;
        }
        showToast("Erreur lors de la sauvegarde.", "fa-circle-exclamation", 4000);
      } finally {
        restore();
      }

      wsPrescription.style.display = 'block';
      prescriptionEditor.style.display = 'none';
      prescriptionEditorActions.style.display = 'none';
    });
  }

  if (allPdfsHeader) {
    allPdfsHeader.addEventListener('click', () => {
      const isOpen = allPdfsAccordion.classList.contains('open');
      if (isOpen) {
        allPdfsAccordion.classList.remove('open');
        allPdfsContent.style.display = 'none';
      } else {
        allPdfsAccordion.classList.add('open');
        allPdfsContent.style.display = 'block';
        renderAllPdfsList(state.allPdfs);
      }
    });
  }

  if (pdfSearch) {
    pdfSearch.addEventListener('input', filterAllPdfsList);
  }

  const deleteCatBtn = document.getElementById('delete-cat-btn');
  if (deleteCatBtn) {
    deleteCatBtn.addEventListener('click', async () => {
      if (!state.activeCat) return;
      const catToDelete = state.activeCat;
      const catId = catToDelete.id;
      const catTitle = catToDelete.title;

      if (!confirm(`Voulez-vous vraiment supprimer définitivement la fiche "${catTitle}" (ID: ${catId}) ?`)) {
        return;
      }

      try {
        const res = await api.deleteCatFromServer(catId);
        if (res && (res.success || res.message)) {
          showToast(`La fiche "${escapeHTML(catTitle)}" a été supprimée avec succès.`, "fa-circle-check", 4000);
          
          // Remove from local state
          state.allCats = state.allCats.filter(c => c.id !== catId);
          
          if (onCatDeleted) await onCatDeleted(catId);
          else if (onProgressReset) await onProgressReset();
          
          selectCat(null);
        } else {
          showToast(escapeHTML(res.error || "Échec de la suppression de la fiche."), "fa-triangle-exclamation", 4000);
        }
      } catch (err) {
        console.error('[Delete CAT Error]', err);
        showToast("Erreur lors de la suppression de la fiche.", "fa-circle-exclamation", 4000);
      }
    });
  }

  const resetProgressBtn = document.getElementById('reset-progress-btn');
  if (resetProgressBtn) {
    resetProgressBtn.addEventListener('click', async () => {
      if (confirm("Voulez-vous vraiment réinitialiser toute votre progression et vos notes ? Cette action est irréversible et n'affectera que ce navigateur.")) {
        localStorage.removeItem('dr_cat_user_progress');
        localStorage.removeItem('dr_cat_leitner');
        localStorage.removeItem('dr_cat_streak');
        localStorage.removeItem('dr_cat_local_overrides');

        state.allCats.forEach(c => {
          c.status = 'todo';
          c.notes = '';
          c.lastRead = 0;
        });

        if (state.activeCat) {
          state.activeCat.status = 'todo';
          state.activeCat.notes = '';
          state.activeCat.lastRead = 0;
          if (notesInput) notesInput.value = '';
          const statusBtns = document.querySelectorAll('.status-btn');
          statusBtns.forEach(btn => {
            btn.classList.remove('active');
            if (btn.getAttribute('data-status') === 'todo') {
              btn.classList.add('active');
            }
          });
        }

        showToast("Progression réinitialisée avec succès !", "fa-circle-check", 3000);
        if (onProgressReset) await onProgressReset();
      }
    });
  }

  const readerModeBtn = document.getElementById('reader-mode-btn');
  const summaryReaderModal = document.getElementById('summary-reader-modal');
  const closeReaderModalBtn = document.getElementById('close-reader-modal-btn');
  const readerCatCategory = document.getElementById('reader-cat-category');
  const readerCatTitle = document.getElementById('reader-cat-title');
  const readerSummaryView = document.getElementById('reader-summary-view');

  function openReaderMode() {
    if (!state.activeCat || !summaryReaderModal) return;
    if (readerCatCategory) readerCatCategory.textContent = state.activeCat.category;
    if (readerCatTitle) readerCatTitle.textContent = `${state.activeCat.id}. ${state.activeCat.title}`;
    const summaryText = state.activeCat.customSummary || state.activeCat.summary || '';
    if (readerSummaryView) readerSummaryView.innerHTML = parseSummaryMarkdown(summaryText);
    summaryReaderModal.style.display = 'flex';
    document.body.style.overflow = 'hidden';
  }

  function closeReaderMode() {
    if (!summaryReaderModal) return;
    summaryReaderModal.style.display = 'none';
    document.body.style.overflow = '';
  }

  if (readerModeBtn) {
    readerModeBtn.addEventListener('click', openReaderMode);
  }
  if (closeReaderModalBtn) {
    closeReaderModalBtn.addEventListener('click', closeReaderMode);
  }
  if (summaryReaderModal) {
    summaryReaderModal.addEventListener('click', (e) => {
      if (e.target === summaryReaderModal) closeReaderMode();
    });
  }
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && summaryReaderModal && summaryReaderModal.style.display === 'flex') {
      closeReaderMode();
    }
  });

  if (pdfContentSearchBtn) {
    pdfContentSearchBtn.addEventListener('click', performPdfSearch);
  }
  if (pdfContentSearchInput) {
    pdfContentSearchInput.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') {
        performPdfSearch();
      }
    });
  }
  if (pdfReindexBtn) {
    pdfReindexBtn.addEventListener('click', triggerPdfReindex);
  }

  if (api.isOfflineApp && pdfIndexStatus) {
    pdfIndexStatus.style.display = 'none';
  }

  document.addEventListener('click', (e) => {
    const anchor = e.target.closest('a');
    if (anchor && anchor.getAttribute('href') && anchor.getAttribute('href').includes('pdf_viewer.html')) {
      saveAppStateBeforeNavigation();
    }
  });

  let touchstartX = 0;
  let touchstartY = 0;
  let touchendX = 0;
  let touchendY = 0;
  let isSwipeActive = false;

  if (workspace) {
    workspace.addEventListener('touchstart', (e) => {
      isSwipeActive = false;
      if (!e.target || typeof e.target.closest !== 'function') return;

      const isTopPanel = e.target.closest('.workspace-header') || e.target.closest('#red-flags-banner');
      if (!isTopPanel) return;

      // Prevent conflict when tapping sub-profile pills
      if (e.target.closest('#subcat-selector-bar') || e.target.closest('.subcat-pill')) return;

      const tagName = e.target.tagName.toLowerCase();
      const insideEditor = e.target.closest('#summary-editor') || e.target.closest('#notes-input');
      if (tagName === 'textarea' || tagName === 'input' || insideEditor) return;

      isSwipeActive = true;
      touchstartX = e.changedTouches[0].screenX;
      touchstartY = e.changedTouches[0].screenY;
    }, { passive: true });

    workspace.addEventListener('touchend', (e) => {
      if (!isSwipeActive) return;
      isSwipeActive = false;

      if (!e.target || typeof e.target.closest !== 'function') return;

      touchendX = e.changedTouches[0].screenX;
      touchendY = e.changedTouches[0].screenY;
      handleSwipeGesture();
    }, { passive: true });
  }

  function handleSwipeGesture() {
    const diffX = touchendX - touchstartX;
    const diffY = touchendY - touchstartY;
    const minDistance = 60;

    if (Math.abs(diffX) > minDistance && Math.abs(diffX) > Math.abs(diffY) * 2) {
      const activeItem = document.querySelector('.cat-item.active');
      const items = Array.from(document.querySelectorAll('.cat-item'));
      if (items.length === 0 || !activeItem) return;

      const currentIndex = items.indexOf(activeItem);
      if (currentIndex === -1) return;

      let nextIndex = currentIndex;
      if (diffX < 0) {
        nextIndex = (currentIndex + 1) % items.length;
      } else {
        nextIndex = (currentIndex - 1 + items.length) % items.length;
      }

      const targetItem = items[nextIndex];
      if (targetItem) {
        targetItem.click();
        targetItem.scrollIntoView({ block: 'nearest', behavior: prefersReducedMotion() ? 'auto' : 'smooth' });

        triggerHaptic(true);
      }
    }
  }
}

export function selectCat(cat, preserveTab = false) {
  if (window.perf) window.perf.startMeasure('workspace.selectCat');
  state.activeCat = cat;
  state.activeSubCatIndex = 0;
  state.activePrescriptionVariantIndex = 0;

  if (!cat) {
    if (workspace) workspace.style.display = 'none';
    if (welcomeScreen) welcomeScreen.style.display = 'flex';
    document.querySelectorAll('.cat-item').forEach(item => item.classList.remove('active'));
    if (window.perf) window.perf.endMeasure('workspace.selectCat');
    return;
  }

  if (!preserveTab) {
    cat.lastRead = Date.now();
    const progress = getLocalProgress();
    if (!progress[cat.id]) progress[cat.id] = {};
    progress[cat.id].lastRead = Date.now();
    progress[cat.id].status = cat.status || 'todo';
    progress[cat.id].notes = cat.notes || '';
    saveLocalProgress(progress);
  }

  document.querySelectorAll('.cat-item').forEach(item => {
    item.classList.remove('active');
    if (parseInt(item.getAttribute('data-id')) === cat.id) {
      item.classList.add('active');
    }
  });

  if (welcomeScreen) welcomeScreen.style.display = 'none';
  if (workspace) workspace.style.display = 'flex';
  const quizScreen = document.getElementById('quiz-screen');
  if (quizScreen) quizScreen.style.display = 'none';

  const backToQuizBtn = document.getElementById('workspace-back-to-quiz-btn');
  if (backToQuizBtn) {
    if (state.quizSession &&
        state.quizSession.quizViewingCatId === cat.id) {
      backToQuizBtn.style.display = 'inline-flex';
    } else {
      backToQuizBtn.style.display = 'none';
    }
  }

  if (wsCategory) wsCategory.textContent = cat.category;
  if (wsTitle) {
    const fullTitle = `${cat.id}. ${cat.title}`;
    if (fullTitle.length > 50) {
      wsTitle.classList.add('very-long-title');
      let formattedTitle = escapeHTML(fullTitle);
      if (formattedTitle.includes(' et ')) {
        formattedTitle = formattedTitle.replace(' et ', '<br>et ');
      } else if (formattedTitle.includes(' avec ')) {
        formattedTitle = formattedTitle.replace(' avec ', '<br>avec ');
      } else if (formattedTitle.includes(' : ')) {
        formattedTitle = formattedTitle.replace(' : ', ' :<br>');
      }
      wsTitle.innerHTML = formattedTitle;
    } else {
      wsTitle.classList.remove('very-long-title');
      wsTitle.textContent = fullTitle;
    }
  }
  if (wsRedFlags) wsRedFlags.textContent = cat.red_flags;

  const redFlagsBannerEl = document.getElementById('red-flags-banner');
  if (redFlagsBannerEl) {
    redFlagsBannerEl.classList.remove('expanded');
    if (cat.red_flags && cat.red_flags.trim().length > 0) {
      redFlagsBannerEl.style.display = 'block';
    } else {
      redFlagsBannerEl.style.display = 'none';
    }
  }

  document.querySelectorAll('.status-btn').forEach(btn => {
    btn.classList.remove('active');
    if (btn.getAttribute('data-status') === cat.status) {
      btn.classList.add('active');
    }
  });

  renderSubCatBar(cat);

  renderSummary(cat.customSummary || cat.summary, cat);

  if (notesInput) notesInput.value = cat.notes || '';

  renderPrescription(cat.customOrdonnance || cat.ordonnance);

  const prescriptionEditor = document.getElementById('prescription-editor');
  const prescriptionEditorActions = document.getElementById('prescription-editor-actions');
  if (prescriptionEditor) prescriptionEditor.style.display = 'none';
  if (prescriptionEditorActions) prescriptionEditorActions.style.display = 'none';
  if (wsPrescription) wsPrescription.style.display = 'block';

  loadRelatedPdfs(cat);

  if (!preserveTab) {
    document.querySelectorAll('.tab-btn').forEach(b => { b.classList.remove('active'); b.setAttribute('aria-selected', 'false'); });
    document.querySelectorAll('.tab-pane').forEach(p => p.classList.remove('active'));
    const firstTabBtn = document.querySelector('.tab-btn[data-tab="tab-summary"]');
    const firstTabPane = document.getElementById('tab-summary');
    if (firstTabBtn) { firstTabBtn.classList.add('active'); firstTabBtn.setAttribute('aria-selected', 'true'); }
    if (firstTabPane) firstTabPane.classList.add('active');
  }

  if (summaryView) summaryView.style.display = 'block';
  if (summaryEditorWrapper) summaryEditorWrapper.style.display = 'none';

  const deleteBtn = document.getElementById('delete-cat-btn');
  const editSummaryBtnEl = document.getElementById('edit-summary-btn');
  const editPrescriptionBtnEl = document.getElementById('edit-prescription-btn');

  if (api.isOfflineApp) {
    if (deleteBtn) deleteBtn.style.display = 'none';
    const displayStyle = state.isOnlineAtStartup ? 'inline-flex' : 'none';
    if (editSummaryBtnEl) editSummaryBtnEl.style.display = displayStyle;
    if (editPrescriptionBtnEl) editPrescriptionBtnEl.style.display = displayStyle;
  } else {
    if (editSummaryBtnEl) editSummaryBtnEl.style.display = 'inline-flex';
    if (editPrescriptionBtnEl) editPrescriptionBtnEl.style.display = 'inline-flex';
    if (deleteBtn) {
      if (cat.id > 55 && state.isAdmin) {
        deleteBtn.style.display = 'inline-flex';
      } else {
        deleteBtn.style.display = 'none';
      }
    }
  }
  if (window.perf) window.perf.endMeasure('workspace.selectCat');
}

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

async function performPdfSearch() {
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
      pdfSearchResultsContainer.innerHTML = `<p class="text-warning text-center" style="margin-top: 20px;"><i class="fa-solid fa-triangle-exclamation"></i> ${errData.error}</p>`;
      return;
    }

    const data = await response.json();
    const results = data.results;

    if (!results || results.length === 0) {
      pdfSearchResultsContainer.innerHTML = `<p class="text-muted text-center" style="margin-top: 30px;">Aucun résultat trouvé pour "${query}". Vérifiez l'orthographe.</p>`;
      return;
    }

    let resultsHtml = '';
    results.forEach(res => {
      const escapedSnippet = escapeHTML(res.snippet);
      const escapedQueryVal = escapeHTML(query);
      const escapedQuery = escapedQueryVal.replace(/[-\\^$*+?.()|[\]{}]/g, '\\$&');
      const regex = new RegExp(`(${escapedQuery})`, 'gi');
      const highlightedSnippet = escapedSnippet.replace(regex, '<mark>$1</mark>');

      const displayTitle = escapeHTML(res.pdf.replace(/^\d+锔忊儯\d+锔忊儯/i, '')
                                  .replace(/^\d+锔忊儯/i, '')
                                  .replace(/馃[A-Z0-9]/g, '')
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

async function triggerPdfReindex() {
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
  if (!pdfListContainer) return;
  pdfListContainer.innerHTML = '';

  const keywords = Array.isArray(cat?.pdf_keywords) ? cat.pdf_keywords : [];
  const categoryName = cat?.category ? cat.category.toLowerCase() : '';
  const tags = Array.isArray(cat?.tags) ? cat.tags.filter(t => t && typeof t === 'string').map(t => t.toLowerCase()) : [];
  
  // Broad clinical terms that define a "General Guide" (Urgencies, Therapeutics, Prescriptions, etc.)
  const clinicalGenerals = ['urgence', 'urgences', 'traitement', 'thérapeutique', 'ordonnance', 'ordonnances', 'manuel', 'guide'];
  const generalKeywords = [categoryName, ...tags, ...clinicalGenerals].filter(k => k && k.trim().length > 2);

  // Specific PDFs matching pdf_keywords
  const matchedFiles = state.allPdfs.filter(filename => {
    if (!filename) return false;
    const lowerName = filename.toLowerCase();
    return keywords.some(kw => kw != null && typeof kw === 'string' && lowerName.includes(kw.toLowerCase()));
  });

  // Global PDFs matching category or tags (but not already caught by specific keywords)
  const globalFiles = state.allPdfs.filter(filename => {
    if (!filename) return false;
    const lowerName = filename.toLowerCase();
    
    // Skip if it's already in the specific matched files
    const isSpecific = keywords.some(kw => kw != null && typeof kw === 'string' && lowerName.includes(kw.toLowerCase()));
    if (isSpecific) return false;

    // Must match the category or tags
    return generalKeywords.some(kw => lowerName.includes(kw));
  });

  // Render Specific section
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

  // Render Global section (Specialty manuals)
  if (globalFiles.length > 0) {
    const globalHeader = document.createElement('h4');
    globalHeader.style.gridColumn = '1 / -1';
    globalHeader.style.color = 'var(--color-success)';
    globalHeader.style.margin = '20px 0 5px';
    globalHeader.style.fontSize = '14px';
    globalHeader.style.fontWeight = '600';
    globalHeader.innerHTML = `<i class="fa-solid fa-book-medical"></i> Manuels & Guides (${cat?.category || 'Généraux'})`;
    pdfListContainer.appendChild(globalHeader);

    globalFiles.forEach(file => {
      pdfListContainer.appendChild(createPdfCardElement(file, true));
    });
  }
}

/**
 * Render fluid Sub-CAT / Clinical Profile Segmented Bar
 */
/**
 * Sub-CAT Navigation Handler
 * 100% Inlined Contextual Navigation directly inside Fiche de Synthèse (Zero top header clutter).
 */
function renderSubCatBar(cat) {
  const subCatBar = document.getElementById('subcat-selector-bar');
  if (subCatBar) {
    subCatBar.style.display = 'none';
    subCatBar.innerHTML = '';
  }
}

/**
 * Global In-Place Sub-Profile Switcher
 * Callable directly by contextual in-text badges inside Fiche de Synthèse!
 */
window.switchToSubProfile = function(idx) {
  if (!state.activeCat) return;
  const subCats = Array.isArray(state.activeCat.sub_cats) && state.activeCat.sub_cats.length > 0 ? state.activeCat.sub_cats : [];
  const profiles = [
    {
      label: '🩺 Standard (Adulte)',
      summary: state.activeCat.summary,
      red_flags: state.activeCat.red_flags,
      ordonnance: state.activeCat.ordonnance
    },
    ...subCats
  ];

  const targetIdx = Number(idx);
  if (targetIdx < 0 || targetIdx >= profiles.length) return;
  state.activeSubCatIndex = targetIdx;

  const prof = profiles[targetIdx];
  const wsRedFlags = document.getElementById('workspace-red-flags');
  if (wsRedFlags) wsRedFlags.textContent = prof.red_flags || state.activeCat.red_flags;

  renderSummary(prof.summary || state.activeCat.summary, state.activeCat, targetIdx > 0 ? prof.label : null);
  renderPrescription(prof.ordonnance || state.activeCat.ordonnance);
  triggerHaptic(true);

  // Smooth scroll back to top of summary view
  const summaryView = document.getElementById('summary-view');
  if (summaryView) summaryView.scrollIntoView({ behavior: 'smooth', block: 'start' });
};

function getSubCatIcon(textOrType) {
  const t = (textOrType || '').toLowerCase();
  if (t.includes('urgence') || t.includes('grave') || t.includes('aigu') || t.includes('glairo') || t.includes('sanglant')) return 'fa-truck-medical';
  if (t.includes('enceinte') || t.includes('grossesse')) return 'fa-person-pregnant';
  if (t.includes('enfant') || t.includes('pédiatr') || t.includes('nourrisson') || t.includes('sro')) return 'fa-child';
  if (t.includes('âgé') || t.includes('gériatr') || t.includes('senior')) return 'fa-person-cane';
  if (t.includes('diabét') || t.includes('diabete')) return 'fa-droplet';
  if (t.includes('rénal') || t.includes('renal')) return 'fa-kidneys';
  if (t.includes('psych') || t.includes('neuro')) return 'fa-brain';
  return 'fa-stethoscope';
}

export { restoreAppState };
