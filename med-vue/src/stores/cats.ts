import { defineStore } from 'pinia';
import type { Cat, LocalProgress, LocalOverrides, LeitnerEntry } from '../types/cat';
import { fetchCats, saveCatDataToServer, updateCatOverrides, deleteCatFromServer, createCatOnServer, bulkImportCats } from '../api/client';
import { getItem, setItem, STORAGE_KEYS } from '../utils/storage';

export const useCatsStore = defineStore('cats', {
  state: (): {
    cats: Cat[];
    loading: boolean;
    error: string | null;
    searchQuery: string;
    activeStatusFilter: string;
    activeCategoryFilter: string;
  } => ({
    cats: [],
    loading: false,
    error: null,
    searchQuery: '',
    activeStatusFilter: 'all',
    activeCategoryFilter: 'all'
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

      if (state.activeStatusFilter !== 'all') {
        result = result.filter(c => c.status === state.activeStatusFilter || (!c.status && state.activeStatusFilter === 'todo'));
      }

      if (state.activeCategoryFilter !== 'all') {
        result = result.filter(c => c.category === state.activeCategoryFilter);
      }

      if (state.searchQuery.trim()) {
        const q = state.searchQuery.toLowerCase().trim();
        result = result.filter(c =>
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
      try {
        const data = await fetchCats();
        const localProgress = getItem<LocalProgress>(STORAGE_KEYS.USER_PROGRESS, {});
        const localOverrides = getItem<LocalOverrides>('dr_cat_local_overrides', {});

        this.cats = (Array.isArray(data) ? data : []).map((cat: any) => {
          const localEntry = localProgress[cat.id] || {};
          const overrides = localOverrides[cat.id] || {};
          return {
            ...cat,
            status: localEntry.status || 'todo',
            notes: localEntry.notes || '',
            summary: overrides.customSummary || cat.summary,
            customSummary: overrides.customSummary || cat.summary,
            ordonnance: overrides.customOrdonnance || cat.ordonnance,
            customOrdonnance: overrides.customOrdonnance || cat.ordonnance
          };
        });
      } catch (err) {
        this.error = err instanceof Error ? err.message : 'Failed to load CATs';
        console.error('[CatsStore] initialize failed:', err);
      } finally {
        this.loading = false;
      }
    },

    async updateStatus(catId: number, status: 'todo' | 'done'): Promise<void> {
      const cat = this.cats.find(c => c.id === catId);
      if (cat) {
        cat.status = status;
      }

      const progress = getItem<LocalProgress>(STORAGE_KEYS.USER_PROGRESS, {});
      if (!progress[catId]) progress[catId] = {};
      progress[catId].status = status;
      setItem(STORAGE_KEYS.USER_PROGRESS, progress);
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

    setSearchQuery(query: string): void {
      this.searchQuery = query;
    },

    setActiveStatusFilter(filter: string): void {
      this.activeStatusFilter = filter;
    },

    setActiveCategoryFilter(filter: string): void {
      this.activeCategoryFilter = filter;
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

  streakInfo.lastDate = todayStr;
  saveStreakInfo(streakInfo);
  return streakInfo;
}
