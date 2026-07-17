<template>
  <Transition name="fade">
    <div v-if="visible" id="app-loading-overlay" class="loading-overlay">
      <div class="loading-brand">
        <div class="loading-icon">🩺</div>
        <div>
          <h1 class="loading-title">Dr.CAT</h1>
          <p class="loading-subtitle">Chargement en cours...</p>
        </div>
      </div>

      <div class="loading-bar-container">
        <div class="loading-bar-track">
          <div class="loading-bar-fill" :style="{ width: progress + '%' }"></div>
        </div>
        <div v-if="message" class="loading-message">{{ message }}</div>
      </div>

      <div class="loading-actions">
        <button class="loading-skip-btn" @click="skip">
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
    // handled by progress prop binding in parent
  };
});
</script>

<style scoped>
.loading-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 80px;
  background: rgba(9, 13, 22, 0.96);
  border-bottom: 2px solid var(--color-primary);
  z-index: 9999999;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  padding: 0 20px;
  box-sizing: border-box;
  gap: 15px;
}

.loading-brand {
  display: flex;
  align-items: center;
  gap: 12px;
}

.loading-icon {
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 28px;
  animation: pulse-glow 2s ease-in-out infinite;
}

.loading-title {
  font-size: 16px;
  font-weight: 700;
  color: var(--text-primary);
  margin: 0;
}

.loading-subtitle {
  font-size: 10px;
  color: var(--text-muted);
  margin: 0;
}

.loading-bar-container {
  flex-grow: 1;
  max-width: 300px;
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.loading-bar-track {
  width: 100%;
  height: 4px;
  background: rgba(255, 255, 255, 0.06);
  border-radius: 2px;
  overflow: hidden;
}

.loading-bar-fill {
  height: 100%;
  background: linear-gradient(90deg, var(--color-primary), #10b981);
  border-radius: 2px;
  transition: width 0.3s ease;
}

.loading-message {
  display: none;
  font-size: 9px;
  color: #f87171;
  overflow-y: auto;
  max-height: 30px;
  line-height: 1.2;
}

.loading-actions {
  display: flex;
  align-items: center;
  gap: 10px;
}

.loading-skip-btn {
  background: rgba(239, 68, 68, 0.15);
  border: 1px solid rgba(239, 68, 68, 0.3);
  color: #f87171;
  border-radius: 6px;
  padding: 6px 12px;
  font-size: 11px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
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

@keyframes pulse-glow {
  0%,
  100% {
    opacity: 1;
  }
  50% {
    opacity: 0.6;
  }
}
</style>
