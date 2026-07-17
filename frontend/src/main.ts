import './assets/style.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'
import { useAppStore } from './stores/app'
import { useCatsStore } from './stores/cats'

const app = createApp(App)

const pinia = createPinia()
app.use(pinia)
app.use(router)

const appStore = useAppStore(pinia)
const catsStore = useCatsStore(pinia)

appStore.initializeApp().then(() => {
  catsStore.initialize().then(() => {
    app.mount('#app')
  }).catch(err => {
    console.error('[main] Failed to initialize cats:', err)
    app.mount('#app')
  })
}).catch(err => {
  console.error('[main] Failed to initialize app:', err)
  app.mount('#app')
})
