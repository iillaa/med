<script setup lang="ts">
import { useAppStore } from '@/stores/app'

const appStore = useAppStore()
</script>

<template>
  <div class="admin-view">
    <h1>Admin</h1>
    <p v-if="!appStore.isAdmin" class="placeholder">Admin access required.</p>
    <div v-else class="placeholder">
      <p>Admin panel — coming next.</p>
    </div>
  </div>
</template>

<style scoped>
.admin-view {
  padding: 20px;
}
.placeholder {
  color: var(--text-muted);
  margin-top: 12px;
}
</style>
