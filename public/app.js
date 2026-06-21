let allCats = [];
let allPdfs = [];
let activeCat = null;
let activeStatusFilter = 'all';
let activePrescriptionVariantIndex = 0;
let prescriptionVariants = [];

// DOM Elements
const sidebar = document.getElementById('sidebar');
const catList = document.getElementById('cat-list');
const searchInput = document.getElementById('search-input');
const categoryFilter = document.getElementById('category-filter');
const welcomeScreen = document.getElementById('welcome-screen');
const workspace = document.getElementById('workspace');

// Stats elements
const progressPercent = document.getElementById('progress-percent');
const progressFill = document.getElementById('progress-fill');
const countTodo = document.getElementById('count-todo');
const countDoing = document.getElementById('count-doing');
const countDone = document.getElementById('count-done');

// Workspace elements
const wsCategory = document.getElementById('workspace-cat-category');
const wsTitle = document.getElementById('workspace-cat-title');
const wsRedFlags = document.getElementById('workspace-red-flags');
const wsPrescription = document.getElementById('workspace-prescription');
const notesInput = document.getElementById('notes-input');
const summaryView = document.getElementById('summary-view');
const summaryEditor = document.getElementById('summary-editor');
const summaryEditorWrapper = document.getElementById('summary-editor-wrapper');
const editSummaryBtn = document.getElementById('edit-summary-btn');
const cancelSummaryEditBtn = document.getElementById('cancel-summary-edit-btn');
const saveSummaryBtn = document.getElementById('save-summary-btn');
const saveNotesBtn = document.getElementById('save-notes-btn');
const saveIndicator = document.getElementById('save-indicator');
const copyPrescriptionBtn = document.getElementById('copy-prescription-btn');
const currentDateSpan = document.getElementById('current-date');
const pdfListContainer = document.getElementById('pdf-list');

// Mobile drawer elements
const openSidebarBtn = document.getElementById('open-sidebar-btn');
const closeSidebarBtn = document.getElementById('close-sidebar-btn');

// Accordion elements
const allPdfsHeader = document.getElementById('all-pdfs-header');
const allPdfsContent = document.getElementById('all-pdfs-content');
const allPdfsAccordion = allPdfsHeader.parentElement;
const pdfSearch = document.getElementById('pdf-search');
const allPdfsList = document.getElementById('all-pdfs-list');

// Initial setup
document.addEventListener('DOMContentLoaded', () => {
  // Set current date on prescription sheet
  const now = new Date();
  currentDateSpan.textContent = now.toLocaleDateString('fr-FR');

  // Load Data
  initApp();

  // Event Listeners
  searchInput.addEventListener('input', filterCats);
  categoryFilter.addEventListener('change', filterCats);

  // Quick status filter pills
  const statusPills = document.querySelectorAll('.status-pill');
  statusPills.forEach(pill => {
    pill.addEventListener('click', () => {
      statusPills.forEach(p => p.classList.remove('active'));
      pill.classList.add('active');
      activeStatusFilter = pill.getAttribute('data-filter');
      filterCats();
    });
  });

  // Tabs navigation logic
  const tabButtons = document.querySelectorAll('.tab-btn');
  tabButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      tabButtons.forEach(b => b.classList.remove('active'));
      document.querySelectorAll('.tab-pane').forEach(p => p.classList.remove('active'));

      btn.classList.add('active');
      const paneId = btn.getAttribute('data-tab');
      document.getElementById(paneId).classList.add('active');

      // Reset scroll position of the tab container so switching tabs always starts from the top
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
      if (!activeCat) return;
      const status = btn.getAttribute('data-status');
      
      // Update UI active states
      statusButtons.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      // Update Local Object
      activeCat.status = status;
      
      // Save
      saveCatData(activeCat.id, {
        status: activeCat.status,
        notes: activeCat.notes,
        customSummary: activeCat.customSummary,
        customOrdonnance: activeCat.customOrdonnance
      });

      // Update sidebar list item indicator & Stats
      updateSidebarItemUI(activeCat);
      calculateStats();
    });
  });

  // Notes save button
  saveNotesBtn.addEventListener('click', () => {
    if (!activeCat) return;
    activeCat.notes = notesInput.value;
    saveCatData(activeCat.id, {
      status: activeCat.status,
      notes: activeCat.notes,
      customSummary: activeCat.customSummary,
      customOrdonnance: activeCat.customOrdonnance
    }, true);
  });

  // Edit Summary buttons
  editSummaryBtn.addEventListener('click', () => {
    summaryView.style.display = 'none';
    summaryEditorWrapper.style.display = 'flex';
    summaryEditor.value = activeCat.customSummary || activeCat.summary;
  });

  cancelSummaryEditBtn.addEventListener('click', () => {
    summaryView.style.display = 'block';
    summaryEditorWrapper.style.display = 'none';
  });

  saveSummaryBtn.addEventListener('click', () => {
    if (!activeCat) return;
    activeCat.customSummary = summaryEditor.value;
    
    saveCatData(activeCat.id, {
      status: activeCat.status,
      notes: activeCat.notes,
      customSummary: activeCat.customSummary,
      customOrdonnance: activeCat.customOrdonnance
    });

    renderSummary(activeCat.customSummary || activeCat.summary);
    summaryView.style.display = 'block';
    summaryEditorWrapper.style.display = 'none';
  });

  // Copy prescription
  copyPrescriptionBtn.addEventListener('click', () => {
    let textToCopy = '';
    if (prescriptionVariants.length > 0 && prescriptionVariants[activePrescriptionVariantIndex]) {
      textToCopy = prescriptionVariants[activePrescriptionVariantIndex].content;
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

  // Mobile navigation
  openSidebarBtn.addEventListener('click', () => {
    sidebar.classList.add('open');
  });

  closeSidebarBtn.addEventListener('click', () => {
    sidebar.classList.remove('open');
  });

  // Accordion toggle
  allPdfsHeader.addEventListener('click', () => {
    const isOpen = allPdfsAccordion.classList.contains('open');
    if (isOpen) {
      allPdfsAccordion.classList.remove('open');
      allPdfsContent.style.display = 'none';
    } else {
      allPdfsAccordion.classList.add('open');
      allPdfsContent.style.display = 'block';
      renderAllPdfsList(); // Populate accordion
    }
  });

  // Search PDFs in accordion
  pdfSearch.addEventListener('input', filterAllPdfsList);

  // Back to dashboard logo buttons
  const brandLogo = document.getElementById('brand-logo');
  const mobileBrandLogo = document.getElementById('mobile-brand-logo');
  
  brandLogo.addEventListener('click', showDashboard);
  mobileBrandLogo.addEventListener('click', showDashboard);

  // Prescription editing
  const editPrescriptionBtn = document.getElementById('edit-prescription-btn');
  const cancelPrescriptionEditBtn = document.getElementById('cancel-prescription-edit-btn');
  const savePrescriptionBtn = document.getElementById('save-prescription-btn');
  const prescriptionEditor = document.getElementById('prescription-editor');
  const prescriptionEditorActions = document.getElementById('prescription-editor-actions');
  const workspacePrescription = document.getElementById('workspace-prescription');

  editPrescriptionBtn.addEventListener('click', () => {
    workspacePrescription.style.display = 'none';
    prescriptionEditor.style.display = 'block';
    prescriptionEditorActions.style.display = 'flex';
    prescriptionEditor.value = activeCat.customOrdonnance || activeCat.ordonnance;
  });

  cancelPrescriptionEditBtn.addEventListener('click', () => {
    workspacePrescription.style.display = 'block';
    prescriptionEditor.style.display = 'none';
    prescriptionEditorActions.style.display = 'none';
  });

  savePrescriptionBtn.addEventListener('click', () => {
    if (!activeCat) return;
    activeCat.customOrdonnance = prescriptionEditor.value;
    
    saveCatData(activeCat.id, {
      status: activeCat.status,
      notes: activeCat.notes,
      customSummary: activeCat.customSummary,
      customOrdonnance: activeCat.customOrdonnance
    });

    renderPrescription(activeCat.customOrdonnance || activeCat.ordonnance);
    workspacePrescription.style.display = 'block';
    prescriptionEditor.style.display = 'none';
    prescriptionEditorActions.style.display = 'none';
  });

  // Reset progress
  const resetProgressBtn = document.getElementById('reset-progress-btn');
  resetProgressBtn.addEventListener('click', async () => {
    if (confirm("Voulez-vous vraiment réinitialiser toute votre progression et vos notes ? Cette action est irréversible.")) {
      try {
        const res = await fetch('/api/reset', { method: 'POST' });
        const result = await res.json();
        if (result.success) {
          alert("Progression réinitialisée avec succès !");
          await initApp();
          showDashboard();
        }
      } catch (err) {
        console.error(err);
        alert("Erreur lors de la réinitialisation.");
      }
    }
  });

  // Delete CAT
  const deleteCatBtn = document.getElementById('delete-cat-btn');
  if (deleteCatBtn) {
    deleteCatBtn.addEventListener('click', async () => {
      if (!activeCat) return;
      if (activeCat.id <= 55) {
        alert("Impossible de supprimer les fiches de base (IDs 1-55).");
        return;
      }
      if (confirm(`Voulez-vous vraiment supprimer la fiche "${activeCat.title}" ? Cette action est irréversible.`)) {
        try {
          const res = await fetch(`/api/cats/${activeCat.id}`, { method: 'DELETE' });
          const result = await res.json();
          if (result.success) {
            alert("Fiche CAT supprimée avec succès !");
            await initApp();
            showDashboard();
          } else {
            alert("Erreur : " + result.error);
          }
        } catch (err) {
          console.error(err);
          alert("Erreur lors de la suppression de la fiche.");
        }
      }
    });
  }

  // Add CAT Modal control
  const addCatBtn = document.getElementById('add-cat-btn');
  const addCatModal = document.getElementById('add-cat-modal');
  const closeAddCatModalBtn = document.getElementById('close-add-cat-modal-btn');
  const cancelAddCatBtn = document.getElementById('cancel-add-cat-btn');
  const addCatForm = document.getElementById('add-cat-form');

  addCatBtn.addEventListener('click', () => {
    // Populate the datalist of categories
    const datalist = document.getElementById('categories-list-datalist');
    if (datalist) {
      const categories = [...new Set(allCats.map(c => c.category))];
      datalist.innerHTML = categories.map(cat => `<option value="${cat}"></option>`).join('');
    }
    addCatModal.style.display = 'flex';
  });

  const closeModal = () => {
    addCatModal.style.display = 'none';
    addCatForm.reset();
  };

  closeAddCatModalBtn.addEventListener('click', closeModal);
  cancelAddCatBtn.addEventListener('click', closeModal);

  addCatForm.addEventListener('submit', async (e) => {
    e.preventDefault();
    
    const title = document.getElementById('new-cat-title').value.trim();
    const category = document.getElementById('new-cat-category').value.trim();
    const red_flags = document.getElementById('new-cat-red-flags').value.trim();
    const summary = document.getElementById('new-cat-summary').value.trim();
    const ordonnance = document.getElementById('new-cat-ordonnance').value.trim();
    
    const rawKeywords = document.getElementById('new-cat-pdf-keywords').value;
    const pdf_keywords = rawKeywords ? rawKeywords.split(',').map(kw => kw.trim()).filter(kw => kw) : [];

    try {
      const res = await fetch('/api/cats', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ title, category, red_flags, summary, ordonnance, pdf_keywords })
      });
      
      const result = await res.json();
      if (result.success) {
        closeModal();
        alert(`La fiche CAT "${title}" a été ajoutée avec succès !`);
        await initApp();
        const newCat = allCats.find(c => c.id === result.cat.id);
        if (newCat) selectCat(newCat);
      } else {
        alert("Erreur : " + result.error);
      }
    } catch (err) {
      console.error(err);
      alert("Erreur lors de l'enregistrement de la nouvelle CAT.");
    }
  });
});

// App Initialization
async function initApp() {
  try {
    const [catsRes, pdfsRes] = await Promise.all([
      fetch('/api/cats'),
      fetch('/api/pdfs')
    ]);

    allCats = await catsRes.json();
    allPdfs = await pdfsRes.json();

    populateCategoryFilter();
    renderCatList(allCats);
    calculateStats();
    renderDashboard(); // Render initial dashboard
  } catch (err) {
    console.error('Error initializing app:', err);
    alert('Erreur lors du chargement des données. Assurez-vous que le serveur Node tourne.');
  }
}

// Populate Category dropdown dynamically
function populateCategoryFilter() {
  const categories = new Set(allCats.map(c => c.category));
  categoryFilter.innerHTML = '<option value="all">Toutes les spécialités</option>';
  categories.forEach(cat => {
    const opt = document.createElement('option');
    opt.value = cat;
    opt.textContent = cat;
    categoryFilter.appendChild(opt);
  });
}

// Render CATs sidebar
function renderCatList(cats) {
  catList.innerHTML = '';
  cats.forEach(cat => {
    const li = document.createElement('li');
    li.className = `cat-item ${activeCat && activeCat.id === cat.id ? 'active' : ''}`;
    li.setAttribute('data-id', cat.id);
    
    li.innerHTML = `
      <div class="cat-indicator ${cat.status}"></div>
      <div class="cat-item-content">
        <span class="cat-item-title">${cat.id}. ${cat.title}</span>
        <div class="cat-item-meta">
          <span>${cat.category}</span>
          <span>${getStatusLabel(cat.status)}</span>
        </div>
      </div>
    `;

    li.addEventListener('click', () => {
      selectCat(cat);
      // Close sidebar on mobile after selection
      if (window.innerWidth <= 850) {
        sidebar.classList.remove('open');
      }
    });

    catList.appendChild(li);
  });
}

function getStatusLabel(status) {
  switch(status) {
    case 'done': return 'Maîtrisé';
    case 'doing': return 'En cours';
    default: return 'À faire';
  }
}

// Select a CAT and load it into the workspace
function selectCat(cat) {
  activeCat = cat;
  activePrescriptionVariantIndex = 0;

  // Highlight in list
  document.querySelectorAll('.cat-item').forEach(item => {
    item.classList.remove('active');
    if (parseInt(item.getAttribute('data-id')) === cat.id) {
      item.classList.add('active');
    }
  });

  // Switch display
  welcomeScreen.style.display = 'none';
  workspace.style.display = 'flex';

  // Populate info
  wsCategory.textContent = cat.category;
  wsTitle.textContent = `${cat.id}. ${cat.title}`;
  wsRedFlags.textContent = cat.red_flags;
  
  // Set Status Buttons
  document.querySelectorAll('.status-btn').forEach(btn => {
    btn.classList.remove('active');
    if (btn.getAttribute('data-status') === cat.status) {
      btn.classList.add('active');
    }
  });

  // Render markdown-like summary
  renderSummary(cat.customSummary || cat.summary);

  // Set Notes
  notesInput.value = cat.notes || '';

  // Render prescription
  renderPrescription(cat.customOrdonnance || cat.ordonnance);

  // Reset prescription editor views
  document.getElementById('prescription-editor').style.display = 'none';
  document.getElementById('prescription-editor-actions').style.display = 'none';
  document.getElementById('workspace-prescription').style.display = 'block';

  // Load related PDFs
  loadRelatedPdfs(cat);

  // Reset active tab to first tab
  document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
  document.querySelectorAll('.tab-pane').forEach(p => p.classList.remove('active'));
  document.querySelector('.tab-btn[data-tab="tab-summary"]').classList.add('active');
  document.getElementById('tab-summary').classList.add('active');

  // Cancel any ongoing edit view
  summaryView.style.display = 'block';
  summaryEditorWrapper.style.display = 'none';

  // Show delete button only for custom CATs (id > 55)
  const deleteBtn = document.getElementById('delete-cat-btn');
  if (deleteBtn) {
    if (cat.id > 55) {
      deleteBtn.style.display = 'inline-flex';
    } else {
      deleteBtn.style.display = 'none';
    }
  }
}

// Convert line breaks and tables in markdown summaries to HTML elements
function renderSummary(text) {
  if (!text) {
    summaryView.innerHTML = '<p class="text-muted">Aucune synthèse disponible.</p>';
    return;
  }

  let html = text;

  // Bold markdown
  html = html.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');

  // Parse markdown tables if any
  if (html.includes('|')) {
    const lines = html.split('\n');
    let inTable = false;
    let tableHtml = '<table>';

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i].trim();
      if (line.startsWith('|') && line.endsWith('|')) {
        if (!inTable) {
          inTable = true;
        }
        // Skip separator line | :--- | :--- |
        if (line.includes('---')) continue;

        const cells = line.split('|').slice(1, -1).map(c => c.trim());
        tableHtml += '<tr>';
        cells.forEach(cell => {
          const cellTag = tableHtml.includes('<tr><tr>') ? 'td' : 'th'; // First row is header
          tableHtml += `<${cellTag}>${cell}</${cellTag}>`;
        });
        tableHtml += '</tr>';
      } else {
        if (inTable) {
          inTable = false;
          tableHtml += '</table>';
          lines[i] = tableHtml + '\n' + lines[i];
          tableHtml = '<table>'; // Reset
        }
      }
    }
    if (inTable) {
      tableHtml += '</table>';
      lines.push(tableHtml);
    }
    html = lines.join('\n');
  }

  // Remove raw table lines that were already parsed (to prevent double rendering)
  html = html.split('\n').filter(line => {
    const trimmed = line.trim();
    return !(trimmed.startsWith('|') && trimmed.endsWith('|'));
  }).join('\n');

  // Bullet points
  html = html.split('\n').map(line => {
    const trimmed = line.trim();
    if (trimmed.startsWith('- ')) {
      return `<li>${trimmed.substring(2)}</li>`;
    }
    return line;
  }).join('\n');

  // Wrap continuous <li> groups in <ul>
  html = html.replace(/(<li>.*?<\/li>\s*)+/gs, (match) => `<ul>${match}</ul>`);

  // Paragraph line breaks
  html = html.replace(/\n\n/g, '</p><p>').replace(/\n/g, '<br>');
  html = `<p>${html}</p>`;
  
  // Clean empty tags
  html = html.replace(/<p>\s*<\/p>/g, '').replace(/<p>\s*<ul>/g, '<ul>').replace(/<\/ul>\s*<\/p>/g, '</ul>');

  summaryView.innerHTML = html;
}

// Parse prescription text into variant sections (e.g. --- Title ---)
function parsePrescriptionText(text) {
  if (!text) return [];
  
  const lines = text.split('\n');
  const variants = [];
  let currentVariant = null;
  
  lines.forEach(line => {
    const trimmed = line.trim();
    // Match lines like: --- Cas Général ---
    const match = trimmed.match(/^---+\s*(.*?)\s*---+$/);
    if (match) {
      if (currentVariant) {
        variants.push({
          title: currentVariant.title,
          content: currentVariant.content.join('\n').trim()
        });
      }
      currentVariant = {
        title: match[1].trim(),
        content: []
      };
    } else {
      if (!currentVariant) {
        currentVariant = {
          title: "Général",
          content: []
        };
      }
      currentVariant.content.push(line);
    }
  });
  
  if (currentVariant) {
    variants.push({
      title: currentVariant.title,
      content: currentVariant.content.join('\n').trim()
    });
  }
  
  return variants.filter(v => v.content.length > 0 || v.title !== "Général");
}

// Render formatted prescription
function renderPrescription(text) {
  const selector = document.getElementById('prescription-variants-selector');
  if (!text) {
    wsPrescription.innerHTML = 'Pas d\'ordonnance type rédigée.';
    if (selector) selector.style.display = 'none';
    prescriptionVariants = [];
    return;
  }

  // Parse text into variants
  prescriptionVariants = parsePrescriptionText(text);

  if (prescriptionVariants.length <= 1) {
    if (selector) selector.style.display = 'none';
    wsPrescription.textContent = text;
  } else {
    // Show variants selector
    if (selector) {
      selector.style.display = 'flex';
      selector.innerHTML = '';
      
      // Make sure activePrescriptionVariantIndex is within bounds
      if (activePrescriptionVariantIndex >= prescriptionVariants.length) {
        activePrescriptionVariantIndex = 0;
      }

      prescriptionVariants.forEach((v, idx) => {
        const pill = document.createElement('button');
        pill.className = `status-pill ${idx === activePrescriptionVariantIndex ? 'active' : ''}`;
        pill.style.fontSize = '12px';
        pill.style.padding = '5px 12px';
        pill.textContent = v.title;
        
        pill.addEventListener('click', () => {
          activePrescriptionVariantIndex = idx;
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
    const activeVar = prescriptionVariants[activePrescriptionVariantIndex] || prescriptionVariants[0];
    wsPrescription.textContent = activeVar ? activeVar.content : text;
  }
}

// Find and show PDF files related to active CAT
function loadRelatedPdfs(cat) {
  pdfListContainer.innerHTML = '';
  
  const keywords = cat.pdf_keywords || [];
  
  // Specific PDFs matching keywords
  const matchedFiles = allPdfs.filter(filename => {
    const lowerName = filename.toLowerCase();
    // Exclude global references from specific matching so they don't duplicate
    const isGlobal = ["abouimed", "kacem", "boughoufala", "150 ordonnances", "pathognomoniques", "autres cat", "formes d_administration", "je\u00FBne"].some(g => lowerName.includes(g));
    if (isGlobal) return false;
    return keywords.some(kw => lowerName.includes(kw.toLowerCase()));
  });

  // Global PDFs (Manuals, general guides)
  const globalFiles = allPdfs.filter(filename => {
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
  card.href = `/pdfs/${encodeURIComponent(file)}`;
  card.target = '_blank';
  card.className = 'pdf-card';
  
  const isDocx = file.toLowerCase().endsWith('.docx');
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

// Remove corrupted characters / emoji codes from PDF display name
function getCleanPdfName(filename) {
  // Simple regex to clear non-ascii characters or common Termux corrupted sequences
  let name = filename.replace(/\.pdf$/i, '').replace(/\.docx$/i, '');
  // Clean emoji remnants (numbers with squares etc)
  name = name.replace(/[^\x20-\x7E\u00C0-\u00FF]/g, ' ').trim();
  // Clean double spaces
  name = name.replace(/\s+/g, ' ');
  return name;
}

// Save CAT data to the server
async function saveCatData(id, data, showIndicator = false) {
  try {
    const res = await fetch(`/api/cats/${id}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    });
    
    const result = await res.json();
    if (result.success && showIndicator) {
      saveIndicator.classList.add('show');
      setTimeout(() => {
        saveIndicator.classList.remove('show');
      }, 2500);
    }
  } catch (err) {
    console.error('Error saving data:', err);
    alert('Échec de la sauvegarde des modifications.');
  }
}

// Update the list item state dot & label on the fly
function updateSidebarItemUI(cat) {
  const item = document.querySelector(`.cat-item[data-id="${cat.id}"]`);
  if (!item) return;

  const indicator = item.querySelector('.cat-indicator');
  const metaStatus = item.querySelector('.cat-item-meta span:last-child');

  indicator.className = `cat-indicator ${cat.status}`;
  metaStatus.textContent = getStatusLabel(cat.status);
}

// Compute counts and update overall progress bar
function calculateStats() {
  let todo = 0, doing = 0, done = 0;
  
  allCats.forEach(cat => {
    if (cat.status === 'done') done++;
    else if (cat.status === 'doing') doing++;
    else todo++;
  });

  countTodo.textContent = todo;
  countDoing.textContent = doing;
  countDone.textContent = done;

  const total = allCats.length;
  const percent = total > 0 ? Math.round((done / total) * 100) : 0;
  
  progressPercent.textContent = `${percent}%`;
  progressFill.style.width = `${percent}%`;

  // If the dashboard is visible, update it too
  if (welcomeScreen.style.display !== 'none') {
    renderDashboard();
  }
}

// Filter CAT list based on search and category selections
// Filter CAT list based on search, category, and quick status filter selections
function filterCats() {
  const query = searchInput.value.toLowerCase().trim();
  const selectedCat = categoryFilter.value;

  const filtered = allCats.filter(cat => {
    // 1. Search text match (Expanded to search in Title, Summary, Red Flags, Category, and ID)
    const matchesQuery = cat.title.toLowerCase().includes(query) || 
                         cat.summary.toLowerCase().includes(query) || 
                         (cat.red_flags && cat.red_flags.toLowerCase().includes(query)) ||
                         cat.category.toLowerCase().includes(query) ||
                         cat.id.toString() === query;

    // 2. Category filter match
    const matchesCategory = selectedCat === 'all' || cat.category === selectedCat;

    // 3. Quick status / Red flags filter match
    let matchesStatus = true;
    if (activeStatusFilter === 'todo') matchesStatus = cat.status === 'todo';
    else if (activeStatusFilter === 'doing') matchesStatus = cat.status === 'doing';
    else if (activeStatusFilter === 'done') matchesStatus = cat.status === 'done';
    else if (activeStatusFilter === 'redflags') {
      matchesStatus = cat.red_flags && cat.red_flags.trim().length > 0 && 
                      !cat.red_flags.toLowerCase().includes("aucun signe de gravité") && 
                      !cat.red_flags.toLowerCase().includes("aucun");
    }

    return matchesQuery && matchesCategory && matchesStatus;
  });

  renderCatList(filtered);
}

// Accordion list of all PDFs
function renderAllPdfsList() {
  allPdfsList.innerHTML = '';
  allPdfs.forEach(file => {
    const cleanName = getCleanPdfName(file);
    const li = document.createElement('li');
    
    const isDocx = file.toLowerCase().endsWith('.docx');
    const iconClass = isDocx ? 'fa-regular fa-file-word' : 'fa-solid fa-file-pdf';
    
    li.innerHTML = `
      <a href="/pdfs/${encodeURIComponent(file)}" target="_blank" class="all-pdfs-list-item">
        <i class="${iconClass}"></i>
        <span>${cleanName} (${file.toLowerCase().endsWith('.docx') ? 'Word' : 'PDF'})</span>
      </a>
    `;
    allPdfsList.appendChild(li);
  });
}

// Filter the full list of PDFs
function filterAllPdfsList() {
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

function showDashboard() {
  activeCat = null;
  // Remove active styling from list items
  document.querySelectorAll('.cat-item').forEach(item => item.classList.remove('active'));
  
  workspace.style.display = 'none';
  welcomeScreen.style.display = 'flex';
  
  // Close sidebar on mobile
  if (window.innerWidth <= 850) {
    sidebar.classList.remove('open');
  }

  // Update dashboard elements
  renderDashboard();
}

function renderDashboard() {
  // 1. Calculate stats and update values
  let todo = 0, doing = 0, done = 0;
  allCats.forEach(cat => {
    if (cat.status === 'done') done++;
    else if (cat.status === 'doing') doing++;
    else todo++;
  });

  const total = allCats.length;
  const percent = total > 0 ? Math.round((done / total) * 100) : 0;

  const mRate = document.getElementById('dash-mastery-rate');
  const cDone = document.getElementById('dash-count-done');
  const cDoing = document.getElementById('dash-count-doing');
  const cTodo = document.getElementById('dash-count-todo');
  
  if (mRate) mRate.textContent = `${percent}%`;
  if (cDone) cDone.textContent = `${done} / ${total}`;
  if (cDoing) cDoing.textContent = `${doing} / ${total}`;
  if (cTodo) cTodo.textContent = `${todo} / ${total}`;

  // 2. Populate "Reprendre la révision" (Resume list)
  const resumeList = document.getElementById('dash-resume-list');
  if (resumeList) {
    resumeList.innerHTML = '';
    
    const inProgressCats = allCats.filter(cat => cat.status === 'doing');
    
    if (inProgressCats.length === 0) {
      resumeList.innerHTML = `<li class="empty-state">Aucun cours en cours de révision. Choisissez-en un à gauche !</li>`;
    } else {
      // Show last 5
      inProgressCats.slice(-5).reverse().forEach(cat => {
        const li = document.createElement('li');
        li.className = 'resume-item';
        li.innerHTML = `
          <span class="resume-item-title">${cat.id}. ${cat.title}</span>
          <span class="resume-item-meta"><i class="fa-solid fa-play"></i> Continuer</span>
        `;
        li.addEventListener('click', () => {
          selectCat(cat);
        });
        resumeList.appendChild(li);
      });
    }
  }

  // 3. Populate "Progrès par spécialité" (Category progress list)
  const categoriesDiv = document.getElementById('dash-categories-progress');
  if (categoriesDiv) {
    categoriesDiv.innerHTML = '';

    // Get categories and calculate stats for each
    const catStats = {};
    allCats.forEach(cat => {
      if (!catStats[cat.category]) {
        catStats[cat.category] = { total: 0, done: 0 };
      }
      catStats[cat.category].total++;
      if (cat.status === 'done') {
        catStats[cat.category].done++;
      }
    });

    // Render sorted by category name
    Object.keys(catStats).sort().forEach(catName => {
      const stats = catStats[catName];
      const catPercent = stats.total > 0 ? Math.round((stats.done / stats.total) * 100) : 0;
      
      const item = document.createElement('div');
      item.className = 'category-progress-item';
      item.innerHTML = `
        <div class="category-progress-header">
          <span>${catName}</span>
          <span>${stats.done}/${stats.total} (${catPercent}%)</span>
        </div>
        <div class="category-progress-bar">
          <div class="category-progress-fill" style="width: ${catPercent}%"></div>
        </div>
      `;
      categoriesDiv.appendChild(item);
    });
  }
}
