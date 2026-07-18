<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useAppStore } from '@/stores/app'
import { fetchSuggestions, approveSuggestionOnServer, rejectSuggestionOnServer } from '@/api/client'

const appStore = useAppStore()
const suggestions = ref<any[]>([])
const loadingSuggestions = ref(false)

// Review modal state
const showReviewModal = ref(false)
const reviewingSuggestion = ref<any>(null)
const reviewDiffHtml = ref('')

async function loadSuggestions(): Promise<void> {
  loadingSuggestions.value = true
  try {
    suggestions.value = await fetchSuggestions()
  } catch (err) {
    console.error('[AdminSuggestions] fetchSuggestions failed:', err)
  } finally {
    loadingSuggestions.value = false
  }
}

async function approveSuggestion(id: string): Promise<void> {
  try {
    await approveSuggestionOnServer(id)
    suggestions.value = suggestions.value.filter(s => s.id !== id)
    if (reviewingSuggestion.value && reviewingSuggestion.value.id === id) {
      closeReviewModal()
    }
  } catch (err) {
    console.error('[AdminSuggestions] approveSuggestion failed:', err)
  }
}

async function rejectSuggestion(id: string): Promise<void> {
  try {
    await rejectSuggestionOnServer(id)
    suggestions.value = suggestions.value.filter(s => s.id !== id)
    if (reviewingSuggestion.value && reviewingSuggestion.value.id === id) {
      closeReviewModal()
    }
  } catch (err) {
    console.error('[AdminSuggestions] rejectSuggestion failed:', err)
  }
}

function openReviewModal(sug: any): void {
  reviewingSuggestion.value = sug
  reviewDiffHtml.value = generateDiffHtml(sug)
  showReviewModal.value = true
}

function closeReviewModal(): void {
  showReviewModal.value = false
  reviewingSuggestion.value = null
  reviewDiffHtml.value = ''
}

function generateDiffHtml(sug: any): string {
  if (sug.type === 'add') {
    return `
      <strong>Titre :</strong> ${sug.data?.title || 'N/A'}<br>
      <strong>Spécialité :</strong> ${sug.data?.category || 'N/A'}<br>
      <strong>Red Flags :</strong> ${sug.data?.red_flags || 'Aucun'}<br>
      <strong>Synthèse (extrait) :</strong> ${sug.data?.summary ? sug.data.summary.substring(0, 200) + (sug.data.summary.length > 200 ? '...' : '') : 'Aucune'}<br>
      <strong>Ordonnance (extrait) :</strong> ${sug.data?.ordonnance ? sug.data.ordonnance.substring(0, 150) + (sug.data.ordonnance.length > 150 ? '...' : '') : 'Aucune'}
    `
  } else if (sug.type === 'edit') {
    let html = `<strong>Fiche ciblée :</strong> ID ${sug.catId}<br>`
    if (sug.data?.summary) {
      html += `<strong>Proposition Synthèse :</strong><div style="max-height: 120px; overflow: auto; background: rgba(0,0,0,0.2); padding: 8px; border-radius: 4px; margin-top: 4px; font-family: monospace; font-size: 12px; white-space: pre-wrap;">${sug.data.summary}</div>`
    }
    if (sug.data?.ordonnance) {
      html += `<strong>Proposition Ordonnance :</strong><div style="max-height: 120px; overflow: auto; background: rgba(0,0,0,0.2); padding: 8px; border-radius: 4px; margin-top: 4px; font-family: monospace; font-size: 12px; white-space: pre-wrap;">${sug.data.ordonnance}</div>`
    }
    return html
  }
  return 'Contenu non disponible'
}

onMounted(() => {
  loadSuggestions()
})

defineExpose({ loadSuggestions })
</script>

<template>
  <div class="tab-content">
    <div v-if="loadingSuggestions" class="loading-state">Chargement...</div>
    <div v-else-if="suggestions.length === 0" class="empty-state">
      Aucune suggestion en attente.
    </div>
    <div v-else class="suggestions-list">
      <div v-for="s in suggestions" :key="s.id" class="suggestion-card">
        <div class="suggestion-header">
          <span class="suggestion-cat">{{ s.type === 'add' ? 'Nouvelle fiche' : 'Modification fiche #' + (s.catId || s.cat_id) }}</span>
          <span class="suggestion-type">{{ s.type }}</span>
        </div>
        <div class="suggestion-body" style="margin-bottom: 12px;">
          <div style="font-size: 12px; color: var(--text-muted); margin-bottom: 6px;">
            Par: {{ s.author || 'Anonyme' }} | {{ new Date(s.createdAt || s.timestamp || Date.now()).toLocaleDateString('fr-FR') }}
          </div>
          <div style="font-size: 13px; color: var(--text-secondary); background: var(--bg-body); padding: 8px; border-radius: 6px; line-height: 1.5;" v-html="generateDiffHtml(s)"></div>
        </div>
        <div class="suggestion-actions">
          <button class="reject-btn" @click="rejectSuggestion(s.id)">
            <i class="fa-solid fa-xmark"></i> Rejeter
          </button>
          <button class="review-btn" @click="openReviewModal(s)" style="flex: 1; padding: 6px 12px; border: 1px solid rgba(99, 102, 241, 0.3); border-radius: 6px; background: rgba(99, 102, 241, 0.15); color: #a5b4fc; font-size: 12px; font-weight: 600; cursor: pointer; transition: all 0.2s; font-family: inherit;">
            <i class="fa-solid fa-pen-to-square"></i> Réviser
          </button>
          <button class="approve-btn" @click="approveSuggestion(s.id)">
            <i class="fa-solid fa-check"></i> Accepter
          </button>
        </div>
      </div>
    </div>

    <!-- Suggestion Review Modal -->
    <Transition name="fade">
      <div v-if="showReviewModal && reviewingSuggestion" class="modal-overlay" @click.self="closeReviewModal">
        <div class="modal-card" style="max-width: 700px; width: 90%;">
          <div class="modal-header">
            <h3><i class="fa-solid fa-pen-to-square"></i> Réviser la proposition</h3>
            <button class="close-modal-btn" @click="closeReviewModal">
              <i class="fa-solid fa-xmark"></i>
            </button>
          </div>
          <div class="modal-body">
            <div style="margin-bottom: 16px;">
              <div style="display: flex; gap: 8px; margin-bottom: 12px; flex-wrap: wrap;">
                <span class="suggestion-type" style="font-size: 11px; padding: 3px 8px; border-radius: 6px;">
                  {{ reviewingSuggestion.type === 'add' ? 'Ajout de fiche' : 'Modification' }}
                </span>
                <span style="font-size: 12px; color: var(--text-muted);">
                  Par: {{ reviewingSuggestion.author || 'Anonyme' }} | {{ new Date(reviewingSuggestion.createdAt || reviewingSuggestion.timestamp || Date.now()).toLocaleDateString('fr-FR') }}
                </span>
              </div>
              <div style="font-size: 13px; color: var(--text-secondary); background: var(--bg-body); padding: 12px; border-radius: 8px; line-height: 1.6;" v-html="reviewDiffHtml"></div>
            </div>
            <div class="modal-footer" style="display: flex; gap: 10px; justify-content: flex-end;">
              <button class="cancel-btn" @click="closeReviewModal">Annuler</button>
              <button class="reject-btn" @click="rejectSuggestion(reviewingSuggestion.id)" style="padding: 8px 16px;">
                <i class="fa-solid fa-xmark"></i> Rejeter
              </button>
              <button class="approve-btn" @click="approveSuggestion(reviewingSuggestion.id)" style="padding: 8px 16px;">
                <i class="fa-solid fa-check"></i> Accepter
              </button>
            </div>
          </div>
        </div>
      </div>
    </Transition>
  </div>
</template>

<style scoped>
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
.review-btn:hover {
  background: rgba(99, 102, 241, 0.25);
}

/* Review Modal */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
