# Reconstruction Plan — Dr. CAT
**Goal:** Transform the project from spaghetti vanilla JS into a maintainable, testable, scalable architecture.

---

## Phase 0: Stabilization (Week 1-2) — "Stop the Bleeding"

**Objective:** Make the codebase safe to modify without fear of breaking everything.

### Tasks

#### 0.1 Extract Inline Styles from index.html
**Effort:** 2-3 days  
**Impact:** HIGH — Makes HTML readable, enables CSS tooling

Current state: 600+ lines of inline `style=""` attributes.

Action:
1. Audit all inline styles in `index.html`
2. Create corresponding CSS classes in existing CSS files
3. Replace inline styles with class names
4. Test visual parity on mobile + desktop

Tools:
```bash
# Find all inline styles
grep -o 'style="[^"]*"' public/index.html | wc -l
```

#### 0.2 Eliminate Inline Event Handlers
**Effort:** 1 day  
**Impact:** MEDIUM — Separates concerns

Current state: 15+ `onclick=""` handlers in HTML.

Action:
1. Move all `onclick="..."` to `addEventListener` in JS
2. Remove inline handlers from HTML

#### 0.3 Extract Duplicated State Merging Logic
**Effort:** 1 day  
**Impact:** HIGH — Eliminates 3 sources of bugs

Create `public/js/lib/state-merger.js`:
```javascript
export function mergeCatsWithLocalState(serverCats, localProgress, localOverrides, customCats) {
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

export function isOfflineCat(c, customCatIds) {
  return customCatIds.has(c.id) || 
         c.isOffline === true || 
         c.source === 'offline' || 
         c.id.toString().startsWith('offline-') || 
         (typeof c.id === 'number' && c.id < 0);
}
```

Then replace 4+ inline implementations with imports.

#### 0.4 Create Constants File
**Effort:** 1 day  
**Impact:** MEDIUM — Eliminates magic numbers

Create `public/js/lib/constants.js`:
```javascript
export const CORE_CAT_COUNT = 55;
export const MIN_CATS_FOR_CACHE = 40;
export const ADMIN_TOKEN_TTL = 12 * 60 * 60 * 1000;
export const FETCH_TIMEOUT_WEB = 8000;
export const FETCH_TIMEOUT_CAPACITOR = 3000;
export const RATE_LIMIT_WINDOW = 60 * 1000;
export const MAX_REQUESTS_PER_WINDOW = 60;
export const APP_DATA_KEY = 'drcat_pub_2f7a91c4e8';
export const LOCAL_STORAGE_KEYS = {
  PROGRESS: 'dr_cat_user_progress',
  OVERRIDES: 'dr_cat_local_overrides',
  CUSTOM_CATS: 'dr_cat_custom_created_cats',
  ADMIN_TOKEN: 'dr_cat_admin_token',
  REMOTE_URL: 'dr_cat_remote_server_url',
  LEITNER: 'dr_cat_leitner',
  STREAK: 'dr_cat_streak',
  SYNC_CACHE: (v) => `dr_cat_synced_database_v${v}`,
  LAST_SYNC: 'dr_cat_last_sync_time',
  NAVIGATION: 'dr_cat_navigation_state',
  THEME: 'theme',
  SIDEBAR_COLLAPSED: 'sidebar_controls_collapsed'
};
```

#### 0.5 Standardize Error Handling
**Effort:** 1 day  
**Impact:** MEDIUM — Consistent UX

Create `public/js/lib/errors.js`:
```javascript
export class AppError extends Error {
  constructor(message, code, status = 500) {
    super(message);
    this.code = code;
    this.status = status;
  }
}

export const ErrorCodes = {
  NETWORK: 'NETWORK_ERROR',
  UNAUTHORIZED: 'UNAUTHORIZED',
  FORBIDDEN: 'FORBIDDEN',
  NOT_FOUND: 'NOT_FOUND',
  VALIDATION: 'VALIDATION_ERROR',
  QUOTA_EXCEEDED: 'QUOTA_EXCEEDED'
};

export function handleError(err, showToast = true) {
  if (err instanceof AppError) {
    if (showToast) showToastMessage(err.message, 'error');
    return err;
  }
  
  const message = err.message || 'Une erreur inattendue est survenue.';
  if (showToast) showToastMessage(message, 'error');
  return new AppError(message, ErrorCodes.UNKNOWN, 500);
}
```

---

## Phase 1: Frontend Refactor (Week 3-6) — "Untangle the Spaghetti"

**Objective:** Separate concerns, enable component reusability.

### 1.1 Migrate HTML to JS Templates
**Effort:** 3-4 days

Instead of full Svelte migration, use template literals:

```javascript
// Before: 1256-line HTML file
// After: templates/index.js

export const Templates = {
  sidebarItem(cat) {
    return `
      <li class="cat-item ${cat.status}" data-id="${cat.id}">
        <div class="cat-indicator ${cat.status}"></div>
        <div class="cat-item-content">
          <span class="cat-item-title">${escapeHTML(`${cat.id}. ${cat.title}`)}</span>
          <div class="cat-item-meta">
            <span>${escapeHTML(cat.category)}</span>
            <span>${getStatusLabel(cat.status)}</span>
          </div>
        </div>
      </li>
    `;
  },
  
  quizQuestion(q) {
    // ... template for quiz question
  }
};
```

### 1.2 Create a Simple Component System
**Effort:** 3-4 days

```javascript
// lib/component.js
export class Component {
  constructor(container, state = {}) {
    this.container = container;
    this.state = state;
    this.el = null;
  }
  
  render() {
    throw new Error('render() must be implemented');
  }
  
  mount(parent) {
    this.el = this.render();
    parent.appendChild(this.el);
    this.afterMount();
    return this;
  }
  
  afterMount() {}
  
  setState(updates) {
    Object.assign(this.state, updates);
    this.update();
  }
  
  update() {
    if (this.el) {
      const parent = this.el.parentNode;
      this.el.remove();
      this.el = this.render();
      parent.appendChild(this.el);
      this.afterMount();
    }
  }
  
  destroy() {
    if (this.el) this.el.remove();
  }
}
```

### 1.3 Split Large Components
**Effort:** 1 week

**quiz.js (1285 lines) →**
- `quiz/state.js` — Quiz session state, Leitner stats
- `quiz/generator.js` — Question generation (clinical, posology, redflags, prescription)
- `quiz/ui.js` — Rendering, timers, hints
- `quiz/scoring.js` — Answer evaluation, self-grading

**workspace.js (1143 lines) →**
- `workspace/state.js` — Active CAT, prescription variants
- `workspace/summary.js` — Summary rendering, editing
- `workspace/prescription.js` — Prescription variants, copy
- `workspace/pdfs.js` — PDF list, search, accordion
- `workspace/print.js` — Print functionality

**dashboard.js (777 lines) →**
- `dashboard/stats.js` — Statistics calculation
- `dashboard/resume.js` — Resume list
- `dashboard/progress.js` — Category progress bars
- `dashboard/admin.js` — Suggestions moderation

---

## Phase 2: Backend Refactor (Week 7-8) — "Kill the God File"

**Objective:** Split `server.js` into proper modules.

### 2.1 Directory Structure
```
server/
├── index.js              # Entry point, middleware setup
├── routes/
│   ├── cats.js           # CAT CRUD endpoints
│   ├── suggestions.js    # Suggestion endpoints
│   ├── search.js         # PDF search endpoint
│   ├── auth.js           # Login/logout endpoints
│   ├── diagnostics.js    # Diagnostics endpoints
│   └── performance.js    # Performance metrics endpoints
├── middleware/
│   ├── cors.js           # CORS configuration
│   ├── auth.js           # Admin token validation
│   ├── rate-limit.js     # Rate limiting
│   └── app-key.js        # App key validation
├── services/
│   ├── cache.js          # In-memory caching
│   ├── pdf.js            # PDF indexing
│   ├── data-store.js     # Atomic file operations
│   └── auth-service.js   # Password/token management
├── utils/
│   ├── validation.js     # Input validation
│   └── security.js       # Security helpers
└── config/
    └── providers.js      # Server provider registry
```

### 2.2 Key Extractions

**CORS Middleware** → `middleware/cors.js`:
```javascript
export function corsMiddleware(allowedOrigins) {
  return (req, res, next) => {
    // ... all CORS logic from server.js lines 138-222
  };
}
```

**Auth Service** → `services/auth-service.js`:
```javascript
export class AuthService {
  constructor(passwordFile) {
    this.passwordFile = passwordFile;
    this.passwordHash = '';
    this.passwordSalt = '';
    this.activeTokens = new Map();
    this.tokenTtl = 12 * 60 * 60 * 1000;
  }
  
  async init() { /* ... */ }
  hashPassword(password) { /* ... */ }
  verifyPassword(password) { /* ... */ }
  createToken() { /* ... */ }
  validateToken(token) { /* ... */ }
  revokeToken(token) { /* ... */ }
}
```

**Data Store** → `services/data-store.js`:
```javascript
export class DataStore {
  constructor(dbFile, backupDir) {
    this.dbFile = dbFile;
    this.backupDir = backupDir;
    this.lock = new AsyncLock();
    this.cache = [];
  }
  
  async load() { /* ... */ }
  async save(data) { /* ... */ }
  async backup() { /* ... */ }
  async find(id) { /* ... */ }
  async update(id, changes) { /* ... */ }
  async delete(id) { /* ... */ }
}
```

---

## Phase 3: SvelteKit Migration (Week 9-16) — "The Full Rewrite"

**Objective:** Migrate to modern framework for long-term maintainability.

### 3.1 Project Initialization

```bash
npm create svelte@latest drcat
# Select: Skeleton project, TypeScript, ESLint, Prettier, Playwright
cd drcat
npm install
```

### 3.2 Project Structure
```
drcat/
├── src/
│   ├── lib/
│   │   ├── components/
│   │   │   ├── Sidebar/
│   │   │   │   ├── Sidebar.svelte
│   │   │   │   ├── CategoryFilter.svelte
│   │   │   │   └── CatList.svelte
│   │   │   ├── Workspace/
│   │   │   │   ├── Workspace.svelte
│   │   │   │   ├── Summary.svelte
│   │   │   │   ├── Prescription.svelte
│   │   │   │   └── PdfList.svelte
│   │   │   ├── Quiz/
│   │   │   │   ├── Quiz.svelte
│   │   │   │   ├── QuizQuestion.svelte
│   │   │   │   ├── QcmOptions.svelte
│   │   │   │   └── WriteInAnswer.svelte
│   │   │   ├── Dashboard.svelte
│   │   │   └── Diagnostics.svelte
│   │   ├── stores/
│   │   │   ├── cats.ts
│   │   │   ├── quiz.ts
│   │   │   └── app.ts
│   │   ├── api/
│   │   │   ├── client.ts
│   │   │   ├── cats.ts
│   │   │   └── suggestions.ts
│   │   └── types/
│   │       ├── cat.ts
│   │       ├── quiz.ts
│   │       └── api.ts
│   ├── routes/
│   │   ├── +layout.svelte
│   │   ├── +page.svelte
│   │   ├── cats/
│   │   │   └── +page.svelte
│   │   ├── quiz/
│   │   │   └── +page.svelte
│   │   └── api/
│   │       ├── cats/
│   │       │   ├── +server.ts
│   │       │   └── +server.ts
│   │       └── suggestions/
│   │           └── +server.ts
│   └── app.html
├── static/
│   ├── css/
│   ├── pdfs/
│   └── data/
├── package.json
└── svelte.config.js
```

### 3.3 Key SvelteKit Equivalents

| Current | SvelteKit Equivalent |
|---------|----------------------|
| `index.html` (1256 lines) | `+layout.svelte` + component hierarchy |
| `main.js` bootstrap | `+layout.ts` load functions |
| `state.js` | `lib/stores/app.ts` (Svelte stores) |
| `api.js` | `lib/api/client.ts` + `$app/navigation` |
| `components/sidebar.js` | `lib/components/Sidebar/Sidebar.svelte` |
| Inline view switching | SvelteKit routing (`/cats`, `/quiz`) |
| `localStorage` reads | Svelte `$app/storage` or custom store |
| PDF viewer page | `routes/pdf-viewer/+page.svelte` |

### 3.4 State Management with Svelte Stores

```typescript
// lib/stores/cats.ts
import { writable, derived, get } from 'svelte/store';
import type { Cat, LocalProgress, LocalOverrides } from '$lib/types/cat';

export interface CatStore {
  all: Cat[];
  active: Cat | null;
  filter: string;
  search: string;
  loading: boolean;
  error: string | null;
}

function createCatStore() {
  const { subscribe, set, update } = writable<CatStore>({
    all: [],
    active: null,
    filter: 'all',
    search: '',
    loading: false,
    error: null
  });
  
  return {
    subscribe,
    setAll: (cats: Cat[]) => update(s => ({ ...s, all: cats })),
    setActive: (cat: Cat | null) => update(s => ({ ...s, active: cat })),
    setFilter: (filter: string) => update(s => ({ ...s, filter })),
    setSearch: (search: string) => update(s => ({ ...s, search })),
    // Derived stores
    filtered: derived(
      { subscribe: subscribe },
      ($store) => {
        // Filter logic here
        return $store.all.filter(cat => {
          // ...
        });
      }
    ),
    stats: derived(
      { subscribe: subscribe },
      ($store) => {
        const done = $store.all.filter(c => c.status === 'done').length;
        return { done, total: $store.all.length, percent: Math.round(done / $store.all.length * 100) };
      }
    )
  };
}

export const cats = createCatStore();
```

### 3.5 API Layer with SvelteKit

```typescript
// lib/api/client.ts
import { browser } from '$app/environment';

export class ApiClient {
  private baseUrl: string;
  
  constructor() {
    this.baseUrl = browser ? '' : 'http://localhost:3000';
  }
  
  async get<T>(endpoint: string): Promise<T> {
    const res = await fetch(`${this.baseUrl}${endpoint}`, {
      headers: { 'x-app-key': APP_DATA_KEY }
    });
    if (!res.ok) throw new Error(`API Error: ${res.status}`);
    return res.json();
  }
  
  async post<T>(endpoint: string, body: unknown): Promise<T> {
    const res = await fetch(`${this.baseUrl}${endpoint}`, {
      method: 'POST',
      headers: { 
        'Content-Type': 'application/json',
        'x-app-key': APP_DATA_KEY 
      },
      body: JSON.stringify(body)
    });
    if (!res.ok) throw new Error(`API Error: ${res.status}`);
    return res.json();
  }
}

export const api = new ApiClient();
```

### 3.6 SvelteKit API Routes (Server)

```typescript
// src/routes/api/cats/+server.ts
import { json } from '@sveltejs/kit';
import { catsCache } from '$lib/server/services/cache';
import { validateAppKey } from '$lib/server/middleware/app-key';
import type { RequestHandler } from './$types';

export const GET: RequestHandler = async ({ request }) => {
  if (!validateAppKey(request.headers.get('x-app-key') ?? '')) {
    return json({ error: 'Forbidden' }, { status: 403 });
  }
  
  const isAdmin = validateAdminToken(request.headers.get('x-admin-token'));
  let result = catsCache;
  
  if (!isAdmin) {
    result = result.map(({ history, ...rest }) => rest);
  }
  
  return json(result);
};
```

---

## Phase 4: Testing Strategy

### Unit Tests (Vitest)

```typescript
// tests/unit/utils.test.ts
import { describe, it, expect } from 'vitest';
import { parsePrescriptionText } from '$lib/utils/prescription';

describe('parsePrescriptionText', () => {
  it('should parse single variant', () => {
    const text = `Amoxicillin 1g\n3x/day`;
    const result = parsePrescriptionText(text);
    expect(result).toHaveLength(1);
    expect(result[0].title).toBe('Général');
  });
  
  it('should parse multiple variants', () => {
    const text = `--- Adulte ---\nAmoxicillin 1g\n--- Enfant ---\nAmoxicillin 500mg`;
    const result = parsePrescriptionText(text);
    expect(result).toHaveLength(2);
    expect(result[0].title).toBe('Adulte');
    expect(result[1].title).toBe('Enfant');
  });
});
```

### Integration Tests (Vitest)

```typescript
// tests/integration/api.test.ts
import { describe, it, expect } from 'vitest';
import { GET } from '$routes/api/cats/+server';

describe('GET /api/cats', () => {
  it('should return cats array', async () => {
    const response = await GET({
      request: new Request('http://localhost/api/cats', {
        headers: { 'x-app-key': APP_DATA_KEY }
      })
    });
    
    expect(response.status).toBe(200);
    const cats = await response.json();
    expect(Array.isArray(cats)).toBe(true);
    expect(cats.length).toBeGreaterThan(0);
  });
});
```

### E2E Tests (Playwright)

```typescript
// tests/e2e/quiz.spec.ts
import { test, expect } from '@playwright/test';

test.describe('Quiz Flow', () => {
  test('should complete a quiz session', async ({ page }) => {
    await page.goto('/');
    await page.click('#start-quiz-nav-btn');
    await page.selectOption('#quiz-category', 'all');
    await page.selectOption('#quiz-count', '5');
    await page.click('#start-quiz-btn');
    
    // Answer 5 questions
    for (let i = 0; i < 5; i++) {
      await page.waitForSelector('#quiz-qcm-container button', { timeout: 5000 });
      const buttons = await page.locator('#quiz-qcm-container button').all();
      await buttons[0].click();
      await page.click('#quiz-next-btn');
    }
    
    // Verify results
    await page.waitForSelector('#quiz-results-view');
    await expect(page.locator('#quiz-results-score')).toBeVisible();
  });
});
```

---

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Breaking existing features during refactor | HIGH | HIGH | Incremental approach, feature flags, comprehensive testing |
| Data loss during migration | LOW | HIGH | Automated backups, atomic writes, dry runs |
| Performance regression | MEDIUM | MEDIUM | Performance benchmarks before/after, Lighthouse CI |
| Capacitor/Android compatibility | MEDIUM | HIGH | Test on physical device at each milestone |
| User data (localStorage) incompatibility | MEDIUM | MEDIUM | Versioned localStorage schemas, migration scripts |

---

## Success Criteria

### Phase 0 Complete When:
- [ ] Zero inline styles in index.html
- [ ] Zero inline event handlers in HTML
- [ ] No duplicated state-merging logic
- [ ] All magic numbers replaced with named constants

### Phase 1 Complete When:
- [ ] No component file exceeds 500 lines
- [ ] All DOM manipulation centralized
- [ ] CSS is 100% class-based (no inline styles)

### Phase 2 Complete When:
- [ ] server.js is under 500 lines
- [ ] Each route file is under 200 lines
- [ ] Each service file is under 300 lines

### Phase 3 Complete When:
- [ ] Full feature parity with current version
- [ ] All tests passing (unit + integration + E2E)
- [ ] Lighthouse score > 90
- [ ] Works on Android via Capacitor

---

## Conclusion

This reconstruction plan transforms a spaghetti codebase into a modern, maintainable application. The key insight is that **you don't have to do it all at once**. Each phase delivers value independently:

- **Phase 0** makes the code safe to touch
- **Phase 1** makes it readable
- **Phase 2** makes the backend maintainable
- **Phase 3** makes it future-proof

Start with Phase 0. The inline style extraction alone will make you feel like you've taken a weight off your shoulders.

---

*This plan was created after a thorough audit of every file in the project. All estimates are based on the actual codebase complexity.*
