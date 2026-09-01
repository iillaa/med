let labData = null;
    let selectedCatId = null;

    function showToast(msg, isError = false) {
      const toast = document.getElementById('toast-msg');
      toast.textContent = msg;
      toast.style.borderColor = isError ? 'var(--danger)' : 'var(--success)';
      toast.style.display = 'block';
      setTimeout(() => { toast.style.display = 'none'; }, 4000);
    }

    function getAdminToken() {
      return localStorage.getItem('dr_cat_admin_token') || sessionStorage.getItem('dr_cat_admin_token') || '';
    }

    async function loadData() {
      try {
        const token = getAdminToken();
        const res = await fetch('/api/admin/quiz-lab/data', {
          headers: { 'x-admin-token': token }
        });
        if (!res.ok) {
          throw new Error('Erreur HTTP ' + res.status);
        }
        labData = await res.json();
        document.getElementById('val-total-cats').textContent = labData.totalCats || 0;
        document.getElementById('val-staged-count').textContent = labData.stagedCount || 0;
        document.getElementById('val-public-count').textContent = labData.publicCount || 0;
        renderList(labData.items);

        if (selectedCatId) {
          const found = labData.items.find(c => c.id === selectedCatId);
          if (found) renderInspector(found);
        }
      } catch (err) {
        showToast('Échec du chargement du Quiz Lab : ' + err.message, true);
      }
    }

    function renderList(items) {
      const container = document.getElementById('cats-list-container');
      if (!items || items.length === 0) {
        container.innerHTML = '<div style="padding: 20px; text-align: center; color: var(--text-muted);">Aucune CAT trouvée.</div>';
        return;
      }

      container.innerHTML = items.map(cat => {
        const isActive = cat.id === selectedCatId ? 'active' : '';
        const badge = cat.hasStagedQuiz
          ? `<span class="badge badge-success">🟢 Prêt (${cat.vignetteCount} cas)</span>`
          : `<span class="badge badge-danger">🔴 Non généré</span>`;

        return `
          <div class="cat-item ${isActive}" onclick="selectCat(${cat.id})">
            <div class="cat-item-top">
              <span class="cat-title">${escapeHTML(cat.title)}</span>
              ${badge}
            </div>
            <div style="display: flex; justify-content: space-between; align-items: center; font-size: 11.5px; color: var(--text-muted);">
              <span><i class="fa-solid fa-folder"></i> ${escapeHTML(cat.category)}</span>
              <span>#${cat.id}</span>
            </div>
          </div>
        `;
      }).join('');
    }

    function selectCat(id) {
      selectedCatId = id;
      const cat = (labData.items || []).find(c => c.id === id);
      if (cat) {
        renderList(labData.items);
        renderInspector(cat);
      }
    }

    function renderInspector(cat) {
      const container = document.getElementById('inspector-container');
      const staged = cat.stagedData || {};

      let html = `
        <div style="display: flex; justify-content: space-between; align-items: flex-start; border-bottom: 1px solid var(--border); padding-bottom: 16px; margin-bottom: 20px;">
          <div>
            <div style="display: flex; align-items: center; gap: 10px;">
              <h2 style="margin: 0; font-size: 18px; color: var(--text);">${escapeHTML(cat.title)}</h2>
              <span class="badge badge-cat">${escapeHTML(cat.category)}</span>
            </div>
            <p style="margin: 4px 0 0 0; font-size: 13px; color: var(--text-muted);">ID #${cat.id} • Statut Staging : ${cat.hasStagedQuiz ? '🟢 Complet' : '🔴 En attente de génération'}</p>
          </div>
          <button id="btn-gen-ai" class="btn btn-primary" onclick="generateAiForCat(${cat.id})">
            <i class="fa-solid fa-wand-magic-sparkles"></i> ⚡ Générer Quiz IA
          </button>
        </div>
      `;

      if (!cat.hasStagedQuiz) {
        html += `
          <div class="empty-state">
            <i class="fa-solid fa-flask-vial" style="font-size: 40px; opacity: 0.4;"></i>
            <h3 style="margin: 0;">Aucun quiz généré pour cette CAT</h3>
            <p style="margin: 0; font-size: 13.5px; max-width: 450px;">Cliquez sur le bouton bleu ci-dessus pour que l'IA crée instantanément les vignettes cliniques progressives, QCMs et Red Flags.</p>
          </div>
        `;
      } else {
        // Vignettes
        const vignettes = staged.vignettes || [];
        html += `<h3 style="color: var(--primary); font-size: 16px; margin: 20px 0 10px 0;"><i class="fa-solid fa-hospital"></i> 1. Cas Cliniques Multi-Étapes (${vignettes.length})</h3>`;
        vignettes.forEach((v, idx) => {
          html += `
            <div class="vignette-box">
              <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                <strong>Vignette Clinique N°${idx + 1} (${v.level || 'intermédiaire'})</strong>
                <span class="badge badge-cat">${v.stages ? v.stages.length : 0} étapes</span>
              </div>
              <p style="background: rgba(0,0,0,0.2); padding: 10px; border-radius: 6px; font-style: italic; font-size: 13px; margin: 0 0 12px 0;">
                ${escapeHTML(v.patient ? v.patient.presentation : '')}
              </p>
              ${(v.stages || []).map(s => `
                <div style="margin-top: 10px; border-left: 3px solid var(--primary); padding-left: 10px;">
                  <div style="font-weight: 700; font-size: 13px; color: var(--text);">${escapeHTML(s.title_step || '')}</div>
                  <div style="font-size: 13px; margin-top: 2px;">${escapeHTML(s.prompt || '')}</div>
                </div>
              `).join('')}
            </div>
          `;
        });

        // QCMs Diagnostics
        const diags = staged.qcm_diagnostics || [];
        if (diags.length > 0) {
          html += `<h3 style="color: var(--warning); font-size: 16px; margin: 24px 0 10px 0;"><i class="fa-solid fa-stethoscope"></i> 2. QCMs Diagnostics & Sémiologie (${diags.length})</h3>`;
          diags.forEach((d, idx) => {
            html += `
              <div class="qcm-box">
                <div style="font-weight: 700; font-size: 13.5px; margin-bottom: 6px;">Q${idx + 1} : ${escapeHTML(d.question)}</div>
                <div style="color: var(--success); font-size: 12.5px; font-weight: 600;">
                  <i class="fa-solid fa-circle-check"></i> ${escapeHTML(d.options ? d.options[d.correctIndex || 0] : '')}
                </div>
                <div style="color: var(--text-muted); font-size: 12px; margin-top: 4px; font-style: italic;">
                  💡 ${escapeHTML(d.rationale || '')}
                </div>
              </div>
            `;
          });
        }

        // QCMs Ordonnances
        const prescs = staged.qcm_prescriptions || [];
        if (prescs.length > 0) {
          html += `<h3 style="color: var(--success); font-size: 16px; margin: 24px 0 10px 0;"><i class="fa-solid fa-pills"></i> 3. QCMs Ordonnances & Posologies (${prescs.length})</h3>`;
          prescs.forEach((p, idx) => {
            html += `
              <div class="qcm-box">
                <div style="font-weight: 700; font-size: 13.5px; margin-bottom: 6px;">Q${idx + 1} : ${escapeHTML(p.question)}</div>
                <div style="color: var(--success); font-size: 12.5px; font-weight: 600;">
                  <i class="fa-solid fa-circle-check"></i> ${escapeHTML(p.options ? p.options[p.correctIndex || 0] : '')}
                </div>
              </div>
            `;
          });
        }
      }

      container.innerHTML = html;
    }

    async function generateAiForCat(id) {
      const btn = document.getElementById('btn-gen-ai');
      btn.disabled = true;
      btn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Génération IA en cours...';
      showToast('Appel LLM Gemini en cours pour la CAT ' + id + '...');

      try {
        const token = getAdminToken();
        const res = await fetch('/api/admin/quiz-lab/generate', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'x-admin-token': token
          },
          body: JSON.stringify({ catId: id })
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error || 'Erreur');
        showToast(data.message || 'Quiz généré avec succès !');
        await loadData();
      } catch (err) {
        showToast(err.message, true);
        btn.disabled = false;
        btn.innerHTML = '<i class="fa-solid fa-wand-magic-sparkles"></i> ⚡ Générer Quiz IA';
      }
    }

    async function publishAll() {
      if (!confirm('Publier l\'ensemble des suites de quiz en staging vers la production ?')) return;
      showToast('Publication en cours...');
      try {
        const token = getAdminToken();
        const res = await fetch('/api/admin/quiz-lab/publish', {
          method: 'POST',
          headers: { 'x-admin-token': token }
        });
        const data = await res.json();
        if (!res.ok) throw new Error(data.error || 'Erreur');
        showToast(data.message || 'Publié avec succès !');
        await loadData();
      } catch (err) {
        showToast(err.message, true);
      }
    }

    function escapeHTML(str) {
      if (!str) return '';
      return String(str)
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&#039;');
    }

    document.getElementById('btn-refresh').addEventListener('click', loadData);
    document.getElementById('btn-publish-all').addEventListener('click', publishAll);
    document.getElementById('filter-input').addEventListener('input', (e) => {
      const q = e.target.value.toLowerCase().trim();
      if (!labData || !labData.items) return;
      const filtered = labData.items.filter(c => c.title.toLowerCase().includes(q) || c.category.toLowerCase().includes(q));
      renderList(filtered);
    });

    loadData();
