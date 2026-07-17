<script setup lang="ts">
import { useCatsStore } from '@/stores/cats'

const catsStore = useCatsStore()
</script>

<template>
  <div class="dashboard">
    <h1>Dashboard</h1>
    <div class="stats">
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
  </div>
</template>

<style scoped>
.dashboard {
  padding: 20px;
}
.stats {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 16px;
  margin-top: 20px;
}
.stat-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
  padding: 16px;
  display: flex;
  flex-direction: column;
  gap: 8px;
}
.stat-label {
  font-size: 12px;
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 0.5px;
}
.stat-value {
  font-size: 24px;
  font-weight: 700;
  color: var(--text-primary);
}
</style>
