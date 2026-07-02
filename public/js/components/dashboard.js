import { state } from '../state.js';
import * as api from '../api.js';
import { escapeHTML, exportDataFile } from '../utils.js';

// DOM Elements
let welcomeScreen, workspace, sidebar;
let dashMasteryRate, dashCountDone, dashCountDoing, dashCountTodo;
let resumeList, categoriesDiv, adminPanel, suggestionsList;

export function initDashboard(onSelectCat, onSuggestionHandled) {
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

  // Register global window functions for inline onclick handlers in suggestions
  window.handleApproveSuggestion = async function(id) {
    if (!confirm("Voulez-vous vraiment accepter cette suggestion et l'intégrer à la base de données ?")) return;
    try {
      const result = await api.approveSuggestionOnServer(id);
      if (result.success) {
        alert("Proposition approuvée !");
        if (onSuggestionHandled) await onSuggestionHandled();
      } else {
        alert("Erreur: " + result.error);
      }
    } catch (err) {
      console.error(err);
      if (window.handleAdminError && await window.handleAdminError(err)) {
        return;
      }
      alert("Erreur lors de la validation.");
    }
  };

  window.handleRejectSuggestion = async function(id) {
    if (!confirm("Voulez-vous vraiment rejeter et supprimer cette proposition ?")) return;
    try {
      const result = await api.rejectSuggestionOnServer(id);
      if (result.success) {
        alert("Proposition rejetée.");
        if (onSuggestionHandled) await onSuggestionHandled();
      } else {
        alert("Erreur: " + result.error);
      }
    } catch (err) {
      console.error(err);
      if (window.handleAdminError && await window.handleAdminError(err)) {
        return;
      }
      alert("Erreur lors du rejet.");
    }
  };

  // Export progress handler
  const exportBtn = document.getElementById('export-progress-btn');
  if (exportBtn) {
    exportBtn.addEventListener('click', () => {
      const progressData = localStorage.getItem('dr_cat_user_progress');
      if (!progressData || progressData === '{}') {
        alert("Aucune progression enregistrée à exporter.");
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
            alert("Progression importée avec succès ! L'application va se recharger.");
            location.reload();
          } else {
            alert("Format de fichier invalide.");
          }
        } catch (err) {
          console.error(err);
          alert("Erreur lors de la lecture du fichier d'importation.");
        }
      };
      reader.readAsText(file);
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

  // 1. Calculate stats and update values
  let todo = 0, doing = 0, done = 0;
  state.allCats.forEach(cat => {
    if (cat.status === 'done') done++;
    else if (cat.status === 'doing') doing++;
    else todo++;
  });

  const total = state.allCats.length;
  const percent = total > 0 ? Math.round((done / total) * 100) : 0;

  if (dashMasteryRate) dashMasteryRate.textContent = `${percent}%`;
  if (dashCountDone) dashCountDone.textContent = `${done} / ${total}`;
  if (dashCountDoing) dashCountDoing.textContent = `${doing} / ${total}`;
  if (dashCountTodo) dashCountTodo.textContent = `${todo} / ${total}`;

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
  if (adminPanel) {
    adminPanel.style.display = state.isAdmin ? 'block' : 'none';
  }

  if (state.isAdmin) {
    loadPendingSuggestions();
  }

  if (window.perf) {
    window.perf.endMeasure('dashboard.renderDashboard');
    window.perf.recordMilestone('dashboardReady');
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
                    <strong>Ordonnance :</strong> ${sug.data.ordonnance ? escapeHTML(sug.data.ordonnance.substring(0, 100)) + '...' : 'Aucune'}`;
      } else if (sug.type === 'edit') {
        const parentCat = state.allCats.find(c => c.id === parseInt(sug.catId));
        const originalTitle = parentCat ? parentCat.title : `Fiche ${sug.catId}`;
        
        diffHtml = `<strong>Fiche ciblée :</strong> ${escapeHTML(originalTitle)}<br>`;
        if (sug.data.summary) {
          diffHtml += `<strong>Proposition Synthèse (extrait) :</strong><div class="suggestion-diff-container">${escapeHTML(sug.data.summary)}</div>`;
        }
        if (sug.data.ordonnance) {
          diffHtml += `<strong>Proposition Ordonnance :</strong><div class="suggestion-diff-container">${escapeHTML(sug.data.ordonnance)}</div>`;
        }
      }

      html += `
        <div class="suggestion-card" data-sug-id="${escapeHTML(sug.id)}">
          <div class="suggestion-header">
            <span class="suggestion-badge ${badgeClass}">${badgeText}</span>
            <span class="suggestion-time">${formattedDate}</span>
          </div>
          <div class="suggestion-body">
            <div style="font-size: 13px; line-height: 1.5;">${diffHtml}</div>
          </div>
          <div class="suggestion-actions">
            <button class="suggestion-btn btn-reject" data-action="reject">
              <i class="fa-solid fa-xmark"></i> Rejeter
            </button>
            <button class="suggestion-btn btn-approve" data-action="approve">
              <i class="fa-solid fa-check"></i> Accepter
            </button>
          </div>
        </div>
      `;
    });

    suggestionsList.innerHTML = html;

    // Event delegation for approve/reject buttons to avoid inline onclick handlers
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
