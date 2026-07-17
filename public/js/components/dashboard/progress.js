export function renderCategoryProgress(categoriesDiv, cats) {
  if (!categoriesDiv) return;
  categoriesDiv.innerHTML = '';

  const categoriesMap = {};
  cats.forEach(cat => {
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
