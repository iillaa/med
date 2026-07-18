<script setup lang="ts">
import { ref, computed, watch, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { useCatsStore } from '@/stores/cats'
import { useAppStore } from '@/stores/app'
import { useQuizStore } from '@/stores/quiz'
import { parseSummaryMarkdown, buildPrintableText } from '@/utils/markdown'
import { fetchSearchStatus } from '@/api/client'

const route = useRoute()
const catsStore = useCatsStore()
const appStore = useAppStore()
const quizStore = useQuizStore()

const catId = computed(() => Number(route.params.id))
const cat = computed(() => catsStore.cats.find(c => c.id === catId.value))

const notes = ref('')
const saveStatus = ref<'idle' | 'saving' | 'saved'>('idle')
const activeTab = ref('summary')
const isRedFlagsExpanded = ref(false)
const activePrescriptionVariantIndex = ref(0)
const isEditingSummary = ref(false)
const editSummaryText = ref('')
const isEditingPrescription = ref(false)
const editPrescriptionText = ref('')
const pdfSearchQuery = ref('')
const pdfSearchQueryInput = ref('')
const pdfSearchLoading = ref(false)
const pdfSearchResults = ref<any[]>([])

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
  isEditingSummary.value = false
  if (newId) catsStore.markAsRead(newId)
}, { immediate: true })

const showBackToQuiz = computed(() => {
  return cat.value && quizStore.quizViewingCatId === cat.value.id
})

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

async function printCat() {
  if (!cat.value) return
  const dateEl = document.getElementById('print-date-stamp')
  if (dateEl) dateEl.textContent = 'Le : ' + new Date().toLocaleDateString('fr-FR')

  const catVal = document.getElementById('print-val-category')
  const titleVal = document.getElementById('print-val-title')
  const redFlagsVal = document.getElementById('print-val-redflags')
  const summaryVal = document.getElementById('print-val-summary')
  const prescriptionVal = document.getElementById('print-val-prescription')
  const notesVal = document.getElementById('print-val-notes')

  if (catVal) catVal.textContent = cat.value.category
  if (titleVal) titleVal.textContent = `${cat.value.id}. ${cat.value.title}`

  const rfSec = document.getElementById('print-section-redflags')
  if (cat.value.red_flags && cat.value.red_flags.trim().length > 0) {
    if (redFlagsVal) redFlagsVal.textContent = cat.value.red_flags
    if (rfSec) rfSec.style.display = 'block'
  } else {
    if (rfSec) rfSec.style.display = 'none'
  }

  if (summaryVal) {
    const rawText = cat.value.customSummary || cat.value.summary
    summaryVal.innerHTML = parseSummaryMarkdown(rawText)
  }

  const presSec = document.getElementById('print-section-prescription')
  if (cat.value.ordonnance && cat.value.ordonnance.trim().length > 0) {
    if (prescriptionVal) prescriptionVal.textContent = cat.value.ordonnance
    if (presSec) presSec.style.display = 'block'
  } else {
    if (presSec) presSec.style.display = 'none'
  }

  const notesSec = document.getElementById('print-section-notes')
  if (cat.value.notes && cat.value.notes.trim().length > 0) {
    if (notesVal) notesVal.textContent = cat.value.notes
    if (notesSec) notesSec.style.display = 'block'
  } else {
    if (notesSec) notesSec.style.display = 'none'
  }

  if (typeof window.Capacitor !== 'undefined' || (window as any).__drCatIsOffline) {
    const text = buildPrintableText(cat.value)
    if (navigator.clipboard && navigator.clipboard.writeText) {
      try {
        await navigator.clipboard.writeText(text)
        appStore.showToast("Texte copié dans le presse-papier. Vous pouvez le coller ailleurs.", "fa-clipboard-check", 4000)
      } catch (_) {
        appStore.showToast("L'impression native n'est pas disponible. Utilisez la version web.", "fa-circle-info", 5000)
      }
    } else {
      appStore.showToast("L'impression native n'est pas disponible. Utilisez la version web.", "fa-circle-info", 5000)
    }
  } else {
    window.print()
  }
}

function backToQuiz() {
  const quizStore = useQuizStore()
  quizStore.setQuizViewingCatId(null)
  // Navigate back to quiz route
  window.location.hash = '#/quiz'
}

async function deleteCat() {
  if (!cat.value) return
  if (cat.value.id <= 55) {
    appStore.showToast("Impossible de supprimer les fiches de base (IDs 1-55).", "fa-circle-exclamation", 4000)
    return
  }
  if (!appStore.isAdmin) {
    appStore.showToast("Action refusée. Seul l'administrateur peut supprimer des fiches.", "fa-circle-exclamation", 4000)
    return
  }
  if (confirm(`Voulez-vous vraiment supprimer la fiche "${cat.value.title}" ? Cette action est irréversible.`)) {
    try {
      await catsStore.deleteCat(cat.value.id)
      appStore.showToast("Fiche supprimée avec succès !", "fa-circle-check", 3000)
    } catch (err) {
      console.error(err)
      appStore.showToast("Erreur lors de la suppression.", "fa-circle-exclamation", 4000)
    }
  }
}

function startEditSummary() {
  if (!cat.value) return
  editSummaryText.value = cat.value.customSummary || cat.value.summary || ''
  isEditingSummary.value = true
}

function cancelEditSummary() {
  isEditingSummary.value = false
  editSummaryText.value = ''
}

async function saveSummaryEdit() {
  if (!cat.value) return
  const newSummary = editSummaryText.value.trim()
  if (!newSummary) {
    appStore.showToast("La synthèse ne peut pas être vide.", "fa-triangle-exclamation", 3000)
    return
  }

  try {
    if (appStore.isAdmin) {
      await catsStore.updateSummary(cat.value.id, newSummary)
      appStore.showToast("Synthèse mise à jour avec succès !", "fa-circle-check", 2500)
    } else {
      const confirmSave = confirm(
        "Attention : Vos modifications ne seront pas appliquées directement dans l'application. Elles seront envoyées à l'administrateur du site pour relecture et validation avant d'être intégrées.\n\nSouhaitez-vous envoyer cette proposition ?"
      )
      if (!confirmSave) return

      const { submitSuggestion } = await import('@/api/client')
      await submitSuggestion({
        type: 'edit',
        catId: cat.value.id,
        data: { summary: newSummary }
      })
      appStore.showToast("Votre proposition de modification a été envoyée à l'administrateur pour validation.", "fa-circle-check", 4000)
    }
    isEditingSummary.value = false
  } catch (err) {
    console.error(err)
    appStore.showToast("Erreur lors de la sauvegarde.", "fa-circle-exclamation", 4000)
  }
}

async function setStatus(status: 'todo' | 'doing' | 'done'): Promise<void> {
  if (!cat.value) return
  await catsStore.updateStatus(cat.value.id, status)

  // Milestone toast for 20 active CATs
  if (status === 'doing' || status === 'done') {
    const progress = catsStore.cats.filter(c => c.status === 'doing' || c.status === 'done').length
    if (progress === 20) {
      appStore.showToast(
        '<strong>Beau travail, 20 fiches en cours ! 🎉</strong><br>Pensez à exporter votre progression via le tableau de bord pour ne rien perdre.',
        'fa-floppy-disk',
        8000
      )
    }
  }
}

function startEditPrescription() {
  if (!cat.value) return
  editPrescriptionText.value = cat.value.customOrdonnance || cat.value.ordonnance || ''
  isEditingPrescription.value = true
}

function cancelEditPrescription() {
  isEditingPrescription.value = false
  editPrescriptionText.value = ''
}

async function savePrescriptionEdit() {
  if (!cat.value) return
  const newOrdonnance = editPrescriptionText.value.trim()
  if (!newOrdonnance) {
    appStore.showToast("L'ordonnance ne peut pas être vide.", "fa-triangle-exclamation", 3000)
    return
  }

  try {
    if (appStore.isAdmin) {
      await catsStore.updateOrdonnance(cat.value.id, newOrdonnance)
      appStore.showToast("Ordonnance type mise à jour avec succès !", "fa-circle-check", 2500)
    } else {
      const confirmSave = confirm(
        "Attention : Vos modifications ne seront pas appliquées directement dans l'application. Elles seront envoyées à l'administrateur du site pour relecture et validation avant d'être intégrées.\n\nSouhaitez-vous envoyer cette proposition ?"
      )
      if (!confirmSave) return

      const { submitSuggestion } = await import('@/api/client')
      await submitSuggestion({
        type: 'edit',
        catId: cat.value.id,
        data: { ordonnance: newOrdonnance }
      })
      appStore.showToast("Votre proposition de modification de l'ordonnance a été envoyée à l'administrateur pour validation.", "fa-circle-check", 4000)
    }
    isEditingPrescription.value = false
  } catch (err) {
    console.error(err)
    appStore.showToast("Erreur lors de la sauvegarde.", "fa-circle-exclamation", 4000)
  }
}

function loadRelatedPdfs(cat: Cat) {
  const pdfListContainer = document.getElementById('pdf-list')
  if (!pdfListContainer) return
  pdfListContainer.innerHTML = ''

  const keywords = cat.pdf_keywords || []

  const matchedFiles = catsStore.allPdfs.filter(filename => {
    const lowerName = filename.toLowerCase()
    const isGlobal = ["abouimed", "kacem", "boughoufala", "150 ordonnances", "pathognomoniques", "autres cat", "formes d_administration", "jeûne"].some(g => lowerName.includes(g))
    if (isGlobal) return false
    return keywords.some(kw => lowerName.includes(kw.toLowerCase()))
  })

  const globalFiles = catsStore.allPdfs.filter(filename => {
    const lowerName = filename.toLowerCase()
    return ["abouimed", "kacem", "boughoufala", "150 ordonnances", "pathognomoniques", "autres cat", "formes d_administration", "jeûne"].some(g => lowerName.includes(g))
  })

  const specificHeader = document.createElement('h4')
  specificHeader.style.gridColumn = '1 / -1'
  specificHeader.style.color = 'var(--color-primary)'
  specificHeader.style.margin = '10px 0 5px'
  specificHeader.style.fontSize = '14px'
  specificHeader.style.fontWeight = '600'
  specificHeader.innerHTML = '<i class="fa-solid fa-graduation-cap"></i> Cours & Références Spécifiques'
  pdfListContainer.appendChild(specificHeader)

  if (matchedFiles.length === 0) {
    const emptyP = document.createElement('p')
    emptyP.className = 'text-muted'
    emptyP.style.gridColumn = '1 / -1'
    emptyP.style.fontSize = '13px'
    emptyP.style.margin = '5px 0 15px'
    emptyP.textContent = 'Aucun PDF de spécialité spécifique trouvé pour ce sujet dans vos fichiers.'
    pdfListContainer.appendChild(emptyP)
  } else {
    matchedFiles.forEach(file => {
      pdfListContainer.appendChild(createPdfCardElement(file, false))
    })
  }

  const globalHeader = document.createElement('h4')
  globalHeader.style.gridColumn = '1 / -1'
  globalHeader.style.color = 'var(--color-success)'
  globalHeader.style.margin = '20px 0 5px'
  globalHeader.style.fontSize = '14px'
  globalHeader.style.fontWeight = '600'
  globalHeader.innerHTML = '<i class="fa-solid fa-book-medical"></i> Manuels & Guides Généraux (Tous sujets)'
  pdfListContainer.appendChild(globalHeader)

  if (globalFiles.length === 0) {
    const emptyG = document.createElement('p')
    emptyG.className = 'text-muted'
    emptyG.style.gridColumn = '1 / -1'
    emptyG.style.fontSize = '13px'
    emptyG.style.margin = '5px 0 15px'
    emptyG.textContent = 'Aucun manuel général trouvé dans vos fichiers.'
    pdfListContainer.appendChild(emptyG)
  } else {
    globalFiles.forEach(file => {
      pdfListContainer.appendChild(createPdfCardElement(file, true))
    })
  }
}

function createPdfCardElement(file: string, isGlobal: boolean): HTMLElement {
  const cleanName = file.replace(/^\d+_/, '').replace(/_/g, ' ').replace(/\.pdf$/i, '')
  const card = document.createElement('a')
  const isDocx = file.toLowerCase().endsWith('.docx')
  card.href = isDocx ? `pdfs/${encodeURIComponent(file)}` : `pdf_viewer.html?file=${encodeURIComponent(file)}&page=1`
  if (isDocx) card.target = '_blank'
  card.className = 'pdf-card'

  const iconClass = isDocx ? 'fa-regular fa-file-word text-primary' : (isGlobal ? 'fa-solid fa-book-open-reader' : 'fa-solid fa-file-pdf')
  const statusInfo = catsStore.pdfIndexStatus[file] || { status: 'red', pagesWithText: 0, totalPages: 0 }
  const dotColor = isDocx ? '#ef4444' : (statusInfo.status === 'green' ? '#10b981' : (statusInfo.status === 'orange' ? '#f59e0b' : '#ef4444'))
  const dotTitle = isDocx
    ? "Document Word (Non indexable, convertissez en PDF pour la recherche)"
    : (statusInfo.status === 'green'
      ? `Indexation complète (${statusInfo.pagesWithText}/${statusInfo.totalPages} pages indexées)`
      : (statusInfo.status === 'orange'
        ? `Indexation partielle (${statusInfo.pagesWithText}/${statusInfo.totalPages} pages indexées)`
        : `Non indexable (0/${statusInfo.totalPages} pages, PDF scanné sans texte)`))

  card.innerHTML = `
    <i class="${iconClass}" style="${isGlobal && !isDocx ? 'color: var(--color-success);' : ''}"></i>
    <div style="flex-grow: 1; min-width: 0;">
      <h4 style="display: flex; align-items: center; justify-content: space-between; gap: 8px; width: 100%; margin: 0;">
        <span style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${cleanName}</span>
        <span class="pdf-status-dot" style="width: 7px; height: 7px; background-color: ${dotColor}; border-radius: 50%; display: inline-block; flex-shrink: 0;" title="${dotTitle}"></span>
      </h4>
      <span>${isDocx ? 'Document Word' : (isGlobal ? 'Ouvrir le manuel général' : 'Ouvrir le cours PDF')}</span>
    </div>
  `

  const dot = card.querySelector('.pdf-status-dot')
  if (dot) {
    dot.addEventListener('click', (e) => {
      e.preventDefault()
      e.stopPropagation()
      appStore.showToast(dotTitle, "fa-circle-info", 4000)
    })
  }

  return card
}

async function performPdfSearch() {
  const input = document.getElementById('pdf-content-search-input')
  const loadingEl = document.getElementById('pdf-search-loading')
  const resultsContainer = document.getElementById('pdf-search-results-container')
  if (!input || !loadingEl || !resultsContainer) return
  const query = input.value.trim()
  if (!query) return

  pdfSearchLoading.value = true
  loadingEl.style.display = 'flex'
  resultsContainer.innerHTML = ''

  try {
    const { searchPdfsContent } = await import('@/api/client')
    const response = await searchPdfsContent(query)
    const data = await response.json()
    const results = data.results || []

    if (!results || results.length === 0) {
      resultsContainer.innerHTML = `<p class="text-muted text-center" style="margin-top: 30px;">Aucun résultat trouvé pour "${query}". Vérifiez l'orthographe.</p>`
      return
    }

    let resultsHtml = ''
    results.forEach(res => {
      const escapedSnippet = res.snippet.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
      const escapedQuery = query.replace(/[-\\^$*+?.()|[\]{}]/g, '\\$&')
      const regex = new RegExp(`(${escapedQuery})`, 'gi')
      const highlightedSnippet = escapedSnippet.replace(regex, '<mark>$1</mark>')

      const displayTitle = res.pdf.replace(/^\d+_/i, '').replace(/_/g, ' ').replace(/\.pdf$/i, '')

      resultsHtml += `
        <div class="pdf-search-result-card" data-pdf="${encodeURIComponent(res.pdf)}" data-page="${res.page}">
          <div class="pdf-search-result-header">
            <span class="pdf-search-result-title"><i class="fa-solid fa-file-pdf"></i> ${displayTitle}</span>
            <span class="pdf-search-result-page">Page ${res.page}</span>
          </div>
          <div class="pdf-search-result-snippet">${highlightedSnippet}</div>
        </div>
      `
    })

    resultsContainer.innerHTML = resultsHtml

    resultsContainer.querySelectorAll('.pdf-search-result-card').forEach(card => {
      card.addEventListener('click', () => {
        const pdfFile = decodeURIComponent(card.getAttribute('data-pdf') || '')
        const page = card.getAttribute('data-page')
        window.location.href = `pdf_viewer.html?file=${encodeURIComponent(pdfFile)}&page=${page}`
      })
    })
  } catch (err) {
    console.error("PDF search error:", err)
    resultsContainer.innerHTML = '<p class="text-danger text-center" style="margin-top: 20px;">Une erreur est survenue lors de la recherche.</p>'
  } finally {
    pdfSearchLoading.value = false
    loadingEl.style.display = 'none'
  }
}

async function triggerPdfReindex() {
  try {
    const { triggerReindexing } = await import('@/api/client')
    const data = await triggerReindexing()
    if (data.success) {
      appStore.showToast("Ré-indexation lancée avec succès !", "fa-circle-check", 3000)
      updatePdfIndexStatus()
    }
  } catch (err) {
    console.error("Failed to trigger re-index:", err)
    appStore.showToast("Erreur lors de la réindexation.", "fa-circle-exclamation", 4000)
  }
}

async function updatePdfIndexStatus() {
  try {
    const status = await fetchSearchStatus()
    const statusEl = document.getElementById('pdf-index-status')
    if (!statusEl) return
    const statusTextEl = statusEl.querySelector('.status-text')
    if (statusTextEl) {
      if (status.isIndexing) {
        statusTextEl.innerHTML = `<span class="status-text text-warning"><i class="fa-solid fa-circle-notch fa-spin"></i> Indexation en cours... (${status.indexedFiles}/${status.totalFiles} fichiers)</span>`
        setTimeout(updatePdfIndexStatus, 2000)
      } else {
        statusTextEl.innerHTML = `<span class="status-text text-success"><i class="fa-solid fa-circle-check"></i> Indexation terminée (${status.indexedFiles}/${status.totalFiles} fichiers indexés)</span>`
      }
    }
  } catch (err) {
    console.error("Failed to fetch index status:", err)
  }
}

onMounted(() => {
  loadRelatedPdfs(cat.value || catsStore.cats[0])
  updatePdfIndexStatus()
})
</script>

<template>
  <div class="workspace animate-entrance" v-if="cat" :key="cat.id" style="display: flex; flex-direction: column; height: 100%;">
    <!-- Header panel -->
    <div class="workspace-header">
      <div class="title-area">
        <div class="title-header-row">
          <div style="display: flex; align-items: center; gap: 10px;">
            <span class="cat-badge" id="workspace-cat-category" style="margin-bottom: 0;">{{ cat.category }}</span>
            <button v-if="showBackToQuiz" class="action-btn" style="display: inline-flex; padding: 4px 10px; font-size: 11px; font-weight: 700; align-items: center; gap: 4px; background: linear-gradient(135deg, var(--color-primary), #10b981) !important; color: #000 !important; border: none; border-radius: var(--radius-sm);" @click="backToQuiz">
              <i class="fa-solid fa-arrow-left-long"></i> Retour au Quiz
            </button>
          </div>
          <div class="workspace-header-actions">
            <button class="action-btn print-compact-btn" title="Imprimer la fiche" @click="printCat">
              <i class="fa-solid fa-print"></i>
            </button>
            <button v-if="cat.id > 55 && appStore.isAdmin" id="delete-cat-btn" class="btn-delete-ghost" @click="deleteCat">
              <i class="fa-solid fa-trash-can"></i> Supprimer la fiche
            </button>
          </div>
        </div>
        <h1 id="workspace-cat-title">{{ cat.id }}. {{ cat.title }}</h1>
      </div>

      <div class="status-selector-area">
        <span class="status-label">Statut :</span>
        <div class="status-btn-group">
          <button class="status-btn btn-todo" :class="{ active: cat.status === 'todo' || !cat.status }" @click="setStatus('todo')" title="À réviser">
            <i class="fa-regular fa-circle"></i> <span>À faire</span>
          </button>
          <button class="status-btn btn-doing" :class="{ active: cat.status === 'doing' }" @click="setStatus('doing')" title="En cours de révision">
            <i class="fa-solid fa-spinner"></i> <span>En cours</span>
          </button>
          <button class="status-btn btn-done" :class="{ active: cat.status === 'done' }" @click="setStatus('done')" title="Maîtrisé">
            <i class="fa-solid fa-circle-check"></i> <span>Maîtrisé</span>
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
        <i class="fa-solid fa-triangle-exclamation"></i>
        <span>SIGNES DE GRAVITÉ / RED FLAGS</span>
      </div>
      <div id="workspace-red-flags">{{ cat.red_flags }}</div>
    </div>

    <!-- Tabs Nav -->
    <nav class="tabs-nav">
      <button class="tab-btn" :class="{ active: activeTab === 'summary' }" @click="activeTab = 'summary'">
        <i class="fa-solid fa-file-invoice-document"></i> Fiche de Synthèse
      </button>
      <button class="tab-btn" :class="{ active: activeTab === 'notes' }" @click="activeTab = 'notes'">
        <i class="fa-solid fa-clipboard-question"></i> Notes Personnelles
      </button>
      <button class="tab-btn" :class="{ active: activeTab === 'prescription' }" @click="activeTab = 'prescription'">
        <i class="fa-solid fa-prescription-bottle-medical"></i> Ordonnance Type
      </button>
      <button class="tab-btn" :class="{ active: activeTab === 'pdfs' }" @click="activeTab = 'pdfs'">
        <i class="fa-solid fa-folder-open"></i> PDFs de Référence
      </button>
      <button class="tab-btn" :class="{ active: activeTab === 'pdf-search' }" @click="activeTab = 'pdf-search'">
        <i class="fa-solid fa-magnifying-glass"></i> Recherche PDF
      </button>
    </nav>

    <!-- Tabs Content -->
    <div class="tab-content-container">
      <!-- Tab: Summary -->
      <div v-show="activeTab === 'summary'" class="tab-pane" :class="{ active: activeTab === 'summary' }">
        <div class="pane-header">
          <h3><i class="fa-solid fa-shield-halved"></i> Conduite Pratique<span class="desktop-only-inline"> Recommandée</span></h3>
          <button class="action-btn edit-summary-btn" id="edit-summary-btn" @click="startEditSummary" v-if="!isEditingSummary">
            <i class="fa-solid fa-pen"></i> Modifier<span class="desktop-only-inline"> la fiche</span>
          </button>
        </div>

        <div v-if="!isEditingSummary" class="summary-view" id="summary-view" v-html="renderedSummary"></div>

        <div v-else class="summary-editor-wrapper" id="summary-editor-wrapper">
          <textarea id="summary-editor" v-model="editSummaryText" rows="18" placeholder="Rédiger votre propre synthèse..."></textarea>
          <div class="editor-actions">
            <button class="cancel-btn" id="cancel-summary-edit-btn" @click="cancelEditSummary">Annuler</button>
            <button class="save-btn" id="save-summary-btn" @click="saveSummaryEdit">Enregistrer</button>
          </div>
        </div>
      </div>

      <!-- Tab: Notes -->
      <div v-show="activeTab === 'notes'" class="tab-pane" :class="{ active: activeTab === 'notes' }">
        <div class="pane-header">
          <h3><i class="fa-solid fa-notes-medical"></i> Mes Observations<span class="desktop-only-inline"> & Protocoles Locaux</span></h3>
        </div>
        <p class="tab-instruction">Prenez vos notes personnelles, observations cliniques ou ajustements ici. Elles sont sauvegardées localement.</p>
        <textarea class="notes-textarea" id="notes-input" v-model="notes" placeholder="Saisir vos notes ici..."></textarea>
        <div class="pane-footer" style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px; width: 100%;">
          <div style="display: flex; flex-direction: column; gap: 4px; flex: 1; min-width: 200px;">
            <span class="save-indicator" id="save-indicator" :class="{ show: saveStatus === 'saved' }"><i class="fa-solid fa-cloud-arrow-up"></i> Changements enregistrés</span>
            <span style="font-size: 11px; color: var(--text-muted); display: block;"><i class="fa-solid fa-circle-info"></i> Notes stockées localement. Utilisez l'export du tableau de bord pour les sauvegarder.</span>
          </div>
          <button class="save-btn" id="save-notes-btn" style="margin-left: auto;" @click="saveNotes" :disabled="saveStatus === 'saving'">
            <i class="fa-solid fa-floppy-disk"></i> {{ saveStatus === 'saving' ? 'Sauvegarde...' : saveStatus === 'saved' ? 'Sauvegardé ✓' : 'Sauvegarder' }}
          </button>
        </div>
      </div>

      <!-- Tab: Prescription -->
      <div v-show="activeTab === 'prescription'" class="tab-pane" :class="{ active: activeTab === 'prescription' }">
        <div class="pane-header" style="margin-bottom: 12px;">
          <h3 style="font-size: 13.5px; margin: 0; color: var(--text-secondary);"><i class="fa-solid fa-file-prescription"></i> <span class="desktop-only-inline">Exemple d'</span>Ordonnance Type</h3>
          <div style="display: flex; gap: 8px;">
            <button class="action-btn" id="edit-prescription-btn" @click="startEditPrescription" v-if="!isEditingPrescription">
              <i class="fa-solid fa-pen"></i> Modifier<span class="desktop-only-inline"> l'ordonnance</span>
            </button>
            <button class="action-btn copy-prescription-btn" id="copy-prescription-btn" @click="copyPrescription" title="Copier dans le presse-papier">
              <i class="fa-regular fa-copy"></i> Copier
            </button>
          </div>
        </div>

        <!-- Prescription Variants Selector -->
        <div v-if="prescriptionVariants.length > 1" id="prescription-variants-selector" class="prescription-variants-selector" style="display: flex; flex-wrap: wrap; gap: 8px; margin-bottom: 12px; padding: 0 4px;">
          <button v-for="(variant, idx) in prescriptionVariants" :key="idx" class="status-pill" :class="{ active: idx === activePrescriptionVariantIndex }" style="font-size: 11px; padding: 4px 10px;" @click="activePrescriptionVariantIndex = idx">
            {{ variant.title }}
          </button>
        </div>

        <div class="prescription-container" id="prescription-container">
          <div v-if="!isEditingPrescription">
            <div class="prescription-header">
              <div class="clinic-info">
                <strong>Cabinet Médical de Médecine Générale</strong>
                <span>Alger, Algérie</span>
              </div>
              <div class="date-placeholder">Le: <span id="current-date">{{ currentDate }}</span></div>
            </div>
            <div class="prescription-body">
              <div class="patient-line">Nom, Prénom : .................................................... Âge : ............</div>
              <div class="prescription-content" id="workspace-prescription">
                {{ prescriptionVariants[activePrescriptionVariantIndex]?.content || cat.ordonnance || 'Aucun modèle d\'ordonnance type disponible pour cette fiche.' }}
              </div>
            </div>
            <div class="prescription-footer">
              <span>Signature et Cachet</span>
            </div>
          </div>
          <div v-else>
            <textarea id="prescription-editor" v-model="editPrescriptionText" class="notes-textarea" style="display: block; background: #fff; color: #000; border-color: #cbd5e1; font-family: monospace; font-size: 14.5px; font-weight: bold; margin-top: 10px; resize: none;" rows="12"></textarea>
            <div id="prescription-editor-actions" style="display: flex; justify-content: flex-end; gap: 10px; margin-top: 10px;">
              <button class="cancel-btn" id="cancel-prescription-edit-btn" style="border-color: #cbd5e1; color: #475569;" @click="cancelEditPrescription">Annuler</button>
              <button class="save-btn" id="save-prescription-btn" @click="savePrescriptionEdit">Enregistrer</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Tab: PDFs -->
      <div v-show="activeTab === 'pdfs'" class="tab-pane" :class="{ active: activeTab === 'pdfs' }">
        <div class="pane-header">
          <h3><i class="fa-solid fa-file-pdf"></i> Documents<span class="desktop-only-inline"> Médicaux</span> de Référence</h3>
        </div>
        <p class="tab-instruction">Voici les cours et documents PDF de votre dossier de référence correspondant à cette spécialité :</p>
        <div class="pdf-list" id="pdf-list">
          <!-- Dynamically populated -->
        </div>

        <div class="all-pdfs-accordion">
          <div class="accordion-header" id="all-pdfs-header">
            <span><i class="fa-solid fa-search"></i> Parcourir tous les PDFs disponibles</span>
            <i class="fa-solid fa-chevron-down accordion-icon"></i>
          </div>
          <div class="accordion-content" id="all-pdfs-content" style="display: none;">
            <input type="text" id="pdf-search" placeholder="Filtrer parmi les 78 fichiers PDF..." v-model="pdfSearchQuery">
            <ul class="all-pdfs-list" id="all-pdfs-list">
              <!-- List of all PDFs -->
            </ul>
          </div>
        </div>
      </div>

      <!-- Tab: PDF Search -->
      <div v-show="activeTab === 'pdf-search'" class="tab-pane" :class="{ active: activeTab === 'pdf-search' }">
        <div class="pane-header">
          <h3><i class="fa-solid fa-magnifying-glass"></i> Recherche Globale<span class="desktop-only-inline"> dans le texte des PDFs</span></h3>
        </div>
        <p class="tab-instruction">Saisissez un mot-clé (médicament, posologie, symptôme) pour fouiller dans le texte complet de vos 78 livres et guides de référence.</p>

        <div class="pdf-search-box">
          <div class="search-input-wrapper">
            <input type="text" id="pdf-content-search-input" placeholder="Rechercher un mot (ex: Amoxicilline, Asthme, Céphalée)..." v-model="pdfSearchQueryInput">
            <button id="pdf-content-search-btn" class="btn btn-primary" @click="performPdfSearch"><i class="fa-solid fa-magnifying-glass"></i> <span class="desktop-only-inline">Rechercher</span></button>
          </div>

          <div class="index-status-indicator" id="pdf-index-status">
            <span class="status-text"><i class="fa-solid fa-circle-notch fa-spin"></i> Chargement du statut d'indexation...</span>
            <button id="pdf-reindex-btn" class="btn-text" title="Forcer la ré-indexation de tous les PDFs" @click="triggerPdfReindex"><i class="fa-solid fa-rotate"></i> Ré-indexer</button>
          </div>
        </div>

        <div class="pdf-search-loading" id="pdf-search-loading" style="display: none;">
          <div class="spinner"></div>
          <span>Recherche en cours dans vos documents (cela peut prendre quelques secondes)...</span>
        </div>

        <div class="pdf-search-results" id="pdf-search-results-container">
          <p class="text-muted text-center" style="margin-top: 30px;">Entrez un terme de recherche ci-dessus pour commencer.</p>
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
