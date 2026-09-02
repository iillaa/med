// Cloudflare Worker — Active Devices & Global Telemetry Heartbeat Route Handler
import { requireSyncSecret, syncDenied } from '../auth.js';
import { jsonResponse } from '../cors.js';

const NINETY_DAYS_MS = 90 * 24 * 60 * 60 * 1000;
const MAX_DEVICES_LIMIT = 500;

export async function handleActiveDevicesRoute(request, env, url) {
  // 1. GET /api/active-devices (Server-to-Server Sync from Termux)
  if (url.pathname === '/api/active-devices') {
    if (request.method === 'GET') {
      if (!(await requireSyncSecret(request, env))) return syncDenied();
      try {
        let devices = {};
        if (env && env.SUGGESTIONS_KV) {
          const raw = await env.SUGGESTIONS_KV.get("active_devices");
          if (raw) {
            try { devices = JSON.parse(raw); } catch (_) { devices = {}; }
          }
        }
        return jsonResponse({
          success: true,
          devices,
          timestamp: new Date().toISOString()
        }, 200, { "Cache-Control": "no-store, no-cache, must-revalidate" });
      } catch (err) {
        return jsonResponse({ success: false, error: err.message }, 500);
      }
    }
  }

  // 2. POST /api/active-devices/reset (Server-to-Server Wipe)
  if (url.pathname === '/api/active-devices/reset') {
    if (request.method === 'POST') {
      if (!(await requireSyncSecret(request, env))) return syncDenied();
      try {
        if (env && env.SUGGESTIONS_KV) {
          await env.SUGGESTIONS_KV.put("active_devices", JSON.stringify({}));
        }
        return jsonResponse({ success: true, message: "Registre d'appareils Edge réinitialisé" });
      } catch (err) {
        return jsonResponse({ success: false, error: err.message }, 500);
      }
    }
  }

  // 3. POST /api/active-devices/ping (Public Heartbeat Ping from Web / Android)
  if (url.pathname === '/api/active-devices/ping' || url.pathname === '/api/telemetry/heartbeat') {
    if (request.method === 'POST') {
      try {
        let body = {};
        try {
          body = await request.json();
        } catch (_) {
          body = {};
        }

        const installId = body.installId || request.headers.get('x-install-id');
        if (!installId || typeof installId !== 'string' || !installId.startsWith('drcat-inst-')) {
          return jsonResponse({ success: false, error: "Identifiant d'installation invalide" }, 400);
        }

        const now = new Date().toISOString();
        const nowMs = Date.now();
        const appVersion = body.appVersion || request.headers.get('x-app-version') || '1.21.0';
        const explicitPlat = body.platform || request.headers.get('x-device-platform') || request.headers.get('x-capacitor-platform');
        const ua = (request.headers.get('user-agent') || '').toLowerCase();
        
        let platform = 'web_browser';
        if (explicitPlat === 'android_apk' || explicitPlat === 'android' || ua.includes('capacitor')) {
          platform = 'android_apk';
        } else if (explicitPlat === 'web_pwa') {
          platform = 'web_pwa';
        }

        // Country resolution from Cloudflare GeoIP
        const country = request.cf?.country || request.headers.get('cf-ipcountry') || 'DZ';
        const city = request.cf?.city || '';
        const screen = body.screen || '';
        const deviceModel = body.deviceModel || '';

        if (env && env.SUGGESTIONS_KV) {
          let devices = {};
          const raw = await env.SUGGESTIONS_KV.get("active_devices");
          if (raw) {
            try { devices = JSON.parse(raw); } catch (_) { devices = {}; }
          }

          const existing = devices[installId] || {
            installId,
            firstSeen: now,
            requestCount: 0
          };

          existing.appVersion = appVersion;
          existing.platform = platform;
          existing.lastSeen = now;
          existing.country = country;
          if (city) existing.city = city;
          if (screen) existing.screen = screen;
          if (deviceModel) existing.deviceModel = deviceModel;
          existing.requestCount = (existing.requestCount || 0) + 1;

          devices[installId] = existing;

          // Prune devices inactive for > 90 days and cap at MAX_DEVICES_LIMIT
          const entries = Object.entries(devices);
          const validEntries = entries.filter(([, dev]) => {
            const lastSeenMs = new Date(dev.lastSeen).getTime() || 0;
            return (nowMs - lastSeenMs) <= NINETY_DAYS_MS;
          });

          // Sort by lastSeen descending if count exceeds MAX_DEVICES_LIMIT
          if (validEntries.length > MAX_DEVICES_LIMIT) {
            validEntries.sort((a, b) => new Date(b[1].lastSeen).getTime() - new Date(a[1].lastSeen).getTime());
            validEntries.length = MAX_DEVICES_LIMIT;
          }

          const prunedDevices = Object.fromEntries(validEntries);
          await env.SUGGESTIONS_KV.put("active_devices", JSON.stringify(prunedDevices));
        }

        return jsonResponse({
          success: true,
          installId,
          country,
          message: "Heartbeat enregistré"
        });
      } catch (err) {
        return jsonResponse({ success: false, error: err.message }, 500);
      }
    }
  }

  return null;
}
