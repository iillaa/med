import { defineStore } from 'pinia';
import type { Cat, CatStatus, LocalProgress, LocalOverrides, LeitnerEntry } from '../types/cat';
import { fetchCats, saveCatDataToServer, updateCatOverrides, deleteCatFromServer, createCatOnServer, bulkImportCats, fetchPdfs, fetchPdfIndexStatus } from '../api/client';
import { getItem, setItem, STORAGE_KEYS } from '../utils/storage';
import { hapticFeedback } from '../utils/haptics';
import { useAppStore } from './app';

export const useCatsStore = defineStore('cats', {
  state: (): {
    cats: Cat[];
    loading: boolean;
    error: string | null;
    searchQuery: string;
    activeStatusFilter: string;
    activeCategoryFilter: string;
    allPdfs: any[];
    pdfIndexStatus: Record<string, any>;
  } => ({
    cats: [],
    loading: false,
    error: null,
    searchQuery: '',
    activeStatusFilter: 'all',
    activeCategoryFilter: 'all',
    allPdfs: [],
    pdfIndexStatus: {}
  }),

  getters: {
    stats: (state): { total: number; done: number; todo: number; masteryPercent: number } => {
      const total = state.cats.length;
      const done = state.cats.filter(c => c.status === 'done').length;
      const todo = state.cats.filter(c => c.status === 'todo' || !c.status).length;
      const masteryPercent = total > 0 ? Math.round((done / total) * 100) : 0;
      return { total, done, todo, masteryPercent };
    },

    categories: (state): string[] => {
      const cats = state.cats;
      const catsList = Array.isArray(cats) ? cats : [];
      const set = new Set(catsList.map(c => c.category));
      return Array.from(set).sort();
    },

    filtered: (state): Cat[] => {
      let result = state.cats;

      if (state.activeStatusFilter === 'redflags') {
        result = result.filter(c => c.red_flags && c.red_flags.trim().length > 0 && 
                        !c.red_flags.toLowerCase().includes("aucun signe de gravité") && 
                        !c.red_flags.toLowerCase().includes("aucun"));
      } else if (state.activeStatusFilter !== 'all') {
        result = result.filter(c => c.status === state.activeStatusFilter || (!c.status && state.activeStatusFilter === 'todo'));
      }

      if (state.activeCategoryFilter !== 'all') {
        result = result.filter(c => c.category === state.activeCategoryFilter);
      }

      if (state.searchQuery.trim()) {
        const q = state.searchQuery.toLowerCase().trim();
        result = result.filter(c =>
          c.id.toString() === q ||
          c.title.toLowerCase().includes(q) ||
          c.category.toLowerCase().includes(q) ||
          (c.summary && c.summary.toLowerCase().includes(q)) ||
          (c.red_flags && c.red_flags.toLowerCase().includes(q))
        );
      }

      return result;
    },

    doneCats: (state): Cat[] => {
      return state.cats.filter(c => c.status === 'done');
    },

    doingCats: (state): Cat[] => {
      return state.cats.filter(c => c.status === 'doing' || (!c.status && c.status !== 'todo'));
    }
  },

  actions: {
    async initialize(): Promise<void> {
      this.loading = true;
      this.error = null;
      const appStore = useAppStore();
      try {
        appStore.loadingMessage = "Récupération des fiches cliniques...";
        appStore.loadingProgress = 60;
        const data = await fetchCats();

        appStore.loadingMessage = "Chargement des PDFs de référence...";
        appStore.loadingProgress = 70;
        try {
          this.allPdfs = await fetchPdfs();
        } catch (pdfErr) {
          console.warn('[CatsStore] Failed to fetch PDFs:', pdfErr);
          this.allPdfs = [];
        }

        appStore.loadingMessage = "Chargement de la progression locale...";
        appStore.loadingProgress = 80;
        const localProgress = getItem<LocalProgress>(STORAGE_KEYS.USER_PROGRESS, {});
        const localOverrides = getItem<LocalOverrides>('dr_cat_local_overrides', {});

        this.cats = (Array.isArray(data) ? data : []).map((cat: any) => {
          const localEntry = localProgress[cat.id] || {};
          const overrides = localOverrides[cat.id] || {};
          return {
            ...cat,
            status: localEntry.status || 'todo',
            notes: localEntry.notes || '',
            lastRead: localEntry.lastRead || undefined,
            summary: overrides.customSummary || cat.summary,
            customSummary: overrides.customSummary || cat.summary,
            ordonnance: overrides.customOrdonnance || cat.ordonnance,
            customOrdonnance: overrides.customOrdonnance || cat.ordonnance
          };
        });

        appStore.loadingProgress = 100;
        appStore.loadingMessage = "Prêt !";
        setTimeout(() => {
          appStore.loading = false;
        }, 300);
      } catch (err) {
        this.error = err instanceof Error ? err.message : 'Failed to load CATs';
        console.error('[CatsStore] initialize failed:', err);
        appStore.loading = false;
      } finally {
        this.loading = false;
      }
    },

    async updateStatus(catId: number, status: CatStatus): Promise<void> {
      const cat = this.cats.find(c => c.id === catId)
      if (cat) {
        cat.status = status
      }

      const progress = getItem<LocalProgress>(STORAGE_KEYS.USER_PROGRESS, {})
      if (!progress[catId]) progress[catId] = {}
      progress[catId].status = status
      setItem(STORAGE_KEYS.USER_PROGRESS, progress)

      if (status === 'done') {
        hapticFeedback('success')
      } else if (status === 'doing') {
        hapticFeedback('medium')
      }
    },

    updateNotes(catId: number, notes: string): void {
      const cat = this.cats.find(c => c.id === catId);
      if (cat) {
        cat.notes = notes;
      }

      const progress = getItem<LocalProgress>(STORAGE_KEYS.USER_PROGRESS, {});
      if (!progress[catId]) progress[catId] = {};
      progress[catId].notes = notes;
      setItem(STORAGE_KEYS.USER_PROGRESS, progress);
    },

    async updateSummary(catId: number, summary: string): Promise<void> {
      const cat = this.cats.find(c => c.id === catId);
      if (cat) {
        cat.summary = summary;
        cat.customSummary = summary;
      }

      const localOverrides = getItem<any>('dr_cat_local_overrides', {});
      if (!localOverrides[catId]) localOverrides[catId] = {};
      localOverrides[catId].customSummary = summary;
      setItem('dr_cat_local_overrides', localOverrides);

      try {
        await saveCatDataToServer(catId, { summary });
      } catch (err) {
        console.error('[CatsStore] updateSummary failed:', err);
      }
    },

    async updateOrdonnance(catId: number, ordonnance: string): Promise<void> {
      const cat = this.cats.find(c => c.id === catId);
      if (cat) {
        cat.ordonnance = ordonnance;
        cat.customOrdonnance = ordonnance;
      }

      const localOverrides = getItem<any>('dr_cat_local_overrides', {});
      if (!localOverrides[catId]) localOverrides[catId] = {};
      localOverrides[catId].customOrdonnance = ordonnance;
      setItem('dr_cat_local_overrides', localOverrides);

      try {
        await saveCatDataToServer(catId, { ordonnance });
      } catch (err) {
        console.error('[CatsStore] updateOrdonnance failed:', err);
      }
    },

    async deleteCat(catId: number): Promise<void> {
      this.cats = this.cats.filter(c => c.id !== catId);
      try {
        await deleteCatFromServer(catId);
      } catch (err) {
        console.error('[CatsStore] deleteCat failed:', err);
      }
    },

    async createCat(catData: Partial<Cat>): Promise<Cat | null> {
      try {
        const result = await createCatOnServer(catData);
        if (result && result.success && result.cat) {
          this.cats.push(result.cat);
          return result.cat;
        }
      } catch (err) {
        console.error('[CatsStore] createCat failed:', err);
      }
      return null;
    },

    async bulkImport(importList: any[]): Promise<void> {
      try {
        await bulkImportCats(importList);
        await this.initialize();
      } catch (err) {
        console.error('[CatsStore] bulkImport failed:', err);
        throw err;
      }
    },

    markAsRead(catId: number): void {
      const cat = this.cats.find(c => c.id === catId);
      if (cat) {
        const now = Date.now();
        cat.lastRead = now;

        const progress = getItem<LocalProgress>(STORAGE_KEYS.USER_PROGRESS, {});
        if (!progress[catId]) progress[catId] = {};
        progress[catId].lastRead = now;
        setItem(STORAGE_KEYS.USER_PROGRESS, progress);
      }
    },

    setSearchQuery(query: string): void {
      this.searchQuery = query;
    },

    setActiveStatusFilter(filter: string): void {
      this.activeStatusFilter = filter;
    },

    setActiveCategoryFilter(filter: string): void {
      this.activeCategoryFilter = filter;
    },

    async updatePdfIndexStatus(): Promise<void> {
      try {
        this.pdfIndexStatus = await fetchPdfIndexStatus();
      } catch (err) {
        console.error('[CatsStore] updatePdfIndexStatus failed:', err);
      }
    },

    async fetchCatsFromApi(since?: number): Promise<Cat[]> {
      const data = await fetchCats(since)
      return Array.isArray(data) ? data : []
    },

    refreshSidebar(): void {
      window.dispatchEvent(new CustomEvent('drcat-cats-updated'))
    },

    refreshDashboard(): void {
      window.dispatchEvent(new CustomEvent('drcat-cats-updated'))
    }
  }
});

export type LeitnerData = Record<number, LeitnerEntry>;

export function getLeitnerData(): LeitnerData {
  return getItem<LeitnerData>('dr_cat_leitner', {});
}

export function saveLeitnerData(data: LeitnerData): void {
  setItem('dr_cat_leitner', data);
}

export function updateLeitnerStats(catId: number, wasCorrect: boolean): void {
  let leitnerData = getLeitnerData();
  const current = leitnerData[catId] || { box: 1, lastQuizzed: 0 };

  if (wasCorrect) {
    current.box = Math.min(5, (current.box || 1) + 1);
  } else {
    current.box = 1;
  }
  current.lastQuizzed = Date.now();

  leitnerData[catId] = current;
  saveLeitnerData(leitnerData);
}

export function getStreakInfo(): { count: number; lastDate: string } {
  return getItem<{ count: number; lastDate: string }>('dr_cat_streak', { count: 0, lastDate: '' });
}

export function saveStreakInfo(info: { count: number; lastDate: string }): void {
  setItem('dr_cat_streak', info);
}

export function updateQuizStreak(): { count: number; lastDate: string } {
  const todayStr = new Date().toISOString().split('T')[0];
  let streakInfo = getStreakInfo();

  if (streakInfo.lastDate === todayStr) {
    return streakInfo;
  }

  const yesterday = new Date();
  yesterday.setDate(yesterday.getDate() - 1);
  const yesterdayStr = yesterday.toISOString().split('T')[0];

  if (streakInfo.lastDate === yesterdayStr) {
    streakInfo.count += 1;
  } else {
    streakInfo.count = 1;
  }

  streakInfo.lastDate = todayStr as string;
  saveStreakInfo(streakInfo);
  return streakInfo;
}
