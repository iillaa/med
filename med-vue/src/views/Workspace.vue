<script setup lang="ts">
import { ref, computed, watch } from 'vue'
import { useRoute } from 'vue-router'
import { useCatsStore } from '@/stores/cats'
import { useAppStore } from '@/stores/app'
import { parseSummaryMarkdown } from '@/utils/markdown'

const route = useRoute()
const catsStore = useCatsStore()
const appStore = useAppStore()

const catId = computed(() => Number(route.params.id))
const cat = computed(() => catsStore.cats.find(c => c.id === catId.value))

const notes = ref('')
const saveStatus = ref<'idle' | 'saving' | 'saved'>('idle')
const activeTab = ref('summary')
const isRedFlagsExpanded = ref(false)
const activePrescriptionVariantIndex = ref(0)

const currentDate = computed(() => {
  return new Date().toLocaleDateString('fr-FR')
})

watch(
  () => cat.value?.notes,
  (newNotes) => {
    if (newNotes !== undefined) notes.value = newNotes
  },
  { immediate: true }
)

// Reset tab states when switching CATs and mark as read
watch(catId, (newId) => {
  activeTab.value = 'summary'
  isRedFlagsExpanded.value = false
  activePrescriptionVariantIndex.value = 0
  if (newId) catsStore.markAsRead(newId)
}, { immediate: true })

async function setStatus(status: 'todo' | 'doing' | 'done'): Promise<void> {
  if (!cat.value) return
  await catsStore.updateStatus(cat.value.id, status)
}

async function saveNotes(): Promise<void> {
  if (!cat.value) return
  saveStatus.value = 'saving'
  try {
    catsStore.updateNotes(cat.value.id, notes.value)
    saveStatus.value = 'saved'
    appStore.showToast(
      'Notes sauvegardées localement. Exportez régulièrement vos données depuis le <strong>tableau de bord</strong> pour les sécuriser.',
      'fa-cloud-arrow-up',
      6000
    )
  } catch (err) {
    console.error('Failed to save notes:', err)
  } finally {
    setTimeout(() => {
      saveStatus.value = 'idle'
    }, 2000)
  }
}

const renderedSummary = computed(() => {
  if (!cat.value) return ''
  return parseSummaryMarkdown(cat.value.customSummary || cat.value.summary)
})

// Prescription variants parsing logic
const prescriptionVariants = computed(() => {
  const ordonnance = cat.value?.ordonnance
  if (!ordonnance) return []
  return parsePrescriptionText(ordonnance)
})

function parsePrescriptionText(text: string): { title: string; content: string }[] {
  if (!text) return []
  
  const lines = text.split('\n')
  const variants: { title: string; content: string }[] = []
  
  interface VariantBuilder { title: string; content: string[] }
  let currentVariant: VariantBuilder | null = null
  
  lines.forEach(line => {
    const trimmed = line.trim()
    const match = trimmed.match(/^---+\s*(.*?)\s*---+$/)
    if (match && match[1] !== undefined) {
      if (currentVariant) {
        variants.push({ title: currentVariant.title, content: currentVariant.content.join('\n').trim() })
      }
      currentVariant = { title: match[1].trim(), content: [] }
    } else {
      if (!currentVariant) {
        currentVariant = { title: 'Général', content: [] }
      }
      currentVariant.content.push(line)
    }
  })
  
  if (currentVariant) {
    const cv = currentVariant as VariantBuilder
    variants.push({ title: cv.title, content: cv.content.join('\n').trim() })
  }
  
  return variants.filter(v => v.content.length > 0 || v.title !== 'Général')
}

async function copyPrescription() {
  const currentContent = prescriptionVariants.value[activePrescriptionVariantIndex.value]?.content || cat.value?.ordonnance || ''
  if (!currentContent) return
  
  try {
    await navigator.clipboard.writeText(currentContent)
    appStore.showToast("Ordonnance copiée dans le presse-papiers !", "fa-copy", 4000)
  } catch (err) {
    console.error("Failed to copy prescription:", err)
    appStore.showToast("Échec de la copie automatique.", "fa-circle-xmark", 3000)
  }
}
</script>

<template>
  <div class="workspace animate-entrance" v-if="cat" :key="cat.id" style="display: flex; flex-direction: column; height: 100%;">
    <!-- Header panel -->
    <div class="workspace-header">
      <div class="title-area">
        <span class="cat-badge" id="workspace-cat-category">{{ cat.category }}</span>
        <h1 class="workspace-title" id="workspace-cat-title">{{ cat.id }}. {{ cat.title }}</h1>
      </div>
      <div class="status-selector-area">
        <span class="status-label">Statut :</span>
        <div class="status-btn-group">
          <button
            class="status-btn"
            :class="{ active: cat.status === 'todo' || !cat.status }"
            @click="setStatus('todo')"
          >
            À faire
          </button>
          <button
            class="status-btn"
            :class="{ active: cat.status === 'doing' }"
            @click="setStatus('doing')"
          >
            En cours
          </button>
          <button
            class="status-btn"
            :class="{ active: cat.status === 'done' }"
            @click="setStatus('done')"
          >
            Maîtrisé
          </button>
        </div>
      </div>
    </div>

    <!-- Collapsible Alertes / Red flags -->
    <div 
      v-if="cat.red_flags" 
      class="red-flags-banner" 
      :class="{ expanded: isRedFlagsExpanded }"
      @click="isRedFlagsExpanded = !isRedFlagsExpanded"
      id="red-flags-banner"
    >
      <div class="red-flags-title">
        <i class="fa-solid fa-triangle-exclamation" style="margin-right: 6px;"></i>
        <strong>Drapeaux Rouges (Signes de gravité) :</strong>
      </div>
      <div id="workspace-red-flags">{{ cat.red_flags }}</div>
    </div>

    <!-- Tabs Nav -->
    <nav class="tabs-nav">
      <button 
        class="tab-btn" 
        :class="{ active: activeTab === 'summary' }" 
        @click="activeTab = 'summary'"
      >
        <i class="fa-solid fa-file-medical" style="margin-right: 4px;"></i> Conduite à tenir
      </button>
      <button 
        class="tab-btn" 
        :class="{ active: activeTab === 'notes' }" 
        @click="activeTab = 'notes'"
      >
        <i class="fa-solid fa-pen-to-square" style="margin-right: 4px;"></i> Notes
      </button>
      <button 
        class="tab-btn" 
        :class="{ active: activeTab === 'prescription' }" 
        @click="activeTab = 'prescription'"
      >
        <i class="fa-solid fa-prescription-bottle-medical" style="margin-right: 4px;"></i> Ordonnance
      </button>
    </nav>

    <!-- Scrollable Tab Content Container -->
    <div class="tab-content-container">
      <!-- Tab: Summary -->
      <div v-show="activeTab === 'summary'" class="tab-pane" :class="{ active: activeTab === 'summary' }">
        <div class="summary-view" id="summary-view" v-html="renderedSummary"></div>
      </div>

      <!-- Tab: Notes -->
      <div v-show="activeTab === 'notes'" class="tab-pane" :class="{ active: activeTab === 'notes' }">
        <div class="notes-container">
          <textarea
            v-model="notes"
            id="notes-input"
            class="notes-textarea"
            placeholder="Saisir vos notes personnelles sur cette pathologie..."
            rows="12"
          ></textarea>
          <div class="notes-actions">
            <span id="save-indicator" class="save-indicator" :class="{ show: saveStatus === 'saved' }" style="margin-right: 12px; align-self: center; font-size: 12px; color: var(--color-success); transition: opacity 0.3s; opacity: 0;">
              Sauvegardé ✓
            </span>
            <button
              id="save-notes-btn"
              class="save-notes-btn"
              :class="{ saving: saveStatus === 'saving', saved: saveStatus === 'saved' }"
              @click="saveNotes"
              :disabled="saveStatus === 'saving'"
            >
              <i class="fa-solid fa-floppy-disk"></i> {{ saveStatus === 'saving' ? 'Sauvegarde...' : saveStatus === 'saved' ? 'Sauvegardé ✓' : 'Sauvegarder' }}
            </button>
          </div>
        </div>
      </div>

      <!-- Tab: Ordonnance -->
      <div v-show="activeTab === 'prescription'" class="tab-pane" :class="{ active: activeTab === 'prescription' }">
        <div class="pane-header" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px;">
          <h3 style="font-size: 13.5px; margin: 0; color: var(--text-secondary);"><i class="fa-solid fa-prescription-bottle-medical"></i> Modèle d'Ordonnance</h3>
          <button class="suggestion-btn btn-review" id="copy-prescription-btn" @click="copyPrescription" style="padding: 5px 10px; font-size: 11px;">
            <i class="fa-regular fa-copy"></i> Copier le texte
          </button>
        </div>

        <!-- Prescription Variants selector if multiple -->
        <div 
          v-if="prescriptionVariants.length > 1" 
          id="prescription-variants-selector" 
          class="prescription-variants-selector"
          style="display: flex; gap: 6px; margin-bottom: 12px; flex-wrap: wrap;"
        >
          <button
            v-for="(variant, idx) in prescriptionVariants"
            :key="idx"
            class="status-pill"
            :class="{ active: idx === activePrescriptionVariantIndex }"
            style="font-size: 11px; padding: 4px 10px;"
            @click="activePrescriptionVariantIndex = idx"
          >
            {{ variant.title }}
          </button>
        </div>

        <!-- Simulated Prescription Sheet -->
        <div class="prescription-container" id="prescription-container">
          <div class="prescription-header">
            <div class="clinic-info">
              <strong>Dr. CAT</strong>
              <span>Cabinet de Médecine Générale</span>
            </div>
            <div class="date-placeholder">Le {{ currentDate }}</div>
          </div>
          <div class="prescription-body">
            <div class="patient-line">Nom du Patient : ..............................................................</div>
            <div class="prescription-content" id="prescription-text" style="white-space: pre-wrap; font-family: monospace; font-size: 13px;">
              {{ prescriptionVariants[activePrescriptionVariantIndex]?.content || cat.ordonnance || 'Aucun modèle d\'ordonnance type disponible pour cette fiche.' }}
            </div>
          </div>
          <div class="prescription-footer">
            Signature & Cachet du Praticien
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="workspace" v-else style="display: flex; align-items: center; justify-content: center; height: 100%;">
    <div class="empty-state">
      <i class="fa-solid fa-circle-question" style="font-size: 36px; margin-bottom: 12px; color: var(--text-muted);"></i>
      <p>Sélectionnez une fiche clinique dans le menu latéral pour commencer.</p>
    </div>
  </div>
</template>

<style scoped>
/* Scoped overrides to handle layout alignments and show/hide animation triggers */
.save-indicator.show {
  opacity: 1 !important;
}

.prescription-variants-selector .status-pill.active {
  background-color: rgba(6, 182, 212, 0.15) !important;
  border-color: var(--color-primary) !important;
  color: var(--color-primary) !important;
}
</style>
