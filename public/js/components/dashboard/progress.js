import { safeGetItem, safeSetItem } from '../../lib/safeStorage.js';

export function renderCategoryProgress(categoriesDiv, cats) {
  if (!categoriesDiv) return;
  categoriesDiv.innerHTML = '';

  const categoriesMap = {};
  cats.forEach(cat => {
    if (!categoriesMap[cat.category]) {
      categoriesMap[cat.category] = { total: 0, done: 0, items: [] };
    }
    categoriesMap[cat.category].total++;
    categoriesMap[cat.category].items.push(cat);
    if (cat.status === 'done') {
      categoriesMap[cat.category].done++;
    }
  });

  const categoryNames = Object.keys(categoriesMap).sort();
  
  // Update header summary badge
  const summaryBadge = document.getElementById('categories-summary-badge');
  if (summaryBadge) {
    summaryBadge.textContent = `${categoryNames.length} domaines`;
  }

  categoryNames.forEach(catName => {
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

  // Setup collapsible toggle once
  const toggleBtn = document.getElementById('categories-progress-toggle');
  const content = document.getElementById('categories-progress-content');
  const chevron = document.getElementById('categories-toggle-chevron');

  if (toggleBtn && content && chevron && !toggleBtn._hasListener) {
    toggleBtn._hasListener = true;
    
    // Restore saved state (default: collapsed to save vertical space)
    const isExpanded = safeGetItem('dash_categories_expanded') === 'true';
    if (isExpanded) {
      content.style.display = 'block';
      chevron.style.transform = 'rotate(180deg)';
    } else {
      content.style.display = 'none';
      chevron.style.transform = 'rotate(0deg)';
    }

    toggleBtn.addEventListener('click', () => {
      const currentlyOpen = content.style.display !== 'none';
      if (currentlyOpen) {
        content.style.display = 'none';
        chevron.style.transform = 'rotate(0deg)';
        safeSetItem('dash_categories_expanded', 'false');
      } else {
        content.style.display = 'block';
        chevron.style.transform = 'rotate(180deg)';
        safeSetItem('dash_categories_expanded', 'true');
      }
    });
  }
}
