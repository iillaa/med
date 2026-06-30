# Performance Monitoring System — Product Specification

**Feature**: Performance Monitoring & Profiling Panel (Phase 4, Priority P0)  
**Audience**: AI coding agent + human developer  
**Goal**: Measure, display, and export performance metrics to identify and fix jank, slow renders, and Capacitor WebView bottlenecks — for both the website (Termux browser) and the Android APK.

---

## 1. Product Mission

The user has polished the UI and features of Dr. CAT, but on Android (Capacitor WebView) the app feels "not smooth". The root cause is unknown — it could be scroll jank, slow component renders, WebView bridge latency, or heavy synchronous operations blocking the main thread.

This feature exists to **measure what is actually slow** so fixes can be targeted, not guessed. It must:
1. Capture real-time frame rate and jank during scroll/interaction
2. Time every major component render (sidebar, workspace, dashboard, quiz)
3. Track API round-trip latency per endpoint
4. Measure interaction latency (tap → paint) to catch WebView bridge overhead
5. Monitor memory growth to find leaks in long sessions
6. Capture server-side timing (endpoint response times, PDF parse duration, write queue depth)
7. Allow exporting a complete performance report (JSON) to paste into a chat with an AI agent for analysis

---

## 2. User Story

> As an admin user,  
> I want to open a Performance Panel from the dashboard,  
> So that I can see exactly which parts of the app are slow, copy a performance report, and fix the bottlenecks to make the Android app feel polished and smooth.

**Acceptance Criteria**:
- The panel is only visible to admin users
- The panel shows FPS, frame drops, component render times, API latency, interaction latency, memory usage, and server metrics
- Metrics update in real-time (or on refresh) without requiring a page reload
- The user can export a full report as JSON for AI analysis
- The monitoring overhead itself is negligible (<1ms per frame, <1% CPU)
- Works identically in browser (localhost) and Capacitor WebView (APK)

---

## 3. What to Measure (and Why)

### 3.1 Client-Side: UI / Interaction Metrics

| Metric | How to Capture | Why It Matters |
|--------|---------------|---------------|
| **Frame rate (FPS)** | `requestAnimationFrame` loop measuring delta between frames | Direct measure of scroll and animation smoothness. Capacitor WebView often drops frames during list scroll or tab transitions. |
| **Frame drops (jank)** | Count frames where delta > 16.6ms (one frame budget). Major drops if delta > 50ms. | Shows how often the UI feels "stuttery". A 3% drop rate is noticeable to users. |
| **Component render time** | `performance.now()` before/after render functions | Identifies which component is the bottleneck. Rendering 55 CAT cards vs loading a PDF fiche have very different costs. |
| **API round-trip time** | Timestamp on `fetch()` call start and end | Shows network + server latency per endpoint. Key for comparing localhost vs ngrok vs cloud latency. |
| **Interaction latency** | Tap/click timestamp → first paint after handler | Measures perceived responsiveness. Critical for mobile where users expect <100ms feedback. Capacitor bridge adds overhead here. |
| **Initial load time** | `DOMContentLoaded` → time when sidebar + dashboard are fully interactive | First impression metric. Should be <2s on mobile. |
| **PDF search duration** | Start/stop around `searchPdfsContent()` | Full-text search is in-memory but JSON traversal + DOM rendering can be slow across 78 PDFs. |
| **LocalStorage I/O time** | `performance.now()` around `getItem`/`setItem` | `localStorage` is synchronous and blocks the main thread. Large writes cause noticeable jank. |
| **Memory snapshot** | `performance.memory?.usedJSHeapSize` (Chromium only) | Tracks memory growth. Useful for Capacitor where leaks accumulate across sessions if event listeners or components are not cleaned up. |

### 3.2 Server-Side: Backend Metrics

| Metric | How to Capture | Why It Matters |
|--------|---------------|---------------|
| **Endpoint response time** | Express middleware: `Date.now()` on request, log on `res.finish` | Shows which API calls are slow. PDF search, DB writes, and reindex are the likely culprits. |
| **PDF parse duration per file** | `index_pdfs.js`: time around `parser.getText()` | 78 PDFs can take minutes on first index. Per-file timing identifies the worst offenders. |
| **Atomic write duration** | `safeWriteJsonAsync()`: time `.tmp` write + `rename()` | Disk I/O on Android/Termux can be slow. Writes >500ms block concurrent requests. |
| **Concurrent request queue depth** | Track `dbLock.promise` chain length | If the lock queue grows, you have more concurrent writes than serialization can handle. |
| **Cache hit rate** | Track how often `indexPdfs` skips a file vs re-parses it | After initial index, this should be ~100%. If not, something is touching the PDF files on disk unexpectedly. |

---

## 4. Architecture

### 4.1 Client-Side: Performance Monitor Module

New file: `public/js/performance.js` (ES module)

```javascript
// Public API
export const perf = {
  startMeasure(name),
  endMeasure(name),
  getMetrics(),
  getJankRate(),
  getFrameDrops(),
  reset(),
  onFrameDrop(callback),
  offFrameDrop(callback)
};
```

**Internal design:**
- Uses a `Map<string, {start, end, duration}>` for named measurements
- Frame monitoring: `requestAnimationFrame` loop that runs **only when tab is visible** (`document.visibilityState === 'visible'`)
- Jank counter: increments when `now() - lastFrameTime > 20` (more than one frame budget of 16.6ms missed)
- Memory snapshots: read `performance.memory` if available, store every 30s

### 4.2 Server-Side: Timing Middleware

New middleware in `server.js` for `/api/*` routes:

```javascript
app.use('/api', timingMiddleware);
```

```javascript
function timingMiddleware(req, res, next) {
  const start = Date.now();
  res.on('finish', () => {
    const duration = Date.now() - start;
    perfServer.record(req.path, req.method, duration, res.statusCode);
  });
  next();
}
```

Store results in a ring buffer (last 200 requests) so memory doesn't grow unbounded.

### 4.3 New Backend Endpoint

| Method | Path | Returns |
|--------|------|---------|
| `GET` | `/api/performance/server-metrics` | Server-side timing histogram (min/avg/max/p95 per endpoint) + memory + queue depth + cache hit rate |

Example response:
```json
{
  "uptimeSeconds": 3600,
  "memoryUsage": { "rss": 45000000, "heapUsed": 12000000 },
  "endpoints": {
    "GET /api/cats": { "count": 152, "minMs": 2, "avgMs": 4.3, "maxMs": 180, "p95Ms": 12, "errors": 0 },
    "GET /api/search-pdfs": { "count": 47, "minMs": 45, "avgMs": 210, "maxMs": 1500, "p95Ms": 800, "errors": 1 }
  },
  "pdfParse": { "totalFiles": 78, "avgParseMs": 340, "slowest": "Cardiologie.pdf: 2100ms" },
  "writeDurations": { "avgMs": 12, "maxMs": 45 },
  "lockQueueDepth": 0,
  "cacheHitRate": 0.98
}
```

---

## 5. Client Metrics Implementation Detail

### 5.1 Frame Drop Detector

```javascript
let lastFrameTime = 0;
let frameDrops = 0;
let majorDrops = 0;
let frameCount = 0;

function frameLoop() {
  const now = performance.now();
  if (lastFrameTime > 0) {
    const delta = now - lastFrameTime;
    frameCount++;
    if (delta > 20) frameDrops++;       // missed >1 frame budget
    if (delta > 50) majorDrops++;      // missed >3 frame budgets
  }
  lastFrameTime = now;
  if (document.visibilityState === 'visible') {
    requestAnimationFrame(frameLoop);
  }
}
```

Start the loop when the performance panel opens (or on app init if monitoring always-on in dev). Stop when tab is hidden to save battery.

### 5.2 API Timing Wrapper

In `api.js`, wrap `fetch()` at the module level:

```javascript
const originalFetch = window.fetch;
window.fetch = async (...args) => {
  const start = performance.now();
  const res = await originalFetch(...args);
  const duration = performance.now() - start;
  perf.recordApiCall(args[0], res.status, duration);
  return res;
};
```

Record: URL (as string), method, status code, duration ms. Classify as "slow" if >3000ms.

**Important**: The wrapper must not alter existing `fetch()` behavior. It should be transparent.

### 5.3 Component Render Marks

Instrument the 4 main render functions by timing from entry to DOM insertion:

| Component | File | Function to time |
|-----------|------|-----------------|
| Sidebar CAT list | `sidebar.js` | `renderCatList()` — start to `appendChild` complete |
| Workspace fiche | `workspace.js` | `selectCat()` → fully rendered (after all tabs populated) |
| Dashboard | `dashboard.js` | `renderDashboard()` |
| Quiz question | `quiz.js` | `renderQuestion()` |

Use `performance.mark()` / `performance.measure()` where available, fallback to `performance.now()` delta.

### 5.4 Interaction Latency

```javascript
document.addEventListener('pointerdown', (e) => {
  const target = e.target.closest('button, .cat-item, .tab-btn, .action-btn');
  if (!target) return;
  const start = performance.now();
  requestAnimationFrame(() => {
    perf.recordInteraction(
      target.tagName + '.' + target.className,
      performance.now() - start
    );
  });
});
```

Ignore scroll and drag events. Only measure tappable elements.

### 5.5 Initial Load Timeline

Record these milestones:
```javascript
const marks = {
  domContentLoaded: performance.now() - timeOrigin,
  catsFetched: null,      // timestamp when fetchCats() resolves
  sidebarRendered: null,  // after renderCatList completes
  dashboardReady: null    // after renderDashboard + event listeners
};
```

### 5.6 PDF Search + DB Write Timing

- PDF search: wrap `searchPdfsContent()` call. The actual search is in-memory (fast) but DOM rendering of results can be slow. Time the full `fetch → render results` cycle.
- DB write: instrument `safeWriteJsonAsync()` in `server.js` to time each phase (backup copy, temp write, rename). Client-side can also time the `fetch()` that triggers it.

---

## 6. Server Metrics Implementation Detail

### 6.1 Endpoint Histogram

For each endpoint path, maintain:
```javascript
{
  "/api/cats": {
    count: 152,
    minMs: 2,
    avgMs: 4.3,
    maxMs: 180,
    p95Ms: 12,
    lastStatus: 200,
    errors: 3
  }
}
```

Calculate p95 by sorting a ring buffer of the last 100 samples for that endpoint. If fewer than 100 samples, use whatever is available.

### 6.2 PDF Parse Timing

In `index_pdfs.js`, wrap `parser.getText()`:
```javascript
const parseStart = Date.now();
const dataBuffer = await fs.promises.readFile(filePath);
const parser = new PDFParse({ data: dataBuffer });
const res = await parser.getText();
const parseDuration = Date.now() - parseStart;
perfServer.recordPdfParse(file, parseDuration, res.pages.length);
```

Track: filename, file size, parse duration ms, page count.

### 6.3 Write Duration

In `safeWriteJsonAsync()`, time each phase:
1. `copyFile` (backup) duration
2. `writeFile` (temp) duration  
3. `rename` duration

Record separately. If any exceeds 500ms on Termux/Android, flag it.

### 6.4 Memory Snapshot

Every 60 seconds or on each API request (dev mode only), record:
```javascript
{
  timestamp: ISO string,
  rss: process.memoryUsage().rss,
  heapTotal: ...,
  heapUsed: ...,
  external: ...,
  arrayBuffers: ...
}
```

Store last 20 snapshots in a ring buffer.

---

## 7. UI: Performance Panel

Admin-only panel in the dashboard. Toggle to expand/collapse.

### 7.1 Panel Sections

```
┌─ Performance ─────────────────────────────────────────┐
│                                                        │
│  ┌─ Frame Rate ─────────────────────────────────────┐ │
│  │ Current FPS: 58  Drops: 12 (3%)  Major: 2       │ │
│  │ [🎯 Show frame graph (optional)]                 │ │
│  └─────────────────────────────────────────────────┘ │
│                                                        │
│  ┌─ Component Render Times ────────────────────────┐ │
│  │ Sidebar list     : 45ms   (target: <50ms)       │ │
│  │ Workspace fiche  : 120ms  (target: <100ms) ⚠️  │ │
│  │ Dashboard        : 80ms   (target: <100ms)      │ │
│  │ Quiz question    : 35ms   (target: <50ms)       │ │
│  └─────────────────────────────────────────────────┘ │
│                                                        │
│  ┌─ API Latency ──────────────────────────────────┐  │
│  │ GET /api/cats         avg: 4ms   max: 12ms     │ │
│  │ GET /api/search-pdfs  avg: 210ms max: 1.5s ⚠️  │ │
│  │ POST /api/suggestions avg: 15ms  max: 45ms     │ │
│  │ [📋 Copier les métriques]                       │ │
│  └─────────────────────────────────────────────────┘ │
│                                                        │
│  ┌─ Interaction Latency ──────────────────────────┐  │
│  │ Button taps: avg 45ms, max 120ms                │ │
│  │ Cat item taps: avg 38ms, max 95ms               │ │
│  │ Tab switches: avg 25ms, max 60ms                │ │
│  └─────────────────────────────────────────────────┘ │
│                                                        │
│  ┌─ Memory ───────────────────────────────────────┐  │
│  │ JS Heap: 12.4 MB / 50 MB (25%)                 │ │
│  │ Trend: 📈 +0.8 MB since last snapshot          │ │
│  └─────────────────────────────────────────────────┘ │
│                                                        │
│  ┌─ Server ───────────────────────────────────────┐  │
│  │ Uptime: 2h 14m  Total req: 1,247               │ │
│  │ Slowest: /api/search-pdfs (avg 210ms) ⚠️       │ │
│  │ Write queue: 0 pending                          │ │
│  │ PDF parse avg: 340ms  Cache hit rate: 98%       │ │
│  │ [📥 Exporter le rapport complet]                │ │
│  └─────────────────────────────────────────────────┘ │
│                                                        │
└────────────────────────────────────────────────────────┘
```

### 7.2 Warning Indicators

Use visual indicators for metrics that exceed thresholds:

| Severity | Condition | Visual |
|----------|-----------|--------|
| ✅ Good | Within target | Green text, no badge |
| ⚠️ Warning | 1.5x–3x target | Yellow/orange text, small `⚠️` badge |
| 🔴 Bad | >3x target | Red text, `🔴` badge |

Example: `Workspace fiche: 120ms (target: <100ms) ⚠️`

### 7.3 Export Feature

"Exporter le rapport" button generates a downloadable JSON file containing:
- Client metrics (FPS, render times, API timings, interactions, memory snapshots)
- Server metrics (fetched from `/api/performance/server-metrics`)
- Last N console logs (for correlation with errors)
- Timestamp, app version (from `package.json`), user agent

The JSON filename: `drcat-performance-YYYY-MM-DD-HHmmss.json`

---

## 8. Thresholds (What to Flag)

| Metric | Good (target) | Warning (>1.5x) | Bad (>3x) |
|--------|---------------|-----------------|-----------|
| FPS during scroll | 55-60 | 40-55 | <40 |
| Component render | <50ms | 50-150ms | >150ms |
| API round-trip (localhost) | <50ms | 50-200ms | >200ms |
| API round-trip (ngrok) | <500ms | 500-1500ms | >1500ms |
| Interaction latency | <80ms | 80-200ms | >200ms |
| PDF search | <500ms | 500-2000ms | >2000ms |
| DB write (server) | <100ms | 100-500ms | >500ms |
| Memory growth (per hour) | <5 MB | 5-20 MB | >20 MB |

Thresholds are constants at the top of `performance.js` so they are easy to tune.

---

## 9. Files to Create / Modify

| File | Action | Purpose |
|------|--------|---------|
| `public/js/performance.js` | **CREATE** | Core client-side performance monitor (frame drops, timing, memory) |
| `public/js/api.js` | **MODIFY** | Wrap `fetch()` with timing; add `fetchServerMetrics()` |
| `public/js/utils.js` | **MODIFY** | Add `formatDuration()`, `formatPercent()` formatting helpers |
| `public/js/main.js` | **MODIFY** | Initialize perf monitor, start frame loop |
| `server.js` | **MODIFY** | Add timing middleware, `/api/performance/server-metrics` endpoint |
| `public/index.html` | **MODIFY** | Add performance panel markup (admin-only) |
| `public/js/components/dashboard.js` OR `public/js/components/performance.js` | **CREATE/MODIFY** | Render panel, handle exports, wire up refresh |

---

## 10. Integration Points with Existing Code

| Existing File | What to hook into |
|---------------|-------------------|
| `public/js/main.js` | Import `performance.js`, call `perf.startFrameMonitor()` on init, call `perf.stopFrameMonitor()` on page hide |
| `public/js/api.js` | Add `fetch` wrapper at module top. Add `fetchServerMetrics()` export. Do NOT modify existing `checkRealConnection()` — it is used by app startup |
| `public/js/utils.js` | Add `formatDuration(ms)` (`"120ms"`, `"1.5s"`) and `formatPercent(float)` (`"12%"`, `"99.9%"`) |
| `public/js/state.js` | Optional: add `perfMetrics` sub-object if the agent wants centralized state for testing |
| `public/js/components/sidebar.js` | Call `perf.startMeasure('sidebar.renderCatList')` / `perf.endMeasure('sidebar.renderCatList')` around render |
| `public/js/components/workspace.js` | Same pattern around `selectCat()` |
| `public/js/components/dashboard.js` | Same pattern around `renderDashboard()` |
| `public/js/components/quiz.js` | Same pattern around `renderQuestion()` |
| `server.js` | Add `timingMiddleware` for `/api/*`. Add endpoint. Track `indexState` timings. Record `safeWriteJsonAsync` phase durations. |

---

## 11. Implementation Order

| Step | Priority | Description |
|------|----------|-------------|
| 1 | P0 | `performance.js` core: frame drop detector + named measures + memory snapshots |
| 2 | P0 | API timing wrapper in `api.js` + server timing middleware + `/api/performance/server-metrics` |
| 3 | P0 | Instrument 4 components with render timing (sidebar, workspace, dashboard, quiz) |
| 4 | P1 | Interaction latency tracker (pointerdown → paint) |
| 5 | P1 | PDF search + DB write timing |
| 6 | P1 | HTML performance panel + render logic |
| 7 | P1 | Export to JSON |
| 8 | P2 | Optional: simple visual frame graph (no external lib — just a CSS bar chart of last 60 FPS samples) |

---

## 12. Constraints & Guardrails

- **No external dependencies**: Do not add npm packages. Use native `performance.now()`, `requestAnimationFrame`, `performance.memory`, Express middleware only.
- **Zero impact when panel is closed**: Frame monitoring overhead must be <1ms per frame. Memory snapshots every 30s when open, never when closed.
- **No disk writes from client**: Client metrics live in memory. Export is triggered by user action only.
- **Do not break existing fetch behavior**: The `fetch` wrapper must be transparent. If it throws or alters responses, the app breaks.
- **Admin-only**: Same gating as diagnostics panel. Non-admin users never see it.
- **Language**: French for UI, English for code comments (consistent with existing codebase).

---

## 13. How This Helps Polish the Android App

Capacitor WebView introduces specific performance problems this system will expose:

1. **WebView bridge latency**: Every Capacitor plugin call crosses JS→native. Interaction latency tracker will show if taps feel sluggish.
2. **Scroll jank**: Frame drop detector reveals exactly when scrolling the CAT list drops frames. You'll see if sidebar render is too heavy.
3. **Cold start time**: Initial load timeline shows if WebView is slow to become interactive. >3s means the index page or initial fetches need pruning.
4. **Memory leaks**: Memory growth metric over 10+ minutes of use will leak if components don't clean up event listeners. Current code cleans up in most places — this verifies it.
5. **Offline vs online perf**: Comparing API round-trip times via ngrok vs localhost tells you if the tunnel itself is the bottleneck (ngrok adds 50-150ms RTT minimum).

---

## 14. What NOT to Do

- Do not add new npm packages (no `web-vitals`, no `stats.js`, no profiler libs). Native APIs only.
- Do not log metrics to disk continuously. In-memory only, exported on demand.
- Do not sample. Capture everything — data volumes are small (a few KB per session).
- Do not add A/B testing or experiment framework. This is measurement, not experimentation.
- Do not auto-trigger alerts. The panel is manual — user opens it, reads it, decides what to fix.
- Do not replace or modify the existing Diagnostics Panel. These are separate admin tools.

---

## 15. Success Criteria

When this feature is complete, the user should be able to:

1. Open the Performance Panel as admin on Android (Capacitor) and see FPS, render times, and API latency
2. See warning indicators (⚠️/🔴) on any metric that exceeds the threshold
3. Scroll the app with the panel open and watch frame drops appear in real-time
4. Click a button to export a complete JSON report with all metrics + server data
5. Paste the exported JSON into a chat with an AI agent and get actionable bottleneck identification
6. Compare metrics between localhost (Termux browser) and ngrok (mobile browser) to isolate network vs UI issues
7. Verify that the monitoring overhead is negligible by checking that FPS stays at 60 even with the panel open

If all 7 are true, the feature is done.
