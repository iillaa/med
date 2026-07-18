<script setup lang="ts">
import { ref, computed, watch, onMounted } from 'vue'
import { useCatsStore } from '@/stores/cats'
import { useAppStore } from '@/stores/app'
import type { Cat } from '@/types/cat'

const catsStore = useCatsStore()
const appStore = useAppStore()

const visible = computed({
  get: () => appStore.showAddCatModal,
  set: (val) => {
    if (!val) appStore.showAddCatModal = false
  }
})

const form = ref({
  title: '',
  category: '',
  red_flags: '',
  summary: '',
  ordonnance: '',
  pdf_keywords: ''
})

const isSubmitting = ref(false)
const categoryOptions = ref<string[]>([])

watch(visible, (newVal) => {
  if (newVal) {
    loadCategories()
    resetForm()
  }
})

function loadCategories() {
  const cats = catsStore.cats
  const catsList = Array.isArray(cats) ? cats : []
  const set = new Set(catsList.map(c => c.category).filter(Boolean))
  categoryOptions.value = Array.from(set).sort()
}

function resetForm() {
  form.value = {
    title: '',
    category: '',
    red_flags: '',
    summary: '',
    ordonnance: '',
    pdf_keywords: ''
  }
}

function close() {
  appStore.showAddCatModal = false
}

async function submit() {
  if (!form.value.title.trim() || !form.value.category.trim()) {
    appStore.showToast('Le titre et la catégorie sont obligatoires.', 'fa-triangle-exclamation', 3000)
    return
  }

  const rawKeywords = form.value.pdf_keywords
  const pdf_keywords = rawKeywords
    ? rawKeywords.split(',').map(kw => kw.trim()).filter(kw => kw)
    : []

  const payload = {
    title: form.value.title.trim(),
    category: form.value.category.trim(),
    red_flags: form.value.red_flags.trim(),
    summary: form.value.summary.trim(),
    ordonnance: form.value.ordonnance.trim(),
    pdf_keywords
  }

  try {
    if (appStore.isAdmin) {
      isSubmitting.value = true
      const result = await catsStore.createCat(payload)
      if (result) {
        appStore.showToast(`La fiche "${payload.title}" a été ajoutée avec succès !`, 'fa-circle-check', 3000)
        close()
        // Navigate to the new cat
        if (result.id) {
          window.location.hash = `#/workspace/${result.id}`
        }
      } else {
        appStore.showToast("Erreur lors de l'ajout de la fiche.", 'fa-circle-exclamation', 4000)
      }
    } else {
      const confirmSubmit = confirm(
        "Attention : Cette nouvelle fiche ne sera pas ajoutée directement. Elle sera envoyée à l'administrateur du site pour relecture et validation avant d'être intégrée.\n\nSouhaitez-vous envoyer cette proposition ?"
      )
      if (!confirmSubmit) return

      const { submitSuggestion } = await import('@/api/client')
      await submitSuggestion({
        type: 'add',
        data: payload
      })
      appStore.showToast(`Votre proposition de fiche "${payload.title}" a été envoyée à l'administrateur pour validation.`, 'fa-circle-check', 4000)
      close()
    }
  } catch (err) {
    console.error(err)
    appStore.showToast("Erreur lors de l'enregistrement.", 'fa-circle-exclamation', 4000)
  } finally {
    isSubmitting.value = false
  }
}
</script>

<template>
  <Transition name="fade">
    <div v-if="visible" class="modal-overlay" @click.self="close">
      <div class="modal-card">
        <div class="modal-header">
          <h3><i class="fa-solid fa-plus-circle"></i> Ajouter une nouvelle CAT</h3>
          <button class="close-modal-btn" @click="close">
            <i class="fa-solid fa-xmark"></i>
          </button>
        </div>
        <div class="modal-body">
          <form @submit.prevent="submit">
            <div class="form-group">
              <label for="new-cat-title">Titre de la CAT *</label>
              <input
                id="new-cat-title"
                v-model="form.title"
                type="text"
                required
                placeholder="Ex: CAT devant colique néphrétique..."
              />
            </div>

            <div class="form-group">
              <label for="new-cat-category">Spécialité / Catégorie *</label>
              <div style="display: flex; flex-direction: column; gap: 8px;">
                <select
                  id="new-cat-category-select"
                  v-model="form.category"
                >
                  <option value="">-- Sélectionner une spécialité existante --</option>
                  <option v-for="cat in categoryOptions" :key="cat" :value="cat">
                    {{ cat }}
                  </option>
                </select>
                <input
                  id="new-cat-category"
                  v-model="form.category"
                  type="text"
                  required
                  placeholder="Ou saisissez une nouvelle spécialité..."
                />
              </div>
            </div>

            <div class="form-group">
              <label for="new-cat-red-flags">Signes de Gravité / Red Flags (séparés par des virgules ou retours à la ligne)</label>
              <textarea
                id="new-cat-red-flags"
                v-model="form.red_flags"
                rows="3"
                placeholder="Ex: Fièvre élevée, perte de poids..."
              ></textarea>
            </div>

            <div class="form-group">
              <label for="new-cat-summary">Fiche de Synthèse / Conduite à tenir</label>
              <textarea
                id="new-cat-summary"
                v-model="form.summary"
                rows="6"
                placeholder="**1. Évaluation :** ...&#10;**2. Traitement :** ..."
              ></textarea>
            </div>

            <div class="form-group">
              <label for="new-cat-ordonnance">Ordonnance Type</label>
              <textarea
                id="new-cat-ordonnance"
                v-model="form.ordonnance"
                rows="5"
                placeholder="1. Amoxicilline 1g...&#10;2. Paracétamol 1g..."
              ></textarea>
            </div>

            <div class="form-group">
              <label for="new-cat-pdf-keywords">Mots-clés pour l'association des PDFs (ex: Gastro, Pediatrie...)</label>
              <input
                id="new-cat-pdf-keywords"
                v-model="form.pdf_keywords"
                type="text"
                placeholder="Mots clés séparés par des virgules"
              />
            </div>

            <div class="modal-footer">
              <button type="button" class="cancel-btn" @click="close">
                Annuler
              </button>
              <button
                type="submit"
                class="save-btn"
                :disabled="isSubmitting"
              >
                <i v-if="isSubmitting" class="fa-solid fa-spinner fa-spin"></i>
                {{ isSubmitting ? 'Enregistrement...' : 'Ajouter la fiche' }}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </Transition>
</template>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
