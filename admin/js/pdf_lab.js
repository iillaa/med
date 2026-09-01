if (window.pdfjsLib) {
      pdfjsLib.GlobalWorkerOptions.workerSrc = '/js/pdf.worker.min.js';
    }

    const API_HEADERS = {
      'Content-Type': 'application/json',
      'x-admin-token': localStorage.getItem('dr_cat_admin_token') || ''
    };

    // ── Complete Medical Specialties List (22 Specialties + Custom) ───────────
    const ALL_SPECIALTIES = [
      "Cardiologie",
      "Urgences & Réanimation",
      "Pédiatrie",
      "Gynécologie-Obstétrique",
      "Gastro-entérologie",
      "Pneumologie",
      "Infectiologie",
      "Neurologie",
      "Psychiatrie & Santé Mentale",
      "Dermatologie",
      "Endocrinologie-Diabétologie",
      "Rhumatologie",
      "Néphrologie",
      "Urologie",
      "Ophtalmologie",
      "ORL & Stomatologie",
      "Hématologie",
      "Toxicologie",
      "Médecine Interne",
      "Médecine Générale",
      "Médecine Légale",
      "Chirurgie & Traumatologie",
      "__custom__"
    ];

    function populateSpecialtySelects() {
      const selects = [
        document.getElementById('new-doc-specialty'),
        document.getElementById('slice-specialty-select'),
        document.getElementById('editor-specialty')
      ];

      selects.forEach(sel => {
        if (!sel) return;
        sel.innerHTML = '<option value="">-- Choisir la Spécialité --</option>';
        ALL_SPECIALTIES.forEach(sp => {
          const opt = document.createElement('option');
          if (sp === '__custom__') {
            opt.value = '__custom__';
            opt.textContent = '➕ Autre / Spécialité personnalisée...';
            opt.style.color = '#38bdf8';
            opt.style.fontWeight = 'bold';
          } else {
            opt.value = sp;
            opt.textContent = sp;
          }
          sel.appendChild(opt);
        });
      });
    }

    function handleSpecialtyChange(selectId, customInputId) {
      const select = document.getElementById(selectId);
      const customInput = document.getElementById(customInputId);
      if (!select || !customInput) return;

      if (select.value === '__custom__') {
        customInput.style.display = 'block';
        customInput.focus();
      } else {
        customInput.style.display = 'none';
        customInput.value = '';
      }
    }

    function getSelectedSpecialty(selectId, customInputId) {
      const select = document.getElementById(selectId);
      const customInput = document.getElementById(customInputId);
      if (!select) return 'Médecine Générale';
      if (select.value === '__custom__') {
        return (customInput && customInput.value.trim()) || 'Médecine Générale';
      }
      return select.value || 'Médecine Générale';
    }

    // ── Modal Lifecycle with Background Scroll Lock ───────────────────────────
    function openModal(modalId) {
      const el = document.getElementById(modalId);
      if (el) {
        el.style.display = 'flex';
        document.body.style.overflow = 'hidden';
      }
    }

    function closeModal(modalId) {
      const el = document.getElementById(modalId);
      if (el) {
        el.style.display = 'none';
        // Only unlock body scroll if no other modals are active
        const activeModals = document.querySelectorAll('.modal-overlay[style*="display: flex"]');
        if (activeModals.length === 0) {
          document.body.style.overflow = '';
        }
      }
    }

    function handleBackdropClick(event, modalId) {
      if (event.target && event.target.id === modalId) {
        closeModal(modalId);
      }
    }

    // ── Application State ─────────────────────────────────────────────────────
    let activeTab = 'staging';
    let stagingFiles = [];
    let masterFiles = [];
    let currentEditingDoc = null;
    let currentTocFilename = '';
    let parsedTocItems = [];
    let currentRawJsonData = null;
    let currentRawJsonFilename = '';

    // Slicer Variables
    let currentSlicerPdfDoc = null;
    let currentSlicerPageNum = 1;
    let currentSlicerScale = 1.3;
    let slicerSourceFilename = '';
    let slicerBase64 = '';
    let cropTopY = 50;
    let cropBottomY = 280;
    let isDraggingCropTop = false;
    let isDraggingCropBottom = false;
    let isDraggingCropBox = false;
    let dragBoxStartY = 0;
    let dragBoxStartTop = 0;
    let dragBoxStartBottom = 0;

    function switchTab(tabId) {
      activeTab = tabId;
      document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
      document.getElementById(`tab-btn-${tabId}`).classList.add('active');

      document.getElementById('tab-content-staging').style.display = tabId === 'staging' ? 'flex' : 'none';
      document.getElementById('tab-content-slicer').style.display = tabId === 'slicer' ? 'flex' : 'none';
      document.getElementById('tab-content-master').style.display = tabId === 'master' ? 'flex' : 'none';
      document.getElementById('tab-content-simulator').style.display = tabId === 'simulator' ? 'flex' : 'none';
    }

    async function refreshAll() {
      await Promise.all([fetchStagingList(), fetchMasterList()]);
      populateSlicerFileSelect();
    }

    // ══════════════════════════════════════════════════════════════════════════
    // 📁 FILE UPLOAD HANDLER (.pdf, .md, .txt)
    // ══════════════════════════════════════════════════════════════════════════
    async function handleFileUpload(event) {
      const file = event.target.files[0];
      if (!file) return;

      const titleInput = document.getElementById('new-doc-title');
      const formatSelect = document.getElementById('new-doc-format');
      const contentInput = document.getElementById('new-doc-content');

      const lowerName = file.name.toLowerCase();
      let ext = '.md';
      if (lowerName.endsWith('.pdf')) ext = '.pdf';
      else if (lowerName.endsWith('.txt')) ext = '.txt';
      else if (lowerName.endsWith('.md')) ext = '.md';

      if (formatSelect) formatSelect.value = ext;
      titleInput.value = file.name.replace(/\.(pdf|md|txt)$/i, '');

      if (file.name.endsWith('.pdf')) {
        const overlay = document.getElementById('overlay');
        const overlayText = document.getElementById('overlay-text');
        overlay.style.display = 'flex';
        overlayText.textContent = `Extraction de ${file.name}...`;

        const reader = new FileReader();
        reader.onload = async (e) => {
          try {
            const base64Data = e.target.result.split(',')[1];
            const res = await fetch('/api/admin/pdf-lab-parse', {
              method: 'POST',
              headers: API_HEADERS,
              body: JSON.stringify({ filename: file.name, base64Data })
            });
            const data = await res.json();
            if (!res.ok) throw new Error(data.error);

            const pages = data.result?.pages || [];
            contentInput.value = pages.map(p => `## Page ${p.page}\n${p.content || ''}`).join('\n\n---\n\n');
            alert(`✅ Extraction réussie : ${pages.length} page(s) extraite(s) !`);
          } catch (err) {
            alert(`Échec extraction: ${err.message}`);
          } finally {
            overlay.style.display = 'none';
          }
        };
        reader.readAsDataURL(file);
      } else {
        const reader = new FileReader();
        reader.onload = (e) => {
          contentInput.value = e.target.result;
        };
        reader.readAsText(file);
      }
    }

    // ══════════════════════════════════════════════════════════════════════════
    // 🧪 STAGING FUNCTIONS
    // ══════════════════════════════════════════════════════════════════════════
    async function fetchStagingList() {
      const tbody = document.getElementById('staging-table-body');
      try {
        const res = await fetch('/api/admin/staging-list', { headers: API_HEADERS });
        const data = await res.json();
        stagingFiles = data.files || [];
        document.getElementById('staging-count').textContent = stagingFiles.length;

        if (stagingFiles.length === 0) {
          tbody.innerHTML = '<tr><td colspan="6" style="text-align: center; color: var(--text-muted); padding: 20px;">Aucun document dans le staging. Utilisez le formulaire ou le Découpeur Visuel pour ajouter des fiches.</td></tr>';
          return;
        }

        tbody.innerHTML = '';
        stagingFiles.forEach(file => {
          const tr = document.createElement('tr');
          const audit = file.audit || { score: 0, grade: 'C' };
          const gradeBadge = audit.grade === 'A' 
            ? `<span class="badge badge-grade-a">Grade A (${audit.score}%)</span>`
            : (audit.grade === 'B' ? `<span class="badge badge-grade-b">Grade B (${audit.score}%)</span>` : `<span class="badge badge-grade-c">Grade C (${audit.score}%)</span>`);

          const isPromoted = file.status === 'promoted';
          const statusBadge = isPromoted
            ? `<span class="badge badge-grade-a">💎 Master Promu</span>`
            : `<span class="badge badge-offline">🟡 En Curation</span>`;

          const filename = file.pdf || file.filename || file.title || 'Sans titre';
          let formatBadge = `<span class="badge" style="background: rgba(56, 189, 248, 0.15); color: #38bdf8; border: 1px solid #38bdf8; font-size: 10px; margin-left: 6px;">📝 MD</span>`;
          if (filename.toLowerCase().endsWith('.txt')) {
            formatBadge = `<span class="badge" style="background: rgba(148, 163, 184, 0.15); color: #cbd5e1; border: 1px solid #94a3b8; font-size: 10px; margin-left: 6px;">📄 TXT</span>`;
          } else if (filename.toLowerCase().endsWith('.pdf')) {
            formatBadge = `<span class="badge" style="background: rgba(239, 68, 68, 0.15); color: #f87171; border: 1px solid #ef4444; font-size: 10px; margin-left: 6px;">📑 PDF</span>`;
          }

          tr.innerHTML = `
            <td><strong>${escapeHtml(filename)}</strong> ${formatBadge}</td>
            <td><span class="badge badge-llamaparse">${escapeHtml(file.specialty || 'Non définie')}</span></td>
            <td>${(file.pages || []).length} page(s) (${((file.audit?.checks?.totalChars || 0) / 1000).toFixed(1)}k car.)</td>
            <td>${gradeBadge}</td>
            <td>${statusBadge}</td>
            <td style="text-align: right; display: flex; gap: 6px; justify-content: flex-end; align-items: center;">
              <button class="btn-outline staging-view-btn" title="Voir / Lire le document (Ouvrir le PDF ou l'éditeur)" style="padding: 4px 8px; font-size: 11px; color: #38bdf8; border-color: #0284c7;">👁️</button>
              <button class="btn-outline staging-edit-btn" style="padding: 4px 8px; font-size: 11px;">✏️ Éditer</button>
              <button class="btn-outline staging-toc-btn" style="color: #38bdf8; padding: 4px 8px; font-size: 11px;">🎯 TOC GPS</button>
              <button class="btn-outline staging-clean-btn" style="border-color: var(--warning); color: var(--warning); padding: 4px 8px; font-size: 11px;">🧹 Nettoyer</button>
              <button class="btn-success staging-promote-btn" style="padding: 4px 10px; font-size: 11px;">💎 Promouvoir</button>
              <button class="btn-danger staging-del-btn" style="padding: 4px 8px; font-size: 11px;">✕</button>
            </td>
          `;

          tr.querySelector('.staging-view-btn').addEventListener('click', () => {
            if (filename.toLowerCase().endsWith('.pdf')) {
              window.open(`/pdfs/${encodeURIComponent(filename)}`, '_blank');
            } else {
              openEditorModal(file.id);
            }
          });
          tr.querySelector('.staging-edit-btn').addEventListener('click', () => openEditorModal(file.id));
          tr.querySelector('.staging-toc-btn').addEventListener('click', () => openTocModal(file.pdf, file.toc || []));
          tr.querySelector('.staging-clean-btn').addEventListener('click', () => cleanStagingOcr(file.id));
          tr.querySelector('.staging-promote-btn').addEventListener('click', () => promoteStagingDoc(file.id));
          tr.querySelector('.staging-del-btn').addEventListener('click', () => deleteStagingDoc(file.id));

          tbody.appendChild(tr);
        });
      } catch (err) {
        tbody.innerHTML = `<tr><td colspan="6" style="color: var(--danger); text-align: center;">Erreur de chargement: ${err.message}</td></tr>`;
      }
    }

    async function createStagingDoc() {
      let title = document.getElementById('new-doc-title').value.trim();
      const format = document.getElementById('new-doc-format') ? document.getElementById('new-doc-format').value : '.md';
      const specialty = getSelectedSpecialty('new-doc-specialty', 'new-doc-custom-specialty');
      const content = document.getElementById('new-doc-content').value.trim();

      if (!title) return alert('Veuillez spécifier un nom de fichier / titre.');
      if (!content) return alert('Veuillez coller le contenu extrait de la fiche.');

      // Strip existing extension if user typed it, then append chosen format
      title = title.replace(/\.(pdf|md|txt)$/i, '');
      const finalFilename = `${title}${format}`;

      const rawPages = content.split(/(?:\n\s*---\s*\n|\n\s*##\s*Page\s*\d+)/i).filter(p => p.trim());
      const pages = rawPages.map((text, idx) => ({
        page: idx + 1,
        content: text.trim()
      }));

      try {
        const res = await fetch('/api/admin/staging-save', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({
            pdf: finalFilename,
            format: format.replace('.', ''),
            specialty,
            pages
          })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);

        alert(`✅ Fiche "${finalFilename}" enregistrée dans le Staging !`);
        document.getElementById('new-doc-title').value = '';
        document.getElementById('new-doc-content').value = '';
        document.getElementById('new-doc-custom-specialty').value = '';
        document.getElementById('new-doc-custom-specialty').style.display = 'none';
        fetchStagingList();
      } catch (err) {
        alert(`Erreur: ${err.message}`);
      }
    }

    async function cleanStagingOcr(docId) {
      try {
        const res = await fetch('/api/admin/staging-clean-ocr', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({ id: docId })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);
        alert(data.message);
        fetchStagingList();
      } catch (err) {
        alert(`Erreur nettoyage: ${err.message}`);
      }
    }

    async function deleteStagingDoc(docId) {
      if (!confirm('Voulez-vous vraiment supprimer ce document du staging ?')) return;
      try {
        const res = await fetch('/api/admin/staging-delete', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({ id: docId })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);
        fetchStagingList();
      } catch (err) {
        alert(`Erreur suppression: ${err.message}`);
      }
    }

    async function promoteStagingDoc(docId) {
      if (!confirm('Promouvoir ce document dans le Master Production Index ?\n\nIl deviendra une référence active pour le générateur et l\'application.')) return;
      try {
        const res = await fetch('/api/admin/staging-promote', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({ id: docId })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);
        alert(data.message);
        refreshAll();
      } catch (err) {
        alert(`Erreur de promotion: ${err.message}`);
      }
    }

    // ══════════════════════════════════════════════════════════════════════════
    // ✂️ VISUAL SLICER & PDF BUILDER
    // ══════════════════════════════════════════════════════════════════════════
    function filterSlicerSelect() {
      const query = (document.getElementById('slicer-search-input')?.value || '').toLowerCase().trim();
      const select = document.getElementById('slicer-file-select');
      const currentVal = select.value;
      select.innerHTML = '<option value="">-- Choisir un PDF existant --</option>';

      const filtered = masterFiles.filter(f => 
        !query || 
        f.pdf.toLowerCase().includes(query) || 
        (f.specialty && f.specialty.toLowerCase().includes(query))
      );

      filtered.forEach(f => {
        const opt = document.createElement('option');
        opt.value = f.pdf;
        opt.textContent = `${f.pdf} (${f.pagesCount} p.)`;
        if (f.pdf === currentVal) opt.selected = true;
        select.appendChild(opt);
      });

      if (query && filtered.length > 0) {
        select.style.borderColor = '#38bdf8';
      } else {
        select.style.borderColor = 'var(--border)';
      }
    }

    function populateSlicerFileSelect() {
      filterSlicerSelect();
    }

    async function loadSelectedPdfToSlicer() {
      const filename = document.getElementById('slicer-file-select').value;
      if (!filename) return;
      slicerSourceFilename = filename;
      document.getElementById('slice-title-input').value = filename.replace(/\.pdf$/i, '') + '_Slice.pdf';

      // Auto-prefill specialty if present in master index
      const matched = masterFiles.find(f => f.pdf === filename);
      if (matched && matched.specialty) {
        const specSelect = document.getElementById('slice-specialty-select');
        const customInput = document.getElementById('slice-custom-specialty');
        if (specSelect) {
          if (Array.from(specSelect.options).some(o => o.value === matched.specialty)) {
            specSelect.value = matched.specialty;
            if (customInput) customInput.style.display = 'none';
          } else {
            specSelect.value = '__custom__';
            if (customInput) {
              customInput.value = matched.specialty;
              customInput.style.display = 'block';
            }
          }
        }
      }

      // Load uncompressed pristine Master original directly from data/pdf_masters/
      await loadPdfIntoCanvas(`/api/admin/master-pdf?filename=${encodeURIComponent(filename)}`);
    }

    function handleSlicerFileSelect(event) {
      const file = event.target.files[0];
      if (!file) return;

      slicerSourceFilename = file.name;
      document.getElementById('slice-title-input').value = file.name.replace(/\.pdf$/i, '') + '_Slice.pdf';

      const reader = new FileReader();
      reader.onload = async (e) => {
        const arrayBuffer = e.target.result;
        slicerBase64 = btoa(new Uint8Array(arrayBuffer).reduce((data, byte) => data + String.fromCharCode(byte), ''));
        await loadPdfDataIntoCanvas(arrayBuffer);
      };
      reader.readAsArrayBuffer(file);
    }

    async function loadPdfIntoCanvas(url) {
      const overlay = document.getElementById('overlay');
      overlay.style.display = 'flex';
      try {
        const loadingTask = pdfjsLib.getDocument({
          url,
          httpHeaders: API_HEADERS
        });
        currentSlicerPdfDoc = await loadingTask.promise;
        currentSlicerPageNum = 1;
        document.getElementById('slice-end-page').max = currentSlicerPdfDoc.numPages;
        document.getElementById('slice-start-page').max = currentSlicerPdfDoc.numPages;
        document.getElementById('slice-end-page').value = Math.min(2, currentSlicerPdfDoc.numPages);
        renderSlicerPage(currentSlicerPageNum);
      } catch (err) {
        alert(`Erreur chargement PDF: ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    async function loadPdfDataIntoCanvas(data) {
      const overlay = document.getElementById('overlay');
      overlay.style.display = 'flex';
      try {
        const loadingTask = pdfjsLib.getDocument({ data });
        currentSlicerPdfDoc = await loadingTask.promise;
        currentSlicerPageNum = 1;
        document.getElementById('slice-end-page').max = currentSlicerPdfDoc.numPages;
        document.getElementById('slice-start-page').max = currentSlicerPdfDoc.numPages;
        document.getElementById('slice-end-page').value = Math.min(2, currentSlicerPdfDoc.numPages);
        renderSlicerPage(currentSlicerPageNum);
      } catch (err) {
        alert(`Erreur chargement PDF: ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    let currentRenderTask = null;

    async function renderSlicerPage(num) {
      if (!currentSlicerPdfDoc) return;
      if (currentRenderTask) {
        try { currentRenderTask.cancel(); } catch (_) {}
      }
      const page = await currentSlicerPdfDoc.getPage(num);
      const viewport = page.getViewport({ scale: currentSlicerScale });
      const canvas = document.getElementById('pdf-canvas');
      const context = canvas.getContext('2d');
      canvas.height = viewport.height;
      canvas.width = viewport.width;

      const renderContext = { canvasContext: context, viewport: viewport };
      currentRenderTask = page.render(renderContext);
      try {
        await currentRenderTask.promise;
      } catch (err) {
        if (err && err.name === 'RenderingCancelledException') return;
        console.error('Render error:', err);
      } finally {
        currentRenderTask = null;
      }

      document.getElementById('slicer-page-indicator').textContent = `Page ${num} / ${currentSlicerPdfDoc.numPages}`;
      
      // Auto-bound crop coordinates to canvas height
      cropTopY = Math.min(cropTopY, canvas.height - 80);
      cropBottomY = Math.min(Math.max(cropBottomY, cropTopY + 100), canvas.height);
      updateCropOverlay();
    }

    function slicerPrevPage() {
      if (!currentSlicerPdfDoc || currentSlicerPageNum <= 1) return;
      currentSlicerPageNum--;
      renderSlicerPage(currentSlicerPageNum);
    }

    function slicerNextPage() {
      if (!currentSlicerPdfDoc || currentSlicerPageNum >= currentSlicerPdfDoc.numPages) return;
      currentSlicerPageNum++;
      renderSlicerPage(currentSlicerPageNum);
    }

    function slicerZoom(delta) {
      currentSlicerScale = Math.max(0.6, Math.min(3.0, currentSlicerScale + delta));
      if (currentSlicerPdfDoc) renderSlicerPage(currentSlicerPageNum);
    }

    function slicerResetZoom() {
      currentSlicerScale = 1.3;
      if (currentSlicerPdfDoc) renderSlicerPage(currentSlicerPageNum);
    }

    function toggleSlicerMode() {
      const mode = document.getElementById('slicer-mode-select').value;
      const pageRangeControls = document.getElementById('page-range-controls');
      const standardFields = document.getElementById('standard-slicer-fields');
      const zoneEraserControls = document.getElementById('zone-eraser-controls');
      const handles = [
        document.getElementById('crop-handle-top'),
        document.getElementById('crop-handle-bottom'),
        document.getElementById('crop-mask-top'),
        document.getElementById('crop-mask-bottom'),
        document.getElementById('crop-box-highlight')
      ];

      if (mode === 'page_range') {
        if (standardFields) standardFields.style.display = 'flex';
        if (zoneEraserControls) zoneEraserControls.style.display = 'none';
        pageRangeControls.style.display = 'grid';
        handles.forEach(el => el.style.display = 'none');
      } else if (mode === 'zone_eraser') {
        if (standardFields) standardFields.style.display = 'none';
        if (zoneEraserControls) zoneEraserControls.style.display = 'flex';
        pageRangeControls.style.display = 'none';
        handles.forEach(el => el.style.display = 'block');
      } else {
        if (standardFields) standardFields.style.display = 'flex';
        if (zoneEraserControls) zoneEraserControls.style.display = 'none';
        pageRangeControls.style.display = 'none';
        handles.forEach(el => el.style.display = 'block');
      }
    }

    // ── Touch & Mouse Resizing / Dragging Implementation ──────────────────────
    const handleTop = document.getElementById('crop-handle-top');
    const handleBottom = document.getElementById('crop-handle-bottom');
    const cropHighlight = document.getElementById('crop-box-highlight');
    const canvasWrapper = document.getElementById('canvas-wrapper');

    function onPointerDown(type, e) {
      e.stopPropagation();
      const clientY = e.touches ? e.touches[0].clientY : e.clientY;
      if (type === 'top') isDraggingCropTop = true;
      if (type === 'bottom') isDraggingCropBottom = true;
      if (type === 'box') {
        isDraggingCropBox = true;
        dragBoxStartY = clientY;
        dragBoxStartTop = cropTopY;
        dragBoxStartBottom = cropBottomY;
      }
    }

    handleTop.addEventListener('mousedown', (e) => onPointerDown('top', e));
    handleTop.addEventListener('touchstart', (e) => onPointerDown('top', e), { passive: false });

    handleBottom.addEventListener('mousedown', (e) => onPointerDown('bottom', e));
    handleBottom.addEventListener('touchstart', (e) => onPointerDown('bottom', e), { passive: false });

    cropHighlight.addEventListener('mousedown', (e) => onPointerDown('box', e));
    cropHighlight.addEventListener('touchstart', (e) => onPointerDown('box', e), { passive: false });

    function onPointerUp() {
      isDraggingCropTop = false;
      isDraggingCropBottom = false;
      isDraggingCropBox = false;
    }

    window.addEventListener('mouseup', onPointerUp);
    window.addEventListener('touchend', onPointerUp);

    function onPointerMove(e) {
      if (!isDraggingCropTop && !isDraggingCropBottom && !isDraggingCropBox) return;
      if (e.cancelable) e.preventDefault(); // Prevent accidental page scrolling during handle drag

      const clientY = e.touches ? e.touches[0].clientY : e.clientY;
      const rect = canvasWrapper.getBoundingClientRect();
      const y = clientY - rect.top;
      const canvasHeight = document.getElementById('pdf-canvas').height || 800;

      if (isDraggingCropTop) {
        cropTopY = Math.max(0, Math.min(y, cropBottomY - 40));
      } else if (isDraggingCropBottom) {
        cropBottomY = Math.max(cropTopY + 40, Math.min(y, canvasHeight));
      } else if (isDraggingCropBox) {
        const delta = clientY - dragBoxStartY;
        const boxHeight = dragBoxStartBottom - dragBoxStartTop;
        let newTop = dragBoxStartTop + delta;
        let newBottom = dragBoxStartBottom + delta;

        if (newTop < 0) {
          newTop = 0;
          newBottom = boxHeight;
        } else if (newBottom > canvasHeight) {
          newBottom = canvasHeight;
          newTop = canvasHeight - boxHeight;
        }
        cropTopY = newTop;
        cropBottomY = newBottom;
      }
      updateCropOverlay();
    }

    window.addEventListener('mousemove', onPointerMove);
    window.addEventListener('touchmove', onPointerMove, { passive: false });

    function updateCropOverlay() {
      document.getElementById('crop-mask-top').style.height = `${cropTopY}px`;
      document.getElementById('crop-handle-top').style.top = `${cropTopY}px`;
      document.getElementById('crop-box-highlight').style.top = `${cropTopY}px`;
      document.getElementById('crop-box-highlight').style.height = `${cropBottomY - cropTopY}px`;
      document.getElementById('crop-handle-bottom').style.top = `${cropBottomY}px`;
      document.getElementById('crop-mask-bottom').style.top = `${cropBottomY}px`;
    }

    async function executeSliceAction() {
      const mode = document.getElementById('slicer-mode-select').value;
      const title = document.getElementById('slice-title-input').value.trim();
      const specialty = getSelectedSpecialty('slice-specialty-select', 'slice-custom-specialty');
      const pathology = document.getElementById('slice-pathology-input').value.trim();

      if (!title) return alert('Veuillez entrer un titre pour la fiche.');

      const overlay = document.getElementById('overlay');
      const overlayText = document.getElementById('overlay-text');
      overlay.style.display = 'flex';
      overlayText.textContent = `Découpage et création du nouveau PDF : ${title}...`;

      try {
        let payload = {
          title,
          specialty,
          pathology,
          sourceFilename: slicerSourceFilename,
          base64Data: slicerBase64,
          mode
        };

        if (mode === 'image_crop') {
          // Crop image from canvas with +15px safety margin
          const canvas = document.getElementById('pdf-canvas');
          const safeTop = Math.max(0, cropTopY - 15);
          const safeHeight = Math.min(canvas.height - safeTop, (cropBottomY - cropTopY) + 30);
          
          const cropCanvas = document.createElement('canvas');
          cropCanvas.width = canvas.width;
          cropCanvas.height = safeHeight;
          const ctx = cropCanvas.getContext('2d');
          ctx.drawImage(canvas, 0, safeTop, canvas.width, safeHeight, 0, 0, canvas.width, safeHeight);

          payload.croppedImageBase64 = cropCanvas.toDataURL('image/png');
          payload.startPage = currentSlicerPageNum;
          payload.endPage = currentSlicerPageNum;
        } else {
          payload.startPage = parseInt(document.getElementById('slice-start-page').value, 10) || 1;
          payload.endPage = parseInt(document.getElementById('slice-end-page').value, 10) || payload.startPage;
        }

        const res = await fetch('/api/admin/slice-pdf', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify(payload)
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);

        if (activeSlicingSegmentId) {
          const seg = currentAiSegments.find(s => s.id === activeSlicingSegmentId);
          if (seg) {
            seg.sliced = true;
            renderAiSegmentCards(currentAiSegments);
            document.getElementById('ai-slice-approved-count').textContent = currentAiSegments.filter(s => !s.sliced).length;
          }
        }

        alert(`✅ Fiche "${title}" découpée avec succès et créée dans le Staging !`);
        switchTab('staging');
        fetchStagingList();
      } catch (err) {
        alert(`Échec découpage: ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    // 🧽 VISUAL ZONE ERASER (MASQUAGE / NETTOYAGE VECTORIEL)
    async function applyVisualZoneErase() {
      const filename = slicerSourceFilename || document.getElementById('slicer-file-select').value;
      if (!filename) return alert('Veuillez d\'abord charger un PDF dans le Découpeur.');

      const canvas = document.getElementById('pdf-canvas');
      if (!canvas) return alert('Canvas introuvable.');

      const zoneH = cropBottomY - cropTopY;
      if (zoneH <= 5) return alert('Veuillez définir une zone à masquer en glissant le cadre bleu.');

      const confirmErase = confirm(`🧽 Masquer cette zone sur la page ${currentSlicerPageNum} de "${filename}" ?\nCette action appliquera un masque vectoriel blanc propre directement sur le document.`);
      if (!confirmErase) return;

      const overlay = document.getElementById('overlay');
      const overlayText = document.getElementById('overlay-text');
      overlay.style.display = 'flex';
      overlayText.textContent = `Masquage de la zone sur la page ${currentSlicerPageNum}...`;

      try {
        const payload = {
          filename,
          pageNum: currentSlicerPageNum,
          zone: {
            x: 0,
            y: cropTopY,
            width: canvas.width,
            height: zoneH,
            canvasWidth: canvas.width,
            canvasHeight: canvas.height
          }
        };

        const res = await fetch('/api/admin/erase-pdf-zone', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify(payload)
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);

        alert(`✅ ${data.message}`);
        // Reload current PDF document and re-render current page
        await loadPdfIntoSlicer(filename, currentSlicerPageNum);
      } catch (err) {
        alert(`Échec masquage: ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    // ══════════════════════════════════════════════════════════════════════════
    // 🤖 AI SMART SLICER, COVERAGE & PATHOLOGY CATALOGER
    // ══════════════════════════════════════════════════════════════════════════
    let currentAiSegments = [];
    let currentAiIgnoredSegments = [];
    let currentCoverageData = null;
    let rawSlicedTreeData = null;
    let doneMastersList = [];

    async function triggerAutoSegmentCurrentPdf() {
      const filename = slicerSourceFilename || document.getElementById('slicer-file-select').value;
      if (!filename) {
        return alert("Veuillez sélectionner ou charger un PDF dans le Découpeur avant de lancer la détection IA.");
      }

      const overlay = document.getElementById('overlay');
      const overlayText = document.getElementById('overlay-text');
      overlay.style.display = 'flex';
      overlayText.textContent = `🤖 Analyse IA des chapitres et pathologies pour "${filename}"...`;

      try {
        const res = await fetch('/api/admin/auto-segment-pdf', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({ filename })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error || "Échec de l'analyse IA");

        currentAiSegments = data.segments || [];
        currentAiIgnoredSegments = [];
        currentCoverageData = data.coverage || null;

        if (currentAiSegments.length === 0) {
          alert(`Aucun segment clinique distinct n'a été détecté pour ${filename}.`);
          return;
        }

        renderCoverageBar(currentCoverageData);
        renderAiSegmentCards(currentAiSegments);
        renderIgnoredSegmentsCards(currentAiIgnoredSegments);

        document.getElementById('ai-segments-container').style.display = 'block';
        document.getElementById('ai-segments-meta').textContent = `${currentAiSegments.length} fiche(s) suggérée(s) pour "${filename}"`;
        document.getElementById('ai-slice-approved-count').textContent = currentAiSegments.filter(s => !s.sliced).length;
      } catch (err) {
        alert(`Erreur Détection IA : ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    function renderCoverageBar(cov) {
      const badge = document.getElementById('ai-coverage-badge');
      const detail = document.getElementById('ai-coverage-detail');
      const residualBox = document.getElementById('ai-residual-action-box');
      const residualCount = document.getElementById('ai-residual-pages-count');

      if (!cov) {
        badge.textContent = `📊 Analyse de couverture prête`;
        detail.textContent = ``;
        residualBox.style.display = 'none';
        return;
      }

      const unassigned = (cov.uncoveredPages || []).length;
      if (cov.coveragePercent >= 95 || unassigned === 0) {
        badge.style.color = '#34d399';
        badge.textContent = `📊 Couverture Complète : ${cov.coveragePercent}% (${cov.coveredCount}/${cov.totalPages} pages traitées)`;
        detail.textContent = `100% de la matière médicale couverte.`;
        residualBox.style.display = 'none';
      } else {
        badge.style.color = '#fbbf24';
        badge.textContent = `📊 Couverture : ${cov.coveragePercent}% (${cov.coveredCount}/${cov.totalPages} pages traitées)`;
        detail.textContent = `${unassigned} page(s) orpheline(s) non incluses dans les fiches principales.`;
        residualBox.style.display = 'block';
        residualCount.textContent = unassigned;
      }
    }

    async function createResidualReviewDocument() {
      if (!currentCoverageData || !currentCoverageData.uncoveredPages || currentCoverageData.uncoveredPages.length === 0) {
        return alert("Aucune page résiduelle à extraire.");
      }

      const filename = slicerSourceFilename || document.getElementById('slicer-file-select').value;
      const unassigned = currentCoverageData.uncoveredPages;

      if (!confirm(`Extraire ces ${unassigned.length} pages orphelines (${unassigned.join(', ')}) dans un sous-document résiduel pour examen ?`)) return;

      const overlay = document.getElementById('overlay');
      const overlayText = document.getElementById('overlay-text');
      overlay.style.display = 'flex';
      overlayText.textContent = `📦 Création du PDF résiduel (${unassigned.length} pages)...`;

      try {
        const res = await fetch('/api/admin/create-residual-slice', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({
            sourceFilename: filename,
            uncoveredPages: unassigned
          })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error || "Erreur lors de l'extraction du résidu");

        alert(`🎉 ${data.message}`);
        fetchStagingList();
        switchTab('staging');
      } catch (err) {
        alert(`Échec : ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    function closeAiSegmentsPanel() {
      document.getElementById('ai-segments-container').style.display = 'none';
    }

    function updateSegmentField(segId, field, val) {
      const seg = currentAiSegments.find(s => s.id === segId) || currentAiIgnoredSegments.find(s => s.id === segId);
      if (!seg) return;
      if (field === 'startPage' || field === 'endPage') {
        const num = parseInt(val, 10);
        if (!isNaN(num) && num >= 1) {
          seg[field] = num;
          if (seg.startPage > seg.endPage) seg.endPage = seg.startPage;
          seg.pageCount = (seg.endPage - seg.startPage) + 1;
        }
      } else {
        seg[field] = val;
      }
    }

    function addNewManualSegment() {
      const curPage = currentSlicerPageNum || 1;
      const newSeg = {
        id: `seg_${Date.now()}_custom`,
        pathology: 'Nouvelle Pathologie / Molécule',
        title: `Extrait_Page_${curPage}.pdf`,
        specialty: 'Médecine Générale',
        startPage: curPage,
        endPage: curPage,
        pageCount: 1,
        keyTopics: ['Clinique', 'Traitement'],
        summary: '',
        confidence: 'high',
        sliced: false
      };
      currentAiSegments.unshift(newSeg);
      renderAiSegmentCards(currentAiSegments);
      document.getElementById('ai-slice-approved-count').textContent = currentAiSegments.filter(s => !s.sliced).length;
    }

    function splitSegmentToPages(segId) {
      const seg = currentAiSegments.find(s => s.id === segId);
      if (!seg || seg.startPage >= seg.endPage) return;

      const idx = currentAiSegments.indexOf(seg);
      const newSlices = [];
      for (let p = seg.startPage; p <= seg.endPage; p++) {
        newSlices.push({
          id: `seg_${Date.now()}_p${p}`,
          pathology: `${seg.pathology} (P.${p})`,
          title: `${seg.title.replace(/\.pdf$/i, '')}_P${p}.pdf`,
          specialty: seg.specialty,
          startPage: p,
          endPage: p,
          pageCount: 1,
          keyTopics: seg.keyTopics,
          summary: seg.summary,
          confidence: seg.confidence,
          sliced: false
        });
      }
      currentAiSegments.splice(idx, 1, ...newSlices);
      renderAiSegmentCards(currentAiSegments);
      document.getElementById('ai-slice-approved-count').textContent = currentAiSegments.filter(s => !s.sliced).length;
    }

    async function archiveCurrentMasterPdf() {
      const filename = slicerSourceFilename || document.getElementById('slicer-file-select').value;
      if (!filename) return alert("Veuillez d'abord sélectionner un PDF.");

      if (!confirm(`Archiver le Master "${filename}" dans data/pdf_done/ ?\n\nIl sera retiré de l'index actif mais conservé en archive pour consultation.`)) return;

      const overlay = document.getElementById('overlay');
      const overlayText = document.getElementById('overlay-text');
      overlay.style.display = 'flex';
      overlayText.textContent = `📦 Archivage du Master "${filename}"...`;

      try {
        const res = await fetch('/api/admin/archive-pdf-master', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({ filename })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error || "Erreur lors de l'archivage.");

        alert(`✅ ${data.message}`);
        refreshAll();
        closeAiSegmentsPanel();
      } catch (err) {
        alert(`Échec : ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    function renderAiSegmentCards(segments) {
      const list = document.getElementById('ai-segments-list');
      const banner = document.getElementById('ai-completion-banner');
      list.innerHTML = '';

      if (!segments || segments.length === 0) {
        list.innerHTML = '<div style="color: var(--text-muted); padding: 15px; grid-column: 1 / -1; text-align: center;">Aucun segment actif dans la file.</div>';
        if (banner) banner.style.display = 'none';
        return;
      }

      const allSliced = segments.length > 0 && segments.every(s => s.sliced);
      if (banner) banner.style.display = allSliced ? 'flex' : 'none';

      segments.forEach(seg => {
        const card = document.createElement('div');
        card.className = `ai-segment-card ${seg.sliced ? 'sliced-done' : ''}`;
        card.id = `card-${seg.id}`;

        const topicBadges = (seg.keyTopics || []).map(t => `<span class="ai-segment-topic-pill">${escapeHtml(t)}</span>`).join(' ');

        let confBadge = `<span class="conf-high">🟢 Haute</span>`;
        if (seg.confidence === 'medium') {
          confBadge = `<span class="conf-medium">🟡 Moyenne</span>`;
        } else if (seg.confidence === 'uncertain') {
          confBadge = `<span class="conf-uncertain">⚪ À Vérifier</span>`;
        }

        const specialtyOptions = ALL_SPECIALTIES.map(sp => `<option value="${escapeHtml(sp)}" ${sp === seg.specialty ? 'selected' : ''}>${escapeHtml(sp)}</option>`).join('');

        card.innerHTML = `
          <div style="display: flex; justify-content: space-between; align-items: center; gap: 8px;">
            <div style="display: flex; gap: 6px; align-items: center; flex: 1;">
              <span style="color: #38bdf8; font-size: 13px;">🩺</span>
              <input type="text" value="${escapeHtml(seg.pathology)}" onchange="updateSegmentField('${seg.id}', 'pathology', this.value)" style="flex: 1; background: #070a10; border: 1px solid var(--border); color: #38bdf8; font-weight: bold; font-size: 13px; padding: 4px 8px; border-radius: 4px;" title="Cliquer pour modifier la pathologie" />
            </div>
            <div style="display: flex; gap: 4px; align-items: center;">
              ${confBadge}
            </div>
          </div>

          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 6px; margin-top: 2px;">
            <div style="display: flex; align-items: center; gap: 4px; min-width: 0;">
              <span style="font-size: 11px; color: var(--text-muted); flex-shrink: 0;">📄 Fichier:</span>
              <input type="text" value="${escapeHtml(seg.title)}" onchange="updateSegmentField('${seg.id}', 'title', this.value)" style="width: 100%; min-width: 0; box-sizing: border-box; background: #070a10; border: 1px solid var(--border); color: #f8fafc; font-size: 11px; font-family: monospace; padding: 3px 6px; border-radius: 4px;" title="Nom du PDF découpé" />
            </div>
            <div style="display: flex; align-items: center; gap: 4px; min-width: 0;">
              <span style="font-size: 11px; color: var(--text-muted); flex-shrink: 0;">🏷️ Spéc:</span>
              <select onchange="updateSegmentField('${seg.id}', 'specialty', this.value)" style="width: 100%; min-width: 0; box-sizing: border-box; background: #070a10; border: 1px solid var(--border); color: #cbd5e1; font-size: 11px; padding: 3px 4px; border-radius: 4px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">
                ${specialtyOptions}
              </select>
            </div>
          </div>

          <div style="display: flex; align-items: center; justify-content: space-between; gap: 8px; font-size: 12px; background: rgba(0,0,0,0.25); padding: 4px 8px; border-radius: 4px;">
            <div style="display: flex; align-items: center; gap: 6px;">
              <span style="font-size: 11px; color: var(--text-muted);">Pages:</span>
              <input type="number" min="1" value="${seg.startPage}" onchange="updateSegmentField('${seg.id}', 'startPage', this.value); renderAiSegmentCards(currentAiSegments);" style="width: 45px; background: #070a10; border: 1px solid var(--border); color: #38bdf8; font-weight: bold; text-align: center; padding: 2px 4px; border-radius: 4px; font-size: 11.5px;" />
              <span style="color: var(--text-muted);">➔</span>
              <input type="number" min="1" value="${seg.endPage}" onchange="updateSegmentField('${seg.id}', 'endPage', this.value); renderAiSegmentCards(currentAiSegments);" style="width: 45px; background: #070a10; border: 1px solid var(--border); color: #38bdf8; font-weight: bold; text-align: center; padding: 2px 4px; border-radius: 4px; font-size: 11.5px;" />
              <span style="color: var(--text-muted); font-size: 10.5px;">(${seg.pageCount} p.)</span>
            </div>
            ${seg.pageCount > 1 ? `<button onclick="splitSegmentToPages('${seg.id}')" class="btn-outline" style="padding: 2px 6px; font-size: 10px; color: #fbbf24; border-color: rgba(251,191,36,0.4);" title="Diviser ce bloc de ${seg.pageCount} pages en fiches individuelles de 1 page">✂️ Scinder (1p/fiche)</button>` : ''}
          </div>

          ${seg.summary ? `<p style="font-size: 11px; color: #94a3b8; margin: 0; line-height: 1.3;">${escapeHtml(seg.summary)}</p>` : ''}
          
          <div style="display: flex; gap: 4px; flex-wrap: wrap;">
            ${topicBadges}
          </div>

          <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 4px; padding-top: 6px; border-top: 1px solid rgba(255,255,255,0.06); flex-wrap: wrap; gap: 6px;">
            <div style="display: flex; gap: 6px;">
              <button onclick="jumpToSegmentById('${seg.id}')" class="btn-outline" style="padding: 3px 8px; font-size: 11px; color: #38bdf8; border-color: rgba(56,189,248,0.4);" title="Prévisualiser sur le Canvas et charger les paramètres">👁️ Charger & Recadrer</button>
              <button onclick="ignoreSegment('${seg.id}')" class="btn-outline" style="padding: 3px 6px; font-size: 11px; color: #f87171; border-color: rgba(239,68,68,0.4);" title="Mettre de côté ce segment">✕ Ignorer</button>
            </div>
            ${seg.sliced 
              ? '<span style="color: #34d399; font-size: 11px; font-weight: bold;">✅ Découpé & Classé</span>'
              : `<button onclick="sliceSingleAiSegment('${seg.id}')" class="btn-success" style="padding: 4px 10px; font-size: 11px; font-weight: bold;">✂️ Découper</button>`
            }
          </div>
        `;
        list.appendChild(card);
      });
    }

    function renderIgnoredSegmentsCards(ignored) {
      const container = document.getElementById('ai-ignored-container');
      const list = document.getElementById('ai-ignored-list');
      const countEl = document.getElementById('ai-ignored-count');

      countEl.textContent = ignored.length;
      if (ignored.length === 0) {
        container.style.display = 'none';
        list.innerHTML = '';
        return;
      }

      container.style.display = 'block';
      list.innerHTML = '';

      ignored.forEach(seg => {
        const item = document.createElement('div');
        item.style.cssText = "background: #0f172a; border: 1px solid rgba(239, 68, 68, 0.3); border-radius: 6px; padding: 8px; display: flex; justify-content: space-between; align-items: center; gap: 8px;";
        item.innerHTML = `
          <div>
            <strong style="font-size: 12px; color: #fca5a5;">${escapeHtml(seg.pathology)}</strong>
            <div style="font-size: 11px; color: var(--text-muted); font-family: monospace;">p. ${seg.startPage} → ${seg.endPage}</div>
          </div>
          <button onclick="restoreIgnoredSegment('${seg.id}')" class="btn-outline" style="border-color: #34d399; color: #34d399; padding: 2px 8px; font-size: 11px; font-weight: bold;">
            ↩️ Restaurer
          </button>
        `;
        list.appendChild(item);
      });
    }

    function toggleIgnoredDrawer() {
      const list = document.getElementById('ai-ignored-list');
      const arrow = document.getElementById('ai-ignored-toggle-arrow');
      if (list.style.display === 'none' || list.style.display === '') {
        list.style.display = 'grid';
        arrow.textContent = '▲ Masquer';
      } else {
        list.style.display = 'none';
        arrow.textContent = '▼ Afficher';
      }
    }

    let activeSlicingSegmentId = null;

    function jumpToSegmentById(segId) {
      const seg = currentAiSegments.find(s => s.id === segId) || currentAiIgnoredSegments.find(s => s.id === segId);
      if (!seg) return;
      activeSlicingSegmentId = segId;
      jumpToSegmentPages(seg.startPage, seg.endPage, seg.title, seg.specialty, seg.pathology, segId);
    }

    function jumpToSegmentPages(startPage, endPage, title, specialty, pathology, segId = null) {
      if (segId) activeSlicingSegmentId = segId;
      document.getElementById('slicer-mode-select').value = 'page_range';
      toggleSlicerMode();
      document.getElementById('slice-start-page').value = startPage;
      document.getElementById('slice-end-page').value = endPage;
      document.getElementById('slice-title-input').value = title || '';
      document.getElementById('slice-pathology-input').value = pathology || '';

      const specSelect = document.getElementById('slice-specialty-select');
      const customSpecInput = document.getElementById('slice-custom-specialty');
      if (Array.from(specSelect.options).some(o => o.value === specialty)) {
        specSelect.value = specialty;
        if (customSpecInput) {
          customSpecInput.value = '';
          customSpecInput.style.display = 'none';
        }
      } else {
        specSelect.value = 'Autre';
        if (customSpecInput) {
          customSpecInput.value = specialty || '';
          customSpecInput.style.display = 'block';
        }
      }

      currentSlicerPageNum = startPage;
      renderSlicerPage(currentSlicerPageNum);

      // Smooth scroll directly to the canvas & customizer workspace
      const workspace = document.querySelector('.slicer-workspace');
      if (workspace) {
        workspace.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
      }
    }

    function ignoreSegment(segId) {
      const seg = currentAiSegments.find(s => s.id === segId);
      if (!seg) return;

      currentAiSegments = currentAiSegments.filter(s => s.id !== segId);
      currentAiIgnoredSegments.push(seg);

      renderAiSegmentCards(currentAiSegments);
      renderIgnoredSegmentsCards(currentAiIgnoredSegments);
      document.getElementById('ai-slice-approved-count').textContent = currentAiSegments.filter(s => !s.sliced).length;
    }

    function restoreIgnoredSegment(segId) {
      const seg = currentAiIgnoredSegments.find(s => s.id === segId);
      if (!seg) return;

      currentAiIgnoredSegments = currentAiIgnoredSegments.filter(s => s.id !== segId);
      currentAiSegments.push(seg);
      currentAiSegments.sort((a, b) => a.startPage - b.startPage);

      renderAiSegmentCards(currentAiSegments);
      renderIgnoredSegmentsCards(currentAiIgnoredSegments);
      document.getElementById('ai-slice-approved-count').textContent = currentAiSegments.filter(s => !s.sliced).length;
    }

    async function sliceSingleAiSegment(segId) {
      const seg = currentAiSegments.find(s => s.id === segId) || currentAiIgnoredSegments.find(s => s.id === segId);
      if (!seg) return;

      const filename = slicerSourceFilename || document.getElementById('slicer-file-select').value;
      const overlay = document.getElementById('overlay');
      const overlayText = document.getElementById('overlay-text');
      overlay.style.display = 'flex';
      overlayText.textContent = `✂️ Découpage et indexation cache de "${seg.title}"...`;

      try {
        const res = await fetch('/api/admin/auto-slice-execute', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({
            sourceFilename: filename,
            segments: [seg],
            markDone: false
          })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error || "Erreur de découpage");

        seg.sliced = true;
        renderAiSegmentCards(currentAiSegments);
        document.getElementById('ai-slice-approved-count').textContent = currentAiSegments.filter(s => !s.sliced).length;
        fetchStagingList();
      } catch (err) {
        alert(`Échec : ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    async function executeBatchSliceAllApproved() {
      const pendingSegments = currentAiSegments.filter(s => !s.sliced);
      if (pendingSegments.length === 0) {
        return alert("Tous les segments proposés ont déjà été découpés !");
      }

      const filename = slicerSourceFilename || document.getElementById('slicer-file-select').value;
      const markDone = document.getElementById('ai-mark-done-checkbox').checked;

      if (!confirm(`Découper, indexer (LlamaParse direct) et classer automatiquement ces ${pendingSegments.length} segments dans data/pdf_sliced/ ?${markDone ? '\n\nLe fichier source sera ensuite archivé dans data/pdf_done/.' : ''}`)) return;

      const overlay = document.getElementById('overlay');
      const overlayText = document.getElementById('overlay-text');
      overlay.style.display = 'flex';
      overlayText.textContent = `✂️ Découpage par lot de ${pendingSegments.length} fiche(s)...`;

      try {
        const res = await fetch('/api/admin/auto-slice-execute', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({
            sourceFilename: filename,
            segments: pendingSegments,
            markDone
          })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error || "Erreur de découpage par lot");

        currentAiSegments.forEach(s => s.sliced = true);
        renderAiSegmentCards(currentAiSegments);
        document.getElementById('ai-slice-approved-count').textContent = '0';

        alert(`🎉 ${data.message}`);
        fetchStagingList();
        if (markDone) {
          refreshAll();
          closeAiSegmentsPanel();
        }
      } catch (err) {
        alert(`Échec du découpage par lot : ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    async function openSlicerWithAutoSegment(filename) {
      switchTab('slicer');
      const searchInput = document.getElementById('slicer-search-input');
      if (searchInput) searchInput.value = '';
      populateSlicerFileSelect();
      document.getElementById('slicer-file-select').value = filename;
      await loadSelectedPdfToSlicer();
      await triggerAutoSegmentCurrentPdf();
    }

    async function openSlicedLibraryModal() {
      openModal('sliced-library-modal');
      const container = document.getElementById('sliced-tree-content');
      container.innerHTML = '<div style="text-align: center; color: var(--text-muted); padding: 30px;">Chargement de l\'arborescence...</div>';

      try {
        const res = await fetch('/api/admin/sliced-tree', {
          headers: API_HEADERS
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error || "Erreur chargement arborescence");

        rawSlicedTreeData = data;
        document.getElementById('sliced-tree-total-count').textContent = data.totalSlices || 0;
        document.getElementById('sliced-tree-done-count').textContent = data.doneCount || 0;
        renderSlicedTree(data.tree || {});
      } catch (err) {
        container.innerHTML = `<div style="color: #ef4444; padding: 20px; text-align: center;">Erreur : ${escapeHtml(err.message)}</div>`;
      }
    }

    // ══════════════════════════════════════════════════════════════════════════
    // 📦 DONE ARCHIVED MASTERS MODAL & RESTORATION
    // ══════════════════════════════════════════════════════════════════════════
    async function openDonePdfsModal() {
      openModal('done-masters-modal');
      const tbody = document.getElementById('done-masters-table-body');
      tbody.innerHTML = '<tr><td colspan="4" style="text-align: center; color: var(--text-muted); padding: 20px;">Chargement des masters archivés...</td></tr>';

      try {
        const res = await fetch('/api/admin/done-pdfs-list', { headers: API_HEADERS });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error || "Erreur chargement masters archivés");

        doneMastersList = data.files || [];
        document.getElementById('done-modal-total-count').textContent = doneMastersList.length;
        const doneHeaderCount = document.getElementById('done-masters-count');
        if (doneHeaderCount) doneHeaderCount.textContent = doneMastersList.length;

        renderDoneMastersTable(doneMastersList);
      } catch (err) {
        tbody.innerHTML = `<tr><td colspan="4" style="color: #ef4444; text-align: center;">Erreur : ${escapeHtml(err.message)}</td></tr>`;
      }
    }

    function renderDoneMastersTable(files) {
      const tbody = document.getElementById('done-masters-table-body');
      tbody.innerHTML = '';

      if (!files || files.length === 0) {
        tbody.innerHTML = '<tr><td colspan="4" style="text-align: center; color: var(--text-muted); padding: 25px;">Aucun fichier master archivé pour le moment dans <code>data/pdf_done/</code>.</td></tr>';
        return;
      }

      files.forEach(f => {
        const tr = document.createElement('tr');
        const sizeMb = (f.size / (1024 * 1024)).toFixed(2);
        const dateStr = f.timestamp ? new Date(f.timestamp).toLocaleString('fr-FR') : '-';

        tr.innerHTML = `
          <td><strong style="color: #c084fc;">📄 ${escapeHtml(f.pdf)}</strong></td>
          <td><span style="font-family: monospace; color: var(--text-muted);">${sizeMb} Mo</span></td>
          <td><span style="font-size: 12px; color: var(--text-muted);">${dateStr}</span></td>
          <td style="text-align: right;">
            <button onclick="restoreMasterPdf('${escapeHtml(f.pdf).replace(/'/g, "\\'")}')" class="btn-outline" style="border-color: #34d399; color: #34d399; padding: 4px 10px; font-size: 11.5px; font-weight: bold;">
              ↩️ Restaurer dans Master Corpus
            </button>
          </td>
        `;
        tbody.appendChild(tr);
      });
    }

    function filterDoneMastersList() {
      const q = (document.getElementById('done-modal-filter').value || '').toLowerCase().trim();
      const filtered = doneMastersList.filter(f => f.pdf.toLowerCase().includes(q));
      renderDoneMastersTable(filtered);
    }

    async function restoreMasterPdf(filename) {
      if (!confirm(`Voulez-vous restaurer "${filename}" dans le Master Production Corpus ?\n\nLe document réapparaîtra immédiatement dans la file de travail et dans la recherche.`)) return;

      const overlay = document.getElementById('overlay');
      const overlayText = document.getElementById('overlay-text');
      overlay.style.display = 'flex';
      overlayText.textContent = `↩️ Restauration de "${filename}"...`;

      try {
        const res = await fetch('/api/admin/restore-pdf-master', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({ filename })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error || "Erreur de restauration");

        alert(`🎉 ${data.message}`);
        openDonePdfsModal();
        fetchMasterList();
        populateSlicerFileSelect();
      } catch (err) {
        alert(`Échec : ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    function renderSlicedTree(tree) {
      const container = document.getElementById('sliced-tree-content');
      container.innerHTML = '';

      const specialties = Object.keys(tree).sort();
      if (specialties.length === 0) {
        container.innerHTML = '<div style="color: var(--text-muted); padding: 30px; text-align: center;">Aucun extrait classé pour le moment dans <code>data/pdf_sliced/</code>. Découpez des fiches avec le Slicer IA pour les voir apparaître ici !</div>';
        return;
      }

      specialties.forEach(spec => {
        const pathologiesObj = tree[spec] || {};
        const patholKeys = Object.keys(pathologiesObj).sort();
        let specTotalFiles = 0;
        patholKeys.forEach(pk => specTotalFiles += (pathologiesObj[pk] || []).length);

        const specBox = document.createElement('details');
        specBox.open = true;
        specBox.style.cssText = 'background: #0f172a; border: 1px solid var(--border); border-radius: 8px; padding: 10px 14px;';

        let patholHtml = '';
        patholKeys.forEach(pk => {
          const files = pathologiesObj[pk] || [];
          const filesListHtml = files.map(f => {
            const kbSize = (f.size / 1024).toFixed(1);
            return `
              <div style="display: flex; justify-content: space-between; align-items: center; background: rgba(255,255,255,0.03); padding: 6px 10px; border-radius: 6px; font-size: 12px; margin-top: 4px;">
                <div style="display: flex; align-items: center; gap: 8px;">
                  <span>📄</span>
                  <a href="/pdfs/${encodeURIComponent(f.filename)}" target="_blank" style="color: #38bdf8; text-decoration: none; font-weight: 500;">${escapeHtml(f.filename)}</a>
                  <span style="color: var(--text-muted); font-size: 11px;">(${kbSize} KB)</span>
                </div>
                <div style="display: flex; gap: 6px;">
                  <button onclick="window.open('/pdfs/${encodeURIComponent(f.filename)}', '_blank')" class="btn-outline" style="padding: 2px 7px; font-size: 11px;">👁️ Ouvrir</button>
                </div>
              </div>
            `;
          }).join('');

          patholHtml += `
            <div style="margin-top: 8px; border-left: 2px solid #0284c7; padding-left: 10px;">
              <div style="font-weight: bold; color: #e2e8f0; font-size: 12.5px; display: flex; align-items: center; gap: 6px;">
                <span>🩺</span>
                <span>${escapeHtml(pk)}</span>
                <span style="font-size: 11px; color: var(--text-muted); font-weight: normal;">(${files.length} fichier(s))</span>
              </div>
              <div style="display: flex; flex-direction: column; gap: 4px; margin-top: 4px;">
                ${filesListHtml}
              </div>
            </div>
          `;
        });

        specBox.innerHTML = `
          <summary style="font-weight: bold; font-size: 14px; color: #38bdf8; cursor: pointer; display: flex; justify-content: space-between; align-items: center;">
            <span>📂 ${escapeHtml(spec)}</span>
            <span class="badge badge-llamaparse">${specTotalFiles} extrait(s)</span>
          </summary>
          <div style="display: flex; flex-direction: column; gap: 8px; margin-top: 10px;">
            ${patholHtml}
          </div>
        `;
        container.appendChild(specBox);
      });
    }

    function filterSlicedTree() {
      if (!rawSlicedTreeData || !rawSlicedTreeData.tree) return;
      const query = (document.getElementById('sliced-tree-filter')?.value || '').toLowerCase().trim();
      if (!query) {
        renderSlicedTree(rawSlicedTreeData.tree);
        return;
      }

      const filteredTree = {};
      const orig = rawSlicedTreeData.tree;

      Object.keys(orig).forEach(spec => {
        const specMatches = spec.toLowerCase().includes(query);
        const filteredPathols = {};

        Object.keys(orig[spec] || {}).forEach(pathol => {
          const patholMatches = pathol.toLowerCase().includes(query);
          const matchingFiles = (orig[spec][pathol] || []).filter(f => f.filename.toLowerCase().includes(query));

          if (specMatches || patholMatches || matchingFiles.length > 0) {
            filteredPathols[pathol] = orig[spec][pathol];
          }
        });

        if (Object.keys(filteredPathols).length > 0) {
          filteredTree[spec] = filteredPathols;
        }
      });

      renderSlicedTree(filteredTree);
    }

    // ══════════════════════════════════════════════════════════════════════════
    // ✏️ IN-BROWSER PAGE EDITOR
    // ══════════════════════════════════════════════════════════════════════════
    function openEditorModal(docId) {
      currentEditingDoc = stagingFiles.find(d => d.id === docId);
      if (!currentEditingDoc) return;

      document.getElementById('editor-title').textContent = `✏️ Éditeur : ${currentEditingDoc.pdf}`;
      document.getElementById('editor-subtitle').textContent = `ID: ${currentEditingDoc.id}`;
      document.getElementById('editor-specialty').value = currentEditingDoc.specialty || 'Médecine Générale';

      renderEditorPages();
      openModal('editor-modal');
    }

    function renderEditorPages() {
      const container = document.getElementById('editor-pages-container');
      container.innerHTML = '';
      const pages = currentEditingDoc.pages || [];

      pages.forEach((p, idx) => {
        const pageBox = document.createElement('div');
        pageBox.style.cssText = 'background: #0f172a; padding: 12px; border-radius: 8px; border: 1px solid var(--border); display: flex; flex-direction: column; gap: 6px;';
        pageBox.innerHTML = `
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <strong style="color: var(--primary); font-size: 13px;">Page ${p.page || idx + 1}</strong>
            <button onclick="removeEditorPage(${idx})" class="btn-outline" style="color: var(--danger); padding: 2px 6px; font-size: 11px;">Supprimer Page</button>
          </div>
          <textarea class="editor-page-text" data-idx="${idx}" rows="5" style="width: 100%; box-sizing: border-box; background: #070a10; color: #fff; border: 1px solid var(--border); border-radius: 6px; padding: 8px; font-family: monospace; font-size: 12px; resize: vertical;">${escapeHtml(p.content || '')}</textarea>
        `;
        container.appendChild(pageBox);
      });
    }

    function addEditorPage() {
      if (!currentEditingDoc) return;
      currentEditingDoc.pages = currentEditingDoc.pages || [];
      currentEditingDoc.pages.push({
        page: currentEditingDoc.pages.length + 1,
        content: ''
      });
      renderEditorPages();
    }

    function removeEditorPage(idx) {
      if (!currentEditingDoc) return;
      currentEditingDoc.pages.splice(idx, 1);
      currentEditingDoc.pages.forEach((p, i) => p.page = i + 1);
      renderEditorPages();
    }

    function cleanEditorOcr() {
      document.querySelectorAll('.editor-page-text').forEach(ta => {
        let text = ta.value;
        text = text.replace(/\bamoxici11ine\b/gi, 'amoxicilline')
                   .replace(/\bhoerdumon\b/gi, 'hématome')
                   .replace(/\bvraaroudaire\b/gi, 'ventriculaire')
                   .replace(/\s+/g, ' ');
        ta.value = text;
      });
    }

    async function saveEditorDoc() {
      if (!currentEditingDoc) return;

      const textareas = document.querySelectorAll('.editor-page-text');
      const updatedPages = [];
      textareas.forEach((ta, idx) => {
        updatedPages.push({
          page: idx + 1,
          content: ta.value.trim()
        });
      });

      currentEditingDoc.specialty = document.getElementById('editor-specialty').value;
      currentEditingDoc.pages = updatedPages;

      try {
        const res = await fetch('/api/admin/staging-save', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify(currentEditingDoc)
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);

        closeModal('editor-modal');
        fetchStagingList();
      } catch (err) {
        alert(`Erreur: ${err.message}`);
      }
    }

    // ══════════════════════════════════════════════════════════════════════════
    // 🎯 TOC GPS INDEXER MODAL
    // ══════════════════════════════════════════════════════════════════════════
    function openTocModal(filename, existingToc = []) {
      currentTocFilename = filename;
      document.getElementById('toc-modal-filename').textContent = `Fichier : ${filename}`;
      const tocInput = document.getElementById('toc-input');

      if (Array.isArray(existingToc) && existingToc.length > 0) {
        tocInput.value = existingToc.map(item => `- ${item.title} .................... ${item.page}`).join('\n');
      } else {
        tocInput.value = '';
      }

      previewTocParse();
      openModal('toc-modal');
    }

    function clearTocInput() {
      document.getElementById('toc-input').value = '';
      previewTocParse();
    }

    function previewTocParse() {
      const text = document.getElementById('toc-input').value;
      const countEl = document.getElementById('toc-parsed-count');
      const tbody = document.getElementById('toc-preview-rows');

      parsedTocItems = [];
      const lines = text.split('\n');
      const regex = /^\s*[-*•]?\s*(.+?)\s*(?:\.{2,}|\s{3,}|…|\t)\s*(\d{1,4})\s*$/;

      lines.forEach(line => {
        const trimmed = line.trim();
        if (!trimmed) return;
        const match = trimmed.match(regex);
        if (match && match[1] && match[2]) {
          parsedTocItems.push({
            title: match[1].replace(/^[-*•\d.)\s]+/, '').trim(),
            page: parseInt(match[2], 10)
          });
        }
      });

      countEl.textContent = parsedTocItems.length;

      if (parsedTocItems.length === 0) {
        tbody.innerHTML = '<tr><td colspan="2" style="text-align: center; color: var(--text-muted); font-size: 12px;">Aucun chapitre détecté.</td></tr>';
        return;
      }

      tbody.innerHTML = '';
      parsedTocItems.forEach(item => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
          <td style="padding: 6px 10px; font-weight: 500;">${escapeHtml(item.title)}</td>
          <td style="padding: 6px 10px; text-align: right; color: var(--primary); font-weight: bold;">Page ${item.page}</td>
        `;
        tbody.appendChild(tr);
      });
    }

    async function saveTocData() {
      if (parsedTocItems.length === 0) {
        return alert('Aucun chapitre détecté. Veuillez entrer un sommaire valide.');
      }

      try {
        const res = await fetch('/api/admin/save-pdf-toc', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({
            filename: currentTocFilename,
            toc: parsedTocItems
          })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);

        alert(`✅ Sommaire GPS enregistré avec ${parsedTocItems.length} chapitres !`);
        closeModal('toc-modal');
        refreshAll();
      } catch (err) {
        alert(`Erreur: ${err.message}`);
      }
    }

    // ══════════════════════════════════════════════════════════════════════════
    // 💎 MASTER CORPUS FUNCTIONS & RESTORED V1 ACTIONS
    // ══════════════════════════════════════════════════════════════════════════
    async function fetchMasterList() {
      const tbody = document.getElementById('master-table-body');
      try {
        const res = await fetch('/api/admin/pdf-lab-list', { headers: API_HEADERS });
        const data = await res.json();
        masterFiles = data.files || [];
        document.getElementById('master-count').textContent = masterFiles.length;
        renderMasterTable(masterFiles);

        // Also update done masters count
        fetch('/api/admin/done-pdfs-list', { headers: API_HEADERS })
          .then(r => r.json())
          .then(d => {
            const countEl = document.getElementById('done-masters-count');
            if (countEl && d.success) countEl.textContent = d.count || 0;
          }).catch(() => {});
      } catch (err) {
        tbody.innerHTML = `<tr><td colspan="6" style="color: var(--danger); text-align: center;">Erreur: ${err.message}</td></tr>`;
      }
    }

    function getQualityBadgeHtml(quality) {
      const q = (quality || '').toLowerCase();
      if (q.includes('llama_cached_slice') || q.includes('ai_smart_sliced') || q.includes('sliced')) {
        return '<span class="badge badge-llamaparse" style="background: rgba(14, 165, 233, 0.25); border-color: #38bdf8;">🦙 Llama Slice</span>';
      }
      if (q === 'online' || q === 'llamaparse' || q.includes('llama')) {
        return '<span class="badge badge-llamaparse">🦙 LlamaParse</span>';
      }
      if (q === 'online-google' || q === 'google' || q.includes('gemini')) {
        return '<span class="badge badge-google">✨ Gemini OCR</span>';
      }
      if (q === 'curated_master' || q === 'curated') {
        return '<span class="badge badge-curated">💎 Curated Master</span>';
      }
      return '<span class="badge badge-offline">⚡ Offline</span>';
    }

    function renderMasterTable(files) {
      const tbody = document.getElementById('master-table-body');
      if (files.length === 0) {
        tbody.innerHTML = '<tr><td colspan="6" style="text-align: center; color: var(--text-muted);">Aucun fichier trouvé.</td></tr>';
        return;
      }

      tbody.innerHTML = '';
      files.forEach(file => {
        const tr = document.createElement('tr');
        const date = new Date(file.timestamp).toLocaleDateString();

        const tocPill = (file.tocCount || 0) > 0
          ? `<span class="badge badge-llamaparse" style="margin-left: 4px;">🎯 GPS (${file.tocCount})</span>`
          : '';

        const qualityBadge = getQualityBadgeHtml(file.quality);

        tr.innerHTML = `
          <td>
            <div style="display: flex; align-items: center; gap: 6px;">
              <a href="/pdfs/${encodeURIComponent(file.pdf)}" target="_blank" title="Ouvrir le PDF" style="text-decoration: none; font-size: 15px;">👁️</a>
              <strong>${escapeHtml(file.pdf)}</strong>
            </div>
          </td>
          <td>${qualityBadge}</td>
          <td>${file.pagesCount} p. (${((file.totalWords || 0) / 1000).toFixed(1)}k mots)</td>
          <td><span class="badge badge-grade-a">💎 Master</span>${tocPill}</td>
          <td style="color: var(--text-muted); font-size: 12px;">${date}</td>
          <td style="text-align: right;">
            <div style="display: flex; gap: 5px; justify-content: flex-end; flex-wrap: wrap;">
              <button class="btn-outline master-view-pdf-btn" title="Ouvrir et lire le PDF dans un nouvel onglet" style="padding: 4px 7px; font-size: 11px;">👁️</button>
              <button class="btn-outline master-autoslice-btn" title="Lancer l'assistant IA de découpage par pathologie" style="color: #34d399; border-color: #059669; padding: 4px 8px; font-size: 11px; font-weight: bold;">🤖 Auto-Slice</button>
              <button class="btn-outline master-inspect-btn" title="Inspection détaillée de la densité par page" style="padding: 4px 8px; font-size: 11px;">🔍 Inspecter</button>
              <button class="btn-outline master-json-btn" title="Ouvrir l'inspecteur JSON grand écran (90%)" style="color: #38bdf8; border-color: var(--primary); padding: 4px 8px; font-size: 11px;">📄 JSON</button>
              <button class="btn-outline master-reparse-btn" title="Forcer la ré-extraction en ligne (Re-Parse / Force Upgrade)" style="color: var(--warning); border-color: var(--warning); padding: 4px 8px; font-size: 11px;">⚡ Re-Parse</button>
              <button class="btn-outline master-compress-btn" title="Compresser ce PDF avec Ghostscript pour l'APK" style="color: #38bdf8; border-color: #38bdf8; padding: 4px 7px; font-size: 11px;">🗜️</button>
              <button class="btn-outline master-toc-btn" title="Éditer le sommaire GPS" style="color: #38bdf8; padding: 4px 8px; font-size: 11px;">🎯 TOC</button>
              <button class="btn-outline master-delete-btn" title="Supprimer définitivement ce PDF" style="color: #ef4444; border-color: #ef4444; padding: 4px 7px; font-size: 11px;">🗑️</button>
            </div>
          </td>
        `;

        tr.querySelector('.master-view-pdf-btn').addEventListener('click', () => window.open(`/pdfs/${encodeURIComponent(file.pdf)}`, '_blank'));
        tr.querySelector('.master-autoslice-btn').addEventListener('click', () => openSlicerWithAutoSegment(file.pdf));
        tr.querySelector('.master-inspect-btn').addEventListener('click', () => inspectMasterPdf(file));
        tr.querySelector('.master-json-btn').addEventListener('click', () => openJsonModal(file.pdf));
        tr.querySelector('.master-reparse-btn').addEventListener('click', () => forceReextractPdf(file.pdf));
        tr.querySelector('.master-compress-btn').addEventListener('click', () => compressSinglePdf(file.pdf));
        tr.querySelector('.master-toc-btn').addEventListener('click', () => openTocModal(file.pdf, file.toc || []));
        tr.querySelector('.master-delete-btn').addEventListener('click', () => deleteMasterPdf(file.pdf));

        tbody.appendChild(tr);
      });
    }

    function filterMasterList() {
      const term = document.getElementById('master-filter-input').value.toLowerCase();
      const filtered = masterFiles.filter(f => f.pdf.toLowerCase().includes(term));
      renderMasterTable(filtered);
    }

    // ── 📄 Dedicated 90% Width JSON Inspector ─────────────────────────────────
    async function openJsonModal(pdfName) {
      currentRawJsonFilename = pdfName;
      document.getElementById('json-modal-title').textContent = `JSON Inspecteur : ${pdfName}`;
      document.getElementById('json-modal-subtitle').textContent = `Fichier : /data/pdf_cache/${pdfName}.json`;
      document.getElementById('json-modal-pre').textContent = 'Chargement du contenu JSON...';
      document.getElementById('json-search-input').value = '';
      openModal('json-modal');

      try {
        const res = await fetch(`/api/admin/pdf-lab-json?filename=${encodeURIComponent(pdfName)}`, { headers: API_HEADERS });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);

        currentRawJsonData = data.result;
        const formatted = JSON.stringify(currentRawJsonData, null, 2);
        document.getElementById('json-modal-pre').textContent = formatted;
        document.getElementById('json-stats-badge').textContent = `${(formatted.length / 1024).toFixed(1)} KB | ${(currentRawJsonData.pages || []).length} page(s)`;
      } catch (err) {
        document.getElementById('json-modal-pre').textContent = `Erreur de chargement: ${err.message}`;
      }
    }

    function filterJsonModalContent() {
      if (!currentRawJsonData) return;
      const term = document.getElementById('json-search-input').value.trim().toLowerCase();
      const fullText = JSON.stringify(currentRawJsonData, null, 2);

      if (!term) {
        document.getElementById('json-modal-pre').textContent = fullText;
        return;
      }

      // Filter pages matching search query
      const filteredDoc = { ...currentRawJsonData };
      if (Array.isArray(filteredDoc.pages)) {
        filteredDoc.pages = filteredDoc.pages.filter(p => (p.content || '').toLowerCase().includes(term));
      }
      document.getElementById('json-modal-pre').textContent = JSON.stringify(filteredDoc, null, 2);
    }

    function copyJsonModalContent() {
      if (!currentRawJsonData) return;
      navigator.clipboard.writeText(JSON.stringify(currentRawJsonData, null, 2)).then(() => {
        alert('📋 JSON complet copié dans le presse-papier !');
      });
    }

    function downloadJsonModalContent() {
      if (!currentRawJsonData) return;
      const blob = new Blob([JSON.stringify(currentRawJsonData, null, 2)], { type: 'application/json' });
      const a = document.createElement('a');
      a.href = URL.createObjectURL(blob);
      a.download = `${currentRawJsonFilename}.json`;
      a.click();
    }

    // ── 🔍 Restored Detailed Page Breakdown Modal ─────────────────────────────
    function inspectMasterPdf(file) {
      document.getElementById('inspect-modal-title').textContent = `Inspection : ${file.pdf}`;
      document.getElementById('inspect-modal-hash').textContent = `Hash SHA-256: ${file.hash || 'N/A'}`;
      
      document.getElementById('inspect-modal-engine').innerHTML = getQualityBadgeHtml(file.quality);
        
      document.getElementById('inspect-modal-words').textContent = `${(file.totalWords || 0).toLocaleString()} mots (${((file.totalChars || 0) / 1000).toFixed(1)}k car.)`;
      document.getElementById('inspect-modal-savings').textContent = file.savedPercent > 0 ? `-${file.savedPercent}% économisé` : '0%';

      // Wire Action Buttons inside Modal
      document.getElementById('inspect-open-pdf-btn').onclick = () => window.open(`/pdfs/${encodeURIComponent(file.pdf)}`, '_blank');
      document.getElementById('inspect-view-json-btn').onclick = () => {
        closeModal('inspect-modal');
        openJsonModal(file.pdf);
      };

      const tbody = document.getElementById('inspect-modal-page-rows');
      tbody.innerHTML = '';

      const pages = file.pageStats || [];
      const maxChars = Math.max(...pages.map(p => p.chars || 0), 1);

      pages.forEach(p => {
        const percent = Math.min(Math.round((p.chars / maxChars) * 100), 100);
        const tr = document.createElement('tr');
        tr.innerHTML = `
          <td style="padding: 6px 12px; font-weight: bold; color: var(--primary);">p. ${p.page}</td>
          <td style="padding: 6px 12px;">${p.words.toLocaleString()}</td>
          <td style="padding: 6px 12px; color: var(--text-muted);">${p.chars.toLocaleString()}</td>
          <td style="padding: 6px 12px; width: 45%;">
            <div style="display: flex; align-items: center; gap: 8px;">
              <div style="background: rgba(255,255,255,0.08); flex: 1; height: 8px; border-radius: 4px; overflow: hidden;">
                <div style="background: linear-gradient(90deg, #0ea5e9, #10b981); width: ${percent}%; height: 100%;"></div>
              </div>
              <span style="font-size: 11px; color: var(--text-muted); font-family: monospace; min-width: 32px;">${percent}%</span>
            </div>
          </td>
        `;
        tbody.appendChild(tr);
      });

      openModal('inspect-modal');
    }

    // ── ⚡ Force Re-Extract (Re-Parse / Force Upgrade) ─────────────────────────
    async function forceReextractPdf(filename) {
      if (!confirm(`Forcer la ré-extraction complète de "${filename}" en ligne via LlamaParse / Google OCR ?\n\nLe cache actuel sera purgé.`)) return;

      const overlay = document.getElementById('overlay');
      const overlayText = document.getElementById('overlay-text');
      overlay.style.display = 'flex';
      overlayText.textContent = `Ré-extraction forcée en cours pour : ${filename}...`;

      try {
        const res = await fetch('/api/admin/pdf-lab-force-extract', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({ filename })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);

        alert(`✅ Ré-extraction réussie pour "${filename}" !\nPages traitées : ${(data.result?.pages || []).length}`);
        fetchMasterList();
      } catch (err) {
        alert(`Échec ré-extraction: ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    async function deleteMasterPdf(filename) {
      if (!confirm(`Voulez-vous vraiment supprimer définitivement le PDF "${filename}" du Master Index ?`)) return;
      try {
        const res = await fetch('/api/admin/delete-pdf', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({ filename })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);
        alert(data.message);
        fetchMasterList();
      } catch (err) {
        alert(`Erreur: ${err.message}`);
      }
    }

    async function triggerBatchReindex() {
      if (!confirm("⚡ Lancer une réindexation globale de tous les PDFs du Master Corpus (Batch Parse) ?\n\nLe moteur va réanalyser l'ensemble des fichiers originaux sans modifier vos brouillons en Staging.")) return;
      const overlay = document.getElementById('overlay');
      const overlayText = document.getElementById('overlay-text');
      overlay.style.display = 'flex';
      overlayText.textContent = "Réindexation globale du Master Corpus en cours (Batch Parse)...";

      try {
        const res = await fetch('/api/reindex', {
          method: 'POST',
          headers: API_HEADERS
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);

        alert("✅ Réindexation globale du Master Corpus lancée avec succès en arrière-plan !");
        setTimeout(() => {
          fetchMasterList();
        }, 2000);
      } catch (err) {
        alert(`Erreur réindexation: ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    async function triggerCompressAllPdfs() {
      if (!confirm("🗜️ Lancer la compression double pipeline Ghostscript sur tous les PDFs Master ?\n\nCela optimisera et réduira considérablement la taille de l'application APK.")) return;
      const overlay = document.getElementById('overlay');
      const overlayText = document.getElementById('overlay-text');
      overlay.style.display = 'flex';
      overlayText.textContent = "Compression et optimisation de tous les PDFs pour l'APK en cours...";

      try {
        const res = await fetch('/api/admin/compress-all-pdfs', {
          method: 'POST',
          headers: API_HEADERS
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);
        alert(`✅ ${data.message}`);
        fetchMasterList();
      } catch (err) {
        alert(`Erreur de compression: ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    async function compressSinglePdf(filename) {
      const overlay = document.getElementById('overlay');
      const overlayText = document.getElementById('overlay-text');
      overlay.style.display = 'flex';
      overlayText.textContent = `Compression de ${filename}...`;

      try {
        const res = await fetch('/api/admin/compress-pdf', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({ filename })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error);
        alert(`✅ ${data.message}`);
        fetchMasterList();
      } catch (err) {
        alert(`Erreur de compression: ${err.message}`);
      } finally {
        overlay.style.display = 'none';
      }
    }

    // ══════════════════════════════════════════════════════════════════════════
    // 🔍 RAG SIMULATOR FUNCTIONS
    // ══════════════════════════════════════════════════════════════════════════
    async function runRagSimulation() {
      const query = document.getElementById('sim-query-input').value.trim();
      if (!query) return alert('Veuillez entrer une requête médicale à tester.');

      const container = document.getElementById('sim-results-container');
      const list = document.getElementById('sim-results-list');
      const countSpan = document.getElementById('sim-results-count');

      list.innerHTML = '<div style="color: var(--text-muted);">Recherche en cours...</div>';
      container.style.display = 'block';

      try {
        const res = await fetch('/api/admin/rag-simulate', {
          method: 'POST',
          headers: API_HEADERS,
          body: JSON.stringify({ query })
        });
        const data = await res.json();
        const results = data.results || [];
        countSpan.textContent = results.length;

        if (results.length === 0) {
          list.innerHTML = '<div style="color: var(--warning); padding: 10px;">Aucun document PDF local ne correspond à cette requête.</div>';
          return;
        }

        list.innerHTML = '';
        results.forEach((doc, idx) => {
          const docBox = document.createElement('div');
          docBox.style.cssText = 'background: #0f172a; padding: 15px; border-radius: 8px; border: 1px solid var(--border); display: flex; flex-direction: column; gap: 10px;';
          
          let matchesHtml = '';
          (doc.matches || []).forEach(m => {
            const hasCutWarning = m.snippet && m.snippet.length > 500 && !['.', '!', '?'].includes(m.snippet.trim().slice(-1));
            const cutWarningBadge = hasCutWarning
              ? '<span class="badge badge-failed" style="margin-left: 6px;">⚠️ Risque de Coupure N+1</span>'
              : '<span class="badge badge-grade-a" style="margin-left: 6px;">✅ Phrase Complète</span>';

            matchesHtml += `
              <div style="background: rgba(0,0,0,0.3); padding: 10px; border-radius: 6px; border: 1px solid rgba(255,255,255,0.05);">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 6px;">
                  <strong style="color: var(--primary);">Page ${m.page} (Score: ${m.score} pts)</strong>
                  ${cutWarningBadge}
                </div>
                <pre style="margin: 0; max-height: 150px; font-size: 11px; white-space: pre-wrap;">${escapeHtml(m.snippet || '')}</pre>
              </div>
            `;
          });

          docBox.innerHTML = `
            <div style="display: flex; justify-content: space-between; align-items: center;">
              <strong style="font-size: 15px; color: #38bdf8;">#${idx + 1} ${escapeHtml(doc.pdfFile)}</strong>
              <span class="badge badge-grade-a">Score Total: ${doc.docScore} pts</span>
            </div>
            <div style="display: flex; flex-direction: column; gap: 8px;">${matchesHtml}</div>
          `;
          list.appendChild(docBox);
        });

      } catch (err) {
        list.innerHTML = `<div style="color: var(--danger);">Erreur simulation: ${err.message}</div>`;
      }
    }

    // ══════════════════════════════════════════════════════════════════════════
    // UTILITIES
    // ══════════════════════════════════════════════════════════════════════════
    function copyStandardizationPrompt() {
      const prompt = `Tu es un médecin réviseur et expert en synthèse clinique pour le moteur RAG Dr.CAT.
Ta mission est de transformer ce texte/cours médical brut en une ressource clinique parfaitement structurée au format Markdown (.md).

RÈGLES DE STRUCTURATION OBLIGATOIRES :
1. Titre clair au sommet : # Conduite à tenir devant [NOM DE LA PATHOLOGIE]
2. Spécialité et Mots-clés : **Spécialité :** [Cardiologie/Pédiatrie...] | **Mots-clés :** [DCI, synonymes]
3. Structuration en 5 sections académiques claires :
   ## 1. Étiologie, Clinique & Diagnostic
   - Sémiologie clé, interrogatoire, critères diagnostiques positifs.
   ## 2. Drapeaux Rouges & Critères d'Hospitalisation
   - Signes de gravité imposant un avis spécialisé ou une urgence vitale.
   ## 3. Examens complémentaires
   - Bilan biologique, ECG, imagerie de 1ère et 2nde intention.
   ## 4. Traitement, Posologies & RHD
   - Molécules DCI avec posologies cibles exactes (adulte et pédiatrique en mg/kg/j).
   - Mesures hygiéno-diététiques et éducation du patient.
   ## 5. Surveillance & Volet Médico-Légal
   - Critères d'amélioration, éviction, ALD 30, arrêt de travail.

4. Conserve TOUTES les molécules, dosages et détails thérapeutiques réels sans rien tronquer.
Génère UNIQUEMENT le texte Markdown propre sans bavardage.`;

      navigator.clipboard.writeText(prompt).then(() => {
        alert('📋 Prompt de Standardisation PDF Lab 2.0 copié dans le presse-papier !');
      }).catch(() => {
        prompt('Copiez le prompt :', prompt);
      });
    }

    function escapeHtml(str) {
      if (!str) return '';
      return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
    }

    // Initialize on load
    window.addEventListener('DOMContentLoaded', () => {
      populateSpecialtySelects();
      refreshAll();
    });
