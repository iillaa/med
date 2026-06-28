import { state } from '../state.js';
import * as api from '../api.js';
import { escapeHTML } from '../utils.js';

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
    exportBtn.addEventListener('click', async () => {
      const progressData = localStorage.getItem('dr_cat_user_progress');
      if (!progressData || progressData === '{}') {
        alert("Aucune progression enregistrée à exporter.");
        return;
      }
      
      // If mobile standalone app, trigger native sharing dialog
      if (api.isOfflineApp && navigator.share) {
        try {
          const file = new File([progressData], `drcat-progression.json`, { type: 'application/json' });
          if (navigator.canShare && navigator.canShare({ files: [file] })) {
            await navigator.share({
              files: [file],
              title: 'Progression Dr.CAT',
              text: 'Sauvegarde de ma progression clinique Dr.CAT'
            });
            return;
          }
        } catch (err) {
          console.error("File sharing failed, trying text sharing:", err);
        }
        
        try {
          await navigator.share({
            title: 'Progression Dr.CAT',
            text: progressData
          });
          return;
        } catch (err) {
          console.error("Native text sharing failed:", err);
        }
      }
      
      // Standard browser download fallback
      const blob = new Blob([progressData], { type: 'application/json' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `drcat-progression-${new Date().toISOString().slice(0, 10)}.json`;
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      URL.revokeObjectURL(url);
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
    
    const inProgressCats = state.allCats.filter(cat => cat.status === 'doing');
    
    if (inProgressCats.length === 0) {
      resumeList.innerHTML = `
        <li class="empty-state-card">
          <i class="fa-solid fa-book-open-reader empty-state-icon"></i>
          <div>
            <strong>Aucune fiche en cours</strong>
            <p>Sélectionnez une CAT dans la liste à gauche pour commencer votre révision.</p>
          </div>
        </li>
      `;
    } else {
      // Show last 5
      inProgressCats.slice(-5).reverse().forEach(cat => {
        const li = document.createElement('li');
        li.className = 'resume-item';
        li.innerHTML = `
          <span class="resume-item-title">${cat.id}. ${escapeHTML(cat.title)}</span>
          <span class="resume-item-meta"><i class="fa-solid fa-play"></i> Continuer</span>
        `;
        li.addEventListener('click', () => {
          onSelectCat(cat);
        });
        resumeList.appendChild(li);
      });
    }
  }

  // 3. Populate "Progrès par spécialité" (Category progress list)
  if (categoriesDiv) {
    categoriesDiv.innerHTML = '';

    // Get categories and calculate stats for each
    const catStats = {};
    state.allCats.forEach(cat => {
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
          <span>${escapeHTML(catName)}</span>
          <span>${stats.done}/${stats.total} (${catPercent}%)</span>
        </div>
        <div class="category-progress-bar">
          <div class="category-progress-fill" style="width: ${catPercent}%"></div>
        </div>
      `;
      categoriesDiv.appendChild(item);
    });
  }

  // 4. First-run welcome banner (shown only when user hasn't started anything)
  const firstRunBanner = document.getElementById('first-run-banner');
  if (firstRunBanner) {
    const hasStarted = state.allCats.some(c => c.status === 'doing' || c.status === 'done');
    firstRunBanner.style.display = hasStarted ? 'none' : 'flex';
  }

  // 5. Load Admin suggestions panel
  if (adminPanel) {
    adminPanel.style.display = state.isAdmin ? 'block' : 'none';
  }

  if (state.isAdmin) {
    loadPendingSuggestions();
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
        <div class="suggestion-card" data-sug-id="${sug.id}">
          <div class="suggestion-header">
            <span class="suggestion-badge ${badgeClass}">${badgeText}</span>
            <span class="suggestion-time">${formattedDate}</span>
          </div>
          <div class="suggestion-body">
            <div style="font-size: 13px; line-height: 1.5;">${diffHtml}</div>
          </div>
          <div class="suggestion-actions">
            <button class="suggestion-btn btn-reject" onclick="handleRejectSuggestion('${sug.id}')">
              <i class="fa-solid fa-xmark"></i> Rejeter
            </button>
            <button class="suggestion-btn btn-approve" onclick="handleApproveSuggestion('${sug.id}')">
              <i class="fa-solid fa-check"></i> Accepter
            </button>
          </div>
        </div>
      `;
    });

    suggestionsList.innerHTML = html;
  } catch (err) {
    console.error("Failed to load suggestions:", err);
    suggestionsList.innerHTML = '<p class="text-danger text-center" style="padding: 10px 0;">Erreur lors du chargement des propositions.</p>';
  }
}
