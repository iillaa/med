<script setup lang="ts">
import { ref, computed, watch } from 'vue'
import { useRoute } from 'vue-router'
import { useCatsStore } from '@/stores/cats'
import { parseSummaryMarkdown } from '@/utils/markdown'

const route = useRoute()
const catsStore = useCatsStore()

const catId = computed(() => Number(route.params.id))
const cat = computed(() => catsStore.cats.find(c => c.id === catId.value))

const notes = ref('')
const saveStatus = ref<'idle' | 'saving' | 'saved'>('idle')

watch(
  () => cat.value?.notes,
  (newNotes) => {
    if (newNotes !== undefined) notes.value = newNotes
  },
  { immediate: true }
)

async function setStatus(status: 'todo' | 'done'): Promise<void> {
  if (!cat.value) return
  await catsStore.updateStatus(cat.value.id, status)
}

async function saveNotes(): Promise<void> {
  if (!cat.value) return
  saveStatus.value = 'saving'
  catsStore.updateNotes(cat.value.id, notes.value)
  saveStatus.value = 'saved'
  setTimeout(() => {
    saveStatus.value = 'idle'
  }, 2000)
}

const renderedSummary = computed(() => {
  if (!cat.value) return ''
  return parseSummaryMarkdown(cat.value.customSummary || cat.value.summary)
})
</script>

<template>
  <div class="workspace" v-if="cat">
    <div class="workspace-header">
      <div class="title-area">
        <span class="cat-badge">{{ cat.category }}</span>
        <h1 class="workspace-title">{{ cat.id }}. {{ cat.title }}</h1>
      </div>
      <div class="status-selector-area">
        <span class="status-label">Statut :</span>
        <div class="status-btn-group">
          <button
            v-for="s in ['todo', 'done']"
            :key="s"
            :class="['status-btn', { active: cat.status === s }]"
            @click="setStatus(s)"
          >
            {{ s === 'todo' ? 'À faire' : 'Maîtrisé' }}
          </button>
        </div>
      </div>
    </div>

    <div v-if="cat.red_flags" class="red-flags-banner">
      <strong>Red Flags :</strong> {{ cat.red_flags }}
    </div>

    <nav class="tabs-nav">
      <button class="tab-btn active">Conduite à tenir</button>
      <button class="tab-btn">Notes</button>
      <button class="tab-btn">Ordonnance</button>
    </nav>

    <div class="tab-content">
      <div class="tab-pane active">
        <div class="summary-view" v-html="renderedSummary"></div>
      </div>
      <div class="tab-pane">
        <div class="notes-container">
          <textarea
            v-model="notes"
            class="notes-textarea"
            placeholder="Saisir vos notes ici..."
            rows="12"
          ></textarea>
          <div class="notes-actions">
            <button
              :class="['save-notes-btn', { saving: saveStatus === 'saving', saved: saveStatus === 'saved' }]"
              @click="saveNotes"
              :disabled="saveStatus === 'saving'"
            >
              {{ saveStatus === 'saving' ? 'Sauvegarde...' : saveStatus === 'saved' ? 'Sauvegardé ✓' : 'Sauvegarder les notes' }}
            </button>
          </div>
        </div>
      </div>
      <div class="tab-pane">
        <div class="ordonnance-content">{{ cat.ordonnance }}</div>
      </div>
    </div>
  </div>

  <div class="workspace" v-else>
    <div class="empty-state">CAT non trouvée.</div>
  </div>
</template>

<style scoped>
.workspace {
  padding: 20px;
  max-width: 900px;
  margin: 0 auto;
}
.workspace-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  flex-wrap: wrap;
  gap: 16px;
  margin-bottom: 20px;
}
.title-area {
  display: flex;
  flex-direction: column;
  gap: 8px;
  flex: 1;
  min-width: 0;
}
.cat-badge {
  display: inline-flex;
  align-self: flex-start;
  font-size: 11px;
  font-weight: 600;
  color: var(--color-primary);
  background: rgba(6, 182, 212, 0.15);
  padding: 3px 8px;
  border-radius: 6px;
  width: fit-content;
}
.workspace-title {
  font-size: 20px;
  font-weight: 700;
  margin: 0;
  color: var(--text-primary);
}
.status-selector-area {
  display: flex;
  align-items: center;
  gap: 10px;
}
.status-label {
  font-size: 13px;
  color: var(--text-muted);
}
.status-btn-group {
  display: flex;
  gap: 6px;
}
.status-btn {
  padding: 6px 12px;
  border: 1px solid var(--color-border);
  border-radius: 8px;
  background: transparent;
  color: var(--text-secondary);
  font-size: 12px;
  cursor: pointer;
  transition: all 0.2s;
}
.status-btn.active {
  background: var(--color-primary);
  color: white;
  border-color: var(--color-primary);
}
.red-flags-banner {
  padding: 12px 16px;
  background: rgba(239, 68, 68, 0.1);
  border: 1px solid rgba(239, 68, 68, 0.3);
  border-radius: 12px;
  color: #fca5a5;
  font-size: 13px;
  margin-bottom: 20px;
}
.tabs-nav {
  display: flex;
  gap: 4px;
  border-bottom: 1px solid var(--color-border);
  margin-bottom: 16px;
}
.tab-btn {
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
.tab-btn.active {
  color: var(--color-primary);
  border-bottom-color: var(--color-primary);
}
.tab-content {
  display: flex;
  flex-direction: column;
  gap: 16px;
}
.tab-pane {
  display: none;
}
.tab-pane.active {
  display: block;
}
.summary-view {
  line-height: 1.7;
  color: var(--text-primary);
  font-size: 14px;
}
.summary-view :deep(p) {
  margin: 0 0 12px 0;
}
.summary-view :deep(ul) {
  margin: 0 0 12px 0;
  padding-left: 20px;
}
.summary-view :deep(li) {
  margin-bottom: 4px;
}
.summary-view :deep(table) {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 12px;
  font-size: 13px;
}
.summary-view :deep(th),
.summary-view :deep(td) {
  border: 1px solid var(--color-border);
  padding: 8px;
  text-align: left;
}
.summary-view :deep(th) {
  background: var(--color-surface);
  font-weight: 600;
}
.notes-container {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.notes-textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid var(--color-border);
  border-radius: 12px;
  background: var(--color-surface);
  color: var(--text-primary);
  font-size: 14px;
  line-height: 1.6;
  resize: vertical;
  outline: none;
  font-family: inherit;
  box-sizing: border-box;
}
.notes-actions {
  display: flex;
  justify-content: flex-end;
}
.save-notes-btn {
  padding: 8px 16px;
  border: none;
  border-radius: 8px;
  background: var(--color-primary);
  color: white;
  font-size: 13px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
}
.save-notes-btn.saving {
  opacity: 0.7;
  cursor: not-allowed;
}
.save-notes-btn.saved {
  background: var(--color-success);
}
.ordonnance-content {
  white-space: pre-wrap;
  line-height: 1.7;
  color: var(--text-primary);
  font-size: 14px;
}
.empty-state {
  padding: 40px 20px;
  text-align: center;
  color: var(--text-muted);
  font-size: 14px;
}
</style>
