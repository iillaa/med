import { defineStore } from 'pinia';
import type { AppModeType } from '../types/cat';
import { getAppMode, setAppMode, isOfflineApp, checkAdminStatus, checkIsLocal, hasRemoteServerConfigured, fetchSearchStatus, fetchDiagnosticsSystem, fetchDiagnosticsDbStats, fetchDiagnosticsIndexDetail, fetchDiagnosticsRemoteUrl, updateDiagnosticsRemoteUrl, fetchTunnelInfo, fetchServerMetrics, fetchRateLimits } from '../api/client';
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
  } => ({
    loading: true,
    isOffline: false,
    isAdmin: false,
    isLocal: false,
    theme: getItem<'light' | 'dark'>(STORAGE_KEYS.THEME, 'light'),
    appMode: getAppMode(),
    sidebarOpen: false,
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
    rateLimits: null
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
    }
  }
});
