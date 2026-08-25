/**
 * Dr. CAT — Admin Quiz Lab & Staging Studio UI Component
 * Provides live inspection of staged quiz suites, 1-click AI generation, and production publishing.
 */

import { state } from '../../state.js';
import { escapeHTML, showToast } from '../../utils.js';

let quizLabData = null;

export async function renderAdminQuizTab(container) {
  if (!container) return;

  container.innerHTML = `
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 14px; flex-wrap: wrap; gap: 10px;">
      <div>
        <h4 style="margin: 0; color: var(--color-primary); font-size: 15px; display: flex; align-items: center; gap: 8px;">
          <i class="fa-solid fa-brain"></i> Quiz Lab & Staging Studio
        </h4>
        <p class="block-desc" style="margin: 4px 0 0 0; font-size: 12.5px;">Générez des sets de questions par IA, inspectez le staging et publiez vers l'application :</p>
      </div>
      <div style="display: flex; gap: 8px;">
        <button id="admin-quiz-refresh-btn" class="action-btn" style="padding: 6px 12px; font-size: 12px; display: flex; align-items: center; gap: 6px;">
          <i class="fa-solid fa-rotate"></i> Actualiser
        </button>
        <button id="admin-quiz-publish-all-btn" class="action-btn" style="padding: 6px 14px; font-size: 12px; display: flex; align-items: center; gap: 6px; background: linear-gradient(135deg, var(--color-success), #059669); color: #fff; font-weight: 700; border: none;">
          <i class="fa-solid fa-cloud-arrow-up"></i> 🚀 Publier en Production
        </button>
      </div>
    </div>

    <!-- Summary Metrics Cards -->
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(180px, 1fr)); gap: 12px; margin-bottom: 18px;">
      <div style="background: rgba(255,255,255,0.03); border: 1px solid var(--border-color); border-radius: 8px; padding: 12px 14px;">
        <span style="font-size: 11px; color: var(--text-muted); text-transform: uppercase;">Total Fiches CATs</span>
        <div id="quiz-stat-total-cats" style="font-size: 20px; font-weight: 800; color: var(--text-primary); margin-top: 4px;">--</div>
      </div>
      <div style="background: rgba(16,185,129,0.05); border: 1px solid rgba(16,185,129,0.3); border-radius: 8px; padding: 12px 14px;">
        <span style="font-size: 11px; color: var(--color-success); text-transform: uppercase;">Suites en Staging</span>
        <div id="quiz-stat-staged-count" style="font-size: 20px; font-weight: 800; color: var(--color-success); margin-top: 4px;">--</div>
      </div>
      <div style="background: rgba(6,182,212,0.05); border: 1px solid rgba(6,182,212,0.3); border-radius: 8px; padding: 12px 14px;">
        <span style="font-size: 11px; color: var(--color-primary); text-transform: uppercase;">Questions Publiées</span>
        <div id="quiz-stat-public-count" style="font-size: 20px; font-weight: 800; color: var(--color-primary); margin-top: 4px;">--</div>
      </div>
    </div>

    <!-- Main Workspace Split: Left = CATs List, Right = Live Staging Inspector -->
    <div style="display: grid; grid-template-columns: 1fr 1.3fr; gap: 16px; min-height: 480px;">
      <!-- Left Column: CATs Staging Status -->
      <div style="background: rgba(0,0,0,0.15); border: 1px solid var(--border-color); border-radius: 8px; padding: 12px; display: flex; flex-direction: column;">
        <div style="margin-bottom: 10px;">
          <input type="text" id="admin-quiz-filter-input" placeholder="Filtrer une CAT..." style="width: 100%; padding: 8px 12px; font-size: 12.5px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-card); color: var(--text-primary);">
        </div>
        <div id="admin-quiz-cats-list" style="flex: 1; overflow-y: auto; max-height: 480px; display: flex; flex-direction: column; gap: 6px;">
          <p class="text-muted text-center" style="padding: 20px;">Chargement du Quiz Lab...</p>
        </div>
      </div>

      <!-- Right Column: Live Inspector & Editor -->
      <div id="admin-quiz-inspector" style="background: rgba(0,0,0,0.15); border: 1px solid var(--border-color); border-radius: 8px; padding: 16px; overflow-y: auto; max-height: 540px;">
        <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100%; color: var(--text-muted); text-align: center; gap: 10px; padding: 40px 0;">
          <i class="fa-solid fa-arrow-pointer" style="font-size: 28px; opacity: 0.5;"></i>
          <p style="margin: 0; font-size: 13px;">Sélectionnez une CAT à gauche pour inspecter son set de questions ou lancer la génération IA.</p>
        </div>
      </div>
    </div>
  `;

  // Attach handlers
  document.getElementById('admin-quiz-refresh-btn')?.addEventListener('click', () => loadQuizLabData(container));
  document.getElementById('admin-quiz-publish-all-btn')?.addEventListener('click', () => publishQuizStaging(container));
  document.getElementById('admin-quiz-filter-input')?.addEventListener('input', (e) => filterQuizCats(e.target.value));

  await loadQuizLabData(container);
}

async function loadQuizLabData(container) {
  try {
    const token = localStorage.getItem('dr_cat_admin_token') || sessionStorage.getItem('dr_cat_admin_token') || '';
    if (!token) {
      const listEl = document.getElementById('admin-quiz-cats-list');
      if (listEl) {
        listEl.innerHTML = `<p class="text-muted text-center" style="padding: 20px;">Veuillez vous connecter en tant qu'administrateur pour charger le Quiz Lab.</p>`;
      }
      return;
    }

    const res = await fetch('/api/admin/quiz-lab/data', {
      headers: {
        'x-admin-token': token
      }
    });

    if (!res.ok) {
      throw new Error(`Erreur HTTP ${res.status}`);
    }

    quizLabData = await res.json();

    document.getElementById('quiz-stat-total-cats').textContent = quizLabData.totalCats || 0;
    document.getElementById('quiz-stat-staged-count').textContent = quizLabData.stagedCount || 0;
    document.getElementById('quiz-stat-public-count').textContent = quizLabData.publicCount || 0;

    renderCatsList(quizLabData.items);
  } catch (err) {
    console.error("[QuizLab UI Error]", err);
    showToast("Impossible de charger les données du Quiz Lab.", "error");
  }
}

function renderCatsList(items) {
  const listEl = document.getElementById('admin-quiz-cats-list');
  if (!listEl) return;

  if (!items || items.length === 0) {
    listEl.innerHTML = `<p class="text-muted text-center" style="padding: 20px;">Aucune fiche CAT trouvée.</p>`;
    return;
  }

  listEl.innerHTML = items.map(cat => {
    const statusBadge = cat.hasStagedQuiz
      ? `<span style="font-size: 10.5px; padding: 2px 6px; border-radius: 4px; background: rgba(16,185,129,0.2); color: var(--color-success); font-weight: 700;">🟢 Généré (${cat.vignetteCount} cas)</span>`
      : `<span style="font-size: 10.5px; padding: 2px 6px; border-radius: 4px; background: rgba(239,68,68,0.15); color: var(--color-danger); font-weight: 600;">🔴 Non généré</span>`;

    return `
      <div class="admin-quiz-cat-row" data-id="${cat.id}" style="padding: 10px; border-radius: 6px; border: 1px solid var(--border-color); background: var(--bg-card); cursor: pointer; display: flex; flex-direction: column; gap: 4px; transition: all 0.2s ease;">
        <div style="display: flex; justify-content: space-between; align-items: center; gap: 8px;">
          <span style="font-size: 12.5px; font-weight: 700; color: var(--text-primary); overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${escapeHTML(cat.title)}</span>
          ${statusBadge}
        </div>
        <div style="display: flex; justify-content: space-between; align-items: center; font-size: 11px; color: var(--text-muted);">
          <span><i class="fa-solid fa-folder-medical"></i> ${escapeHTML(cat.category)}</span>
          <span>ID #${cat.id}</span>
        </div>
      </div>
    `;
  }).join('');

  listEl.querySelectorAll('.admin-quiz-cat-row').forEach(row => {
    row.addEventListener('click', () => {
      listEl.querySelectorAll('.admin-quiz-cat-row').forEach(r => {
        r.style.borderColor = 'var(--border-color)';
        r.style.background = 'var(--bg-card)';
      });
      row.style.borderColor = 'var(--color-primary)';
      row.style.background = 'rgba(6,182,212,0.08)';

      const id = parseInt(row.getAttribute('data-id'));
      const cat = quizLabData.items.find(c => c.id === id);
      if (cat) {
        renderInspectorForCat(cat);
      }
    });
  });
}

function filterQuizCats(query) {
  if (!quizLabData || !quizLabData.items) return;
  const q = (query || '').toLowerCase().trim();
  const filtered = quizLabData.items.filter(c => 
    c.title.toLowerCase().includes(q) || c.category.toLowerCase().includes(q)
  );
  renderCatsList(filtered);
}

function renderInspectorForCat(cat) {
  const inspector = document.getElementById('admin-quiz-inspector');
  if (!inspector) return;

  const hasData = cat.hasStagedQuiz && cat.stagedData;
  const staged = cat.stagedData || {};

  let contentHtml = `
    <div style="display: flex; justify-content: space-between; align-items: flex-start; border-bottom: 1px solid var(--border-color); padding-bottom: 12px; margin-bottom: 14px;">
      <div>
        <div style="display: flex; align-items: center; gap: 8px;">
          <h4 style="margin: 0; font-size: 15px; color: var(--text-primary);">${escapeHTML(cat.title)}</h4>
          <span class="cat-badge" style="font-size: 10px;">${escapeHTML(cat.category)}</span>
        </div>
        <span style="font-size: 11.5px; color: var(--text-muted);">ID #${cat.id} • Statut: ${cat.hasStagedQuiz ? 'Prêt en Staging 🟢' : 'Non Généré 🔴'}</span>
      </div>
      <button id="admin-quiz-btn-generate-ai" class="action-btn" style="padding: 8px 14px; font-size: 12px; background: linear-gradient(135deg, #06b6d4, #3b82f6); color: #fff; font-weight: 700; border: none; display: flex; align-items: center; gap: 6px; box-shadow: 0 2px 8px rgba(6,182,212,0.3);">
        <i class="fa-solid fa-wand-magic-sparkles"></i> ⚡ Générer Quiz IA
      </button>
    </div>
  `;

  if (!hasData) {
    contentHtml += `
      <div style="padding: 30px; text-align: center; color: var(--text-muted); background: rgba(0,0,0,0.1); border-radius: 6px;">
        <i class="fa-solid fa-flask-vial" style="font-size: 32px; margin-bottom: 10px; opacity: 0.5;"></i>
        <p style="margin: 0 0 8px 0; font-size: 13.5px; font-weight: 600; color: var(--text-secondary);">Aucun quiz généré pour cette CAT.</p>
        <p style="margin: 0; font-size: 12px;">Cliquez sur <strong>« ⚡ Générer Quiz IA »</strong> ci-dessus pour construire automatiquement 2 cas cliniques multi-étapes, des QCMs d'orientation et d'ordonnance ainsi que des questions de Red Flags.</p>
      </div>
    `;
  } else {
    // Render Vignettes
    const vignettes = staged.vignettes || [];
    contentHtml += `
      <h5 style="margin: 14px 0 8px 0; color: var(--color-primary); font-size: 13.5px;"><i class="fa-solid fa-hospital"></i> 1. Cas Cliniques Réels (${vignettes.length} vignettes)</h5>
    `;
    vignettes.forEach((v, vIdx) => {
      contentHtml += `
        <div style="background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 6px; padding: 12px; margin-bottom: 10px;">
          <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 6px;">
            <strong>Cas Clinique N°${vIdx + 1} (${v.level || 'intermédiaire'})</strong>
            <span style="font-size: 11px; color: var(--text-muted);">${v.stages ? v.stages.length : 0} étapes</span>
          </div>
          <p style="font-size: 12.5px; color: var(--text-secondary); margin: 0 0 8px 0; font-style: italic; background: rgba(0,0,0,0.15); padding: 8px; border-radius: 4px;">
            ${escapeHTML(v.patient ? v.patient.presentation : '')}
          </p>
          <div style="display: flex; flex-direction: column; gap: 8px;">
            ${(v.stages || []).map(s => `
              <div style="font-size: 12px; border-left: 3px solid var(--color-primary); padding-left: 8px;">
                <strong>${escapeHTML(s.title_step || '')} :</strong> ${escapeHTML(s.prompt || '')}
              </div>
            `).join('')}
          </div>
        </div>
      `;
    });

    // Render QCMs Diagnostic
    const diags = staged.qcm_diagnostics || [];
    if (diags.length > 0) {
      contentHtml += `
        <h5 style="margin: 14px 0 8px 0; color: var(--color-warning); font-size: 13.5px;"><i class="fa-solid fa-stethoscope"></i> 2. QCMs Conduite & Diagnostic (${diags.length} questions)</h5>
      `;
      diags.forEach((d, dIdx) => {
        contentHtml += `
          <div style="background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 6px; padding: 10px; margin-bottom: 8px; font-size: 12.5px;">
            <strong>Q${dIdx + 1}: ${escapeHTML(d.question)}</strong>
            <div style="margin-top: 6px; font-size: 11.5px; color: var(--color-success);">
              <i class="fa-solid fa-check"></i> <strong>Réponse exacte :</strong> ${escapeHTML(d.options ? d.options[d.correctIndex || 0] : '')}
            </div>
            <div style="font-size: 11px; color: var(--text-muted); margin-top: 4px;">
              💡 <em>${escapeHTML(d.rationale || '')}</em>
            </div>
          </div>
        `;
      });
    }

    // Render QCMs Ordonnances
    const prescs = staged.qcm_prescriptions || [];
    if (prescs.length > 0) {
      contentHtml += `
        <h5 style="margin: 14px 0 8px 0; color: #10b981; font-size: 13.5px;"><i class="fa-solid fa-pills"></i> 3. QCMs Ordonnances & Posologies (${prescs.length} questions)</h5>
      `;
      prescs.forEach((p, pIdx) => {
        contentHtml += `
          <div style="background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 6px; padding: 10px; margin-bottom: 8px; font-size: 12.5px;">
            <strong>Q${pIdx + 1}: ${escapeHTML(p.question)}</strong>
            <div style="margin-top: 6px; font-size: 11.5px; color: var(--color-success);">
              <i class="fa-solid fa-check"></i> <strong>Ordonnance validée :</strong> ${escapeHTML(p.options ? p.options[p.correctIndex || 0] : '')}
            </div>
          </div>
        `;
      });
    }
  }

  inspector.innerHTML = contentHtml;

  document.getElementById('admin-quiz-btn-generate-ai')?.addEventListener('click', async () => {
    const btn = document.getElementById('admin-quiz-btn-generate-ai');
    btn.disabled = true;
    btn.innerHTML = `<i class="fa-solid fa-spinner fa-spin"></i> Génération en cours...`;
    showToast(`Génération IA en cours pour la CAT ${cat.id}...`, "info");

    try {
      const token = localStorage.getItem('dr_cat_admin_token') || sessionStorage.getItem('dr_cat_admin_token') || '';
      const res = await fetch('/api/admin/quiz-lab/generate', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'x-admin-token': token
        },
        body: JSON.stringify({ catId: cat.id })
      });

      if (!res.ok) {
        const errJson = await res.json();
        throw new Error(errJson.error || "Erreur de génération.");
      }

      const result = await res.json();
      showToast(result.message || "Quiz généré avec succès !", "success");
      await loadQuizLabData();
      const updatedCat = quizLabData.items.find(c => c.id === cat.id);
      if (updatedCat) renderInspectorForCat(updatedCat);
    } catch (err) {
      showToast(err.message, "error");
      btn.disabled = false;
      btn.innerHTML = `<i class="fa-solid fa-wand-magic-sparkles"></i> ⚡ Générer Quiz IA`;
    }
  });
}

async function publishQuizStaging() {
  if (!confirm("Voulez-vous publier l'intégralité des suites de quiz du staging vers la base publique accessible aux utilisateurs ?")) {
    return;
  }

  showToast("Publication en cours...", "info");
  try {
    const token = localStorage.getItem('dr_cat_admin_token') || sessionStorage.getItem('dr_cat_admin_token') || '';
    const res = await fetch('/api/admin/quiz-lab/publish', {
      method: 'POST',
      headers: {
        'x-admin-token': token
      }
    });

    if (!res.ok) {
      const errJson = await res.json();
      throw new Error(errJson.error || "Erreur de publication.");
    }

    const data = await res.json();
    showToast(data.message || "Quiz publié avec succès !", "success");
    await loadQuizLabData();
  } catch (err) {
    showToast(err.message, "error");
  }
}
