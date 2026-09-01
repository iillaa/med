// Cloudflare Worker — Telemetry & Crash Reporting Route Handler
import { requireSyncSecret, syncDenied } from '../auth.js';
import { jsonResponse } from '../cors.js';

export async function handleTelemetryRoute(request, env, url) {
  // 1. DELETE /api/admin/telemetry/:id
  if (url.pathname.startsWith('/api/admin/telemetry')) {
    if (!(await requireSyncSecret(request, env))) return syncDenied();
    const parts = url.pathname.split('/');
    const targetId = parts[4];
    try {
      if (env && env.SUGGESTIONS_KV) {
        let list = [];
        const raw = await env.SUGGESTIONS_KV.get("telemetry_reports");
        if (raw) { try { list = JSON.parse(raw); } catch (_) { list = []; } }
        if (targetId === 'all' || !targetId) {
          list = [];
        } else {
          list = list.filter(r => r && r.id !== targetId);
        }
        await env.SUGGESTIONS_KV.put("telemetry_reports", JSON.stringify(list));
      }
      return jsonResponse({ success: true, message: "Rapport supprimé" });
    } catch (err) {
      return jsonResponse({ success: false, error: err.message }, 500);
    }
  }

  // 2. /api/telemetry
  if (url.pathname === '/api/telemetry') {
    if (request.method === 'POST') {
      try {
        const body = await request.json();
        const now = Date.now();
        
        let fingerprint = body.fingerprint;
        if (!fingerprint) {
          const cleanErr = String(body.error || '').trim().split('\n')[0].replace(/:\d+:\d+/g, '');
          const firstStackLine = String(body.stack || '').split('\n').find(l => l.includes('.js') || l.includes('at ')) || '';
          const cleanStack = firstStackLine.replace(/https?:\/\/[^\/]+\//g, '').replace(/:\d+:\d+/g, '').trim();
          const raw = `${cleanErr}::${cleanStack}`.toLowerCase();
          let hash = 0;
          for (let i = 0; i < raw.length; i++) {
            hash = ((hash << 5) - hash) + raw.charCodeAt(i);
            hash |= 0;
          }
          fingerprint = 'fp_' + Math.abs(hash).toString(36);
        }

        const dev = typeof body.device === 'object' && body.device !== null ? body.device : {};
        const devModel = dev.model || 'Inconnu';
        let reportId = null;

        if (env && env.SUGGESTIONS_KV) {
          let list = [];
          const raw = await env.SUGGESTIONS_KV.get("telemetry_reports");
          if (raw) { try { list = JSON.parse(raw); } catch (_) { list = []; } }

          const existingIdx = list.findIndex(r => r && (r.fingerprint === fingerprint || r.id === fingerprint));
          
          if (existingIdx !== -1) {
            const item = list[existingIdx];
            item.occurrences = (item.occurrences || 1) + 1;
            item.lastSeen = now;

            if (item.occurrences >= 20) {
              item.severity = 'critical';
            } else if (item.occurrences >= 5) {
              item.severity = 'warning';
            } else {
              item.severity = 'info';
            }

            if (!item.affectedDevices || typeof item.affectedDevices !== 'object') {
              item.affectedDevices = {};
            }
            item.affectedDevices[devModel] = (item.affectedDevices[devModel] || 0) + 1;

            if (body.stack && (!item.stack || item.stack.length < body.stack.length)) {
              item.stack = String(body.stack).substring(0, 1500);
            }
            if (body.logs && Array.isArray(body.logs) && body.logs.length > 0) {
              item.logs = body.logs.slice(-20);
            }

            reportId = item.id;
            list.splice(existingIdx, 1);
            list.unshift(item);
          } else {
            reportId = `tel_${now}_${Math.random().toString(36).substring(2, 9)}`;
            const newIncident = {
              id: reportId,
              fingerprint,
              firstSeen: now,
              lastSeen: now,
              occurrences: 1,
              severity: 'info',
              type: body.type || 'unhandled_error',
              error: String(body.error || 'Erreur non spécifiée').substring(0, 500),
              stack: String(body.stack || '').substring(0, 1500),
              device: dev,
              affectedDevices: { [devModel]: 1 },
              appVersion: String(body.appVersion || '1.17.0').substring(0, 20),
              installId: String(body.installId || '').substring(0, 50),
              logs: Array.isArray(body.logs) ? body.logs.slice(-20) : [],
              userNote: String(body.userNote || '').substring(0, 500)
            };
            list.unshift(newIncident);
          }

          if (list.length > 50) list = list.slice(0, 50);
          await env.SUGGESTIONS_KV.put("telemetry_reports", JSON.stringify(list));
        }

        return jsonResponse({
          success: true,
          id: reportId,
          fingerprint,
          message: "Rapport de diagnostic transmis au Dr. Ali."
        });
      } catch (err) {
        return jsonResponse({ success: false, error: err.message }, 400);
      }
    }

    if (request.method === 'GET') {
      if (!(await requireSyncSecret(request, env))) return syncDenied();
      try {
        let list = [];
        if (env && env.SUGGESTIONS_KV) {
          const raw = await env.SUGGESTIONS_KV.get("telemetry_reports");
          if (raw) { try { list = JSON.parse(raw); } catch (_) { list = []; } }
        }
        return jsonResponse(list, 200, { "Cache-Control": "no-store, no-cache, must-revalidate" });
      } catch (_) {
        return jsonResponse([], 200, { "Cache-Control": "no-store, no-cache, must-revalidate" });
      }
    }
  }

  return null;
}
