<script setup lang="ts">
import { useCatsStore } from '@/stores/cats'
import { useRouter } from 'vue-router'

const catsStore = useCatsStore()
const router = useRouter()

function goToWorkspace(id: number): void {
  router.push(`/workspace/${id}`)
}

async function updateStatus(id: number, status: 'todo' | 'done'): Promise<void> {
  await catsStore.updateStatus(id, status)
}
</script>

<template>
  <div class="cats-view">
    <div class="cats-header">
      <h1 class="cats-title">CATs</h1>
      <span class="cats-count">{{ catsStore.filtered.length }} / {{ catsStore.cats.length }}</span>
    </div>

    <div v-if="catsStore.cats.length === 0" class="empty-state">
      Chargement des CATs...
    </div>

    <div v-else class="cats-list">
      <div v-for="cat in catsStore.filtered" :key="cat.id" class="cat-card">
        <div class="cat-card-main" @click="goToWorkspace(cat.id)">
          <div class="cat-card-header">
            <span class="cat-card-id">{{ cat.id }}</span>
            <span class="cat-card-category">{{ cat.category }}</span>
          </div>
          <h3 class="cat-card-title">{{ cat.title }}</h3>
          <p class="cat-card-summary">{{ cat.summary?.slice(0, 160) }}{{ cat.summary && cat.summary.length > 160 ? '...' : '' }}</p>
        </div>
        <div class="cat-card-actions">
          <span :class="['badge', cat.status === 'done' ? 'badge-success' : cat.status === 'doing' ? 'badge-warning' : 'badge-neutral']">
            {{ cat.status === 'done' ? 'Maîtrisé' : cat.status === 'doing' ? 'En cours' : 'À faire' }}
          </span>
          <select
            :value="cat.status"
            @click.stop
            @change="(e) => updateStatus(cat.id, (e.target as HTMLSelectElement).value as 'todo' | 'done')"
            class="status-select"
          >
            <option value="todo">À faire</option>
            <option value="done">Maîtrisé</option>
          </select>
        </div>
      </div>

      <div v-if="catsStore.filtered.length === 0" class="empty-state">
        Aucune CAT ne correspond à vos filtres.
      </div>
    </div>
  </div>
</template>

<style scoped>
.cats-view {
  padding: 20px;
  max-width: 900px;
  margin: 0 auto;
}
.cats-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}
.cats-title {
  font-size: 24px;
  font-weight: 700;
  margin: 0;
}
.cats-count {
  font-size: 13px;
  color: var(--text-muted);
}
.empty-state {
  padding: 40px 20px;
  text-align: center;
  color: var(--text-muted);
  font-size: 14px;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
}
.cats-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.cat-card {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 12px;
  padding: 16px;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
  transition: border-color 0.15s;
}
.cat-card:hover {
  border-color: var(--color-primary);
}
.cat-card-main {
  flex: 1;
  min-width: 0;
  cursor: pointer;
}
.cat-card-header {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 6px;
}
.cat-card-id {
  font-size: 11px;
  font-weight: 700;
  color: var(--text-muted);
  background: rgba(255, 255, 255, 0.06);
  padding: 2px 6px;
  border-radius: 4px;
}
.cat-card-category {
  font-size: 11px;
  color: var(--color-primary);
  font-weight: 500;
}
.cat-card-title {
  font-size: 14px;
  font-weight: 600;
  color: var(--text-primary);
  margin: 0 0 6px 0;
}
.cat-card-summary {
  font-size: 12px;
  color: var(--text-muted);
  margin: 0;
  line-height: 1.4;
}
.cat-card-actions {
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
.badge-neutral {
  background: rgba(148, 163, 184, 0.15);
  color: var(--text-muted);
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
</style>
