<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useCatsStore } from '@/stores/cats'
import { useAppStore } from '@/stores/app'
import { getStreakInfo } from '@/stores/cats'
import SkeletonLoader from '@/components/Common/SkeletonLoader.vue'

const router = useRouter()
const catsStore = useCatsStore()
const appStore = useAppStore()

const resumeCats = computed(() =>
  catsStore.cats
    .filter(c => c.status === 'doing' || c.status === 'done')
    .sort((a, b) => (b.lastRead || 0) - (a.lastRead || 0))
    .slice(0, 3)
)

const streakInfo = computed(() => getStreakInfo())

const specialtyProgress = computed(() => {
  const map = new Map<string, { total: number; done: number }>()
  catsStore.cats.forEach(cat => {
    const entry = map.get(cat.category) || { total: 0, done: 0 }
    entry.total++
    if (cat.status === 'done') entry.done++
    map.set(cat.category, entry)
  })
  return Array.from(map.entries())
    .map(([name, info]) => ({
      name,
      ...info,
      percent: info.total > 0 ? Math.round((info.done / info.total) * 100) : 0
    }))
    .sort((a, b) => b.total - a.total)
})

const isAdmin = computed(() => appStore.isAdmin)
const suggestions = computed(() => appStore.suggestions)
const categories = computed(() => catsStore.categories)

const activeAdminTab = ref<'suggestions' | 'diagnostics' | 'performance'>('suggestions')
const isAboutExpanded = ref(false)

// Bulk import state
const bulkImportFile = ref<File | null>(null)
const bulkImportLoading = ref(false)

// Export specialty state
const exportSpecialty = ref('')

onMounted(async () => {
  if (isAdmin.value) {
    await appStore.loadSuggestions()
  }
})

function goToWorkspace(id: number): void {
  router.push(`/workspace/${id}`)
}

async function updateStatus(id: number, status: 'todo' | 'done'): Promise<void> {
  await catsStore.updateStatus(id, status)
}

function exportProgress(): void {
  const progressData = localStorage.getItem('dr_cat_user_progress')
  if (!progressData || progressData === '{}') {
    appStore.showToast("Aucune progression enregistrée à exporter.", "fa-circle-exclamation", 3000)
    return
  }

  const fileName = `drcat-progression-${new Date().toISOString().slice(0, 10)}.json`
  const blob = new Blob([progressData], { type: 'application/json' })
  const url = URL.createObjectURL(blob)
  const a = document.createElement('a')
  a.href = url
  a.download = fileName
  a.click()
  URL.revokeObjectURL(url)
  appStore.showToast("Progression exportée avec succès !", "fa-circle-check", 3000)
}

function importProgress(event: Event): void {
  const input = event.target as HTMLInputElement
  const file = input.files?.[0]
  if (!file) return

  const reader = new FileReader()
  reader.onload = (e) => {
    try {
      const importedData = JSON.parse(e.target?.result as string)
      const keys = Object.keys(importedData)
      if (keys.length > 0 && typeof importedData[keys[0]] === 'object') {
        localStorage.setItem('dr_cat_user_progress', JSON.stringify(importedData))
        appStore.showToast("Progression importée avec succès ! L'application va se recharger.", "fa-circle-check", 4000)
        setTimeout(() => window.location.reload(), 1500)
      } else {
        appStore.showToast("Format de fichier invalide.", "fa-circle-exclamation", 4000)
      }
    } catch (err) {
      console.error(err)
      appStore.showToast("Erreur lors de la lecture du fichier d'importation.", "fa-circle-exclamation", 4000)
    }
  }
  reader.readAsText(file)
}

function onBulkImportFileChange(event: Event): void {
  const input = event.target as HTMLInputElement
  const file = input.files?.[0]
  bulkImportFile.value = file || null
}

async function submitBulkImport(): Promise<void> {
  if (!bulkImportFile.value) return

  bulkImportLoading.value = true
  try {
    const text = await bulkImportFile.value.text()
    const parsed = JSON.parse(text)
    if (!Array.isArray(parsed)) {
      throw new Error("Le fichier JSON doit contenir un tableau de fiches.")
    }
    await appStore.performBulkImport(parsed)
    bulkImportFile.value = null
    // Reset file input
    const input = document.getElementById('admin-bulk-import-input') as HTMLInputElement
    if (input) input.value = ''
  } catch (err) {
    console.error(err)
    appStore.showToast("Erreur lors de l'importation groupée.", 'fa-circle-exclamation', 4000)
  } finally {
    bulkImportLoading.value = false
  }
}

function exportSpecialtyData(): void {
  if (!exportSpecialty.value) {
    appStore.showToast("Veuillez sélectionner une spécialité.", "fa-triangle-exclamation", 3000)
    return
  }

  const list = catsStore.cats
    .filter(c => c.category === exportSpecialty.value)
    .map(c => ({
      category: c.category,
      title: c.title,
      summary: c.summary,
      red_flags: c.red_flags,
      ordonnance: c.ordonnance,
      pdf_keywords: c.pdf_keywords || []
    }))

  const blob = new Blob([JSON.stringify(list, null, 2)], { type: 'application/json' })
  const url = URL.createObjectURL(blob)
  const a = document.createElement('a')
  a.href = url
  a.download = `Fiches_DrCAT_${exportSpecialty.value.replace(/\s+/g, '_')}.json`
  a.click()
  URL.revokeObjectURL(url)
  appStore.showToast(`Exportation réussie de ${list.length} fiches !`, "fa-circle-check", 3000)
}

async function approveSuggestion(id: string): Promise<void> {
  await appStore.approveSuggestion(id)
}

async function rejectSuggestion(id: string): Promise<void> {
  await appStore.rejectSuggestion(id)
}

function toggleAboutLegal(): void {
  isAboutExpanded.value = !isAboutExpanded.value
}
</script>

<template>
  <div class="dashboard">
    <h1 class="dashboard-title">Dashboard</h1>

    <!-- Header actions -->
    <div class="dashboard-header-actions" style="display: flex; gap: 8px; flex-wrap: wrap; margin-bottom: 20px; align-items: center;">
      <div class="specialty-export-container" v-if="categories.length > 0" style="display: flex; align-items: center; gap: 6px; background: var(--bg-card); border: 1px solid var(--border-color); padding: 4px 8px; border-radius: var(--radius-md);">
        <select v-model="exportSpecialty" style="background: none; border: none; color: var(--text-primary); font-size: 11.5px; outline: none; cursor: pointer; padding: 4px; max-width: 160px;">
          <option value="">Spécialité...</option>
          <option v-for="cat in categories" :key="cat" :value="cat">{{ cat }}</option>
        </select>
        <button class="action-btn" @click="exportSpecialtyData" style="font-size: 11px; padding: 4px 8px; border: none; background: rgba(6,182,212,0.1); color: var(--color-primary); cursor: pointer; display: flex; align-items: center; gap: 4px; border-radius: 4px; font-weight: 600;">
          <i class="fa-solid fa-file-export"></i> Exporter
        </button>
      </div>

      <button class="action-btn" @click="exportProgress" style="font-size: 12px; padding: 6px 12px; display: flex; align-items: center; gap: 6px; background-color: var(--bg-card); border-color: var(--border-color); color: var(--text-primary);">
        <i class="fa-solid fa-download"></i> Exporter Progrès
      </button>

      <button class="action-btn" @click="$refs.importProgressFile.click()" style="font-size: 12px; padding: 6px 12px; display: flex; align-items: center; gap: 6px; background-color: var(--bg-card); border-color: var(--border-color); color: var(--text-primary);">
        <i class="fa-solid fa-upload"></i> Importer Progrès
      </button>
      <input type="file" ref="importProgressFile" accept=".json" style="display: none;" @change="importProgress">

      <button class="action-btn" @click="$refs.bulkImportFile.click()" style="font-size: 12px; padding: 6px 12px; display: flex; align-items: center; gap: 6px; background-color: var(--bg-card); border-color: var(--border-color); color: var(--text-primary);">
        <i class="fa-solid fa-file-import"></i> Import Groupé
      </button>
      <input type="file" ref="bulkImportFile" accept=".json" style="display: none;" @change="onBulkImportFileChange">
      <button v-if="bulkImportFile" class="save-btn" @click="submitBulkImport" :disabled="bulkImportLoading" style="font-size: 12px; padding: 6px 12px;">
        {{ bulkImportLoading ? 'Importation...' : 'Importer JSON' }}
      </button>
    </div>

    <div v-if="catsStore.loading" class="stats">
      <SkeletonLoader type="stat-card" :count="4" />
    </div>
    <div v-else class="stats">
      <div class="stat-card">
        <span class="stat-label">Total CATs</span>
        <span class="stat-value">{{ catsStore.stats.total }}</span>
      </div>
      <div class="stat-card">
        <span class="stat-label">Maîtrisé</span>
        <span class="stat-value">{{ catsStore.stats.done }}</span>
      </div>
      <div class="stat-card">
        <span class="stat-label">À faire</span>
        <span class="stat-value">{{ catsStore.stats.todo }}</span>
      </div>
      <div class="stat-card">
        <span class="stat-label">Progression</span>
        <span class="stat-value">{{ catsStore.stats.masteryPercent }}%</span>
      </div>
    </div>

    <div class="streak-card" v-if="streakInfo.count > 0">
      <div class="streak-icon">🔥</div>
      <div class="streak-content">
        <span class="streak-label">Série actuelle</span>
        <span class="streak-value">{{ streakInfo.count }} jour{{ streakInfo.count > 1 ? 's' : '' }}</span>
      </div>
    </div>

    <!-- Admin Moderation Panel -->
    <div v-if="isAdmin" class="admin-moderation-panel" style="border-color: var(--color-primary); margin-bottom: 24px; padding: 0; overflow: hidden; background: var(--bg-sidebar); border-radius: var(--radius-lg); box-shadow: var(--shadow-lg);">
      <div class="admin-tabs-header" style="display: flex; background: rgba(0,0,0,0.25); border-bottom: 1px solid var(--border-color); padding: 4px; gap: 4px;">
        <button class="admin-tab-btn" :class="{ active: activeAdminTab === 'suggestions' }" @click="activeAdminTab = 'suggestions'" style="flex: 1; padding: 12px 8px; background: none; border: none; cursor: pointer; border-radius: 6px; font-weight: 600; font-size: 12.5px; display: flex; align-items: center; justify-content: center; gap: 8px; transition: all 0.2s ease;">
          <i class="fa-solid fa-inbox"></i> Propositions
        </button>
        <button class="admin-tab-btn" :class="{ active: activeAdminTab === 'diagnostics' }" @click="activeAdminTab = 'diagnostics'" style="flex: 1; padding: 12px 8px; background: none; border: none; cursor: pointer; border-radius: 6px; font-weight: 600; font-size: 12.5px; display: flex; align-items: center; justify-content: center; gap: 8px; transition: all 0.2s ease;">
          <i class="fa-solid fa-stethoscope"></i> Diagnostic
        </button>
        <button class="admin-tab-btn" :class="{ active: activeAdminTab === 'performance' }" @click="activeAdminTab = 'performance'" style="flex: 1; padding: 12px 8px; background: none; border: none; cursor: pointer; border-radius: 6px; font-weight: 600; font-size: 12.5px; display: flex; align-items: center; justify-content: center; gap: 8px; transition: all 0.2s ease;">
          <i class="fa-solid fa-gauge-high"></i> Performance
        </button>
      </div>

      <div class="admin-panes-container" style="padding: 20px;">
        <!-- Suggestions Tab -->
        <div v-if="activeAdminTab === 'suggestions'" class="admin-pane-content">
          <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px;">
            <h4 style="margin: 0; color: var(--color-primary); font-size: 14.5px; display: flex; align-items: center; gap: 8px;"><i class="fa-solid fa-user-shield"></i> Propositions en attente</h4>
          </div>
          <p style="margin: 0 0 12px 0; font-size: 13px; color: var(--text-secondary);">Validez ou rejetez les suggestions soumises par vos collègues :</p>

          <div v-if="suggestions.length === 0" style="padding: 16px; text-align: center; color: var(--text-muted); font-size: 13px;">
            Aucune proposition en attente.
          </div>
          <div v-else style="display: flex; flex-direction: column; gap: 10px;">
            <div v-for="sug in suggestions" :key="sug.id" style="background: var(--bg-card); border: 1px solid var(--border-color); border-radius: 8px; padding: 14px;">
              <div style="display: flex; justify-content: space-between; align-items: flex-start; gap: 10px; flex-wrap: wrap;">
                <div style="flex: 1; min-width: 200px;">
                  <div style="font-weight: 600; color: var(--text-primary); margin-bottom: 4px;">
                    {{ sug.type === 'add' ? 'Nouvelle fiche' : 'Modification fiche #' + sug.catId }}
                  </div>
                  <div style="font-size: 12px; color: var(--text-muted); margin-bottom: 6px;">
                    Par: {{ sug.author || 'Anonyme' }} | {{ new Date(sug.createdAt || Date.now()).toLocaleDateString('fr-FR') }}
                  </div>
                  <div style="font-size: 13px; color: var(--text-secondary); background: var(--bg-body); padding: 8px; border-radius: 6px;">
                    {{ sug.data?.title || sug.data?.summary || 'Contenu non disponible' }}
                  </div>
                </div>
                <div style="display: flex; gap: 6px; flex-shrink: 0;">
                  <button class="save-btn" style="padding: 6px 12px; font-size: 12px;" @click="approveSuggestion(sug.id)">
                    <i class="fa-solid fa-check"></i> Approuver
                  </button>
                  <button class="cancel-btn" style="padding: 6px 12px; font-size: 12px;" @click="rejectSuggestion(sug.id)">
                    <i class="fa-solid fa-xmark"></i> Rejeter
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Diagnostics Tab -->
        <div v-if="activeAdminTab === 'diagnostics'" class="admin-pane-content">
          <h4 style="margin: 0 0 12px 0; color: var(--color-primary); font-size: 14.5px; display: flex; align-items: center; gap: 8px;"><i class="fa-solid fa-stethoscope"></i> Outils de Diagnostic</h4>
          <p style="margin: 0 0 12px 0; font-size: 13px; color: var(--text-secondary);">Informations système, logs de la console et tests de connectivité en temps réel.</p>
          <button class="action-btn" style="width: 100%; font-size: 13px; padding: 10px; margin-bottom: 12px; border-color: var(--color-success); background: rgba(16, 185, 129, 0.1); color: var(--color-success); font-weight: bold; display: flex; align-items: center; justify-content: center; gap: 8px; border-radius: 8px;" @click="appStore.loadDiagnosticsSystem()">
            <i class="fa-solid fa-microscope"></i> Lancer le Check-up Complet (Auto-Test)
          </button>

          <div class="diag-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 16px;">
            <div class="diag-card" style="background: rgba(30, 41, 59, 0.4); border: 1px solid rgba(255, 255, 255, 0.05); padding: 12px; border-radius: 8px;">
              <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255, 255, 255, 0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-wifi"></i> Statut & Connectivité</h4>
              <div style="display: flex; flex-direction: column; gap: 6px; font-size: 12px; color: var(--text-muted);">
                <div>Navigator.onLine : <span class="badge">{{ navigator.onLine ? 'En ligne' : 'Hors ligne' }}</span></div>
                <div>Mode détecté : <span class="badge">{{ appStore.appMode }}</span></div>
              </div>
              <button class="action-btn" style="margin-top: 12px; width: 100%; font-size: 12px; padding: 6px 12px;" @click="appStore.loadDiagnosticsSystem()">
                <i class="fa-solid fa-bolt"></i> Tester la connexion
              </button>
            </div>

            <div class="diag-card" style="background: rgba(30, 41, 59, 0.4); border: 1px solid rgba(255, 255, 255, 0.05); padding: 12px; border-radius: 8px;">
              <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255, 255, 255, 0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-database"></i> Bases & Fichiers</h4>
              <div style="display: flex; flex-direction: column; gap: 6px; font-size: 12px; color: var(--text-muted);">
                <div>CATs : <span>{{ catsStore.cats.length }}</span></div>
                <div>Suggestions : <span>{{ suggestions.length }}</span></div>
              </div>
            </div>
          </div>
        </div>

        <!-- Performance Tab -->
        <div v-if="activeAdminTab === 'performance'" class="admin-pane-content">
          <h4 style="margin: 0 0 12px 0; color: var(--color-primary); font-size: 14.5px; display: flex; align-items: center; gap: 8px;"><i class="fa-solid fa-gauge-high"></i> Tableau de Performance</h4>
          <p style="margin: 0 0 12px 0; font-size: 13px; color: var(--text-secondary);">Mesure du framerate, temps de rendu des composants, latence réseau et snapshots mémoire.</p>

          <div class="perf-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 16px;">
            <div class="perf-card" style="background: rgba(30, 41, 59, 0.4); border: 1px solid rgba(255, 255, 255, 0.05); padding: 12px; border-radius: 8px;">
              <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255, 255, 255, 0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-film"></i> Taux de Rafraîchissement</h4>
              <div style="display: flex; flex-direction: column; gap: 6px; font-size: 12px; color: var(--text-muted);">
                <div>FPS Actuel : <span style="font-weight: bold; font-size: 14px;">--</span></div>
                <div>Stabilité globale : <span id="perf-fps-status-msg" style="padding: 4px; border-radius: 4px; font-weight: 500; text-align: center;">--</span></div>
              </div>
            </div>

            <div class="perf-card" style="background: rgba(30, 41, 59, 0.4); border: 1px solid rgba(255, 255, 255, 0.05); padding: 12px; border-radius: 8px;">
              <h4 style="font-size: 13.5px; border-bottom: 1px solid rgba(255, 255, 255, 0.08); padding-bottom: 6px; margin-bottom: 8px; color: var(--text-primary);"><i class="fa-solid fa-microchip"></i> Mémoire & I/O Local</h4>
              <div style="display: flex; flex-direction: column; gap: 6px; font-size: 12px; color: var(--text-muted);">
                <div>JS Heap : <span id="perf-heap-val">--</span></div>
                <div>Lectures LocalStorage : <span id="perf-io-reads">--</span></div>
                <div>Écritures LocalStorage : <span id="perf-io-writes">--</span></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="dashboard-content-split">
      <!-- Resume block -->
      <div class="dashboard-block resume-block">
        <h3><i class="fa-solid fa-clock-rotate-left"></i> Reprendre la révision</h3>
        <p class="block-desc">Vos derniers cours en cours de lecture :</p>
        <div v-if="catsStore.loading" class="resume-list">
          <SkeletonLoader type="resume-item" :count="3" />
        </div>
        <div v-else-if="resumeCats.length === 0" class="empty-state">
          Aucune CAT en cours. Sélectionnez une CAT dans la barre latérale pour commencer !
        </div>
        <ul v-else class="resume-list">
          <li v-for="cat in resumeCats" :key="cat.id" class="resume-item">
            <div class="resume-main">
              <button class="resume-title" @click="goToWorkspace(cat.id)">
                {{ cat.id }}. {{ cat.title }}
              </button>
              <span class="resume-category">{{ cat.category }}</span>
            </div>
            <div class="resume-actions">
              <span :class="['badge', cat.status === 'done' ? 'badge-success' : 'badge-warning']">
                {{ cat.status === 'done' ? 'Maîtrisé' : 'En cours' }}
              </span>
              <select
                :value="cat.status"
                @change="(e) => updateStatus(cat.id, (e.target as HTMLSelectElement).value as 'todo' | 'done')"
                class="status-select"
              >
                <option value="todo">À faire</option>
                <option value="done">Maîtrisé</option>
              </select>
            </div>
          </li>
        </ul>
      </div>

      <!-- Categories progress block -->
      <div class="dashboard-block categories-block">
        <h3><i class="fa-solid fa-chart-pie"></i> Progrès par spécialité</h3>
        <div v-if="specialtyProgress.length === 0" class="empty-state">
          Aucune donnée de progression disponible.
        </div>
        <div v-else class="specialty-list">
          <div v-for="item in specialtyProgress" :key="item.name" class="specialty-item">
            <div class="specialty-header">
              <span class="specialty-name">{{ item.name }}</span>
              <span class="specialty-count">{{ item.done }}/{{ item.total }} ({{ item.percent }}%)</span>
            </div>
            <div class="progress-bar-bg">
              <div class="progress-bar-fill" :style="{ width: item.percent + '%' }"></div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- About, Legal & Beta Disclaimer Block (Collapsible) -->
    <div class="dashboard-block about-legal-block" style="margin-top: 20px; border-color: rgba(6, 182, 212, 0.15); background: rgba(30, 41, 59, 0.25); padding: 12px 16px; transition: all 0.3s ease; border-radius: var(--radius-lg);">
      <div class="about-legal-header" @click="toggleAboutLegal" style="display: flex; justify-content: space-between; align-items: center; cursor: pointer;">
        <h3 class="about-legal-title" style="margin: 0; font-size: 15px; font-weight: 600; color: var(--text-primary); display: flex; align-items: center; gap: 8px;">
          <i class="fa-solid fa-scale-balanced" style="color: var(--color-primary);"></i> Informations & Mentions Légales
          <span class="about-legal-badge" style="font-size: 10px; font-weight: 700; background: rgba(6, 182, 212, 0.15); color: var(--color-primary); padding: 2px 6px; border-radius: 4px;">Dr. K-Ali</span>
        </h3>
        <i class="fa-solid fa-chevron-down" :style="{ transform: isAboutExpanded ? 'rotate(180deg)' : 'rotate(0)', transition: 'transform 0.3s ease' }"></i>
      </div>

      <div :style="{ maxHeight: isAboutExpanded ? '500px' : '0px', overflow: 'hidden', transition: 'max-height 0.3s ease' }">
        <div style="display: flex; align-items: flex-start; gap: 16px; flex-wrap: wrap; padding-top: 12px; border-top: 1px solid rgba(255,255,255,0.05); margin-top: 10px;">
          <div style="font-size: 28px; flex-shrink: 0; padding-top: 2px;">⚠️</div>
          <div style="flex: 1; min-width: 200px; font-size: 13px; color: var(--text-secondary); line-height: 1.6;">
            <p style="margin: '0 0 10px 0';"><strong>Dr.CAT</strong> est un outil d'aide à la décision clinique et ne remplace pas le jugement professionnel du médecin.</p>
            <p style="margin: '0 0 10px 0';"><strong>Dr. K-Ali</strong> — Application développée pour la révision et l'apprentissage des conduites à tenir médicales.</p>
            <p style="margin: 0; font-size: 11px; color: var(--text-muted);">Version BETA — Les données sont stockées localement et peuvent être exportées pour sauvegarde.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.dashboard-header-actions {
  margin-bottom: 20px;
}
.admin-moderation-panel {
  margin-bottom: 24px;
}
.admin-tab-btn.active {
  color: var(--color-primary) !important;
  background-color: rgba(6, 182, 212, 0.1) !important;
}
.dashboard-block {
  margin-bottom: 32px;
}
.block-desc {
  font-size: 13px;
  color: var(--text-secondary);
  margin-bottom: 12px;
}
</style>
