/// <reference types="vite/client" />

interface Window {
  Capacitor?: any;
  setLoaderProgress?: (progress: number) => void;
  __drCatBooted?: boolean;
  fetch?: typeof globalThis.fetch;
  perf?: {
    recordApiCall?: (url: string, status: number, duration: number) => void;
  };
}

declare function getExtraHeaders(url: string): Record<string, string>;
declare function detectProvider(url: string): string | null;
