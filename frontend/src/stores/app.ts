import { defineStore } from 'pinia';
import type { AppModeType } from '../types/cat';
import { getAppMode, setAppMode, isOfflineApp, checkAdminStatus, checkIsLocal, hasRemoteServerConfigured, fetchSearchStatus, fetchDiagnosticsSystem, fetchDiagnosticsDbStats, fetchDiagnosticsIndexDetail, fetchDiagnosticsRemoteUrl, updateDiagnosticsRemoteUrl, fetchTunnelInfo, fetchServerMetrics, fetchRateLimits, fetchSuggestions, approveSuggestionOnServer, rejectSuggestionOnServer, bulkImportCats } from '../api/client';
import { getItem, setItem, STORAGE_KEYS } from '../utils/storage';

export const useAppStore = defineStore('app', {
  state: (): {
    loading: boolean;
    isOffline: boolean;
    isAdmin: boolean;
    isLocal: boolean;
    theme: 'light' | 'dark';
    appMode: AppModeType;
    sidebarOpen: boolean;
    showAddCatModal: boolean;
    loadingProgress: number;
    loadingMessage: string;
    toastMessage: string;
    toastIcon: string;
    toastVisible: boolean;
    searchStatus: any;
    diagnosticsSystem: any;
    diagnosticsDbStats: any;
    diagnosticsIndexDetail: any;
    diagnosticsRemoteUrl: any;
    tunnelInfo: any;
    serverMetrics: any;
    rateLimits: any;
    suggestions: any[];
    isOnlineAtStartup: boolean;
  } => ({
    loading: true,
    isOffline: false,
    isAdmin: false,
    isLocal: false,
    theme: getItem<'light' | 'dark'>(STORAGE_KEYS.THEME, 'light'),
    appMode: getAppMode(),
    sidebarOpen: false,
    showAddCatModal: false,
    loadingProgress: 0,
    loadingMessage: '',
    toastMessage: '',
    toastIcon: 'fa-check',
    toastVisible: false,
    searchStatus: null,
    diagnosticsSystem: null,
    diagnosticsDbStats: null,
    diagnosticsIndexDetail: null,
    diagnosticsRemoteUrl: null,
    tunnelInfo: null,
    serverMetrics: null,
    rateLimits: null,
    suggestions: [],
    isOnlineAtStartup: false
  }),

  actions: {
    async initializeApp(): Promise<void> {
      this.loading = true;
      this.loadingProgress = 10;
      this.loadingMessage = "Détection du mode d'application...";
      try {
        this.isOffline = isOfflineApp;
        this.appMode = getAppMode();
        this.loadingProgress = 25;
        
        this.loadingMessage = "Vérification des droits administrateur...";
        this.isAdmin = await checkAdminStatus();
        this.isLocal = await checkIsLocal();
        this.loadingProgress = 50;
      } catch (err) {
        console.error('[AppStore] initializeApp failed:', err);
      }
    },

    toggleSidebar(): void {
      this.sidebarOpen = !this.sidebarOpen;
    },

    setSidebarOpen(open: boolean): void {
      this.sidebarOpen = open;
    },

    showToast(message: string, icon = 'fa-check', duration = 3500): void {
      this.toastMessage = message;
      this.toastIcon = icon;
      this.toastVisible = true;
      setTimeout(() => {
        if (this.toastMessage === message) {
          this.toastVisible = false;
        }
      }, duration);
    },

    hideToast(): void {
      this.toastVisible = false;
    },

    setTheme(theme: 'light' | 'dark'): void {
      this.theme = theme;
      setItem(STORAGE_KEYS.THEME, theme);
    },

    setAppMode(mode: AppModeType): void {
      this.appMode = mode;
      setAppMode(mode);
    },

    async refreshAdminStatus(): Promise<void> {
      this.isAdmin = await checkAdminStatus();
    },

    async refreshSearchStatus(): Promise<void> {
      try {
        this.searchStatus = await fetchSearchStatus();
      } catch (err) {
        console.error('[AppStore] refreshSearchStatus failed:', err);
      }
    },

    async loadDiagnosticsSystem(): Promise<void> {
      try {
        this.diagnosticsSystem = await fetchDiagnosticsSystem();
      } catch (err) {
        console.error('[AppStore] loadDiagnosticsSystem failed:', err);
        throw err;
      }
    },

    async loadDiagnosticsDbStats(): Promise<void> {
      try {
        this.diagnosticsDbStats = await fetchDiagnosticsDbStats();
      } catch (err) {
        console.error('[AppStore] loadDiagnosticsDbStats failed:', err);
        throw err;
      }
    },

    async loadDiagnosticsIndexDetail(): Promise<void> {
      try {
        this.diagnosticsIndexDetail = await fetchDiagnosticsIndexDetail();
      } catch (err) {
        console.error('[AppStore] loadDiagnosticsIndexDetail failed:', err);
        throw err;
      }
    },

    async loadDiagnosticsRemoteUrl(): Promise<void> {
      try {
        this.diagnosticsRemoteUrl = await fetchDiagnosticsRemoteUrl();
      } catch (err) {
        console.error('[AppStore] loadDiagnosticsRemoteUrl failed:', err);
        throw err;
      }
    },

    async updateRemoteServerUrl(url: string): Promise<void> {
      try {
        const result = await updateDiagnosticsRemoteUrl(url);
        this.diagnosticsRemoteUrl = result;
      } catch (err) {
        console.error('[AppStore] updateRemoteServerUrl failed:', err);
        throw err;
      }
    },

    async loadTunnelInfo(): Promise<void> {
      try {
        this.tunnelInfo = await fetchTunnelInfo();
      } catch (err) {
        console.error('[AppStore] loadTunnelInfo failed:', err);
        throw err;
      }
    },

    async loadServerMetrics(): Promise<void> {
      try {
        this.serverMetrics = await fetchServerMetrics();
      } catch (err) {
        console.error('[AppStore] loadServerMetrics failed:', err);
        throw err;
      }
    },

    async loadRateLimits(): Promise<void> {
      try {
        this.rateLimits = await fetchRateLimits();
      } catch (err) {
        console.error('[AppStore] loadRateLimits failed:', err);
        throw err;
      }
    },

    async loadSuggestions(): Promise<void> {
      try {
        this.suggestions = await fetchSuggestions();
      } catch (err) {
        console.error('[AppStore] loadSuggestions failed:', err);
        this.suggestions = [];
      }
    },

    async approveSuggestion(id: string): Promise<void> {
      try {
        const result = await approveSuggestionOnServer(id);
        if (result.success) {
          this.showToast('Proposition approuvée !', 'fa-circle-check', 3000);
          await this.loadSuggestions();
        } else {
          this.showToast('Erreur: ' + result.error, 'fa-circle-exclamation', 4000);
        }
      } catch (err) {
        console.error(err);
        this.showToast('Erreur lors de la validation.', 'fa-circle-exclamation', 4000);
      }
    },

    async rejectSuggestion(id: string): Promise<void> {
      try {
        const result = await rejectSuggestionOnServer(id);
        if (result.success) {
          this.showToast('Proposition rejetée.', 'fa-circle-xmark', 3000);
          await this.loadSuggestions();
        } else {
          this.showToast('Erreur: ' + result.error, 'fa-circle-exclamation', 4000);
        }
      } catch (err) {
        console.error(err);
        this.showToast('Erreur lors du rejet.', 'fa-circle-exclamation', 4000);
      }
    },

    async performBulkImport(importList: any[]): Promise<void> {
      try {
        const result = await bulkImportCats(importList);
        if (result.count > 0) {
          this.showToast(`${result.count} fiches importées avec succès !`, 'fa-circle-check', 4000);
        } else {
          this.showToast('Aucune nouvelle fiche importée.', 'fa-circle-exclamation', 4000);
        }
      } catch (err) {
        console.error(err);
        this.showToast("Échec de l'importation.", 'fa-circle-exclamation', 4000);
        throw err;
      }
    },

    async loginAdmin(password: string): Promise<boolean> {
      try {
        const res = await import('../api/client').then(m => m.loginAdmin(password));
        if (res.success) {
          this.isAdmin = true;
          this.showToast('Connexion administrateur réussie !', 'fa-circle-check', 3000);
          return true;
        } else {
          this.showToast(res.error || 'Mot de passe incorrect.', 'fa-circle-exclamation', 4000);
          return false;
        }
      } catch (err) {
        console.error('[AppStore] loginAdmin failed:', err);
        this.showToast('Erreur lors de la connexion.', 'fa-circle-exclamation', 4000);
        return false;
      }
    },

    async logoutAdmin(): Promise<void> {
      try {
        await import('../api/client').then(m => m.logoutAdmin());
        this.isAdmin = false;
        this.showToast('Déconnexion réussie.', 'fa-circle-check', 3000);
      } catch (err) {
        console.error('[AppStore] logoutAdmin failed:', err);
      }
    },

    resetProgress(): void {
      if (!confirm('Voulez-vous vraiment réinitialiser toute votre progression ? Cette action est irréversible.')) {
        return;
      }
      localStorage.removeItem('dr_cat_user_progress');
      localStorage.removeItem('dr_cat_local_overrides');
      localStorage.removeItem('dr_cat_leitner');
      localStorage.removeItem('dr_cat_streak');
      this.showToast('Progression réinitialisée avec succès. L\'application va se recharger.', 'fa-circle-check', 4000);
      setTimeout(() => window.location.reload(), 1500);
    },

    saveNavigationState(state: Record<string, any>): void {
      try {
        setItem(STORAGE_KEYS.NAVIGATION_STATE, state);
      } catch (err) {
        console.error('[AppStore] saveNavigationState failed:', err);
      }
    },

    getNavigationState<T>(): T | null {
      return getItem<T>(STORAGE_KEYS.NAVIGATION_STATE, null);
    },

    clearNavigationState(): void {
      localStorage.removeItem(STORAGE_KEYS.NAVIGATION_STATE);
    },

    async handleAdminError(err: any): Promise<boolean> {
      if (err && (err.message === "403 Forbidden" || err.message === "401 Unauthorized")) {
        const password = prompt("Action réservée aux administrateurs. Saisissez le mot de passe admin pour déverrouiller :");
        if (password) {
          try {
            const success = await this.loginAdmin(password);
            if (success) {
              this.showToast("Connexion réussie ! L'action va être relancée.", "fa-circle-check", 3000);
              window.location.reload();
              return true;
            }
          } catch (loginErr) {
            console.error("Login failed:", loginErr);
            this.showToast("Erreur lors de la connexion.", "fa-circle-exclamation", 4000);
          }
        }
        return true;
      }
      return false;
    }
  }
});
