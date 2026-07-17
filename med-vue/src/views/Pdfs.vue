<script setup lang="ts">
import { useAppStore } from '@/stores/app'

const appStore = useAppStore()
</script>

<template>
  <div class="pdfs-view">
    <h1>PDFs</h1>
    <p class="placeholder">PDF search and list — coming next.</p>
  </div>
</template>

<style scoped>
.pdfs-view {
  padding: 20px;
}
.placeholder {
  color: var(--text-muted);
  margin-top: 12px;
}
</style>
