import { state, getLocalProgress, saveLocalProgress } from '../state.js';
import * as api from '../api.js';
import { getCleanPdfName, parsePrescriptionText, parseSummaryMarkdown, escapeHTML, showToast } from '../utils.js';

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

      // Remind user to back up their notes via export
      showToast(
        'Notes sauvegardées localement. Exportez régulièrement vos données depuis le <strong>tableau de bord</strong> pour les sécuriser.',
        'fa-cloud-arrow-up',
        6000
      );
    });
  }

  // Back to Quiz button
  const backToQuizBtn = document.getElementById('workspace-back-to-quiz-btn');
  if (backToQuizBtn) {
    backToQuizBtn.addEventListener('click', () => {
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
    printCatBtn.addEventListener('click', () => {
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

      // Fire print
      window.print();
    });
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

      if (state.isAdmin) {
        try {
          const result = await api.saveCatDataToServer(state.activeCat.id, { summary: newSummary });
          if (result.success) {
            state.activeCat.summary = newSummary;
            renderSummary(newSummary);
            alert("Synthèse mise à jour avec succès !");
          } else {
            alert("Erreur: " + result.error);
          }
        } catch (err) {
          console.error(err);
          if (window.handleAdminError && await window.handleAdminError(err)) {
            return;
          }
          alert("Erreur lors de la sauvegarde.");
        }
      } else {
        try {
          const result = await api.submitSuggestion({
            type: 'edit',
            catId: state.activeCat.id,
            data: { summary: newSummary }
          });
          if (result.success) {
            alert("Votre proposition de modification a été envoyée à l'administrateur pour validation.");
          } else {
            alert("Erreur: " + result.error);
          }
        } catch (err) {
          console.error(err);
          alert("Erreur lors de l'envoi de la proposition.");
        }
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

      if (state.isAdmin) {
        try {
          const result = await api.saveCatDataToServer(state.activeCat.id, { ordonnance: newOrdonnance });
          if (result.success) {
            state.activeCat.ordonnance = newOrdonnance;
            renderPrescription(newOrdonnance);
            alert("Ordonnance type mise à jour avec succès !");
          } else {
            alert("Erreur: " + result.error);
          }
        } catch (err) {
          console.error(err);
          if (window.handleAdminError && await window.handleAdminError(err)) {
            return;
          }
          alert("Erreur lors de la sauvegarde.");
        }
      } else {
        try {
          const result = await api.submitSuggestion({
            type: 'edit',
            catId: state.activeCat.id,
            data: { ordonnance: newOrdonnance }
          });
          if (result.success) {
            alert("Votre proposition de modification de l'ordonnance a été envoyée à l'administrateur pour validation.");
          } else {
            alert("Erreur: " + result.error);
          }
        } catch (err) {
          console.error(err);
          alert("Erreur lors de l'envoi de la proposition.");
        }
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
}

export function selectCat(cat) {
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

  // Toggle "Retour au Quiz" button if a quiz is in progress
  const backToQuizBtn = document.getElementById('workspace-back-to-quiz-btn');
  if (backToQuizBtn) {
    if (state.quizSession && state.quizSession.questions && state.quizSession.questions.length > 0) {
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
  renderSummary(cat.customSummary || cat.summary);

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

  // Reset active tab to first tab (Summary)
  document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
  document.querySelectorAll('.tab-pane').forEach(p => p.classList.remove('active'));
  const firstTabBtn = document.querySelector('.tab-btn[data-tab="tab-summary"]');
  const firstTabPane = document.getElementById('tab-summary');
  if (firstTabBtn) firstTabBtn.classList.add('active');
  if (firstTabPane) firstTabPane.classList.add('active');

  // Cancel any ongoing edit view
  if (summaryView) summaryView.style.display = 'block';
  if (summaryEditorWrapper) summaryEditorWrapper.style.display = 'none';

  // Show delete button only for custom CATs (id > 55)
  const deleteBtn = document.getElementById('delete-cat-btn');
  if (deleteBtn) {
    if (cat.id > 55 && state.isAdmin) {
      deleteBtn.style.display = 'inline-flex';
    } else {
      deleteBtn.style.display = 'none';
    }
  }
}

export function renderSummary(text) {
  if (!summaryView) return;
  summaryView.innerHTML = parseSummaryMarkdown(text);
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
  card.target = '_blank';
  card.className = 'pdf-card';
  
  const iconClass = isDocx 
    ? 'fa-regular fa-file-word text-primary' 
    : (isGlobal ? 'fa-solid fa-book-open-reader' : 'fa-solid fa-file-pdf');
  
  card.innerHTML = `
    <i class="${iconClass}" style="${isGlobal && !isDocx ? 'color: var(--color-success);' : ''}"></i>
    <div>
      <h4>${cleanName}</h4>
      <span>${isDocx ? 'Document Word' : (isGlobal ? 'Ouvrir le manuel général' : 'Ouvrir le cours PDF')}</span>
    </div>
  `;
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
    
    li.innerHTML = `
      <a href="${href}" target="_blank" class="all-pdfs-list-item">
        <i class="${iconClass}"></i>
        <span>${cleanName} (${file.toLowerCase().endsWith('.docx') ? 'Word' : 'PDF'})</span>
      </a>
    `;
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

      const displayTitle = res.pdf.replace(/^\d+锔忊儯\d+锔忊儯/i, '')
                                  .replace(/^\d+锔忊儯/i, '')
                                  .replace(/馃[A-Z0-9]/g, '')
                                  .replace(/_/g, ' ')
                                  .replace(/\.pdf$/i, '');

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
        const pdfFile = decodeURIComponent(card.getAttribute('data-pdf'));
        const page = card.getAttribute('data-page');
        window.open(`/pdf_viewer.html?file=${encodeURIComponent(pdfFile)}&page=${page}`, '_blank');
      });
    });

  } catch (err) {
    console.error("PDF search error:", err);
    pdfSearchResultsContainer.innerHTML = '<p class="text-danger text-center" style="margin-top: 20px;">Une erreur est survenue lors de la recherche.</p>';
  } finally {
    pdfSearchLoading.style.display = 'none';
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
