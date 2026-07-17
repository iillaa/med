import { createRouter, createWebHistory } from 'vue-router'
import { useCatsStore } from '../stores/cats'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('../views/Dashboard.vue'),
    },
    {
      path: '/cats',
      name: 'cats',
      component: () => import('../views/Cats.vue'),
    },
    {
      path: '/quiz',
      name: 'quiz',
      component: () => import('../views/Quiz.vue'),
    },
    {
      path: '/workspace/:id',
      name: 'workspace',
      component: () => import('../views/Workspace.vue'),
    },
    {
      path: '/pdfs',
      name: 'pdfs',
      component: () => import('../views/Pdfs.vue'),
    },
    {
      path: '/admin',
      name: 'admin',
      component: () => import('../views/Admin.vue'),
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
