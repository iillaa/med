import { createRouter, createWebHistory } from 'vue-router'
import { useCatsStore } from '../stores/cats'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('../views/HomeView.vue'),
    },
    {
      path: '/about',
      name: 'about',
      component: () => import('../views/AboutView.vue'),
    },
  ],
})

router.beforeEach(async () => {
  const catsStore = useCatsStore()
  if (catsStore.cats.length === 0 && !catsStore.loading) {
    await catsStore.initialize()
  }
})

export default router
