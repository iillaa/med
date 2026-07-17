<script setup lang="ts">
interface Props {
  type?: 'cat-item' | 'stat-card' | 'resume-item'
  count?: number
}
withDefaults(defineProps<Props>(), {
  type: 'cat-item',
  count: 3
})
</script>

<template>
  <div v-if="type === 'cat-item'" class="skeleton-cat-list">
    <div v-for="i in count" :key="i" class="cat-item-skeleton">
      <div class="skeleton-line skeleton-title"></div>
      <div class="skeleton-line skeleton-meta"></div>
    </div>
  </div>
  <div v-else-if="type === 'stat-card'" class="skeleton-stats">
    <div v-for="i in count" :key="i" class="stat-card-skeleton">
      <div class="skeleton-line skeleton-meta" style="width: 60%"></div>
      <div class="skeleton-line skeleton-title" style="width: 40%"></div>
    </div>
  </div>
  <div v-else-if="type === 'resume-item'" class="skeleton-resume">
    <div v-for="i in count" :key="i" class="resume-item-skeleton">
      <div class="skeleton-line skeleton-title" style="width: 70%"></div>
      <div class="skeleton-line skeleton-meta" style="width: 30%"></div>
    </div>
  </div>
</template>

<style scoped>
.skeleton-cat-list {
  padding: 0;
  margin: 0;
}
.stat-card-skeleton {
  padding: 16px;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
  display: flex;
  flex-direction: column;
  gap: 10px;
}
.resume-item-skeleton {
  padding: 14px 16px;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: 12px;
  display: flex;
  flex-direction: column;
  gap: 8px;
}
.skeleton-line {
  background: linear-gradient(90deg,
    var(--color-border) 25%,
    rgba(255, 255, 255, 0.05) 50%,
    var(--color-border) 75%
  );
  background-size: 200% 100%;
  animation: shimmerLoading 1.5s infinite linear;
  border-radius: 4px;
}
.skeleton-title {
  height: 14px;
}
.skeleton-meta {
  height: 10px;
}
@keyframes shimmerLoading {
  0% { background-position: 200% 0; }
  100% { background-position: -200% 0; }
}
</style>
