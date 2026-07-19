import { state } from '../state.js';
import { setupSwipeGestures } from '../utils.js';

// DOM Elements
let catList, searchInput, categoryFilter, sidebar, sidebarOverlay;

function getStatusLabel(status) {
  switch(status) {
    case 'done': return 'Maîtrisé';
    case 'doing': return 'En cours';
    default: return 'À faire';
  }
}

export function initSidebar(onSelectCat, onFilterTriggered) {
  catList = document.getElementById('cat-list');
  searchInput = document.getElementById('search-input');
  categoryFilter = document.getElementById('category-filter');
  sidebar = document.getElementById('sidebar');
  sidebarOverlay = document.getElementById('sidebar-overlay');

  const openSidebarBtn = document.getElementById('open-sidebar-btn');
  const closeSidebarBtn = document.getElementById('close-sidebar-btn');

  // Search and Category input listeners
  if (searchInput) searchInput.addEventListener('input', () => filterCats(onFilterTriggered));
  if (categoryFilter) categoryFilter.addEventListener('change', () => filterCats(onFilterTriggered));

  // Quick status filter pills
  const statusPills = document.querySelectorAll('.status-pill');
  statusPills.forEach(pill => {
    pill.addEventListener('click', () => {
      statusPills.forEach(p => p.classList.remove('active'));
      pill.classList.add('active');
      state.activeStatusFilter = pill.getAttribute('data-filter');
      filterCats(onFilterTriggered);
    });
  });

  // Mobile drawer controls
  if (openSidebarBtn) {
    openSidebarBtn.addEventListener('click', () => {
      sidebar.classList.add('open');
    });
  }
  if (closeSidebarBtn) {
    closeSidebarBtn.addEventListener('click', () => {
      sidebar.classList.remove('open');
    });
  }

  // Controls panel collapsible toggle
  const controlsToggleBtn = document.getElementById('controls-toggle-btn');
  const controlsPanel = document.getElementById('controls-panel');
  const controlsToggleIcon = document.getElementById('controls-toggle-icon');

  // Restore saved state (default: expanded)
  const savedCollapsed = localStorage.getItem('sidebar_controls_collapsed') === 'true';
  if (savedCollapsed && controlsPanel) {
    controlsPanel.classList.add('collapsed');
    if (controlsToggleIcon) controlsToggleIcon.classList.add('rotated');
  }

  if (controlsToggleBtn && controlsPanel) {
    controlsToggleBtn.addEventListener('click', () => {
      const isNowCollapsed = controlsPanel.classList.toggle('collapsed');
      if (controlsToggleIcon) controlsToggleIcon.classList.toggle('rotated', isNowCollapsed);
      localStorage.setItem('sidebar_controls_collapsed', isNowCollapsed);
    });
  }


  if (sidebar) {
    setupSwipeGestures(sidebar);
  }

  // Click overlay to close
  if (sidebarOverlay && sidebar) {
    sidebarOverlay.addEventListener('click', () => {
      sidebar.classList.remove('open');
    });
  }
}

// Populate Category dropdown dynamically
export function populateCategoryFilter(cats) {
  if (!categoryFilter) categoryFilter = document.getElementById('category-filter');
  if (!categoryFilter) return;

  const categories = new Set(cats.map(c => c.category));
  categoryFilter.innerHTML = '<option value="all">Toutes les spécialités</option>';
  categories.forEach(cat => {
    const opt = document.createElement('option');
    opt.value = cat;
    opt.textContent = cat;
    categoryFilter.appendChild(opt);
  });
}

// Render CATs list
export function renderCatList(cats, onSelectCat) {
  if (window.perf) window.perf.startMeasure('sidebar.renderCatList');
  if (!catList) catList = document.getElementById('cat-list');
  if (!catList) return;

  catList.innerHTML = '';
  
  if (cats.length === 0) {
    const emptyLi = document.createElement('li');
    emptyLi.className = 'empty-state';
    emptyLi.innerHTML = `
      <div style="text-align: center; padding: 32px 16px; color: var(--text-muted);">
        <i class="fa-solid fa-filter-circle-xmark" style="font-size: 28px; margin-bottom: 10px; display: block; opacity: 0.6;"></i>
        <span style="font-size: 13px; line-height: 1.5;">Aucune fiche ne correspond à vos filtres actuels.</span>
      </div>
    `;
    catList.appendChild(emptyLi);
    if (window.perf) {
      window.perf.endMeasure('sidebar.renderCatList');
      window.perf.recordMilestone('sidebarRendered');
    }
    return;
  }

  cats.forEach(cat => {
    const li = document.createElement('li');
    li.className = `cat-item ${state.activeCat && state.activeCat.id === cat.id ? 'active' : ''}`;
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
      onSelectCat(cat);
      // Close sidebar on mobile after selection
      if (window.innerWidth <= 850 && sidebar) {
        sidebar.classList.remove('open');
      }
    });

    catList.appendChild(li);
  });
  if (window.perf) {
    window.perf.endMeasure('sidebar.renderCatList');
    window.perf.recordMilestone('sidebarRendered');
  }
}

// Update the list item state dot & label on the fly
export function updateSidebarItemUI(cat) {
  const item = document.querySelector(`.cat-item[data-id="${cat.id}"]`);
  if (!item) return;

  const indicator = item.querySelector('.cat-indicator');
  const metaStatus = item.querySelector('.cat-item-meta span:last-child');

  if (indicator) indicator.className = `cat-indicator ${cat.status}`;
  if (metaStatus) metaStatus.textContent = getStatusLabel(cat.status);
}

// Filter CAT list based on search, category, and quick status filter selections
function filterCats(onFilterTriggered) {
  const query = searchInput.value.toLowerCase().trim();
  const selectedCat = categoryFilter.value;

  const filtered = state.allCats.filter(cat => {
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
    if (state.activeStatusFilter === 'todo') matchesStatus = cat.status === 'todo';
    else if (state.activeStatusFilter === 'doing') matchesStatus = cat.status === 'doing';
    else if (state.activeStatusFilter === 'done') matchesStatus = cat.status === 'done';
    else if (state.activeStatusFilter === 'redflags') {
      matchesStatus = cat.red_flags && cat.red_flags.trim().length > 0 && 
                      !cat.red_flags.toLowerCase().includes("aucun signe de gravité") && 
                      !cat.red_flags.toLowerCase().includes("aucun");
    }

    return matchesQuery && matchesCategory && matchesStatus;
  });

  if (onFilterTriggered) {
    onFilterTriggered(filtered);
  }
}
