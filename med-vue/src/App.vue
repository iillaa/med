<script setup lang="ts">
import { computed } from 'vue'
import { RouterView, useRoute } from 'vue-router'
import { useAppStore } from './stores/app'
import AppLoadingOverlay from './components/Common/AppLoadingOverlay.vue'
import Sidebar from './components/Sidebar/Sidebar.vue'

const appStore = useAppStore()
const route = useRoute()

const loading = computed(() => appStore.loading)
const showSidebar = computed(() => {
  const noSidebarRoutes = ['/about']
  return !noSidebarRoutes.includes(route.path)
})

function onSkip() {
  appStore.loading = false
}
</script>

<template>
  <div class="app-layout">
    <Sidebar v-if="showSidebar" />
    <main class="main-content">
      <AppLoadingOverlay
        v-if="loading"
        :progress="0"
        message="Initialisation de l'application..."
        @skip="onSkip"
      />
      <RouterView v-else />
    </main>
  </div>
</template>

<style>
#app {
  width: 100%;
  height: 100%;
}

.app-layout {
  display: flex;
  width: 100%;
  height: 100vh;
  overflow: hidden;
}

.main-content {
  flex: 1;
  overflow-y: auto;
  background: var(--color-background);
}
</style>
