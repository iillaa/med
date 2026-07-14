import { state, getLocalProgress, saveLocalProgress } from '../state.js';
import * as api from '../api.js';
import { getCleanPdfName, parsePrescriptionText, parseSummaryMarkdown, escapeHTML, showToast, runSuggestionWithUI, setButtonLoading, triggerHaptic } from '../utils.js';

// DOM Elements
let workspace, welcomeScreen;
let wsCategory, wsTitle, wsRedFlags, wsPrescription, notesInput;
let summaryView, summaryEditor, summaryEditorWrapper;
let editSummaryBtn, cancelSummaryEditBtn, saveSummaryBtn;
let saveNotesBtn, saveIndicator, copyPrescriptionBtn;
let currentDateSpan, pdfListContainer;
let allPdfsHeader, allPdfsContent, allPdfsAccordion, pdfSearch, allPdfsList;
let pdfContentSearchInput, pdfContentSearchBtn, pdfIndexStatus, pdfReindexBtn, pdfSearchLoading, pdfSearchResultsContainer;

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
  allPdfsList = document.getElementById('all-pdfs-list');

  pdfContentSearchInput = document.getElementById('pdf-content-search-input');
  pdfContentSearchBtn = document.getElementById('pdf-content-search-btn');
  pdfIndexStatus = document.getElementById('pdf-index-status');
  pdfReindexBtn = document.getElementById('pdf-reindex-btn');
  pdfSearchLoading = document.getElementById('pdf-search-loading');
  pdfSearchResultsContainer = document.getElementById('pdf-search-results-container');

  // Set date
  if (currentDateSpan) {
    const now = new Date();
    currentDateSpan.textContent = now.toLocaleDateString('fr-FR');
  }

  // Collapsible Red Flags banner click handler on mobile
  const redFlagsBanner = document.getElementById('red-flags-banner');
  if (redFlagsBanner) {
    redFlagsBanner.addEventListener('click', () => {
      if (window.innerWidth <= 850) {
        redFlagsBanner.classList.toggle('expanded');
      }
    });
  }

  // Tabs navigation
  const tabButtons = document.querySelectorAll('.tab-btn');
  tabButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      tabButtons.forEach(b => b.classList.remove('active'));
      document.querySelectorAll('.tab-pane').forEach(p => p.classList.remove('active'));

      btn.classList.add('active');
      const paneId = btn.getAttribute('data-tab');
      const pane = document.getElementById(paneId);
      if (pane) pane.classList.add('active');

      const tabContentContainer = document.querySelector('.tab-content-container');
      if (tabContentContainer) {
        tabContentContainer.scrollTop = 0;
      }
    });
  });

  // Status buttons
  const statusButtons = document.querySelectorAll('.status-btn');
  statusButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      if (!state.activeCat) return;
      const status = btn.getAttribute('data-status');
      
      statusButtons.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      state.activeCat.status = status;
      
      const progress = getLocalProgress();
      if (!progress[state.activeCat.id]) progress[state.activeCat.id] = {};
      progress[state.activeCat.id].status = status;
      progress[state.activeCat.id].notes = state.activeCat.notes || '';
      saveLocalProgress(progress);

      onStatusChange(state.activeCat);

      // Milestone toast: exactly at 20 active+done CATs
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

  // Notes save button
  if (saveNotesBtn) {
    saveNotesBtn.addEventListener('click', () => {
      if (!state.activeCat) return;
      const restore = setButtonLoading(saveNotesBtn, '<i class="fa-solid fa-floppy-disk"></i> Sauvegarder');
      
      state.activeCat.notes = notesInput.value;
      
      const progress = getLocalProgress();
      if (!progress[state.activeCat.id]) progress[state.activeCat.id] = {};
      progress[state.activeCat.id].status = state.activeCat.status || 'todo';
      progress[state.activeCat.id].notes = state.activeCat.notes;
      saveLocalProgress(progress);

      saveIndicator.classList.add('show');
      setTimeout(() => {
        saveIndicator.classList.remove('show');
      }, 2500);

      // Brief delay so the user sees the spinner even on fast local saves
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

  // Back to Quiz button
  const backToQuizBtn = document.getElementById('workspace-back-to-quiz-btn');
  if (backToQuizBtn) {
    backToQuizBtn.addEventListener('click', () => {
      state.quizSession.quizViewingCatId = null;
      if (workspace) workspace.style.display = 'none';
      const quizScreen = document.getElementById('quiz-screen');
      if (quizScreen) quizScreen.style.display = 'flex';
      // Deselect sidebar items
      document.querySelectorAll('.cat-item').forEach(item => item.classList.remove('active'));
    });
  }

  // Print CAT Button
  const printCatBtn = document.getElementById('print-cat-btn');
  if (printCatBtn) {
    printCatBtn.addEventListener('click', async () => {
      if (!state.activeCat) return;

      // Set Date
      const dateEl = document.getElementById('print-date-stamp');
      if (dateEl) {
        dateEl.textContent = 'Le : ' + new Date().toLocaleDateString('fr-FR');
      }

      // Populate Texts
      const catVal = document.getElementById('print-val-category');
      const titleVal = document.getElementById('print-val-title');
      const redFlagsVal = document.getElementById('print-val-redflags');
      const summaryVal = document.getElementById('print-val-summary');
      const prescriptionVal = document.getElementById('print-val-prescription');
      const notesVal = document.getElementById('print-val-notes');

      if (catVal) catVal.textContent = state.activeCat.category;
      if (titleVal) titleVal.textContent = `${state.activeCat.id}. ${state.activeCat.title}`;
      
      // Handle Red Flags
      const rfSec = document.getElementById('print-section-redflags');
      if (state.activeCat.red_flags && state.activeCat.red_flags.trim().length > 0) {
        if (redFlagsVal) redFlagsVal.textContent = state.activeCat.red_flags;
        if (rfSec) rfSec.style.display = 'block';
      } else {
        if (rfSec) rfSec.style.display = 'none';
      }

      // Handle Summary
      if (summaryVal) {
        const rawText = state.activeCat.customSummary || state.activeCat.summary;
        summaryVal.innerHTML = parseSummaryMarkdown(rawText);
      }

      // Handle Prescription
      const presSec = document.getElementById('print-section-prescription');
      if (state.activeCat.ordonnance && state.activeCat.ordonnance.trim().length > 0) {
        if (prescriptionVal) prescriptionVal.textContent = state.activeCat.ordonnance;
        if (presSec) presSec.style.display = 'block';
      } else {
        if (presSec) presSec.style.display = 'none';
      }

      // Handle Notes
      const notesSec = document.getElementById('print-section-notes');
      if (state.activeCat.notes && state.activeCat.notes.trim().length > 0) {
        if (notesVal) notesVal.textContent = state.activeCat.notes;
        if (notesSec) notesSec.style.display = 'block';
      } else {
        if (notesSec) notesSec.style.display = 'none';
      }

      // Fire print with fallbacks for mobile/Capacitor
      if (typeof window.Capacitor !== 'undefined' || api.isOfflineApp) {
        // Mobile: offer copy-to-clipboard as fallback
        const text = buildPrintableText(state.activeCat);
        if (navigator.clipboard && navigator.clipboard.writeText) {
          try {
            await navigator.clipboard.writeText(text);
            showToast("Texte copié dans le presse-papier. Vous pouvez le coller ailleurs.", "fa-clipboard-check", 4000);
          } catch (_) {
            showToast("L'impression native n'est pas disponible. Utilisez la version web.", "fa-circle-info", 5000);
          }
        } else {
          showToast("L'impression native n'est pas disponible. Utilisez la version web.", "fa-circle-info", 5000);
        }
      } else {
        window.print();
      }
    });
  }

  // Build a plain-text version of the CAT for clipboard/export
  function buildPrintableText(cat) {
    const lines = [
      `Dr.CAT — ${cat.id}. ${cat.title}`,
      `Catégorie : ${cat.category}`,
      '-------------------------------------------'
    ];
    if (cat.red_flags && cat.red_flags.trim()) {
      lines.push(`\nRED FLAGS:\n${cat.red_flags}`);
    }
    const summary = cat.customSummary || cat.summary;
    if (summary && summary.trim()) {
      lines.push(`\nCONDUCTE À TENIR:\n${summary}`);
    }
    const prescription = cat.customOrdonnance || cat.ordonnance;
    if (prescription && prescription.trim()) {
      lines.push(`\nORDONNANCE TYPE:\n${prescription}`);
    }
    if (cat.notes && cat.notes.trim()) {
      lines.push(`\nNOTES:\n${cat.notes}`);
    }
    lines.push(`\nLe : ${new Date().toLocaleDateString('fr-FR')}`);
    return lines.join('\n');
  }

  // Summary Edit Actions
  if (editSummaryBtn) {
    editSummaryBtn.addEventListener('click', () => {
      summaryView.style.display = 'none';
      summaryEditorWrapper.style.display = 'flex';
      summaryEditor.value = state.activeCat.customSummary || state.activeCat.summary;
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
        alert("La synthèse ne peut pas être vide.");
        return;
      }

      const restore = setButtonLoading(saveSummaryBtn);

      try {
        if (state.isAdmin) {
          const result = await api.saveCatDataToServer(state.activeCat.id, { summary: newSummary });
          if (result.success) {
            state.activeCat.summary = newSummary;
            renderSummary(newSummary);
            showToast("Synthèse mise à jour avec succès !", "fa-circle-check", 2500);
          } else {
            alert("Erreur: " + result.error);
          }
        } else {
          const confirmSave = confirm(
            "Attention : Vos modifications ne seront pas appliquées directement dans l'application. Elles seront envoyées à l'administrateur du site pour relecture et validation avant d'être intégrées.\n\nSouhaitez-vous envoyer cette proposition ?"
          );
          if (!confirmSave) {
            restore();
            return;
          }

          await runSuggestionWithUI(
            api.submitSuggestion,
            {
              type: 'edit',
              catId: state.activeCat.id,
              data: { summary: newSummary }
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
        alert("Erreur lors de la sauvegarde.");
      } finally {
        restore();
      }

      summaryView.style.display = 'block';
      summaryEditorWrapper.style.display = 'none';
    });
  }

  // Copy Prescription
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

  // Prescription Edit Actions
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
      prescriptionEditor.value = state.activeCat.customOrdonnance || state.activeCat.ordonnance;
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
        alert("L'ordonnance ne peut pas être vide.");
        return;
      }

      const restore = setButtonLoading(savePrescriptionBtn);

      try {
        if (state.isAdmin) {
          const result = await api.saveCatDataToServer(state.activeCat.id, { ordonnance: newOrdonnance });
          if (result.success) {
            state.activeCat.ordonnance = newOrdonnance;
            renderPrescription(newOrdonnance);
            showToast("Ordonnance type mise à jour avec succès !", "fa-circle-check", 2500);
          } else {
            alert("Erreur: " + result.error);
          }
        } else {
          const confirmSave = confirm(
            "Attention : Vos modifications ne seront pas appliquées directement dans l'application. Elles seront envoyées à l'administrateur du site pour relecture et validation avant d'être intégrées.\n\nSouhaitez-vous envoyer cette proposition ?"
          );
          if (!confirmSave) {
            restore();
            return;
          }

          await runSuggestionWithUI(
            api.submitSuggestion,
            {
              type: 'edit',
              catId: state.activeCat.id,
              data: { ordonnance: newOrdonnance }
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
        alert("Erreur lors de la sauvegarde.");
      } finally {
        restore();
      }

      wsPrescription.style.display = 'block';
      prescriptionEditor.style.display = 'none';
      prescriptionEditorActions.style.display = 'none';
    });
  }

  // PDF Accordion toggler
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

  // Filter Accordion PDFs
  if (pdfSearch) {
    pdfSearch.addEventListener('input', filterAllPdfsList);
  }

  // Reset Progress Button
  const resetProgressBtn = document.getElementById('reset-progress-btn');
  if (resetProgressBtn) {
    resetProgressBtn.addEventListener('click', async () => {
      if (confirm("Voulez-vous vraiment réinitialiser toute votre progression et vos notes ? Cette action est irréversible et n'affectera que ce navigateur.")) {
        localStorage.removeItem('dr_cat_user_progress');
        alert("Progression réinitialisée avec succès !");
        if (onProgressReset) await onProgressReset();
      }
    });
  }

  // Delete CAT Button
  const deleteCatBtn = document.getElementById('delete-cat-btn');
  if (deleteCatBtn) {
    deleteCatBtn.addEventListener('click', async () => {
      if (!state.activeCat) return;
      if (state.activeCat.id <= 55) {
        alert("Impossible de supprimer les fiches de base (IDs 1-55).");
        return;
      }
      if (!state.isAdmin) {
        alert("Action refusée. Seul l'administrateur peut supprimer des fiches.");
        return;
      }
      if (confirm(`Voulez-vous vraiment supprimer la fiche "${state.activeCat.title}" ? Cette action est irréversible.`)) {
        try {
          const result = await api.deleteCatFromServer(state.activeCat.id);
          if (result.success) {
            alert("Fiche supprimée avec succès !");
            if (onCatDeleted) await onCatDeleted();
          } else {
            alert("Erreur: " + result.error);
          }
        } catch (err) {
          console.error(err);
          if (window.handleAdminError && await window.handleAdminError(err)) {
            return;
          }
          alert("Erreur lors de la suppression.");
        }
      }
    });
  }

  // PDF Content Text Search Event Listeners
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

  // Hide reindexing indicator inside standalone app mode
  if (api.isOfflineApp && pdfIndexStatus) {
    pdfIndexStatus.style.display = 'none';
  }

  // Intercept any PDF viewer links to save state before navigating away
  document.addEventListener('click', (e) => {
    const anchor = e.target.closest('a');
    if (anchor && anchor.getAttribute('href') && anchor.getAttribute('href').includes('pdf_viewer.html')) {
      saveAppStateBeforeNavigation();
    }
  });

  // Swipe navigation touch gesture listeners for mobile
  let touchstartX = 0;
  let touchstartY = 0;
  let touchendX = 0;
  let touchendY = 0;
  let isSwipeActive = false;

  if (workspace) {
    workspace.addEventListener('touchstart', (e) => {
      isSwipeActive = false;
      if (!e.target || typeof e.target.closest !== 'function') return;

      // Limit swipe navigation to the top section panel (header or red flags banner)
      const isTopPanel = e.target.closest('.workspace-header') || e.target.closest('#red-flags-banner');
      if (!isTopPanel) return;

      // Ignore swipe inside textareas or input fields to prevent cursor interference
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
    const minDistance = 60; // minimum touch distance

    // Verify it is a primary horizontal swipe (horizontal distance is greater than twice vertical distance)
    if (Math.abs(diffX) > minDistance && Math.abs(diffX) > Math.abs(diffY) * 2) {
      const activeItem = document.querySelector('.cat-item.active');
      const items = Array.from(document.querySelectorAll('.cat-item'));
      if (items.length === 0 || !activeItem) return;

      const currentIndex = items.indexOf(activeItem);
      if (currentIndex === -1) return;

      let nextIndex = currentIndex;
      if (diffX < 0) {
        // Swipe Left -> Next CAT card
        nextIndex = (currentIndex + 1) % items.length;
      } else {
        // Swipe Right -> Previous CAT card
        nextIndex = (currentIndex - 1 + items.length) % items.length;
      }

      const targetItem = items[nextIndex];
      if (targetItem) {
        targetItem.click();
        targetItem.scrollIntoView({ block: 'nearest', behavior: 'smooth' });
        
        // Lightweight haptic vibration response
        triggerHaptic(true);
      }
    }
  }
}

export function selectCat(cat, preserveTab = false) {
  if (window.perf) window.perf.startMeasure('workspace.selectCat');
  state.activeCat = cat;
  state.activePrescriptionVariantIndex = 0;

  // Highlight in sidebar list
  document.querySelectorAll('.cat-item').forEach(item => {
    item.classList.remove('active');
    if (parseInt(item.getAttribute('data-id')) === cat.id) {
      item.classList.add('active');
    }
  });

  // Switch display
  if (welcomeScreen) welcomeScreen.style.display = 'none';
  if (workspace) workspace.style.display = 'flex';
  const quizScreen = document.getElementById('quiz-screen');
  if (quizScreen) quizScreen.style.display = 'none';

  // Toggle "Retour au Quiz" button if we are viewing a CAT referenced from the quiz
  const backToQuizBtn = document.getElementById('workspace-back-to-quiz-btn');
  if (backToQuizBtn) {
    if (state.quizSession && 
        state.quizSession.quizViewingCatId === cat.id) {
      backToQuizBtn.style.display = 'inline-flex';
    } else {
      backToQuizBtn.style.display = 'none';
    }
  }

  // Populate basic info
  if (wsCategory) wsCategory.textContent = cat.category;
  if (wsTitle) wsTitle.textContent = `${cat.id}. ${cat.title}`;
  if (wsRedFlags) wsRedFlags.textContent = cat.red_flags;
  
  // Toggle & Reset Red Flags Banner visibility and expanded status
  const redFlagsBannerEl = document.getElementById('red-flags-banner');
  if (redFlagsBannerEl) {
    redFlagsBannerEl.classList.remove('expanded');
    if (cat.red_flags && cat.red_flags.trim().length > 0) {
      redFlagsBannerEl.style.display = 'block';
    } else {
      redFlagsBannerEl.style.display = 'none';
    }
  }
  
  // Set Status Buttons Active State
  document.querySelectorAll('.status-btn').forEach(btn => {
    btn.classList.remove('active');
    if (btn.getAttribute('data-status') === cat.status) {
      btn.classList.add('active');
    }
  });

  // Render markdown summary
  renderSummary(cat.customSummary || cat.summary, cat);

  // Set Notes
  if (notesInput) notesInput.value = cat.notes || '';

  // Render prescription
  renderPrescription(cat.customOrdonnance || cat.ordonnance);

  // Reset prescription editor views to reading mode
  const prescriptionEditor = document.getElementById('prescription-editor');
  const prescriptionEditorActions = document.getElementById('prescription-editor-actions');
  if (prescriptionEditor) prescriptionEditor.style.display = 'none';
  if (prescriptionEditorActions) prescriptionEditorActions.style.display = 'none';
  if (wsPrescription) wsPrescription.style.display = 'block';

  // Load related PDFs
  loadRelatedPdfs(cat);

  // Reset active tab to first tab (Summary) only if not preserving it
  if (!preserveTab) {
    document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
    document.querySelectorAll('.tab-pane').forEach(p => p.classList.remove('active'));
    const firstTabBtn = document.querySelector('.tab-btn[data-tab="tab-summary"]');
    const firstTabPane = document.getElementById('tab-summary');
    if (firstTabBtn) firstTabBtn.classList.add('active');
    if (firstTabPane) firstTabPane.classList.add('active');
  }

  // Cancel any ongoing edit view
  if (summaryView) summaryView.style.display = 'block';
  if (summaryEditorWrapper) summaryEditorWrapper.style.display = 'none';

  // Show delete and edit buttons only if online (offline mode disables modifications)
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

export function renderSummary(text, cat) {
  if (!summaryView) return;
  summaryView.innerHTML = parseSummaryMarkdown(text);

  if (state.isAdmin && cat && cat.history && cat.history.length > 0) {
    let historyHtml = '<div class="cat-history-section" style="margin-top:20px; border-top:1px dashed var(--border-color); padding-top:14px; pointer-events:none;">';
    historyHtml += '<h4 style="font-size:11.5px; color:var(--text-secondary); margin-bottom:8px; display:flex; align-items:center; gap:6px;"><i class="fa-solid fa-clock-rotate-left"></i> Historique des versions</h4>';
    historyHtml += '<ul style="list-style:none; padding:0; margin:0; font-size:11px; color:var(--text-muted); display:flex; flex-direction:column; gap:4px;">';
    
    // Cap to a maximum of 10 visible changes, showing the most recent ones first
    const recentHistory = cat.history.slice(-10).reverse();
    recentHistory.forEach(h => {
      const dateStr = new Date(h.timestamp).toLocaleDateString('fr-FR', { day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit' });
      historyHtml += `<li><span style="font-weight:600; color:var(--text-secondary);">${dateStr}</span> — ${escapeHTML(h.detail || h.action)}</li>`;
    });
    historyHtml += '</ul></div>';
    summaryView.innerHTML += historyHtml;
  }
}

export function renderPrescription(text) {
  const selector = document.getElementById('prescription-variants-selector');
  if (!wsPrescription) return;

  if (!text) {
    wsPrescription.innerHTML = 'Pas d\'ordonnance type rédigée.';
    if (selector) selector.style.display = 'none';
    state.prescriptionVariants = [];
    return;
  }

  // Parse text into variants
  state.prescriptionVariants = parsePrescriptionText(text);

  if (state.prescriptionVariants.length <= 1) {
    if (selector) selector.style.display = 'none';
    wsPrescription.textContent = text;
  } else {
    // Show variants selector
    if (selector) {
      selector.style.display = 'flex';
      selector.innerHTML = '';
      
      if (state.activePrescriptionVariantIndex >= state.prescriptionVariants.length) {
        state.activePrescriptionVariantIndex = 0;
      }

      state.prescriptionVariants.forEach((v, idx) => {
        const pill = document.createElement('button');
        pill.className = `status-pill ${idx === state.activePrescriptionVariantIndex ? 'active' : ''}`;
        pill.style.fontSize = '12px';
        pill.style.padding = '5px 12px';
        pill.textContent = v.title;
        
        pill.addEventListener('click', () => {
          state.activePrescriptionVariantIndex = idx;
          selector.querySelectorAll('.status-pill').forEach((p, i) => {
            if (i === idx) p.classList.add('active');
            else p.classList.remove('active');
          });
          wsPrescription.textContent = v.content;
        });
        
        selector.appendChild(pill);
      });
    }

    // Render active variant content
    const activeVar = state.prescriptionVariants[state.activePrescriptionVariantIndex] || state.prescriptionVariants[0];
    wsPrescription.textContent = activeVar ? activeVar.content : text;
  }
}

export function loadRelatedPdfs(cat) {
  if (!pdfListContainer) return;
  pdfListContainer.innerHTML = '';
  
  const keywords = cat.pdf_keywords || [];
  
  // Specific PDFs matching keywords
  const matchedFiles = state.allPdfs.filter(filename => {
    const lowerName = filename.toLowerCase();
    const isGlobal = ["abouimed", "kacem", "boughoufala", "150 ordonnances", "pathognomoniques", "autres cat", "formes d_administration", "je\u00FBne"].some(g => lowerName.includes(g));
    if (isGlobal) return false;
    return keywords.some(kw => lowerName.includes(kw.toLowerCase()));
  });

  // Global PDFs (Manuals, general guides)
  const globalFiles = state.allPdfs.filter(filename => {
    const lowerName = filename.toLowerCase();
    return ["abouimed", "kacem", "boughoufala", "150 ordonnances", "pathognomoniques", "autres cat", "formes d_administration", "je\u00FBne"].some(g => lowerName.includes(g));
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

  // Render Global section
  const globalHeader = document.createElement('h4');
  globalHeader.style.gridColumn = '1 / -1';
  globalHeader.style.color = 'var(--color-success)';
  globalHeader.style.margin = '20px 0 5px';
  globalHeader.style.fontSize = '14px';
  globalHeader.style.fontWeight = '600';
  globalHeader.innerHTML = '<i class="fa-solid fa-book-medical"></i> Manuels & Guides Généraux (Tous sujets)';
  pdfListContainer.appendChild(globalHeader);

  if (globalFiles.length === 0) {
    const emptyG = document.createElement('p');
    emptyG.className = 'text-muted';
    emptyG.style.gridColumn = '1 / -1';
    emptyG.style.fontSize = '13px';
    emptyG.style.margin = '5px 0 15px';
    emptyG.textContent = 'Aucun manuel général trouvé dans vos fichiers.';
    pdfListContainer.appendChild(emptyG);
  } else {
    globalFiles.forEach(file => {
      pdfListContainer.appendChild(createPdfCardElement(file, true));
    });
  }
}

function createPdfCardElement(file, isGlobal = false) {
  const cleanName = getCleanPdfName(file);
  const card = document.createElement('a');
  const isDocx = file.toLowerCase().endsWith('.docx');
  card.href = isDocx ? `pdfs/${encodeURIComponent(file)}` : `pdf_viewer.html?file=${encodeURIComponent(file)}&page=1`;
  if (isDocx) {
    card.target = '_blank';
  }
  card.className = 'pdf-card';
  
  const iconClass = isDocx 
    ? 'fa-regular fa-file-word text-primary' 
    : (isGlobal ? 'fa-solid fa-book-open-reader' : 'fa-solid fa-file-pdf');
  
  // Look up PDF status info
  const statusInfo = (state.pdfIndexStatus && state.pdfIndexStatus[file]) || { status: 'red', pagesWithText: 0, totalPages: 0 };
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

  // Bind click event to the status dot to show toast without opening file
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
  if (!allPdfsList) return;
  allPdfsList.innerHTML = '';
  allPdfs.forEach(file => {
    const cleanName = getCleanPdfName(file);
    const li = document.createElement('li');
    
    const isDocx = file.toLowerCase().endsWith('.docx');
    const iconClass = isDocx ? 'fa-regular fa-file-word' : 'fa-solid fa-file-pdf';
    const href = isDocx ? `pdfs/${encodeURIComponent(file)}` : `pdf_viewer.html?file=${encodeURIComponent(file)}&page=1`;
    
    const statusInfo = (state.pdfIndexStatus && state.pdfIndexStatus[file]) || { status: 'red', pagesWithText: 0, totalPages: 0 };
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
          <span style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${cleanName} (${file.toLowerCase().endsWith('.docx') ? 'Word' : 'PDF'})</span>
        </div>
        <span class="pdf-status-dot" style="width: 8px; height: 8px; background-color: ${dotColor}; border-radius: 50%; flex-shrink: 0; margin-left: 8px;" title="${dotTitle}"></span>
      </a>
    `;

    // Bind click event to the status dot to show toast without opening file
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
  if (!allPdfsList || !pdfSearch) return;
  const query = pdfSearch.value.toLowerCase().trim();
  const items = allPdfsList.querySelectorAll('li');
  
  items.forEach(item => {
    const text = item.textContent.toLowerCase();
    if (text.includes(query)) {
      item.style.display = 'block';
    } else {
      item.style.display = 'none';
    }
  });
}

// PDF content search functionality
export async function updatePdfIndexStatus() {
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
      const escapedQuery = escapedQueryVal.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
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
    alert("Erreur lors de la réindexation.");
  }
}

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
    // Clear it so it doesn't persist across fresh browser starts
    localStorage.removeItem('dr_cat_navigation_state');
    
    // 1. Restore active CAT card in workspace
    if (data.activeCatId) {
      const catCard = document.querySelector(`.cat-item[data-id="${data.activeCatId}"]`);
      if (catCard) {
        catCard.click(); // Programmatically open the CAT card!
      }
    }
    
    // 2. Restore the active tab
    if (data.activeTab && data.activeTab !== 'tab-summary') {
      const tabBtn = document.querySelector(`.tab-btn[data-tab="${data.activeTab}"]`);
      if (tabBtn) {
        tabBtn.click(); // Programmatically click the tab button to switch to it!
      }
    }
    
    // 3. Restore PDF search input and results HTML
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
        
        // Rebind click handlers for the restored cards
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
