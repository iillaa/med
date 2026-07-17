<script setup lang="ts">
import { computed } from 'vue'
import { RouterView } from 'vue-router'
import { useAppStore } from './stores/app'
import AppLoadingOverlay from './components/Common/AppLoadingOverlay.vue'

const appStore = useAppStore()

const loading = computed(() => appStore.loading)

function onSkip() {
  appStore.loading = false
}
</script>

<template>
  <AppLoadingOverlay
    v-if="loading"
    :progress="0"
    message="Initialisation de l'application..."
    @skip="onSkip"
  />
  <RouterView v-else />
</template>

<style>
#app {
  width: 100%;
  height: 100%;
}
</style>
