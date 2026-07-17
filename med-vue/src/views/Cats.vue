<script setup lang="ts">
import { useCatsStore } from '@/stores/cats'

const catsStore = useCatsStore()
</script>

<template>
  <div class="cats-view">
    <h1>CATs</h1>
    <p class="placeholder">Full CAT list with search and filter — coming next.</p>
  </div>
</template>

<style scoped>
.cats-view {
  padding: 20px;
}
.placeholder {
  color: var(--text-muted);
  margin-top: 12px;
}
</style>
