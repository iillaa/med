import { state } from '../state.js';
import { setupSwipeGestures, debounce, prefersReducedMotion, escapeHTML } from '../utils.js';
import { safeGetItem, safeSetItem } from '../lib/safeStorage.js';

// DOM Elements
let catList, searchInput, categoryFilter, sidebar, sidebarOverlay;

/**
 * Pull-to-refresh for the CAT list (Phase 3.6).
 * Triggers `onRefresh` only when the list is scrolled to the very top and the
 * user drags downward past a threshold. A spinner indicator is shown while
 * refreshing. Pointer/touch only; ignores the gesture once content isn't at top
 * or while already refreshing. Honors reduced-motion (no transform drag).
 * @param {HTMLElement} listEl - the <ul id="cat-list"> element.
 * @param {() => Promise<void>|void} onRefresh - refresh callback.
 */
function setupPullToRefresh(listEl, onRefresh) {
  const container = listEl.parentElement; // .cat-list-wrapper (scroll container)
  if (!container) return;

  const indicator = document.createElement('div');
  indicator.className = 'ptr-indicator';
  indicator.innerHTML = '<i class="fa-solid fa-arrows-rotate"></i>';
  container.insertBefore(indicator, listEl);

  const THRESHOLD = 64;
  let startY = 0, dragging = false, refreshing = false;

  let rAFPending = null;
  let currentPull = 0;
  const onStart = (e) => {
    if (refreshing) return;
    if (container.scrollTop > 0) return;
    startY = e.touches ? e.touches[0].clientY : e.clientY;
    dragging = true;
    currentPull = 0;
  };
  const onMove = (e) => {
    if (!dragging || refreshing) return;
    const y = e.touches ? e.touches[0].clientY : e.clientY;
    const delta = y - startY;
    if (delta <= 0) { 
      currentPull = 0;
      container.style.transform = ''; 
      indicator.classList.remove('visible'); 
      return; 
    }
    if (container.scrollTop > 0) { dragging = false; return; }
    if (e.cancelable) e.preventDefault();
    currentPull = Math.min(delta * 0.5, THRESHOLD + 24);
    if (prefersReducedMotion()) return;
    if (!rAFPending) {
      rAFPending = requestAnimationFrame(() => {
        container.style.transform = `translateY(${currentPull}px)`;
        indicator.classList.add('visible');
        indicator.style.opacity = String(Math.min(currentPull / THRESHOLD, 1));
        rAFPending = null;
      });
    }
  };
  const onEnd = async () => {
    if (rAFPending) {
      cancelAnimationFrame(rAFPending);
      rAFPending = null;
    }
    if (!dragging || refreshing) { dragging = false; return; }
    dragging = false;
    const pulled = currentPull;
    currentPull = 0;
    container.style.transform = '';
    indicator.style.opacity = '';
    indicator.classList.remove('visible');
    if (pulled >= THRESHOLD) {
      refreshing = true;
      indicator.classList.add('spinning');
      try { await onRefresh(); } finally {
        indicator.classList.remove('spinning');
        refreshing = false;
      }
    }
  };

  container.addEventListener('touchstart', onStart, { passive: true });
  container.addEventListener('touchmove', onMove, { passive: false });
  container.addEventListener('touchend', onEnd);
  // Mouse fallback (desktop dev): drag from top with button held.
  container.addEventListener('mousedown', onStart);
  container.addEventListener('mousemove', onMove);
  window.addEventListener('mouseup', onEnd);
}

function getStatusLabel(status) {
  switch(status) {
    case 'done': return 'Maîtrisé';
    case 'doing': return 'En cours';
    default: return 'À faire';
  }
}

export function initSidebar(onSelectCat, onFilterTriggered, onRefresh) {
  catList = document.getElementById('cat-list');
  searchInput = document.getElementById('search-input');
  categoryFilter = document.getElementById('category-filter');
  sidebar = document.getElementById('sidebar');
  sidebarOverlay = document.getElementById('sidebar-overlay');

  const openSidebarBtn = document.getElementById('open-sidebar-btn');
  const closeSidebarBtn = document.getElementById('close-sidebar-btn');

  if (catList) {
    catList.addEventListener('click', (e) => {
      const item = e.target.closest('.cat-item');
      if (!item) return;
      const catId = parseInt(item.getAttribute('data-id'), 10);
      if (isNaN(catId)) return;
      const targetCat = state.allCats.find(c => c.id === catId);
      if (targetCat) {
        // Read matched sub-cat index from search deep-link badge (0 = Master)
        const matchedSub = parseInt(item.getAttribute('data-matched-subcat') || '0', 10);
        onSelectCat(targetCat, matchedSub);
        if (window.innerWidth <= 850 && sidebar) {
          sidebar.classList.remove('open');
        }
      }
    });
  }

  // Search and Category input listeners.
  // Debounce keystrokes (150ms) so the (full) list re-render only fires after
  // the user pauses — smooth typing instead of a re-render per character.
  if (searchInput) searchInput.addEventListener('input', debounce(() => filterCats(onFilterTriggered), 150));
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

  // Sidebar Navigation Tabs Switcher (Fiches / PDFs / Quiz)
  const tabCats = document.getElementById('sidebar-tab-cats');
  const tabPdfs = document.getElementById('sidebar-tab-pdfs');
  const tabQuiz = document.getElementById('sidebar-tab-quiz');

  function setSidebarTabActive(btn) {
    [tabCats, tabPdfs, tabQuiz].forEach(b => { if (b) b.classList.remove('active'); });
    if (btn) btn.classList.add('active');
  }

  if (tabCats) {
    tabCats.addEventListener('click', () => {
      setSidebarTabActive(tabCats);
      const welcome = document.getElementById('welcome-screen');
      if (welcome && (!state.activeCat || welcome.style.display !== 'none')) {
        // Show dashboard or active CAT
      }
    });
  }

  if (tabPdfs) {
    tabPdfs.addEventListener('click', () => {
      setSidebarTabActive(tabPdfs);
      if (window.openStandaloneLibrary) {
        window.openStandaloneLibrary();
      }
      if (window.innerWidth <= 850 && sidebar) {
        sidebar.classList.remove('open');
      }
    });
  }

  if (tabQuiz) {
    tabQuiz.addEventListener('click', () => {
      setSidebarTabActive(tabQuiz);
      const quizBtn = document.getElementById('start-quiz-nav-btn');
      if (quizBtn) quizBtn.click();
      if (window.innerWidth <= 850 && sidebar) {
        sidebar.classList.remove('open');
      }
    });
  }

  // Controls panel collapsible toggle
  const controlsToggleBtn = document.getElementById('controls-toggle-btn');
  const controlsPanel = document.getElementById('controls-panel');
  const controlsToggleIcon = document.getElementById('controls-toggle-icon');

  // Restore saved state (default: expanded)
  const savedCollapsed = safeGetItem('sidebar_controls_collapsed') === 'true';
  if (savedCollapsed && controlsPanel) {
    controlsPanel.classList.add('collapsed');
    if (controlsToggleIcon) controlsToggleIcon.classList.add('rotated');
  }

  if (controlsToggleBtn && controlsPanel) {
    controlsToggleBtn.addEventListener('click', () => {
      const isNowCollapsed = controlsPanel.classList.toggle('collapsed');
      if (controlsToggleIcon) controlsToggleIcon.classList.toggle('rotated', isNowCollapsed);
      safeSetItem('sidebar_controls_collapsed', isNowCollapsed);
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

  // APK Download Button visibility: show ONLY when running as web_client/PWA, hide when inside Android APK container
  const apkDownloadBtn = document.getElementById('apk-download-btn');
  if (apkDownloadBtn) {
    const isNativeApk = !!window.Capacitor || (window.Capacitor && window.Capacitor.isNativePlatform && window.Capacitor.isNativePlatform()) || (navigator.userAgent && navigator.userAgent.toLowerCase().includes('capacitor'));
    if (isNativeApk) {
      apkDownloadBtn.style.display = 'none';
    } else {
      apkDownloadBtn.style.display = 'inline-flex';
    }
  }

  // Phase 3.6: Pull-to-refresh on the CAT list (native feel).
  if (catList && onRefresh) setupPullToRefresh(catList, onRefresh);
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

// Keep a stable cat.id -> <li> map so re-renders (filtering/search) update
// existing nodes in place instead of tearing down the whole list. This makes
// list updates O(changes) instead of O(all) and preserves attached listeners.
const catItemNodes = new Map();

function buildCatItem(cat) {
  const li = document.createElement('li');
  const isChild = !!cat.parent_id;
  li.className = `cat-item ${isChild ? 'cat-item-subcat' : ''}`;
  li.setAttribute('data-id', cat.id);

  let branchBadge = '';
  if (isChild) {
    branchBadge = '<span class="badge" style="font-size:9.5px; padding:1px 5px; background:rgba(168,85,247,0.15); color:#c084fc; border:1px solid rgba(168,85,247,0.3);"><i class="fa-solid fa-code-branch"></i> Sous-fiche</span>';
  }

  // Sub-CAT search match badge: shows which sub-cat matched the query
  let subCatBadge = '';
  if (cat._matchedSubCatIdx >= 0 && Array.isArray(cat.sub_cats) && cat.sub_cats[cat._matchedSubCatIdx]) {
    const matchedLabel = cat.sub_cats[cat._matchedSubCatIdx].label || `Sous-fiche ${cat._matchedSubCatIdx + 1}`;
    // Clean label for display (truncate if too long)
    const displayLabel = matchedLabel.length > 35 ? matchedLabel.substring(0, 32) + '…' : matchedLabel;
    subCatBadge = `<div class="cat-item-subcat-match" style="font-size:9.5px; padding:2px 6px; margin-top:2px; border-radius:6px; background:rgba(168,85,247,0.12); color:#c084fc; border:1px solid rgba(168,85,247,0.25); white-space:nowrap; overflow:hidden; text-overflow:ellipsis; max-width:100%;"><i class="fa-solid fa-arrow-turn-down" style="margin-right:3px;"></i> ${escapeHTML(displayLabel)}</div>`;
    li.setAttribute('data-matched-subcat', String(cat._matchedSubCatIdx + 1)); // 1-based index for switchToSubProfile
  } else {
    li.setAttribute('data-matched-subcat', '0');
  }

  li.innerHTML = `
    <div class="cat-indicator ${cat.status}"></div>
    <div class="cat-item-content">
      <span class="cat-item-title">${cat.id}. ${escapeHTML(cat.title)}</span>
      <div class="cat-item-meta">
        <span class="cat-item-cat">${escapeHTML(cat.category)}</span>
        ${branchBadge}
        <span class="cat-item-status">${getStatusLabel(cat.status)}</span>
      </div>
      ${subCatBadge}
    </div>
  `;
  return li;
}

function paintCatItem(li, cat) {
  const isChild = !!cat.parent_id;
  li.className = `cat-item ${isChild ? 'cat-item-subcat' : ''} ${state.activeCat && state.activeCat.id === cat.id ? 'active' : ''}`;
  li.setAttribute('data-id', cat.id);
  const title = li.querySelector('.cat-item-title');
  if (title) title.textContent = `${cat.id}. ${cat.title}`;
  const catEl = li.querySelector('.cat-item-cat');
  if (catEl) catEl.textContent = cat.category;
  const statusEl = li.querySelector('.cat-item-status');
  if (statusEl) statusEl.textContent = getStatusLabel(cat.status);
  const indicator = li.querySelector('.cat-indicator');
  if (indicator) indicator.className = `cat-indicator ${cat.status}`;

  // Update sub-cat match badge on re-paint (search query may have changed)
  const existingBadge = li.querySelector('.cat-item-subcat-match');
  if (cat._matchedSubCatIdx >= 0 && Array.isArray(cat.sub_cats) && cat.sub_cats[cat._matchedSubCatIdx]) {
    const matchedLabel = cat.sub_cats[cat._matchedSubCatIdx].label || `Sous-fiche ${cat._matchedSubCatIdx + 1}`;
    const displayLabel = matchedLabel.length > 35 ? matchedLabel.substring(0, 32) + '…' : matchedLabel;
    li.setAttribute('data-matched-subcat', String(cat._matchedSubCatIdx + 1));
    if (existingBadge) {
      existingBadge.innerHTML = `<i class="fa-solid fa-arrow-turn-down" style="margin-right:3px;"></i> ${escapeHTML(displayLabel)}`;
    } else {
      const content = li.querySelector('.cat-item-content');
      if (content) {
        const badge = document.createElement('div');
        badge.className = 'cat-item-subcat-match';
        badge.style.cssText = 'font-size:9.5px; padding:2px 6px; margin-top:2px; border-radius:6px; background:rgba(168,85,247,0.12); color:#c084fc; border:1px solid rgba(168,85,247,0.25); white-space:nowrap; overflow:hidden; text-overflow:ellipsis; max-width:100%;';
        badge.innerHTML = `<i class="fa-solid fa-arrow-turn-down" style="margin-right:3px;"></i> ${escapeHTML(displayLabel)}`;
        content.appendChild(badge);
      }
    }
  } else {
    li.setAttribute('data-matched-subcat', '0');
    if (existingBadge) existingBadge.remove();
  }
}

// Animate a list item out, then remove it from the DOM (Phase 3.3).
// Falls back to immediate removal under reduced-motion or if animation
// doesn't fire.
function animateListItemExit(li) {
  if (!li || !li.isConnected) return;
  if (prefersReducedMotion()) { li.remove(); return; }
  li.classList.add('cat-item-exit');
  let done = false;
  const finish = () => { if (!done) { done = true; li.remove(); } };
  li.addEventListener('animationend', finish, { once: true });
  setTimeout(finish, 250);
}

// Render CATs list
export function renderCatList(cats, onSelectCat) {
  if (window.perf) window.perf.startMeasure('sidebar.renderCatList');
  if (!catList) catList = document.getElementById('cat-list');
  if (!catList) return;

  // Drop the boot-time shimmer skeletons once real data is present. They are
  // static placeholder <li>s (not in catItemNodes), so the incremental path
  // below would otherwise leave them lingering under the real CATs.
  catList.querySelectorAll('.cat-item-skeleton').forEach((el) => el.remove());

  // Empty state: clear everything and show a tailored placeholder.
  if (cats.length === 0) {
    catItemNodes.clear();
    const dbEmpty = !state.allCats || state.allCats.length === 0;
    catList.innerHTML = `
      <li class="empty-state">
        <div style="text-align: center; padding: 32px 16px; color: var(--text-muted);">
          <i class="fa-solid ${dbEmpty ? 'fa-folder-open' : 'fa-filter-circle-xmark'}" style="font-size: 28px; margin-bottom: 10px; display: block; opacity: 0.6;"></i>
          <span style="font-size: 13px; line-height: 1.5;">${dbEmpty ? "Aucune fiche disponible pour le moment." : "Aucune fiche ne correspond à vos filtres actuels."}</span>
          ${dbEmpty ? '<button id="sidebar-retry-btn" class="btn-secondary" style="margin-top: 12px; padding: 6px 14px; border-radius: 8px; cursor: pointer; font-size: 12px;">Recharger</button>' : ''}
        </div>
      </li>`;
    if (dbEmpty) {
      const retry = catList.querySelector('#sidebar-retry-btn');
      if (retry) retry.addEventListener('click', () => location.reload());
    }
    if (window.perf) {
      window.perf.endMeasure('sidebar.renderCatList');
      window.perf.recordMilestone('sidebarRendered');
    }
    return;
  }

  const incoming = new Set(cats.map(c => c.id));
  // Remove nodes no longer present (animate out first, then drop).
  for (const [id, li] of catItemNodes) {
    if (!incoming.has(id)) {
      catItemNodes.delete(id);
      animateListItemExit(li);
    }
  }

  const fragment = document.createDocumentFragment();
  let attached = false;
  let enterIndex = 0;
  let prev = null;
  cats.forEach((cat) => {
    let li = catItemNodes.get(cat.id);
    if (!li) {
      li = buildCatItem(cat);
      catItemNodes.set(cat.id, li);
      fragment.appendChild(li);
      attached = true;
      // Staggered enter for items that just appeared (Phase 3.3).
      if (!prefersReducedMotion()) {
        li.classList.add('cat-item-enter');
        li.style.animationDelay = `${Math.min(enterIndex, 8) * 30}ms`;
        li.addEventListener('animationend', () => {
          li.classList.remove('cat-item-enter');
          li.style.animationDelay = '';
        }, { once: true });
        enterIndex++;
      }
    } else {
      paintCatItem(li, cat); // update in place (text + active + status dot)
    }
    // Re-establish correct visual order by moving each node after the previous
    // one. Only moves nodes; never tears down the list (preserves listeners).
    if (prev) {
      if (li !== prev.nextSibling) catList.insertBefore(li, prev.nextSibling);
    } else if (li !== catList.firstChild) {
      catList.insertBefore(li, catList.firstChild);
    }
    prev = li;
  });

  if (attached) catList.appendChild(fragment);

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

export function normalizeSearchText(str) {
  if (!str) return '';
  return String(str)
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/[`'’"“”«»\-–—_:;,?.!/\\()[\]{}*+]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

// Filter CAT list based on search, category, and quick status filter selections
function filterCats(onFilterTriggered) {
  const normalizedQuery = normalizeSearchText(searchInput.value);
  const selectedCat = categoryFilter.value;

  // Split query into terms for multi-keyword search (e.g. "otomycose orl", "hta", "avc")
  const queryTokens = normalizedQuery ? normalizedQuery.split(/\s+/).filter(Boolean) : [];

  const filtered = state.allCats.filter(cat => {
    if (!cat) return false;

    // Use pre-cached normalized searchable text index string to avoid string allocations during typing
    if (!cat._searchTokenStr) {
      const titleStr = normalizeSearchText(cat.title);
      const summaryStr = normalizeSearchText(cat.summary || cat.customSummary);
      const ordonnanceStr = normalizeSearchText(cat.ordonnance || cat.customOrdonnance);
      const redFlagsStr = normalizeSearchText(cat.red_flags);
      const categoryStr = normalizeSearchText(cat.category);
      const notesStr = normalizeSearchText(cat.notes);
      const keywordsStr = Array.isArray(cat.pdf_keywords)
        ? cat.pdf_keywords.filter(k => k && typeof k === 'string').map(k => normalizeSearchText(k)).join(' ')
        : normalizeSearchText(cat.pdf_keywords);
      const subCatsStr = Array.isArray(cat.sub_cats)
        ? cat.sub_cats.map(s => `${normalizeSearchText(s.label)} ${normalizeSearchText(s.summary)} ${normalizeSearchText(s.ordonnance)}`).join(' ')
        : '';
      const idStr = cat.id !== undefined && cat.id !== null ? String(cat.id) : '';

      cat._searchTokenStr = `${idStr} ${titleStr} ${categoryStr} ${summaryStr} ${ordonnanceStr} ${redFlagsStr} ${keywordsStr} ${notesStr} ${subCatsStr}`;
    }

    // 1. Search text match (every search token must appear somewhere in the normalized CAT content)
    const matchesQuery = queryTokens.length === 0 || queryTokens.every(token => cat._searchTokenStr.includes(token));

    // Detect which specific sub-cat label matched the search query for deep-link badges.
    cat._matchedSubCatIdx = -1; // -1 = no specific sub-cat match (show Master)
    if (matchesQuery && queryTokens.length > 0 && Array.isArray(cat.sub_cats) && cat.sub_cats.length > 0) {
      const masterStr = `${normalizeSearchText(cat.title)} ${normalizeSearchText(cat.category)}`;
      const matchesMasterDirectly = queryTokens.every(t => masterStr.includes(t));
      if (!matchesMasterDirectly) {
        for (let si = 0; si < cat.sub_cats.length; si++) {
          const sub = cat.sub_cats[si];
          const subStr = `${normalizeSearchText(sub.label)} ${normalizeSearchText(sub.summary)} ${normalizeSearchText(sub.ordonnance)} ${normalizeSearchText(sub.red_flags)}`;
          if (queryTokens.every(t => subStr.includes(t))) {
            cat._matchedSubCatIdx = si;
            break;
          }
        }
      }
    }

    // 2. Category filter match
    const matchesCategory = selectedCat === 'all' || cat.category === selectedCat;

    // 3. Quick status / Red flags filter match
    let matchesStatus = true;
    if (state.activeStatusFilter === 'todo') matchesStatus = cat.status === 'todo';
    else if (state.activeStatusFilter === 'doing') matchesStatus = cat.status === 'doing';
    else if (state.activeStatusFilter === 'done') matchesStatus = cat.status === 'done';
    else if (state.activeStatusFilter === 'redflags') {
      const redFlagsStr = (cat.red_flags || '').toLowerCase();
      matchesStatus = redFlagsStr.length > 0 && 
                      !redFlagsStr.includes("aucun signe de gravité") && 
                      !redFlagsStr.includes("aucun");
    }

    return matchesQuery && matchesCategory && matchesStatus;
  });

  if (onFilterTriggered) {
    onFilterTriggered(filtered);
  }
}

