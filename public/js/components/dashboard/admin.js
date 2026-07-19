import { state } from '../../state.js';
import * as api from '../../api.js';
import { escapeHTML, showToast } from '../../utils.js';

export function autoSelectDevTab() {
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

export function initAdminTabListeners(onSuggestionHandled) {
  const adminTabBtns = document.querySelectorAll('.admin-tab-btn');
  adminTabBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      const targetId = btn.getAttribute('data-target');
      if (!targetId) return;

      if (targetId === 'admin-pane-suggestions' && window.__drCatDevDiagnosticsUnlocked) {
        return;
      }

      adminTabBtns.forEach(b => {
        b.classList.remove('active');
        b.style.color = 'var(--text-secondary)';
        b.style.backgroundColor = 'transparent';
      });
      btn.classList.add('active');
      btn.style.color = 'var(--color-primary)';
      btn.style.backgroundColor = 'rgba(6, 182, 212, 0.1)';

      const panes = document.querySelectorAll('.admin-pane-content');
      panes.forEach(pane => {
        pane.style.display = 'none';
      });
      const activePane = document.getElementById(targetId);
      if (activePane) {
        activePane.style.display = 'block';
      }

      window.dispatchEvent(new CustomEvent('drcat-admin-tab-changed', {
        detail: { activePaneId: targetId }
      }));
    });
  });

  const activeTabBtn = document.querySelector('.admin-tab-btn.active');
  if (activeTabBtn) {
    activeTabBtn.style.color = 'var(--color-primary)';
    activeTabBtn.style.backgroundColor = 'rgba(6, 182, 212, 0.1)';
  }

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

      const closeModal = () => modal.remove();
      document.getElementById('review-modal-close').addEventListener('click', closeModal);
      document.getElementById('review-btn-cancel').addEventListener('click', closeModal);

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
}

export async function loadPendingSuggestions(suggestionsList) {
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
