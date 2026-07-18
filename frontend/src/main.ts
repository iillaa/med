import './assets/style.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'
import { useAppStore } from './stores/app'
import { useCatsStore } from './stores/cats'
import { useDevMode } from './composables/useDevMode'
import { useBackgroundSync } from './composables/useBackgroundSync'
import { isOfflineApp } from './api/client'
import { getItem, setItem, STORAGE_KEYS } from './utils/storage'

const app = createApp(App)

const pinia = createPinia()
app.use(pinia)
app.use(router)

const appStore = useAppStore(pinia)
const catsStore = useCatsStore(pinia)

// Global admin error handler for compatibility
;(window as any).handleAdminError = async (err: any): Promise<boolean> => {
  return appStore.handleAdminError(err)
}

// Protect all localStorage reads from crashing the app
const origLocalStorageGetItem = Storage.prototype.getItem
Storage.prototype.getItem = function(key) {
  try { return origLocalStorageGetItem.call(this, key) }
  catch (_) { return null }
}

// Protect all localStorage writes from crashing the app on quota limits
const origLocalStorageSetItem = Storage.prototype.setItem
Storage.prototype.setItem = function(key, value) {
  try {
    return origLocalStorageSetItem.call(this, key, value)
  } catch (e: any) {
    if (e && (e.name === 'QuotaExceededError' || e.code === 22)) {
      console.warn('[storage] quota exceeded, evicting sync cache:', key)
      try { this.removeItem('dr_cat_synced_database') } catch (_) {}
      try { return origLocalStorageSetItem.call(this, key, value) } catch (_) {}
      return
    }
    throw e
  }
}

// Global error interceptors
window.addEventListener('error', (event) => {
  appStore.showToast("Une erreur d'exécution est survenue. Détails enregistrés dans l'onglet Diagnostic.", 'fa-triangle-exclamation', 7000)
})

window.addEventListener('unhandledrejection', (event) => {
  appStore.showToast('Erreur réseau ou réponse de base de données non reconnue.', 'fa-circle-exclamation', 5000)
})

// PWA Service Worker — disable in standalone Capacitor offline app to prevent freezes
if ('serviceWorker' in navigator) {
  if (isOfflineApp) {
    navigator.serviceWorker.getRegistrations().then(regs => {
      regs.forEach(reg => reg.unregister())
    })
    caches.keys().then(keys => keys.forEach(k => caches.delete(k)))
    console.log('[Startup] Service worker disabled in Standalone Offline App to prevent freezes.')
  } else {
    const isDev = window.location.hostname === 'localhost' ||
                  window.location.hostname === '127.0.0.1' ||
                  window.location.hostname === '::1'
    if (!isDev) {
      window.addEventListener('load', () => {
        navigator.serviceWorker.register('/service-worker.js')
          .then(reg => console.log('PWA SW registered:', reg.scope))
          .catch(err => console.error('PWA SW failed:', err))
      })
    }
  }
}

// Initialize dev mode (debug console)
useDevMode()

// Initialize background sync
useBackgroundSync()

appStore.initializeApp().then(() => {
  catsStore.initialize().then(() => {
    app.mount('#app')
  }).catch(err => {
    console.error('[main] Failed to initialize cats:', err)
    app.mount('#app')
  })
}).catch(err => {
  console.error('[main] Failed to initialize app:', err)
  app.mount('#app')
})
