<script setup lang="ts">
import { useRoute } from 'vue-router'
import { useCatsStore } from '@/stores/cats'
import { computed } from 'vue'

const route = useRoute()
const catsStore = useCatsStore()

const catId = computed(() => Number(route.params.id))
const cat = computed(() => catsStore.cats.find(c => c.id === catId.value))
</script>

<template>
  <div class="workspace" v-if="cat">
    <h1>{{ cat.title }}</h1>
    <p class="category">{{ cat.category }}</p>
    <div class="section">
      <h2>Summary</h2>
      <p>{{ cat.summary }}</p>
    </div>
    <div class="section">
      <h2>Red Flags</h2>
      <p>{{ cat.red_flags }}</p>
    </div>
    <div class="section">
      <h2>Ordonnance</h2>
      <p>{{ cat.ordonnance }}</p>
    </div>
  </div>
  <div class="workspace" v-else>
    <p>CAT not found.</p>
  </div>
</template>

<style scoped>
.workspace {
  padding: 20px;
}
.category {
  color: var(--text-muted);
  margin-top: -8px;
  margin-bottom: 20px;
}
.section {
  margin-top: 24px;
}
.section h2 {
  font-size: 16px;
  margin-bottom: 8px;
}
</style>
