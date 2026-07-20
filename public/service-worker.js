/**
 * Dr.CAT Service Worker — upgraded for Phase 6.1.
 *
 * Caching tiers:
 *  - Navigation (HTML):   network-first w/ stale-while-revalidate fallback to
 *                         cached '/' so the app shell opens offline.
 *  - Hashed/immutable static (dist/*.js, *.woff2, *.webp, css/*.css, fonts,
 *    fa/): cache-first (content-hashed => safe to cache forever; enables
 *    instant + offline loads).
 *  - App data (data/cats_db.json, data/pdf_index.json): stale-while-revalidate
 *    — paint from cache instantly, refresh in background.
 *  - PDFs (/pdf/*.pdf, /data/pdf_list.json): cache-first (large, rarely change).
 *  - API (/api/*): never cached — always hits the Node server directly.
 *  - Unsafe/offline-bundled standalone mode: registration is disabled in
 *    main.js for the offline Android build, so this SW only runs in PWA/online.
 */
const CACHE = 'dr-cat-v6';
const DATA_CACHE = 'dr-cat-data-v6';

// App-shell assets to precache on install (always-present, non-hashed files).
// Hashed dist/ bundles are cached at runtime (cache-first) on first fetch.
const SHELL = [
  '/',
  '/index.html',
  '/drcat_logo.webp',
  '/drcat_logo.png', // fallback for old WebViews without <picture> support
  '/favicon.png',
  '/icon-192.png',
  '/icon-512.png',
  '/css/fonts.css',
  '/fonts/outfit-latin.woff2',
  '/css/fa/all.min.css',
  '/css/fa/webfonts/fa-solid-900.woff2',
  '/css/fa/webfonts/fa-regular-400.woff2',
  '/css/fa/webfonts/fa-brands-400.woff2',
  '/css/fa/webfonts/fa-v4compatibility.woff2'
];

const isHashedStatic = (pathname) =>
  /^\/dist\//.test(pathname) ||                          // esbuild hashed bundles
  /\.(?:woff2?|webp|png|css|svg|jpg|jpeg|gif|ico)$/i.test(pathname);

const isData = (pathname) =>
  /^\/data\/(?:cats_db|pdf_index|pdf_list)\.json$/.test(pathname);

const isPdf = (pathname) =>
  /^\/pdf\//.test(pathname) || pathname.endsWith('.pdf');

const isApi = (pathname) => pathname.startsWith('/api/');

// ── Install: precache the shell ──
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE)
      .then((cache) => cache.addAll(SHELL))
      .then(() => self.skipWaiting())
      .catch(() => self.skipWaiting()) // don't fail install if one asset 404s
  );
});

// ── Activate: drop old caches ──
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((names) =>
      Promise.all(
        names
          .filter((n) => n !== CACHE && n !== DATA_CACHE)
          .map((n) => caches.delete(n))
      )
    ).then(() => self.clients.claim())
  );
});

// ── Cache helpers ──
async function cacheFirst(request, cacheName) {
  const cached = await caches.match(request);
  if (cached) return cached;
  const res = await fetch(request);
  if (res && res.status === 200) {
    const copy = res.clone();
    caches.open(cacheName).then((c) => c.put(request, copy));
  }
  return res;
}

async function networkFirst(request, cacheName) {
  try {
    const res = await fetch(request);
    if (res && res.status === 200) {
      const copy = res.clone();
      caches.open(cacheName).then((c) => c.put(request, copy));
    }
    return res;
  } catch (_) {
    const cached = await caches.match(request);
    if (cached) return cached;
    // For navigations, fall back to the cached app shell.
    if (request.mode === 'navigate') {
      const shell = await caches.match('/index.html');
      if (shell) return shell;
    }
    return new Response('', { status: 504, statusText: 'offline' });
  }
}

// Stale-while-revalidate: return cache immediately, refresh in background.
async function staleWhileRevalidate(request, cacheName) {
  const cached = await caches.match(request);
  const network = fetch(request)
    .then((res) => {
      if (res && res.status === 200) {
        const copy = res.clone();
        caches.open(cacheName).then((c) => c.put(request, copy));
      }
      return res;
    })
    .catch(() => cached);
  return cached || network;
}

// ── Fetch routing ──
self.addEventListener('fetch', (event) => {
  const { request } = event;
  if (request.method !== 'GET') return;

  const url = new URL(request.url);
  if (url.origin !== self.location.origin) return; // only handle same-origin

  const { pathname } = url;

  // API: never cache — always hit the server.
  if (isApi(pathname)) return;

  // PDFs: cache-first (large, immutable-ish).
  if (isPdf(pathname)) {
    event.respondWith(cacheFirst(request, CACHE));
    return;
  }

  // App data: stale-while-revalidate.
  if (isData(pathname)) {
    event.respondWith(staleWhileRevalidate(request, DATA_CACHE));
    return;
  }

  // Hashed/immutable static: cache-first.
  if (isHashedStatic(pathname)) {
    event.respondWith(cacheFirst(request, CACHE));
    return;
  }

  // Navigations: network-first with offline app-shell fallback.
  if (request.mode === 'navigate') {
    event.respondWith(networkFirst(request, CACHE));
    return;
  }

  // Everything else: network-first.
  event.respondWith(networkFirst(request, CACHE));
});
