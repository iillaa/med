<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { useCatsStore } from '@/stores/cats'
import { useAppStore } from '@/stores/app'

const router = useRouter()
const route = useRoute()
const catsStore = useCatsStore()
const appStore = useAppStore()

const categories = computed(() => catsStore.categories)
const filteredCats = computed(() => catsStore.filtered)

// Controls panel collapse state with localStorage persistence
const isControlsCollapsed = ref(false)

onMounted(() => {
  isControlsCollapsed.value = localStorage.getItem('sidebar_controls_collapsed') === 'true'
})

function toggleControls() {
  isControlsCollapsed.value = !isControlsCollapsed.value
  localStorage.setItem('sidebar_controls_collapsed', String(isControlsCollapsed.value))
}

function selectCat(catId: number) {
  router.push(`/workspace/${catId}`)
  appStore.setSidebarOpen(false) // Close sidebar drawer on mobile
}

function navigateToDashboard() {
  router.push('/')
  appStore.setSidebarOpen(false)
}

function toggleTheme() {
  appStore.setTheme(appStore.theme === 'light' ? 'dark' : 'light')
}
</script>

<template>
  <aside class="sidebar">
    <!-- LEVEL 1: Compact Header Strip -->
    <div class="sidebar-header">
      <div class="brand" @click="navigateToDashboard" style="cursor: pointer;">
        <img src="/drcat_logo.png" alt="Dr.CAT Logo" class="brand-icon" />
        <div>
          <h1>Dr.CAT <span class="badge" style="vertical-align: middle; margin-left: 2px;">BETA</span></h1>
          <p>Rappel Clinique</p>
        </div>
      </div>
      <div style="display: flex; align-items: center; gap: 8px;">
        <button 
          id="theme-toggle-btn" 
          class="controls-toggle-btn" 
          style="background:none; border:none; color:var(--text-secondary); width:28px; height:28px;" 
          :title="appStore.theme === 'light' ? 'Activer le mode sombre' : 'Activer le mode clair'"
          @click="toggleTheme"
        >
          <i class="fa-solid" :class="appStore.theme === 'light' ? 'fa-moon' : 'fa-sun'" id="theme-toggle-icon"></i>
        </button>
        <button class="toggle-sidebar-btn" id="close-sidebar-btn" @click="appStore.setSidebarOpen(false)">
          <i class="fa-solid fa-xmark"></i>
        </button>
      </div>
    </div>

    <!-- LEVEL 2: Collapsible Controls Band -->
    <div class="sidebar-controls">
      <!-- Search input + Toggle controls chevron button -->
      <div class="search-row">
        <div class="search-box">
          <i class="fa-solid fa-magnifying-glass search-icon"></i>
          <input
            type="text"
            id="search-input"
            v-model="catsStore.searchQuery"
            placeholder="Rechercher une CAT..."
          />
        </div>
        <button 
          class="controls-toggle-btn" 
          :class="{ collapsed: isControlsCollapsed }"
          @click="toggleControls" 
          title="Afficher/Masquer les filtres"
        >
          <i class="fa-solid fa-chevron-up" :class="{ rotated: isControlsCollapsed }" id="controls-toggle-icon"></i>
        </button>
      </div>

      <!-- Collapsible panel contents -->
      <div class="controls-panel" :class="{ collapsed: isControlsCollapsed }" id="controls-panel">
        <select 
          class="category-select" 
          id="category-filter"
          v-model="catsStore.activeCategoryFilter"
        >
          <option value="all">Toutes les spécialités</option>
          <option v-for="category in categories" :key="category" :value="category">
            {{ category }}
          </option>
        </select>

        <div class="quick-status-filters">
          <button
            class="status-pill"
            :class="{ active: catsStore.activeStatusFilter === 'all' }"
            @click="catsStore.activeStatusFilter = 'all'"
          >
            <i class="fa-solid fa-list"></i> Tous
          </button>
          <button
            class="status-pill"
            :class="{ active: catsStore.activeStatusFilter === 'todo' }"
            @click="catsStore.activeStatusFilter = 'todo'"
          >
            <i class="fa-regular fa-circle"></i> À faire
          </button>
          <button
            class="status-pill"
            :class="{ active: catsStore.activeStatusFilter === 'doing' }"
            @click="catsStore.activeStatusFilter = 'doing'"
          >
            <i class="fa-solid fa-clock"></i> En cours
          </button>
          <button
            class="status-pill"
            :class="{ active: catsStore.activeStatusFilter === 'done' }"
            @click="catsStore.activeStatusFilter = 'done'"
          >
            <i class="fa-solid fa-check"></i> Maîtrisé
          </button>
          <button
            class="status-pill"
            :class="{ active: catsStore.activeStatusFilter === 'redflags' }"
            @click="catsStore.activeStatusFilter = 'redflags'"
          >
            <i class="fa-solid fa-triangle-exclamation"></i> Alertes
          </button>
        </div>

        <div class="sidebar-action-row">
          <button class="action-btn sidebar-btn-quiz" @click="router.push('/quiz')">
            <i class="fa-solid fa-brain"></i> Quiz
          </button>
          <button 
            v-if="appStore.isAdmin" 
            class="action-btn sidebar-btn-add" 
            @click="router.push('/admin')"
          >
            <i class="fa-solid fa-gears"></i> Admin
          </button>
        </div>

        <div class="slim-progress">
          <div class="slim-progress-top">
            <span class="slim-progress-label">
              <i class="fa-solid fa-chart-pie"></i> Progression
            </span>
            <span class="slim-progress-pct">{{ catsStore.stats.masteryPercent }}%</span>
          </div>
          <div class="progress-bar-container">
            <div class="progress-bar-fill" :style="{ width: catsStore.stats.masteryPercent + '%' }"></div>
          </div>
          <div class="stats-counters" style="display: flex; gap: 8px;">
            <span class="stat-counter todo" style="display: inline-flex; align-items: center; gap: 4px; font-size: 11px; color: var(--text-muted);">
              <i class="fa-regular fa-circle" style="font-size: 8px;"></i>
              <span>{{ catsStore.stats.todo }}</span>
            </span>
            <span class="stat-counter done" style="display: inline-flex; align-items: center; gap: 4px; font-size: 11px; color: var(--color-success);">
              <i class="fa-solid fa-check" style="font-size: 8px;"></i>
              <span>{{ catsStore.stats.done }}</span>
            </span>
          </div>
        </div>
      </div>
    </div>

    <!-- LEVEL 3: CAT List -->
    <div class="cat-list-wrapper">
      <ul class="cat-list" id="cat-list">
        <li
          v-for="cat in filteredCats"
          :key="cat.id"
          class="cat-item"
          :class="{ active: route.params.id === String(cat.id) }"
          :data-id="cat.id"
          @click="selectCat(cat.id)"
        >
          <div class="cat-indicator" :class="cat.status || 'todo'"></div>
          <div class="cat-item-content">
            <span class="cat-item-title">{{ cat.id }}. {{ cat.title }}</span>
            <div class="cat-item-meta">
              <span>{{ cat.category }}</span>
              <span>
                {{ cat.status === 'done' ? 'Maîtrisé' : cat.status === 'doing' ? 'En cours' : 'À faire' }}
              </span>
            </div>
          </div>
        </li>
        <li v-if="filteredCats.length === 0" class="empty-state">
          <div style="text-align: center; padding: 32px 16px; color: var(--text-muted);">
            <i class="fa-solid fa-filter-circle-xmark" style="font-size: 28px; margin-bottom: 10px; display: block; opacity: 0.6;"></i>
            <span style="font-size: 13px; line-height: 1.5;">Aucune fiche ne correspond à vos filtres actuels.</span>
          </div>
        </li>
      </ul>
    </div>
  </aside>
</template>

<style scoped>
/* Only transition chevron icon and loading layout structure if needed; layout.css handles the main CSS styles */
#controls-toggle-icon.rotated {
  transform: rotate(180deg);
}
</style>
