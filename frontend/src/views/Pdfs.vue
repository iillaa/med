<script setup lang="ts">
import { ref } from 'vue'
import { useAppStore } from '@/stores/app'
import { searchPdfsContent, fetchSearchStatus } from '@/api/client'

const appStore = useAppStore()
const query = ref('')
const results = ref<any[]>([])
const loading = ref(false)
const searchStatus = ref<any>(null)

async function doSearch(): Promise<void> {
  if (!query.value.trim()) return
  loading.value = true
  try {
    const res = await searchPdfsContent(query.value)
    if (res && typeof res === 'object' && 'json' in res && typeof res.json === 'function') {
      const data = await res.json()
      results.value = data.results || []
    } else if (res.ok) {
      const data = await res.json()
      results.value = data.results || []
    }
  } catch (err) {
    console.error('[Pdfs] search failed:', err)
    results.value = []
  } finally {
    loading.value = false
  }
}

async function loadStatus(): Promise<void> {
  try {
    searchStatus.value = await fetchSearchStatus()
  } catch (err) {
    console.error('[Pdfs] status failed:', err)
  }
}

loadStatus()
</script>

<template>
  <div class="pdfs-view">
    <h1 class="pdfs-title">Recherche PDF</h1>

    <div class="search-bar">
      <input
        v-model="query"
        type="text"
        placeholder="Rechercher dans les PDFs..."
        class="search-input"
        @keyup.enter="doSearch"
      />
      <button class="search-btn" @click="doSearch" :disabled="loading">
        {{ loading ? 'Recherche...' : 'Rechercher' }}
      </button>
    </div>

    <div v-if="searchStatus" class="status-bar">
      <span class="status-text">
        {{ searchStatus.isIndexing ? 'Indexation en cours...' : `Index: ${searchStatus.indexedFiles || 0}/${searchStatus.totalFiles || 0} fichiers` }}
      </span>
    </div>

    <div v-if="results.length === 0 && !loading" class="empty-state">
      Aucun résultat. Effectuez une recherche pour trouver des documents.
    </div>

    <div v-else-if="results.length > 0" class="results-list">
      <div v-for="item in results" :key="`${item.pdf}-${item.page}`" class="result-card">
        <div class="result-header">
          <span class="result-pdf">{{ item.pdf }}</span>
          <span class="result-page">p. {{ item.page }}</span>
        </div>
        <p class="result-snippet">{{ item.snippet }}</p>
      </div>
    </div>
  </div>
</template>

<style scoped>
.pdfs-view {
  padding: 20px;
  max-width: 800px;
  margin: 0 auto;
}
.pdfs-title {
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 20px;
}
.search-bar {
  display: flex;
  gap: 10px;
  margin-bottom: 16px;
}
.search-input {
  flex: 1;
  padding: 10px 14px;
  border: 1px solid var(--color-border);
  border-radius: 10px;
  background: var(--color-surface);
  color: var(--text-primary);
  font-size: 14px;
  outline: none;
  font-family: inherit;
}
.search-btn {
  padding: 10px 18px;
  border: none;
  border-radius: 10px;
  background: var(--color-primary);
  color: white;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
  font-family: inherit;
}
.search-btn:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}
.status-bar {
  margin-bottom: 16px;
  padding: 10px 14px;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 10px;
}
.status-text {
  font-size: 12px;
  color: var(--text-muted);
}
.empty-state {
  padding: 40px 20px;
  text-align: center;
  color: var(--text-muted);
  font-size: 14px;
}
.results-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.result-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
  padding: 14px 16px;
}
.result-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 8px;
}
.result-pdf {
  font-size: 13px;
  font-weight: 600;
  color: var(--text-primary);
}
.result-page {
  font-size: 11px;
  color: var(--text-muted);
}
.result-snippet {
  font-size: 13px;
  color: var(--text-secondary);
  line-height: 1.5;
  margin: 0;
}
</style>
