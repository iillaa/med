<script setup lang="ts">
import { computed, watch, onMounted, onUnmounted } from 'vue'
import { RouterView, useRoute } from 'vue-router'
import { useAppStore } from './stores/app'
import AppLoadingOverlay from './components/Common/AppLoadingOverlay.vue'
import Sidebar from './components/Sidebar/Sidebar.vue'
import AddCatModal from './components/Modals/AddCatModal.vue'

const appStore = useAppStore()
const route = useRoute()

const loading = computed(() => appStore.loading)
const showSidebar = computed(() => {
  return true
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

// Keyboard shortcuts
function handleKeydown(e: KeyboardEvent) {
  const isEditing = document.activeElement?.tagName === 'INPUT' || document.activeElement?.tagName === 'TEXTAREA'
  
  // S: focus search
  if (e.key.toLowerCase() === 's' && !isEditing) {
    e.preventDefault()
    const searchBox = document.getElementById('search-input')
    if (searchBox) {
      searchBox.focus()
      searchBox.select()
    }
  }

  // Escape: close modal
  if (e.key === 'Escape') {
    const modal = document.getElementById('add-cat-modal')
    if (modal && modal.style.display !== 'none') {
      modal.style.display = 'none'
      const form = document.getElementById('add-cat-form')
      if (form) form.reset()
    }
  }

  // ArrowDown/ArrowUp: navigate CATs
  if ((e.key === 'ArrowDown' || e.key === 'ArrowUp') && !isEditing) {
    e.preventDefault()
    const activeItem = document.querySelector('.cat-item.active')
    const items = Array.from(document.querySelectorAll('.cat-item'))
    if (items.length === 0) return

    let nextIndex = 0
    if (activeItem) {
      const currentIndex = items.indexOf(activeItem)
      if (e.key === 'ArrowDown') {
        nextIndex = (currentIndex + 1) % items.length
      } else {
        nextIndex = (currentIndex - 1 + items.length) % items.length
      }
    }

    const targetItem = items[nextIndex]
    if (targetItem) {
      targetItem.click()
      targetItem.scrollIntoView({ block: 'nearest', behavior: 'smooth' })
    }
  }
}

// Online/offline handlers
function handleOnline() {
  appStore.showToast("Connexion réseau détectée. Synchronisation...", "fa-wifi", 4000)
}

function handleOffline() {
  appStore.showToast("Connexion perdue. Mode hors-ligne activé.", "fa-circle-xmark", 6000)
}

onMounted(() => {
  window.addEventListener('keydown', handleKeydown)
  window.addEventListener('online', handleOnline)
  window.addEventListener('offline', handleOffline)
})

onUnmounted(() => {
  window.removeEventListener('keydown', handleKeydown)
  window.removeEventListener('online', handleOnline)
  window.removeEventListener('offline', handleOffline)
})
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
