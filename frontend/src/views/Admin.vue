<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useAppStore } from '@/stores/app'
import AdminSuggestions from './Admin/AdminSuggestions.vue'
import AdminDiagnostics from './Admin/AdminDiagnostics.vue'
import AdminPerformance from './Admin/AdminPerformance.vue'

const appStore = useAppStore()
const activeTab = ref<'suggestions' | 'diagnostics' | 'performance'>('suggestions')

onMounted(async () => {
  if (appStore.isAdmin) {
    // Suggestions component loads itself
  }
})
</script>

<template>
  <div class="admin-view">
    <h1 class="admin-title">Administration</h1>

    <div v-if="!appStore.isAdmin" class="access-denied">
      <p>Accès administrateur requis.</p>
    </div>

    <template v-else>
      <div class="admin-tabs">
        <button
          :class="['admin-tab', { active: activeTab === 'suggestions' }]"
          @click="activeTab = 'suggestions'"
        >
          Suggestions
        </button>
        <button
          :class="['admin-tab', { active: activeTab === 'diagnostics' }]"
          @click="activeTab = 'diagnostics'"
        >
          Diagnostics
        </button>
        <button
          :class="['admin-tab', { active: activeTab === 'performance' }]"
          @click="activeTab = 'performance'"
        >
          Performance
        </button>
      </div>

      <AdminSuggestions v-if="activeTab === 'suggestions'" />
      <AdminDiagnostics v-else-if="activeTab === 'diagnostics'" />
      <AdminPerformance v-else-if="activeTab === 'performance'" />
    </template>
  </div>
</template>

<style scoped>
.admin-view {
  padding: 20px;
  max-width: 900px;
  margin: 0 auto;
}
.admin-title {
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 20px;
}
.access-denied {
  padding: 40px 20px;
  text-align: center;
  color: var(--text-muted);
  font-size: 14px;
}
.admin-tabs {
  display: flex;
  gap: 4px;
  border-bottom: 1px solid var(--color-border);
  margin-bottom: 20px;
}
.admin-tab {
  padding: 10px 16px;
  background: none;
  border: none;
  border-bottom: 2px solid transparent;
  color: var(--text-muted);
  font-size: 13px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.2s;
  font-family: inherit;
}
.admin-tab.active {
  color: var(--color-primary);
  border-bottom-color: var(--color-primary);
}
.tab-content {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
</style>
