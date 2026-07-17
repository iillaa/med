<script setup lang="ts">
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import { useCatsStore } from '@/stores/cats'

const router = useRouter()
const catsStore = useCatsStore()

const categories = computed(() => catsStore.categories)
const filteredCats = computed(() => catsStore.filtered)
</script>

<template>
  <aside class="sidebar">
    <div class="sidebar-header">
      <div class="brand">
        <div class="brand-icon">🩺</div>
        <div>
          <h1>
            Dr.CAT
            <span class="badge">BETA</span>
          </h1>
          <p>Rappel Clinique</p>
        </div>
      </div>
    </div>

    <div class="sidebar-controls">
      <div class="search-row">
        <div class="search-box">
          <input
            type="text"
            :value="catsStore.searchQuery"
            @input="(e) => catsStore.setSearchQuery((e.target as HTMLInputElement).value)"
            placeholder="Rechercher une CAT..."
          />
        </div>
      </div>

      <div class="controls-panel">
        <select :value="catsStore.activeCategoryFilter" @change="(e) => catsStore.setActiveCategoryFilter((e.target as HTMLSelectElement).value)">
          <option value="all">Toutes les spécialités</option>
          <option v-for="category in categories" :key="category" :value="category">
            {{ category }}
          </option>
        </select>

        <div class="quick-status-filters">
          <button
            v-for="filter in ['all', 'todo', 'done']"
            :key="filter"
            :class="['status-pill', { active: catsStore.activeStatusFilter === filter }]"
            @click="() => catsStore.setActiveStatusFilter(filter)"
          >
            {{ filter === 'all' ? 'Tous' : filter === 'todo' ? 'À faire' : 'Maîtrisé' }}
          </button>
        </div>

        <div class="sidebar-action-row">
          <button class="action-btn sidebar-btn-quiz" @click="router.push('/quiz')">
            🧠 Quiz
          </button>
        </div>

        <div class="slim-progress">
          <div class="slim-progress-top">
            <span class="slim-progress-label">Progression globale</span>
            <span class="slim-progress-pct">{{ catsStore.stats.masteryPercent }}%</span>
          </div>
          <div class="progress-bar-container">
            <div class="progress-bar-fill" :style="{ width: catsStore.stats.masteryPercent + '%' }"></div>
          </div>
          <div class="stats-counters">
            <span class="stat-counter todo">
              <span class="stat-icon">○</span>
              <span>{{ catsStore.stats.todo }}</span>
            </span>
            <span class="stat-counter done">
              <span class="stat-icon">✓</span>
              <span>{{ catsStore.stats.done }}</span>
            </span>
          </div>
        </div>
      </div>
    </div>

    <div class="cat-list-wrapper">
      <ul class="cat-list">
        <li
          v-for="cat in catsStore.filtered"
          :key="cat.id"
          class="cat-item"
          @click="router.push(`/workspace/${cat.id}`)"
        >
          <div class="cat-title">{{ cat.title }}</div>
          <div class="cat-meta">
            <span class="cat-category">{{ cat.category }}</span>
            <span :class="['cat-status', cat.status]">{{ cat.status }}</span>
          </div>
        </li>
        <li v-if="catsStore.filtered.length === 0" class="cat-empty">
          Aucune CAT trouvée.
        </li>
      </ul>
    </div>
  </aside>
</template>

<style scoped>
.sidebar {
  width: 320px;
  height: 100vh;
  background: var(--color-surface);
  border-right: 1px solid var(--color-border);
  display: flex;
  flex-direction: column;
  flex-shrink: 0;
}

.sidebar-header {
  padding: 16px;
  border-bottom: 1px solid var(--color-border);
}

.brand {
  display: flex;
  align-items: center;
  gap: 12px;
}

.brand-icon {
  width: 36px;
  height: 36px;
  border-radius: 8px;
  background: var(--color-primary);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  flex-shrink: 0;
}

.brand h1 {
  font-size: 16px;
  font-weight: 700;
  margin: 0;
  display: flex;
  align-items: center;
  gap: 6px;
}

.badge {
  font-size: 9px;
  font-weight: 800;
  background: rgba(6, 182, 212, 0.15);
  color: var(--color-primary);
  padding: 2px 5px;
  border-radius: 4px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  line-height: 1;
}

.brand p {
  font-size: 11px;
  color: var(--text-muted);
  margin: 0;
}

.sidebar-controls {
  padding: 12px 16px;
  border-bottom: 1px solid var(--color-border);
}

.search-row {
  margin-bottom: 12px;
}

.search-box input {
  width: 100%;
  padding: 8px 12px;
  border: 1px solid var(--color-border);
  border-radius: 8px;
  background: var(--color-background);
  color: var(--text-primary);
  font-size: 13px;
  outline: none;
  box-sizing: border-box;
}

.controls-panel {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.controls-panel select {
  padding: 8px 12px;
  border: 1px solid var(--color-border);
  border-radius: 8px;
  background: var(--color-background);
  color: var(--text-primary);
  font-size: 13px;
  outline: none;
}

.quick-status-filters {
  display: flex;
  gap: 8px;
}

.status-pill {
  flex: 1;
  padding: 6px 10px;
  border: 1px solid var(--color-border);
  border-radius: 6px;
  background: transparent;
  color: var(--text-secondary);
  font-size: 12px;
  cursor: pointer;
  transition: all 0.2s;
}

.status-pill.active {
  background: var(--color-primary);
  color: white;
  border-color: var(--color-primary);
}

.sidebar-action-row {
  display: flex;
  gap: 8px;
}

.action-btn {
  flex: 1;
  padding: 8px 12px;
  border: none;
  border-radius: 8px;
  font-size: 13px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
}

.sidebar-btn-quiz {
  background: var(--color-primary);
  color: white;
}

.slim-progress {
  margin-top: 8px;
}

.slim-progress-top {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 6px;
}

.slim-progress-label {
  font-size: 11px;
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.slim-progress-pct {
  font-size: 12px;
  font-weight: 700;
  color: var(--text-primary);
}

.progress-bar-container {
  width: 100%;
  height: 4px;
  background: rgba(255, 255, 255, 0.06);
  border-radius: 2px;
  overflow: hidden;
  margin-bottom: 8px;
}

.progress-bar-fill {
  height: 100%;
  background: linear-gradient(90deg, var(--color-primary), #10b981);
  border-radius: 2px;
  transition: width 0.3s ease;
}

.stats-counters {
  display: flex;
  gap: 12px;
}

.stat-counter {
  display: flex;
  align-items: center;
  gap: 4px;
  font-size: 12px;
  color: var(--text-secondary);
}

.stat-counter.todo {
  color: var(--text-muted);
}

.stat-counter.done {
  color: var(--color-success);
}

.cat-list-wrapper {
  flex: 1;
  overflow-y: auto;
  padding: 8px;
}

.cat-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.cat-item {
  padding: 10px 12px;
  border-radius: 8px;
  cursor: pointer;
  transition: background 0.15s;
  margin-bottom: 4px;
}

.cat-item:hover {
  background: var(--color-background);
}

.cat-title {
  font-size: 13px;
  font-weight: 500;
  color: var(--text-primary);
  margin-bottom: 4px;
}

.cat-meta {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.cat-category {
  font-size: 11px;
  color: var(--text-muted);
}

.cat-status {
  font-size: 10px;
  padding: 2px 6px;
  border-radius: 4px;
  text-transform: uppercase;
  font-weight: 600;
}

.cat-status.todo {
  background: rgba(148, 163, 184, 0.15);
  color: var(--text-muted);
}

.cat-status.done {
  background: rgba(16, 185, 129, 0.15);
  color: var(--color-success);
}

.cat-empty {
  padding: 20px;
  text-align: center;
  color: var(--text-muted);
  font-size: 13px;
}
</style>
