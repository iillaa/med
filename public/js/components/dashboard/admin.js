import { state } from '../../state.js';
import * as api from '../../api.js';
import { escapeHTML, showToast, closeModalAnimated } from '../../utils.js';

let onSuggestionHandledCallback = null;

export function initAdminTabListeners(onSuggestionHandled) {
  onSuggestionHandledCallback = onSuggestionHandled;

  const adminTabBtns = document.querySelectorAll('.admin-tab-btn');
  adminTabBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      const targetId = btn.getAttribute('data-target');
      if (!targetId) return;

      adminTabBtns.forEach(b => {
        b.classList.remove('active');
        b.setAttribute('aria-selected', 'false');
        b.style.color = 'var(--text-secondary)';
        b.style.backgroundColor = 'transparent';
      });
      btn.classList.add('active');
      btn.setAttribute('aria-selected', 'true');
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
        if (onSuggestionHandledCallback) {
          await onSuggestionHandledCallback();
        } else {
          await loadPendingSuggestions();
        }
      } else {
        showToast("Erreur: " + (result.error || result.message), "fa-circle-exclamation", 4000);
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
        if (onSuggestionHandledCallback) {
          await onSuggestionHandledCallback();
        } else {
          await loadPendingSuggestions();
        }
      } else {
        showToast("Erreur: " + (result.error || result.message), "fa-circle-exclamation", 4000);
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
      modal.className = 'modal-overlay modal-overlay--sheet';
      modal.setAttribute('role', 'dialog');
      modal.setAttribute('aria-modal', 'true');

      let fieldsHtml = '';
      if (sug.type === 'add') {
        fieldsHtml = `
          <div class="form-group">
            <label for="review-sug-title">Titre de la fiche</label>
            <input type="text" id="review-sug-title" value="${escapeHTML(sug.data.title || '')}">
          </div>
          <div class="form-group">
            <label for="review-sug-category">Spécialité</label>
            <input type="text" id="review-sug-category" value="${escapeHTML(sug.data.category || '')}">
          </div>
          <div class="form-group">
            <label for="review-sug-redflags">Red Flags (signes de gravité)</label>
            <textarea id="review-sug-redflags" rows="3">${escapeHTML(sug.data.red_flags || '')}</textarea>
          </div>
        `;
      }

      fieldsHtml += `
        <div class="form-group">
          <label for="review-sug-summary">Synthèse de Conduite à Tenir</label>
          <textarea id="review-sug-summary" class="font-monospace" rows="12">${escapeHTML(sug.data.summary || '')}</textarea>
        </div>
        <div class="form-group">
          <label for="review-sug-ordonnance">Ordonnance Type</label>
          <textarea id="review-sug-ordonnance" class="font-monospace" rows="8">${escapeHTML(sug.data.ordonnance || '')}</textarea>
        </div>
      `;

      modal.innerHTML = `
        <div class="modal-card modal-card-lg">
          <div class="modal-header">
            <h3><i class="fa-solid fa-pen-to-square"></i> Réviser & Éditer la proposition</h3>
            <button class="close-modal-btn" id="review-modal-close" aria-label="Fermer"><i class="fa-solid fa-xmark"></i></button>
          </div>
          <div class="modal-body">
            ${fieldsHtml}
          </div>
          <div class="modal-footer">
            <button id="review-btn-cancel" class="cancel-btn">Annuler</button>
            <button id="review-btn-save" class="btn-solid-success"><i class="fa-solid fa-floppy-disk"></i> Enregistrer les corrections</button>
          </div>
        </div>
      `;

      document.body.appendChild(modal);

      const closeModal = () => closeModalAnimated(modal);
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
            closeModalAnimated(modal);
            if (onSuggestionHandledCallback) {
              await onSuggestionHandledCallback();
            } else {
              await loadPendingSuggestions();
            }
          } else {
            showToast("Erreur: " + (result.error || result.message), "fa-circle-exclamation", 4000);
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

export async function loadPendingSuggestions(targetListEl) {
  const suggestionsList = targetListEl || document.getElementById('suggestions-list');
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
        diffHtml = `<strong>Titre :</strong> ${escapeHTML(sug.data.title || '')}<br>
                    <strong>Spécialité :</strong> ${escapeHTML(sug.data.category || '')}<br>
                    <strong>Red Flags :</strong> ${escapeHTML(sug.data.red_flags || '') || 'Aucun'}<br>
                    <strong>Synthèse (extrait) :</strong> ${sug.data.summary ? escapeHTML(sug.data.summary.substring(0, 150)) + '...' : 'Aucune'}<br>
                    <strong>Ordonnance (extrait) :</strong> ${sug.data.ordonnance ? escapeHTML(sug.data.ordonnance.substring(0, 100)) + '...' : 'Aucune'}`;
      } else if (sug.type === 'edit') {
        const parentCat = state.allCats.find(c => c.id === parseInt(sug.catId));
        const originalTitle = parentCat ? parentCat.title : `Fiche ${sug.catId}`;

        diffHtml = `<strong>Fiche ciblée :</strong> ${escapeHTML(originalTitle)}<br>`;
        if (sug.data.summary) {
          const previewText = sug.data.summary.length > 200 ? escapeHTML(sug.data.summary.substring(0, 200)) + '...' : escapeHTML(sug.data.summary);
          diffHtml += `<strong>Proposition Synthèse (extrait) :</strong><div class="suggestion-diff-container">${previewText}</div>`;
        }
        if (sug.data.ordonnance) {
          const previewText = sug.data.ordonnance.length > 150 ? escapeHTML(sug.data.ordonnance.substring(0, 150)) + '...' : escapeHTML(sug.data.ordonnance);
          diffHtml += `<strong>Proposition Ordonnance (extrait) :</strong><div class="suggestion-diff-container">${previewText}</div>`;
        }
      }

      html += `
        <div class="suggestion-card" data-sug-id="${escapeHTML(sug.id)}">
          <div class="suggestion-header">
            <span class="suggestion-badge ${badgeClass}">${badgeText}</span>
            <span class="suggestion-time">${formattedDate}</span>
          </div>
          <div class="suggestion-body">
            <div class="suggestion-diff-content">${diffHtml}</div>
          </div>
          <div class="suggestion-actions">
            <button class="suggestion-btn btn-reject" data-action="reject">
              <i class="fa-solid fa-xmark"></i> Rejeter
            </button>
            <button class="suggestion-btn btn-review" data-action="review">
              <i class="fa-solid fa-pen-to-square"></i> Réviser
            </button>
            <button class="suggestion-btn btn-approve" data-action="approve">
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
