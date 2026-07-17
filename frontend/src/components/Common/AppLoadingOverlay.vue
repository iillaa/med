<template>
  <Transition name="fade">
    <div v-if="visible" id="app-loading-overlay" class="loading-overlay">
      <div class="loading-overlay-brand">
        <img class="brand-icon" src="/drcat_logo.png" alt="Dr.CAT Logo" />
        <div>
          <h1 class="loading-title">Dr.CAT</h1>
          <p class="loading-subtitle">Chargement en cours...</p>
        </div>
      </div>

      <div class="loading-overlay-progress">
        <div class="loading-overlay-bar-bg">
          <div class="loading-overlay-bar-fill" :style="{ width: progress + '%' }"></div>
        </div>
        <div v-if="message" class="loading-overlay-msg" style="display: block;">{{ message }}</div>
      </div>

      <div class="loading-overlay-actions">
        <button class="btn-danger-ghost" @click="skip">
          ✕ Ignorer
        </button>
      </div>
    </div>
  </Transition>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';

const props = defineProps<{
  progress?: number;
  message?: string;
}>();

const emit = defineEmits<{
  skip: [];
}>();

const visible = ref(true);

function skip() {
  visible.value = false;
  emit('skip');
}

onMounted(() => {
  window.setLoaderProgress = (p: number) => {
    // Handled by parent store / state reactive bindings
  };
});
</script>

<style scoped>
.loading-title {
  font-size: 16px;
  font-weight: 700;
  color: var(--text-primary);
  margin: 0;
  line-height: 1.2;
}

.loading-subtitle {
  font-size: 10px;
  color: var(--text-muted);
  margin: 0;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.4s ease, visibility 0.4s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
  visibility: hidden;
}
</style>
