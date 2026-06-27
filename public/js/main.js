import { state, getLocalProgress } from './state.js';
import * as api from './api.js';
import * as sidebar from './components/sidebar.js';
import * as workspace from './components/workspace.js';
import * as dashboard from './components/dashboard.js';
import * as quiz from './components/quiz.js';

// Tracks whether the current physical device is localhost (set once on load)
let isLocalDevice = false;


// Global administrative error interceptor
window.handleAdminError = async function(err) {
  if (err && (err.message === "403 Forbidden" || err.message === "401 Unauthorized")) {
    const password = prompt("Action réservée aux administrateurs. Saisissez le mot de passe admin pour déverrouiller :");
    if (password) {
      try {
        const res = await api.loginAdmin(password);
        if (res.success && res.token) {
          alert("Connexion réussie ! L'action va être relancée.");
          location.reload();
          return true;
        } else {
          alert("Mot de passe incorrect.");
        }
      } catch (loginErr) {
        console.error("Login failed:", loginErr);
        alert("Erreur lors de la connexion.");
      }
    }
    return true; // request handled
  }
  return false;
};

// DOM Elements
let addCatBtn, addCatModal, closeAddCatModalBtn, cancelAddCatBtn, addCatForm;

// Entry Point
document.addEventListener('DOMContentLoaded', async () => {
  // PWA Service Worker Registration
  if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
      navigator.serviceWorker.register('/service-worker.js')
        .then((reg) => console.log('PWA Service Worker registered with scope:', reg.scope))
        .catch((err) => console.error('PWA Service Worker registration failed:', err));
    });
  }

  // Theme Toggle Initialization
  const themeToggleBtn = document.getElementById('theme-toggle-btn');
  const themeToggleIcon = document.getElementById('theme-toggle-icon');
  
  const currentTheme = localStorage.getItem('theme') || (window.matchMedia('(prefers-color-scheme: light)').matches ? 'light' : 'dark');
  if (currentTheme === 'light') {
    document.body.classList.add('light-theme');
    if (themeToggleIcon) {
      themeToggleIcon.classList.remove('fa-moon');
      themeToggleIcon.classList.add('fa-sun');
    }
  }

  if (themeToggleBtn) {
    themeToggleBtn.addEventListener('click', () => {
      document.body.classList.toggle('light-theme');
      const isLight = document.body.classList.contains('light-theme');
      localStorage.setItem('theme', isLight ? 'light' : 'dark');
      
      if (themeToggleIcon) {
        if (isLight) {
          themeToggleIcon.classList.remove('fa-moon');
          themeToggleIcon.classList.add('fa-sun');
        } else {
          themeToggleIcon.classList.remove('fa-sun');
          themeToggleIcon.classList.add('fa-moon');
        }
      }
    });
  }

  // Initialize Components
  sidebar.initSidebar(selectCatWrapper, onFilterTriggered);
  workspace.initWorkspace(onStatusChange, onCatDeleted, onProgressReset);
  dashboard.initDashboard(selectCatWrapper, onSuggestionHandled);
  quiz.initQuiz(selectCatWrapper);

  // Modal DOM Elements
  addCatBtn = document.getElementById('add-cat-btn');
  addCatModal = document.getElementById('add-cat-modal');
  closeAddCatModalBtn = document.getElementById('close-add-cat-modal-btn');
  cancelAddCatBtn = document.getElementById('cancel-add-cat-btn');
  addCatForm = document.getElementById('add-cat-form');

  // Wire up Modal Event Listeners
  if (addCatBtn) {
    addCatBtn.addEventListener('click', () => {
      const datalist = document.getElementById('categories-list-datalist');
      if (datalist) {
        const categories = [...new Set(state.allCats.map(c => c.category))];
        datalist.innerHTML = categories.map(cat => `<option value="${cat}"></option>`).join('');
      }
      if (addCatModal) addCatModal.style.display = 'flex';
    });
  }

  const closeModal = () => {
    if (addCatModal) addCatModal.style.display = 'none';
    if (addCatForm) addCatForm.reset();
  };

  if (closeAddCatModalBtn) closeAddCatModalBtn.addEventListener('click', closeModal);
  if (cancelAddCatBtn) cancelAddCatBtn.addEventListener('click', closeModal);

  if (addCatForm) {
    addCatForm.addEventListener('submit', async (e) => {
      e.preventDefault();
      
      const title = document.getElementById('new-cat-title').value.trim();
      const category = document.getElementById('new-cat-category').value.trim();
      const red_flags = document.getElementById('new-cat-red-flags').value.trim();
      const summary = document.getElementById('new-cat-summary').value.trim();
      const ordonnance = document.getElementById('new-cat-ordonnance').value.trim();
      
      const rawKeywords = document.getElementById('new-cat-pdf-keywords').value;
      const pdf_keywords = rawKeywords ? rawKeywords.split(',').map(kw => kw.trim()).filter(kw => kw) : [];

      if (state.isAdmin) {
        try {
          const result = await api.createCatOnServer({ title, category, red_flags, summary, ordonnance, pdf_keywords });
          if (result.success) {
            closeModal();
            alert(`La fiche CAT "${title}" a été ajoutée avec succès !`);
            await initApp();
            const newCat = state.allCats.find(c => c.id === result.cat.id);
            if (newCat) selectCatWrapper(newCat);
          } else {
            alert("Erreur : " + result.error);
          }
        } catch (err) {
          console.error(err);
          if (window.handleAdminError && await window.handleAdminError(err)) {
            return;
          }
          alert("Erreur lors de l'enregistrement de la nouvelle CAT.");
        }
      } else {
        try {
          const result = await api.submitSuggestion({
            type: 'add',
            data: { title, category, red_flags, summary, ordonnance, pdf_keywords }
          });
          if (result.success) {
            closeModal();
            alert(`Votre proposition de nouvelle fiche "${title}" a été envoyée à l'administrateur pour validation.`);
          } else {
            alert("Erreur : " + result.error);
          }
        } catch (err) {
          console.error(err);
          alert("Erreur lors de l'envoi de la proposition.");
        }
      }
    });
  }

  // Wire up Admin Login Button Event Listener
  let adminLoginBtn = document.getElementById('admin-login-btn');
  if (adminLoginBtn) {
    adminLoginBtn.addEventListener('click', async () => {
      if (state.isAdmin) {
        if (confirm("Voulez-vous vous déconnecter du mode administrateur ?")) {
          await api.logoutAdmin();
          alert("Déconnexion réussie.");
          location.reload();
        }
      } else {
        const password = prompt("Veuillez saisir le mot de passe administrateur :");
        if (password) {
          try {
            const res = await api.loginAdmin(password);
            if (res.success && res.token) {
              alert("Connexion réussie !");
              location.reload();
            } else {
              alert("Mot de passe incorrect.");
            }
          } catch (err) {
            console.error("Login error:", err);
            alert("Erreur lors de la connexion.");
          }
        }
      }
    });
  }

  // --- Localhost-only Admin Button Visibility ---
  // Check with the server if this connection is from the local machine.
  // The server reads the actual TCP socket IP, not the HTTP Host header.
  if (adminLoginBtn) {
    // Hide by default until confirmed local
    adminLoginBtn.style.display = 'none';
    isLocalDevice = await api.checkIsLocal();
    if (isLocalDevice) {
      adminLoginBtn.style.display = 'flex';
    } else {
      console.log('[Security] Admin button hidden: not a local connection.');
    }
  }

  // Load Initial App State
  await initApp();

  // Fetch initial PDF indexing status
  workspace.updatePdfIndexStatus();
});

// App Initialization routine
async function initApp() {
  try {
    // 1. Check Admin status
    state.isAdmin = await api.checkAdminStatus();
    console.log("Admin mode:", state.isAdmin);

    // Update admin login button styling (only if we are on a local connection)
    const adminLoginBtn = document.getElementById('admin-login-btn');
    if (adminLoginBtn && isLocalDevice) {
      adminLoginBtn.style.display = 'flex';
      if (state.isAdmin) {
        adminLoginBtn.innerHTML = '<i class="fa-solid fa-lock-open"></i> Déconnexion Admin';
        adminLoginBtn.classList.remove('action-btn');
        adminLoginBtn.classList.add('cancel-btn');
        adminLoginBtn.style.borderColor = 'rgba(16, 185, 129, 0.4)';
        adminLoginBtn.style.color = 'var(--color-success)';
      } else {
        adminLoginBtn.innerHTML = '<i class="fa-solid fa-lock"></i> Connexion Admin';
        adminLoginBtn.classList.remove('cancel-btn');
        adminLoginBtn.classList.add('action-btn');
        adminLoginBtn.style.borderColor = '';
        adminLoginBtn.style.color = '';
      }
    }

    // 2. Fetch CATs and PDFs
    const [cats, pdfs] = await Promise.all([
      api.fetchCats(),
      api.fetchPdfs()
    ]);

    state.allPdfs = pdfs;

    // 3. Merge server CATs with local progress
    const localProgress = getLocalProgress();
    state.allCats = cats.map(cat => {
      const localEntry = localProgress[cat.id] || {};
      return {
        ...cat,
        status: localEntry.status || 'todo',
        notes: localEntry.notes || ''
      };
    });

    // 4. Update UI Components
    sidebar.populateCategoryFilter(state.allCats);
    sidebar.renderCatList(state.allCats, selectCatWrapper);
    calculateStats();
    dashboard.renderDashboard(selectCatWrapper);

  } catch (err) {
    console.error('Error initializing app:', err);
    alert('Erreur lors du chargement des données. Assurez-vous que le serveur Node tourne.');
  }
}

// Select CAT wrapper that delegates to workspace component
function selectCatWrapper(cat) {
  workspace.selectCat(cat);
}

// Side-effect callback when status updates
function onStatusChange(cat) {
  sidebar.updateSidebarItemUI(cat);
  calculateStats();
}

// Side-effect callback when active status filter triggers search
function onFilterTriggered(filteredCats) {
  sidebar.renderCatList(filteredCats, selectCatWrapper);
}

// Side-effect callback when a CAT is deleted
async function onCatDeleted() {
  await initApp();
  dashboard.showDashboard(selectCatWrapper);
}

// Side-effect callback when progress resets
async function onProgressReset() {
  await initApp();
  dashboard.showDashboard(selectCatWrapper);
}

// Side-effect callback when a pending suggestion is approved or rejected
async function onSuggestionHandled() {
  await initApp();
}

// Helper to compute counts and update overall progress bar UI elements
export function calculateStats() {
  let todo = 0, doing = 0, done = 0;
  
  state.allCats.forEach(cat => {
    if (cat.status === 'done') done++;
    else if (cat.status === 'doing') doing++;
    else todo++;
  });

  const countTodo = document.getElementById('count-todo');
  const countDoing = document.getElementById('count-doing');
  const countDone = document.getElementById('count-done');
  const progressPercent = document.getElementById('progress-percent');
  const progressFill = document.getElementById('progress-fill');

  if (countTodo) countTodo.textContent = todo;
  if (countDoing) countDoing.textContent = doing;
  if (countDone) countDone.textContent = done;

  const total = state.allCats.length;
  const percent = total > 0 ? Math.round((done / total) * 100) : 0;
  
  if (progressPercent) progressPercent.textContent = `${percent}%`;
  if (progressFill) progressFill.style.width = `${percent}%`;

  // If dashboard is active, refresh stats displays inside dashboard
  dashboard.renderDashboard(selectCatWrapper);
}
