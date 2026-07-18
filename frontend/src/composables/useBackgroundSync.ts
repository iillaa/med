/**
 * Background Sync Composable
 * Port of public/js/main.js background sync section to Vue 3 Composition API
 */

import { onMounted, onUnmounted } from 'vue'
import { isOfflineApp, hasRemoteServerConfigured, getConfiguredRemoteUrls, getAppMode, setAppMode, fetchCats, APP_DATA_KEY } from '@/api/client'
import { APP_MODES } from '@/types/cat'
import { useAppStore } from '@/stores/app'
import { useCatsStore } from '@/stores/cats'
import { getItem, setItem } from '@/utils/storage'

let syncIntervalId: ReturnType<typeof setInterval> | null = null
let syncInitialized = false

async function checkRemoteReachable(url: string, timeoutMs = 1500): Promise<boolean> {
  try {
    const controller = new AbortController()
    const timeoutId = setTimeout(() => controller.abort(), timeoutMs)
    const res = await fetch(`${url}/api/search-status`, {
      signal: controller.signal,
      headers: {
        'Content-Type': 'application/json',
        'x-app-key': APP_DATA_KEY
      }
    })
    clearTimeout(timeoutId)
    return res.ok
  } catch {
    return false
  }
}

async function runBackgroundSync(): Promise<void> {
  if (!isOfflineApp || !hasRemoteServerConfigured()) return

  console.log('[Background Sync] Checking for remote updates...')
  try {
    const remoteUrls = getConfiguredRemoteUrls()
    let reachable = false
    for (const url of remoteUrls) {
      if (await checkRemoteReachable(url)) {
        reachable = true
        break
      }
    }

    const wasOffline = getAppMode() === APP_MODES.ANDROID_OFFLINE

    if (reachable) {
      console.log('[Background Sync] Server reachable! Fetching latest data...')

      setAppMode(APP_MODES.ANDROID_ONLINE)
      const appStore = useAppStore()
      if (appStore) {
        appStore.isOnlineAtStartup = true
      }

      const lastSyncTimeStr = getItem<string>('dr_cat_last_sync_time', '')
      const lastSyncTime = lastSyncTimeStr ? parseInt(lastSyncTimeStr) : undefined
      const catsStore = useCatsStore()
      let freshCats: any[] = []
      try {
        freshCats = await catsStore.fetchCatsFromApi(lastSyncTime)
      } catch {
        console.warn('[Background Sync] fetchCats failed')
        return
      }

      // Check for deletions
      let hasDeletions = false
      let activeIdsSet: Set<number> | null = null
      const customCats = JSON.parse(getItem<string>('dr_cat_custom_created_cats', '[]'))
      const customCatIds = new Set(customCats.map((c: any) => c.id))

      if (freshCats && (freshCats as any).activeIds) {
        activeIdsSet = new Set((freshCats as any).activeIds.split(',').map((id: string) => parseInt(id)))
        const localServerCats = (catsStore.cats || []).filter((c: any) => !customCatIds.has(c.id) && !c.isOffline)
        for (const local of localServerCats) {
          if (!activeIdsSet.has(local.id)) {
            hasDeletions = true
            break
          }
        }
      }

      if (freshCats.length === 0 && !hasDeletions) {
        console.log('[Background Sync] Remote database is in sync. No action needed.')
        setItem('dr_cat_last_sync_time', Date.now().toString())
        if (wasOffline) {
          appStore?.showToast('📡 Connexion serveur établie. Données synchronisées !', 'fa-cloud-arrow-up', 4000)
        }
        return
      }

      // Check if incremental or full list
      const localServerCats = (catsStore.cats || []).filter((c: any) => !customCatIds.has(c.id) && !c.isOffline)
      const isIncremental = freshCats.length < (localServerCats.length * 0.7)

      let isUpdated = hasDeletions
      if (!isUpdated) {
        if (isIncremental) {
          for (const remote of freshCats) {
            const local = localServerCats.find((c: any) => c.id === remote.id)
            if (!local || local.title !== remote.title || local.summary !== remote.summary || local.ordonnance !== remote.ordonnance) {
              isUpdated = true
              break
            }
          }
        } else {
          isUpdated = localServerCats.length !== freshCats.length
          if (!isUpdated) {
            for (const remote of freshCats) {
              const local = localServerCats.find((c: any) => c.id === remote.id)
              if (!local || local.title !== remote.title || local.summary !== remote.summary || local.ordonnance !== remote.ordonnance) {
                isUpdated = true
                break
              }
            }
          }
        }
      }

      if (isUpdated) {
        console.log('[Background Sync] Server changes detected! Offering update...')
        appStore?.showToast(
          'Nouvelles fiches ou modifications disponibles — <span id="update-app-toast-btn" style="color:#06b6d4; font-weight:700; text-decoration:underline; cursor:pointer;">Actualiser ?</span>',
          'fa-arrows-rotate',
          15000
        )

        setTimeout(() => {
          const updateBtn = document.getElementById('update-app-toast-btn')
          if (updateBtn) {
            updateBtn.addEventListener('click', (event) => {
              event.preventDefault()
              applySyncUpdates(freshCats, isIncremental, activeIdsSet, catsStore)
              const toast = document.getElementById('drcat-toast')
              if (toast) toast.remove()
              appStore?.showToast('Mise à jour appliquée avec succès !', 'fa-circle-check', 3000)
            })
          }
        }, 150)
      } else {
        console.log('[Background Sync] Remote database is in sync. No action needed.')
        setItem('dr_cat_last_sync_time', Date.now().toString())
      }

      if (wasOffline) {
        appStore?.showToast('📡 Connexion serveur établie. Données synchronisées !', 'fa-cloud-arrow-up', 4000)
      }
    } else {
      console.log('[Background Sync] Server not reachable, staying offline.')
      setAppMode(APP_MODES.ANDROID_OFFLINE)
      const appStore = useAppStore()
      if (appStore) {
        appStore.isOnlineAtStartup = false
      }
    }
  } catch (err) {
    console.warn('[Background Sync] Failed:', err)
  }
}

function applySyncUpdates(freshCats: any[], isIncremental: boolean, activeIdsSet: Set<number> | null, catsStore: ReturnType<typeof useCatsStore>) {
  const localProgress = JSON.parse(getItem<string>('dr_cat_user_progress', '{}'))
  const localOverrides = JSON.parse(getItem<string>('dr_cat_local_overrides', '{}'))

  if (isIncremental) {
    freshCats.forEach((remote: any) => {
      const idx = catsStore.cats.findIndex((c: any) => c.id === remote.id)
      const localEntry = localProgress[remote.id] || {}
      const overrides = localOverrides[remote.id] || {}
      const merged = {
        ...remote,
        status: localEntry.status || 'todo',
        notes: localEntry.notes || '',
        summary: overrides.customSummary || remote.summary,
        customSummary: overrides.customSummary || remote.summary,
        ordonnance: overrides.customOrdonnance || remote.ordonnance,
        customOrdonnance: overrides.customOrdonnance || remote.ordonnance
      }
      if (idx !== -1) {
        catsStore.cats[idx] = merged
      } else {
        catsStore.cats.push(merged)
      }
    })

    if (activeIdsSet) {
      const customCats = JSON.parse(getItem<string>('dr_cat_custom_created_cats', '[]'))
      const customCatIds = new Set(customCats.map((c: any) => c.id))
      catsStore.cats = catsStore.cats.filter((c: any) => {
        if (customCatIds.has(c.id)) return true
        return activeIdsSet.has(c.id)
      })
    }
  } else {
    const existingIds = new Set(freshCats.map((c: any) => c.id))
    const customCats = JSON.parse(getItem<string>('dr_cat_custom_created_cats', '[]'))
      .filter((c: any) => !existingIds.has(c.id))
      .map((c: any) => ({ ...c, isOffline: true }))

    const merged = freshCats.map((remote: any) => {
      const localEntry = localProgress[remote.id] || {}
      const overrides = localOverrides[remote.id] || {}
      return {
        ...remote,
        status: localEntry.status || 'todo',
        notes: localEntry.notes || '',
        summary: overrides.customSummary || remote.summary,
        customSummary: overrides.customSummary || remote.summary,
        ordonnance: overrides.customOrdonnance || remote.ordonnance,
        customOrdonnance: overrides.customOrdonnance || remote.ordonnance
      }
    })

    catsStore.cats = [...merged, ...customCats]
  }

  setItem('dr_cat_last_sync_time', Date.now().toString())
  catsStore.refreshSidebar()
  catsStore.refreshDashboard()
}

export function useBackgroundSync() {
  onMounted(() => {
    if (syncInitialized) return
    syncInitialized = true

    setTimeout(() => {
      runBackgroundSync()
      syncIntervalId = setInterval(runBackgroundSync, 30000)
    }, 1000)
  })

  onUnmounted(() => {
    if (syncIntervalId) {
      clearInterval(syncIntervalId)
      syncIntervalId = null
    }
  })
}
