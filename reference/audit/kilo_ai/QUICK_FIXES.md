# Quick Fixes — Immediate Actions
**Target:** High-impact, low-effort improvements you can make this week.

---

## Fix #1: Extract the 5 Most Critical Inline Styles
**Effort:** 30 minutes  
**Impact:** Makes index.html immediately more readable

Find these inline styles and move them to CSS:

```css
/* Add to public/css/variables.css or a new utilities.css */
.btn-danger-ghost {
  background: rgba(239, 68, 68, 0.15);
  border: 1px solid rgba(239, 68, 68, 0.3);
  color: #f87171;
  border-radius: 6px;
  padding: 6px 12px;
  font-size: 11px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
}

.loading-overlay {
  position: fixed;
  top: 0; left: 0;
  width: 100%; height: 80px;
  background: rgba(9, 13, 22, 0.96);
  border-bottom: 2px solid var(--color-primary);
  z-index: 9999999;
}
```

Then replace in HTML:
```html
<!-- Before -->
<button style="background: rgba(239, 68, 68, 0.15); border: 1px solid ...">

<!-- After -->
<button class="btn-danger-ghost">
```

## Fix #2: Eliminate 3 Inline onclick Handlers
**Effort:** 15 minutes

Move these from HTML to JS:

```javascript
// In main.js or a new events.js file
document.getElementById('about-legal-header')?.addEventListener('click', () => {
  const content = document.getElementById('about-legal-content');
  const chevron = document.getElementById('about-legal-chevron');
  const isExpanded = content.style.maxHeight === '500px';
  content.style.maxHeight = isExpanded ? '0px' : '500px';
  chevron.style.transform = isExpanded ? 'rotate(0deg)' : 'rotate(180deg)';
});
```

```html
<!-- Remove from HTML -->
<!-- Before -->
<div onclick="const content = ...">

<!-- After -->
<div id="about-legal-header">
```

## Fix #3: Extract `isOfflineCat` to Shared Module
**Effort:** 10 minutes  
**Impact:** Eliminates 4 duplicate implementations

Create `public/js/lib/helpers.js`:
```javascript
export function isOfflineCat(c, customCatIds = new Set()) {
  return customCatIds.has(c.id) || 
         c.isOffline === true || 
         c.source === 'offline' || 
         (typeof c.id === 'string' && c.id.startsWith('offline-')) || 
         (typeof c.id === 'number' && c.id < 0);
}
```

Replace in `main.js`, `api.js`, etc.

## Fix #4: Extract `mergeCatsWithLocalState` to Shared Module
**Effort:** 15 minutes  
**Impact:** Eliminates 3 duplicate implementations

Create `public/js/lib/state-merger.js`:
```javascript
export function mergeCatsWithLocalState(serverCats, localProgress, localOverrides) {
  return serverCats.map(cat => {
    const localEntry = localProgress[cat.id] || {};
    const overrides = localOverrides[cat.id] || {};
    return {
      ...cat,
      status: localEntry.status || 'todo',
      notes: localEntry.notes || '',
      summary: overrides.customSummary || cat.summary,
      customSummary: overrides.customSummary || cat.summary,
      ordonnance: overrides.customOrdonnance || cat.ordonnance,
      customOrdonnance: overrides.customOrdonnance || cat.ordonnance
    };
  });
}
```

## Fix #5: Replace `alert()` with `showToast()` in Admin Actions
**Effort:** 20 minutes  
**Impact:** Consistent UX, removes blocking dialogs

Current: `alert("Proposition approuvée !");`  
Target: `showToast("Proposition approuvée !", "fa-circle-check", 3000);`

Search and replace in:
- `dashboard.js`
- `workspace.js`
- `main.js`

## Fix #6: Add JSDoc to Public Functions
**Effort:** 30 minutes  
**Impact:** Enables IDE autocomplete, better documentation

Add to top of each component file:
```javascript
/**
 * @module sidebar
 * @description Sidebar component for Dr. CAT
 */

/**
 * Initialize the sidebar component
 * @param {function} onSelectCat - Callback when a CAT is selected
 * @param {function} onFilterTriggered - Callback when filters change
 */
export function initSidebar(onSelectCat, onFilterTriggered) { ... }
```

## Fix #7: Add ESLint + Prettier
**Effort:** 20 minutes  
**Impact:** Consistent code style, catches bugs

```bash
npm install -D eslint prettier @typescript-eslint/parser @typescript-eslint/eslint-plugin
npx eslint --init
```

`.eslintrc.json`:
```json
{
  "env": { "browser": true, "es2021": true, "node": true },
  "extends": ["eslint:recommended"],
  "parserOptions": { "ecmaVersion": "latest", "sourceType": "module" }
}
```

`.prettierrc`:
```json
{
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5"
}
```

## Fix #8: Remove Duplicate Stats Calculation
**Effort:** 10 minutes

In `main.js`, `calculateStats()` calls `dashboard.renderDashboard()`. But `dashboard.renderDashboard()` also calculates stats. Fix:

```javascript
// In main.js calculateStats()
export function calculateStats() {
  const stats = dashboard.calculateStats(); // Add this function to dashboard
  // Update sidebar elements
  // Update dashboard elements using stats from dashboard
}
```

## Fix #9: Fix the `quiz.js` `failedQuestions` State Bug
**Effort:** 5 minutes  
**Impact:** Bug fix

Current bug: `state.quizSession.failedQuestions` is set but never reset between quiz sessions properly.

```javascript
// In showQuizSetup() — add this:
state.quizSession.failedQuestions = [];
```

## Fix #10: Fix Memory Leak in `diagnostics.js`
**Effort:** 5 minutes  
**Impact:** Prevents memory leak

The `setInterval` in `expandPanel()` is cleared in `collapsePanel()` but what if the user navigates away? Add cleanup:

```javascript
// In initDiagnostics(), add:
window.addEventListener('drcat-admin-tab-changed', (e) => {
  if (e.detail.activePaneId !== 'admin-pane-diagnostics' && isOpen) {
    collapsePanel();
  }
});

// Also add page unload cleanup
window.addEventListener('beforeunload', () => {
  if (isOpen) collapsePanel();
});
```

---

## Checklist

- [ ] Fix #1: Extract 5 critical inline styles
- [ ] Fix #2: Eliminate 3 inline onclick handlers
- [ ] Fix #3: Extract isOfflineCat to shared module
- [ ] Fix #4: Extract mergeCatsWithLocalState to shared module
- [ ] Fix #5: Replace alert() with showToast() in admin actions
- [ ] Fix #6: Add JSDoc to public functions
- [ ] Fix #7: Add ESLint + Prettier
- [ ] Fix #8: Remove duplicate stats calculation
- [ ] Fix #9: Fix failedQuestions state bug
- [ ] Fix #10: Fix memory leak in diagnostics

**Total time: ~3 hours of focused work.**

Do these 10 fixes and your codebase will immediately feel cleaner. Then tackle Phase 0 from the Reconstruction Plan.
