<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useAppStore } from '@/stores/app'
import {
  fetchSuggestions,
  approveSuggestionOnServer,
  rejectSuggestionOnServer
} from '@/api/client'

const appStore = useAppStore()
const activeTab = ref<'suggestions' | 'diagnostics'>('suggestions')
const suggestions = ref<any[]>([])
const loadingSuggestions = ref(false)
const diagnostics = ref<any>(null)
const loadingDiagnostics = ref(false)

const diagTitleMap: Record<string, string> = {
  system: 'Système',
  dbStats: 'Base de données',
  indexDetail: 'Index PDF',
  remoteUrl: 'URL distante',
  tunnelInfo: 'Tunnel',
  metrics: 'Performance',
  rateLimits: 'Rate Limits'
}

function formatDiagTitle(key: string | number): string {
  return diagTitleMap[String(key)] || String(key)
}

function isDiagObject(value: unknown): boolean {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function flattenObject(obj: Record<string, unknown>, prefix = ''): Record<string, string> {
  const result: Record<string, string> = {}
  for (const [key, val] of Object.entries(obj)) {
    const fullKey = prefix ? `${prefix}.${key}` : key
    if (isDiagObject(val as unknown)) {
      Object.assign(result, flattenObject(val as Record<string, unknown>, fullKey))
    } else if (Array.isArray(val)) {
      result[fullKey] = JSON.stringify(val)
    } else {
      result[fullKey] = String(val ?? '')
    }
  }
  return result
}

async function loadSuggestions(): Promise<void> {
  loadingSuggestions.value = true
  try {
    suggestions.value = await fetchSuggestions()
  } catch (err) {
    console.error('[Admin] fetchSuggestions failed:', err)
  } finally {
    loadingSuggestions.value = false
  }
}

async function loadDiagnostics(): Promise<void> {
  loadingDiagnostics.value = true
  try {
    const [system, dbStats, indexDetail, remoteUrl, tunnelInfo, metrics, rateLimits] = await Promise.all([
      appStore.loadDiagnosticsSystem(),
      appStore.loadDiagnosticsDbStats(),
      appStore.loadDiagnosticsIndexDetail(),
      appStore.loadDiagnosticsRemoteUrl(),
      appStore.loadTunnelInfo(),
      appStore.loadServerMetrics(),
      appStore.loadRateLimits()
    ])
    diagnostics.value = {
      system: appStore.diagnosticsSystem,
      dbStats: appStore.diagnosticsDbStats,
      indexDetail: appStore.diagnosticsIndexDetail,
      remoteUrl: appStore.diagnosticsRemoteUrl,
      tunnelInfo: appStore.tunnelInfo,
      metrics: appStore.serverMetrics,
      rateLimits: appStore.rateLimits
    }
  } catch (err) {
    console.error('[Admin] loadDiagnostics failed:', err)
  } finally {
    loadingDiagnostics.value = false
  }
}

async function approveSuggestion(id: string): Promise<void> {
  try {
    await approveSuggestionOnServer(id)
    suggestions.value = suggestions.value.filter(s => s.id !== id)
  } catch (err) {
    console.error('[Admin] approveSuggestion failed:', err)
  }
}

async function rejectSuggestion(id: string): Promise<void> {
  try {
    await rejectSuggestionOnServer(id)
    suggestions.value = suggestions.value.filter(s => s.id !== id)
  } catch (err) {
    console.error('[Admin] rejectSuggestion failed:', err)
  }
}

onMounted(() => {
  if (appStore.isAdmin) {
    loadSuggestions()
  }
})
</script>

<template>
  <div class="admin-view">
    <h1 class="admin-title">Administration</h1>

    <div v-if="!appStore.isAdmin" class="access-denied">
      <p>Accès administrateur requis.</p>
    </div>

    <template v-else>
      <div class="admin-tabs">
        <button
          :class="['admin-tab', { active: activeTab === 'suggestions' }]"
          @click="activeTab = 'suggestions'"
        >
          Suggestions
        </button>
        <button
          :class="['admin-tab', { active: activeTab === 'diagnostics' }]"
          @click="activeTab = 'diagnostics'"
        >
          Diagnostics
        </button>
      </div>

      <div v-if="activeTab === 'suggestions'" class="tab-content">
        <div v-if="loadingSuggestions" class="loading-state">Chargement...</div>
        <div v-else-if="suggestions.length === 0" class="empty-state">
          Aucune suggestion en attente.
        </div>
        <div v-else class="suggestions-list">
          <div v-for="s in suggestions" :key="s.id" class="suggestion-card">
            <div class="suggestion-header">
              <span class="suggestion-cat">{{ s.catTitle || s.cat_id }}</span>
              <span class="suggestion-type">{{ s.type }}</span>
            </div>
            <p class="suggestion-text">{{ s.suggestion }}</p>
            <div class="suggestion-actions">
              <button class="approve-btn" @click="approveSuggestion(s.id)">Approuver</button>
              <button class="reject-btn" @click="rejectSuggestion(s.id)">Rejeter</button>
            </div>
          </div>
        </div>
      </div>

      <div v-else-if="activeTab === 'diagnostics'" class="tab-content">
        <div v-if="loadingDiagnostics" class="loading-state">Chargement...</div>
        <div v-else-if="!diagnostics" class="empty-state">
          Cliquez sur Diagnostics pour charger les données système.
        </div>
        <div v-else class="diagnostics-grid">
          <div v-for="(value, key) in diagnostics" :key="key" class="diag-card">
            <h3>{{ formatDiagTitle(key) }}</h3>
            <div class="diag-content">
              <template v-if="isDiagObject(value)">
                <div v-for="(subVal, subKey) in flattenObject(value)" :key="subKey" class="diag-row">
                  <span class="diag-key">{{ subKey }}</span>
                  <span class="diag-val">{{ subVal }}</span>
                </div>
              </template>
              <pre v-else class="diag-pre">{{ value }}</pre>
            </div>
          </div>
        </div>
      </div>
    </template>
  </div>
</template>

<style scoped>
.admin-view {
  padding: 20px;
  max-width: 900px;
  margin: 0 auto;
}
.admin-title {
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 20px;
}
.access-denied {
  padding: 40px 20px;
  text-align: center;
  color: var(--text-muted);
  font-size: 14px;
}
.admin-tabs {
  display: flex;
  gap: 4px;
  border-bottom: 1px solid var(--color-border);
  margin-bottom: 20px;
}
.admin-tab {
  padding: 10px 16px;
  background: none;
  border: none;
  border-bottom: 2px solid transparent;
  color: var(--text-muted);
  font-size: 13px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.2s;
  font-family: inherit;
}
.admin-tab.active {
  color: var(--color-primary);
  border-bottom-color: var(--color-primary);
}
.tab-content {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.loading-state {
  padding: 40px 20px;
  text-align: center;
  color: var(--text-muted);
  font-size: 14px;
}
.empty-state {
  padding: 40px 20px;
  text-align: center;
  color: var(--text-muted);
  font-size: 14px;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
}
.suggestions-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.suggestion-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
  padding: 14px 16px;
}
.suggestion-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 8px;
}
.suggestion-cat {
  font-size: 13px;
  font-weight: 600;
  color: var(--text-primary);
}
.suggestion-type {
  font-size: 11px;
  color: var(--color-primary);
  background: rgba(6, 182, 212, 0.15);
  padding: 3px 8px;
  border-radius: 6px;
}
.suggestion-text {
  font-size: 13px;
  color: var(--text-secondary);
  margin: 0 0 12px 0;
  line-height: 1.5;
}
.suggestion-actions {
  display: flex;
  gap: 8px;
}
.approve-btn {
  padding: 6px 12px;
  border: none;
  border-radius: 6px;
  background: rgba(16, 185, 129, 0.15);
  color: var(--color-success);
  font-size: 12px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
  font-family: inherit;
}
.approve-btn:hover {
  background: rgba(16, 185, 129, 0.25);
}
.reject-btn {
  padding: 6px 12px;
  border: 1px solid rgba(239, 68, 68, 0.3);
  border-radius: 6px;
  background: rgba(239, 68, 68, 0.1);
  color: #f87171;
  font-size: 12px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
  font-family: inherit;
}
.reject-btn:hover {
  background: rgba(239, 68, 68, 0.2);
}
.diagnostics-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 12px;
}
.diag-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
  padding: 14px 16px;
}
.diag-card h3 {
  font-size: 13px;
  font-weight: 600;
  margin: 0 0 10px 0;
  color: var(--text-primary);
}
.diag-content {
  display: flex;
  flex-direction: column;
  gap: 6px;
}
.diag-row {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  gap: 10px;
  padding: 5px 0;
  border-bottom: 1px solid rgba(255, 255, 255, 0.04);
}
.diag-row:last-child {
  border-bottom: none;
}
.diag-key {
  font-size: 12px;
  color: var(--text-muted);
  font-weight: 500;
  flex-shrink: 0;
  max-width: 40%;
}
.diag-val {
  font-size: 12px;
  color: var(--text-secondary);
  text-align: right;
  word-break: break-word;
}
.diag-pre {
  font-size: 11px;
  color: var(--text-muted);
  margin: 0;
  white-space: pre-wrap;
  word-break: break-word;
  line-height: 1.4;
}
</style>
