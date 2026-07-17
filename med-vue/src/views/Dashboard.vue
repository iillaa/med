<script setup lang="ts">
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import { useCatsStore } from '@/stores/cats'
import { getStreakInfo } from '@/stores/cats'

const router = useRouter()
const catsStore = useCatsStore()

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

function goToWorkspace(id: number): void {
  router.push(`/workspace/${id}`)
}

async function updateStatus(id: number, status: 'todo' | 'done'): Promise<void> {
  await catsStore.updateStatus(id, status)
}
</script>

<template>
  <div class="dashboard">
    <h1 class="dashboard-title">Dashboard</h1>

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

    <div class="streak-card" v-if="streakInfo.count > 0">
      <div class="streak-icon">🔥</div>
      <div class="streak-content">
        <span class="streak-label">Série actuelle</span>
        <span class="streak-value">{{ streakInfo.count }} jour{{ streakInfo.count > 1 ? 's' : '' }}</span>
      </div>
    </div>

    <section class="dashboard-section">
      <h2 class="section-title">Reprendre</h2>
      <div v-if="resumeCats.length === 0" class="empty-state">
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
    </section>

    <section class="dashboard-section">
      <h2 class="section-title">Progression par spécialité</h2>
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
    </section>
  </div>
</template>

<style scoped>
.dashboard {
  padding: 20px;
  max-width: 900px;
  margin: 0 auto;
}
.dashboard-title {
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 20px;
}
.stats {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 16px;
  margin-bottom: 32px;
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
.streak-card {
  display: flex;
  align-items: center;
  gap: 14px;
  padding: 14px 18px;
  background: linear-gradient(135deg, rgba(245, 158, 11, 0.15), rgba(239, 68, 68, 0.08));
  border: 1px solid rgba(245, 158, 11, 0.3);
  border-radius: 14px;
  margin-bottom: 28px;
}
.streak-icon {
  font-size: 28px;
  line-height: 1;
}
.streak-content {
  display: flex;
  flex-direction: column;
  gap: 2px;
}
.streak-label {
  font-size: 12px;
  color: var(--text-muted);
  text-transform: uppercase;
  letter-spacing: 0.5px;
}
.streak-value {
  font-size: 20px;
  font-weight: 700;
  color: var(--color-warning);
}
.dashboard-section {
  margin-bottom: 32px;
}
.section-title {
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 12px;
  color: var(--text-primary);
}
.empty-state {
  padding: 20px;
  text-align: center;
  color: var(--text-muted);
  font-size: 13px;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
}
.resume-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 8px;
}
.resume-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px 16px;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
  gap: 12px;
}
.resume-main {
  display: flex;
  flex-direction: column;
  gap: 4px;
  flex: 1;
  min-width: 0;
}
.resume-title {
  background: none;
  border: none;
  padding: 0;
  font-size: 14px;
  font-weight: 500;
  color: var(--color-primary);
  cursor: pointer;
  text-align: left;
  font-family: inherit;
}
.resume-title:hover {
  text-decoration: underline;
}
.resume-category {
  font-size: 12px;
  color: var(--text-muted);
}
.resume-actions {
  display: flex;
  align-items: center;
  gap: 8px;
  flex-shrink: 0;
}
.badge {
  font-size: 11px;
  padding: 3px 8px;
  border-radius: 6px;
  font-weight: 600;
  white-space: nowrap;
}
.badge-success {
  background: rgba(16, 185, 129, 0.15);
  color: var(--color-success);
}
.badge-warning {
  background: rgba(245, 158, 11, 0.15);
  color: var(--color-warning);
}
.status-select {
  padding: 6px 10px;
  border: 1px solid var(--color-border);
  border-radius: 8px;
  background: var(--color-background);
  color: var(--text-primary);
  font-size: 12px;
  outline: none;
  cursor: pointer;
}
.specialty-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.specialty-item {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
  padding: 12px 16px;
}
.specialty-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 8px;
}
.specialty-name {
  font-size: 13px;
  font-weight: 500;
  color: var(--text-primary);
}
.specialty-count {
  font-size: 12px;
  color: var(--text-muted);
}
.progress-bar-bg {
  width: 100%;
  height: 6px;
  background: rgba(255, 255, 255, 0.06);
  border-radius: 3px;
  overflow: hidden;
}
.progress-bar-fill {
  height: 100%;
  background: linear-gradient(90deg, var(--color-primary), #10b981);
  border-radius: 3px;
  transition: width 0.3s ease;
}
</style>
