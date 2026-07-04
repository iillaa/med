const CACHE_NAME = 'dr-cat-v4';
const ASSETS_TO_CACHE = [
  '/',
  '/index.html',
  '/style.css',
  '/drcat_logo.png',
  '/css/dashboard.css',
  '/css/sidebar.css',
  '/css/workspace.css',
  '/css/modal.css',
  '/css/variables.css'
];

// Install Service Worker and Cache App Shell Assets
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(ASSETS_TO_CACHE);
    }).then(() => self.skipWaiting())
  );
});

// Activate Service Worker and clear old caches
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cache) => {
          if (cache !== CACHE_NAME) {
            return caches.delete(cache);
          }
        })
      );
    }).then(() => self.clients.claim())
  );
});

// Intercept requests
self.addEventListener('fetch', (event) => {
  const url = new URL(event.request.url);

  // Always bypass cache for JS files and API calls
  if (url.pathname.startsWith('/api/') || url.pathname.match(/\.js(\?.*)?$/)) {
    event.respondWith(fetch(event.request));
    return;
  }

  // Network-First strategy for static assets only
  event.respondWith(
    fetch(event.request)
      .then((response) => {
        if (response.status === 200 && !url.pathname.includes('/pdf/')) {
          const responseClone = response.clone();
          caches.open(CACHE_NAME).then((cache) => {
            cache.put(event.request, responseClone);
          });
        }
        return response;
      })
      .catch(() => {
        return caches.match(event.request).then((cachedResponse) => {
          if (cachedResponse) {
            return cachedResponse;
          }
        });
      })
  );
});

// Activate Service Worker and clear old caches
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cache) => {
          if (cache !== CACHE_NAME) {
            return caches.delete(cache);
          }
        })
      );
    }).then(() => self.clients.claim())
  );
});

// Intercept requests and serve from network first, falling back to cache if offline
self.addEventListener('fetch', (event) => {
  const url = new URL(event.request.url);

  // Bypass cache for API server calls so suggestion/admin processes query Node.js directly
  if (url.pathname.startsWith('/api/')) {
    event.respondWith(fetch(event.request));
    return;
  }

  // Network-First strategy for static UI assets
  event.respondWith(
    fetch(event.request)
      .then((response) => {
        // Never cache JS files — they must always be fresh to pick up bug fixes and timeout changes
        if (response.status === 200 && !url.pathname.includes('/pdf/') && !url.pathname.match(/\.js(\?.*)?$/)) {
          const responseClone = response.clone();
          caches.open(CACHE_NAME).then((cache) => {
            cache.put(event.request, responseClone);
          });
        }
        return response;
      })
      .catch(() => {
        // Network failed (offline), try cache
        return caches.match(event.request).then((cachedResponse) => {
          if (cachedResponse) {
            return cachedResponse;
          }
          // Optional: Return a fallback offline page here if neither network nor cache has the resource
        });
      })
  );
});
