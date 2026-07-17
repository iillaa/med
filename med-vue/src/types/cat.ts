export type CatStatus = 'todo' | 'doing' | 'done';

export interface Cat {
  id: number;
  category: string;
  title: string;
  summary: string;
  red_flags: string;
  ordonnance: string;
  pdf_keywords: string[];
  status?: CatStatus;
  notes?: string;
  customSummary?: string;
  customOrdonnance?: string;
  isOffline?: boolean;
  source?: string;
}

export interface LocalProgress {
  [catId: number]: {
    status?: CatStatus;
    notes?: string;
  };
}

export interface LocalOverrides {
  [catId: number]: {
    customSummary?: string;
    customOrdonnance?: string;
    deleted?: boolean;
  };
}

export interface LeitnerEntry {
  box: number;
  lastQuizzed: number;
}

export interface StreakInfo {
  count: number;
  lastDate: string;
}

export interface PdfPage {
  page: number;
  text: string;
}

export interface PdfIndexDoc {
  pdf: string;
  pages?: PdfPage[];
}

export interface AppMode {
  ADMIN_LOCAL: 'admin_local';
  WEB_CLIENT: 'web_client';
  ANDROID_ONLINE: 'android_online';
  ANDROID_OFFLINE: 'android_offline';
}

export const APP_MODES: AppMode = {
  ADMIN_LOCAL: 'admin_local',
  WEB_CLIENT: 'web_client',
  ANDROID_ONLINE: 'android_online',
  ANDROID_OFFLINE: 'android_offline'
};

export type AppModeType = 'admin_local' | 'web_client' | 'android_online' | 'android_offline';
