<script setup lang="ts">
import { computed, watch } from 'vue'
import { RouterView, useRoute } from 'vue-router'
import { useAppStore } from './stores/app'
import AppLoadingOverlay from './components/Common/AppLoadingOverlay.vue'
import Sidebar from './components/Sidebar/Sidebar.vue'
import AddCatModal from './components/Modals/AddCatModal.vue'

const appStore = useAppStore()
const route = useRoute()

const loading = computed(() => appStore.loading)
const showSidebar = computed(() => {
  const noSidebarRoutes = ['/about']
  return !noSidebarRoutes.includes(route.path)
})

// Sync theme class to document body
watch(() => appStore.theme, (newTheme) => {
  if (newTheme === 'light') {
    document.body.classList.add('light-theme')
  } else {
    document.body.classList.remove('light-theme')
  }
}, { immediate: true })

function onSkip() {
  appStore.loading = false
}
</script>

<template>
  <div class="app-container">
    <Sidebar v-if="showSidebar" :class="{ open: appStore.sidebarOpen }" />
    
    <div 
      v-if="showSidebar" 
      class="sidebar-overlay" 
      @click="appStore.setSidebarOpen(false)"
    ></div>
    
    <main class="main-content">
      <!-- Mobile Header -->
      <header v-if="showSidebar" class="mobile-header">
        <button class="menu-btn" @click="appStore.toggleSidebar()">
          <i class="fa-solid fa-bars"></i>
        </button>
        <div class="mobile-brand">
          <img class="mobile-brand-icon" src="/drcat_logo.png" alt="Dr.CAT Logo" />
          <span>Dr.CAT</span>
        </div>
        <div style="width: 20px;"></div> <!-- balance spacer -->
      </header>

      <AppLoadingOverlay
        v-if="loading"
        :progress="appStore.loadingProgress"
        :message="appStore.loadingMessage"
        @skip="onSkip"
      />
      <RouterView v-else />
    </main>

    <!-- Global Premium Toast -->
    <div class="drcat-toast" :class="{ 'drcat-toast--visible': appStore.toastVisible }">
      <i class="drcat-toast-icon fa-solid" :class="appStore.toastIcon"></i>
      <span class="drcat-toast-msg" v-html="appStore.toastMessage"></span>
      <button class="drcat-toast-close" @click="appStore.hideToast()">×</button>
    </div>

    <AddCatModal />
  </div>
</template>

<style>
/* Base overrides to let layout.css control layout sizing */
#app {
  width: 100%;
  height: 100%;
}
</style>
