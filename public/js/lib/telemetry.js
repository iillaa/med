/**
 * Dr.CAT — Telemetry & Crash Reporting Module
 * Captures device context, logs, and error stack traces for 1-tap transmission to admin.
 */

import { safeGetItem } from './safeStorage.js';

export const SUPPORT_EMAIL = 'airdrop257@gmail.com';

/**
 * Identify detailed device and browser environment
 */
export function collectDeviceInfo() {
  if (typeof window === 'undefined') return {};

  const ua = navigator.userAgent || '';
  let model = 'Appareil inconnu';
  
  if (/Xiaomi/i.test(ua)) model = 'Xiaomi';
  else if (/Poco/i.test(ua) || /2311DRK48G|22081212UG/i.test(ua)) model = 'Xiaomi / Poco';
  else if (/Redmi/i.test(ua)) model = 'Redmi';
  else if (/Samsung|SM-/i.test(ua)) model = 'Samsung Galaxy';
  else if (/Huawei|Honor/i.test(ua)) model = 'Huawei / Honor';
  else if (/Pixel/i.test(ua)) model = 'Google Pixel';
  else if (/iPhone/i.test(ua)) model = 'Apple iPhone';
  else if (/iPad/i.test(ua)) model = 'Apple iPad';
  else if (/Android/i.test(ua)) model = 'Android Device';
  else if (/Windows/i.test(ua)) model = 'Windows PC';
  else if (/Macintosh/i.test(ua)) model = 'macOS';
  else if (/Linux/i.test(ua)) model = 'Linux';

  const isStandalone = window.matchMedia?.('(display-mode: standalone)')?.matches || window.navigator?.standalone;
  const isCapacitor = !!window.Capacitor;
  const appMode = isCapacitor ? 'Android APK' : (isStandalone ? 'PWA' : 'Web Browser');

  return {
    model,
    userAgent: ua,
    appMode,
    screen: `${window.innerWidth}x${window.innerHeight} (dpr: ${window.devicePixelRatio || 1})`,
    language: navigator.language || 'fr-FR',
    online: !!navigator.onLine,
    connection: navigator.connection?.effectiveType || 'unknown',
    memory: navigator.deviceMemory ? `${navigator.deviceMemory} GB` : 'unknown',
    timestamp: new Date().toISOString()
  };
}

/**
 * Get current App Version from meta tag
 */
export function getAppVersion() {
  if (typeof document === 'undefined') return '1.15.2';
  const meta = document.querySelector('meta[name="app-version"]');
  return meta ? meta.getAttribute('content') : '1.15.2';
}

/**
 * Get Install ID from safe storage
 */
export function getInstallId() {
  return safeGetItem('dr_cat_install_id') || 'unknown';
}

/**
 * Generate a deterministic fingerprint for an error
 */
export function generateErrorFingerprint(error = '', stack = '') {
  const cleanError = String(error).trim().split('\n')[0].replace(/:\d+:\d+/g, '');
  const firstStackLine = String(stack).split('\n').find(l => l.includes('.js') || l.includes('at ')) || '';
  const cleanStack = firstStackLine.replace(/https?:\/\/[^\/]+\//g, '').replace(/:\d+:\d+/g, '').trim();
  const raw = `${cleanError}::${cleanStack}`.toLowerCase();
  
  // Simple fast string hash
  let hash = 0;
  for (let i = 0; i < raw.length; i++) {
    hash = ((hash << 5) - hash) + raw.charCodeAt(i);
    hash |= 0;
  }
  return 'fp_' + Math.abs(hash).toString(36);
}

// Client-side rate-limiting and deduplication state
const sentFingerprints = new Set();
let clientReportCount = 0;
let lastReportWindowStart = Date.now();
const MAX_REPORTS_PER_10_MIN = 3;

/**
 * Send Error Report to Remote Endpoint with Client-side Deduplication
 */
export async function sendErrorReport({
  error = 'Erreur inconnue',
  stack = '',
  logs = [],
  type = 'unhandled_error',
  userNote = '',
  force = false
} = {}) {
  const now = Date.now();
  if (now - lastReportWindowStart > 10 * 60 * 1000) {
    clientReportCount = 0;
    lastReportWindowStart = now;
  }

  const fingerprint = generateErrorFingerprint(error, stack);

  // Deduplication: Avoid sending the exact same error multiple times per session
  if (!force && sentFingerprints.has(fingerprint)) {
    return { success: true, deduplicated: true, message: 'Erreur déjà signalée récemment.' };
  }

  // Rate-limiting: Don't spam more than MAX_REPORTS_PER_10_MIN
  if (!force && clientReportCount >= MAX_REPORTS_PER_10_MIN) {
    return { success: false, throttled: true, message: 'Limite de rapports atteinte pour cette session.' };
  }

  sentFingerprints.add(fingerprint);
  clientReportCount++;

  const device = collectDeviceInfo();
  const appVersion = getAppVersion();
  const installId = getInstallId();

  const payload = {
    type,
    fingerprint,
    error: String(error).slice(0, 500),
    stack: String(stack).slice(0, 1500),
    logs: Array.isArray(logs) ? logs.slice(-20) : [],
    device,
    appVersion,
    installId,
    userNote: String(userNote).slice(0, 500),
    timestamp: now
  };

  // Determine target API endpoints
  const endpoints = [];
  
  if (typeof window !== 'undefined' && window.REMOTE_SERVER_URLS && Array.isArray(window.REMOTE_SERVER_URLS)) {
    window.REMOTE_SERVER_URLS.forEach(u => endpoints.push(`${u.replace(/\/+$/, '')}/api/telemetry`));
  }
  endpoints.push('/api/telemetry');

  let lastError = null;
  for (const url of endpoints) {
    try {
      const res = await fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'x-app-key': 'drcat_pub_2f7a91c4e8',
          'ngrok-skip-browser-warning': 'true'
        },
        body: JSON.stringify(payload)
      });

      if (res.ok) {
        const data = await res.json();
        return { success: true, id: data.id, fingerprint, message: 'Rapport envoyé avec succès !' };
      }
    } catch (err) {
      lastError = err;
    }
  }

  // If network transmission fails, fallback to mailto
  console.warn('[Telemetry] Remote transmission failed, offering email fallback:', lastError);
  return { success: false, fallbackToMail: true, payload };
}

/**
 * Open Email Client Pre-filled with Crash Diagnostics
 */
export function openMailtoFallback({ error, stack, logs, device, userNote }) {
  const subject = encodeURIComponent(`[Dr. CAT Diagnostic] ${error || 'Rapport de bug'}`);
  const dev = device || collectDeviceInfo();
  
  let body = `Bonjour Dr. Ali,\n\nVoici le rapport de diagnostic de Dr. CAT :\n\n`;
  body += `📌 Appareil : ${dev.model} (${dev.appMode})\n`;
  body += `📱 Écran : ${dev.screen}\n`;
  body += `📦 Version : ${getAppVersion()}\n\n`;
  body += `❌ Erreur : ${error}\n\n`;
  if (stack) body += `StackTrace :\n${stack}\n\n`;
  if (userNote) body += `Note utilisateur :\n${userNote}\n\n`;
  
  if (Array.isArray(logs) && logs.length > 0) {
    body += `📜 Derniers logs :\n` + logs.slice(-15).map(l => `[${l.timestamp || ''}] [${l.level || 'log'}] ${l.message || ''}`).join('\n');
  }

  const mailtoUrl = `mailto:${SUPPORT_EMAIL}?subject=${subject}&body=${encodeURIComponent(body)}`;
  
  if (typeof window !== 'undefined') {
    if (window.Capacitor && window.Capacitor.Commands && typeof window.Capacitor.Commands.openUrl === 'function') {
      window.Capacitor.Commands.openUrl({ url: mailtoUrl });
    } else {
      window.open(mailtoUrl, '_system');
    }
  }
}

let lastHeartbeatTimestamp = 0;

/**
 * Send lightweight non-blocking active device heartbeat
 */
export async function sendHeartbeatPing() {
  if (typeof window === 'undefined') return;
  const now = Date.now();
  // Throttle to maximum once every 5 minutes
  if (now - lastHeartbeatTimestamp < 5 * 60 * 1000) return;
  lastHeartbeatTimestamp = now;

  const device = collectDeviceInfo();
  const appVersion = getAppVersion();
  const installId = getInstallId();
  const isCapacitor = !!window.Capacitor || (window.Capacitor && window.Capacitor.isNativePlatform && window.Capacitor.isNativePlatform()) || navigator.userAgent.toLowerCase().includes('capacitor') || window.location.protocol === 'file:' || window.location.protocol.startsWith('capacitor');
  const isStandalone = typeof window !== 'undefined' && (window.matchMedia?.('(display-mode: standalone)')?.matches || window.navigator?.standalone === true);

  let platform = 'web_browser';
  if (isCapacitor) {
    platform = 'android_apk';
  } else if (isStandalone) {
    platform = 'web_pwa';
  }

  const payload = {
    installId,
    appVersion,
    platform,
    appMode: device.appMode,
    screen: device.screen,
    deviceModel: device.model,
    timestamp: now
  };

  const endpoints = [];
  if (window.api && typeof window.api.getConfiguredRemoteUrls === 'function') {
    const list = window.api.getConfiguredRemoteUrls();
    if (Array.isArray(list)) {
      list.forEach(u => endpoints.push(`${u.replace(/\/+$/, '')}/api/active-devices/ping`));
    }
  }
  if (window.REMOTE_SERVER_URLS && Array.isArray(window.REMOTE_SERVER_URLS)) {
    window.REMOTE_SERVER_URLS.forEach(u => {
      const pingUrl = `${u.replace(/\/+$/, '')}/api/active-devices/ping`;
      if (!endpoints.includes(pingUrl)) endpoints.push(pingUrl);
    });
  }
  endpoints.push('/api/active-devices/ping');

  for (const url of endpoints) {
    try {
      const res = await fetch(url, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'x-app-key': 'drcat_pub_2f7a91c4e8',
          'x-install-id': installId,
          'x-app-version': appVersion,
          'x-device-platform': platform,
          'ngrok-skip-browser-warning': 'true'
        },
        body: JSON.stringify(payload),
        cache: 'no-store',
        keepalive: true
      });
      if (res.ok) {
        break;
      }
    } catch (_) {
      // Gracefully continue to next endpoint
    }
  }
}

