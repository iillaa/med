// Native Cloudflare Worker entrypoint (worker.js)
// Handles API routes natively on Cloudflare edge network and serves static assets

const APP_DATA_KEY = 'drcat_pub_2f7a91c4e8';

async function isValidSyncSecret(provided, expected) {
  if (!expected || typeof provided !== 'string' || provided.length === 0) return false;
  const enc = new TextEncoder();
  const a = await crypto.subtle.digest('SHA-256', enc.encode(provided));
  const b = await crypto.subtle.digest('SHA-256', enc.encode(expected));
  const av = new Uint8Array(a);
  const bv = new Uint8Array(b);
  let diff = 0;
  for (let i = 0; i < av.length; i++) diff |= av[i] ^ bv[i];
  return diff === 0;
}

// Gate for server-to-server routes (sync, ack, purge). Client POST stays open.
function requireSyncSecret(request, env) {
  const provided = request.headers.get('x-sync-secret');
  return isValidSyncSecret(provided, env && env.SYNC_SECRET);
}

const syncDenied = () => new Response(JSON.stringify({
  success: false,
  error: 'Secret de synchronisation requis (en-tête x-sync-secret).'
}), {
  status: 403,
  headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
});

export default {
  async fetch(request, env, ctx) {
    // 1. Universal CORS Preflight Handling
    if (request.method === 'OPTIONS') {
      return new Response(null, {
        status: 204,
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS, HEAD',
          'Access-Control-Allow-Headers': '*',
          'Access-Control-Max-Age': '86400'
        }
      });
    }

    const url = new URL(request.url);

    // 2. ACK handler: POST /api/suggestions/ack — Termux acknowledges receipt of suggestions
    if (url.pathname === '/api/suggestions/ack' && request.method === 'POST') {
      if (!(await requireSyncSecret(request, env))) return syncDenied();
      try {
        const { ids } = await request.json();
        if (Array.isArray(ids) && ids.length > 0 && env && env.SUGGESTIONS_KV) {
          let list = [];
          const raw = await env.SUGGESTIONS_KV.get("pending_suggestions");
          if (raw) { try { list = JSON.parse(raw); } catch (_) { list = []; } }
          
          // Mark acknowledged IDs as synced or purge them so they are never sent twice
          const filtered = list.filter(s => s && !ids.includes(s.id));
          await env.SUGGESTIONS_KV.put("pending_suggestions", JSON.stringify(filtered));
        }
        return new Response(JSON.stringify({ success: true, message: "Acknowledged receipt" }), {
          status: 200,
          headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
        });
      } catch (err) {
        return new Response(JSON.stringify({ success: false, error: err.message }), {
          status: 500,
          headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
        });
      }
    }

    // 3. Delete/Purge specific suggestion: DELETE /api/suggestions/:id
    if (url.pathname.startsWith('/api/suggestions/')) {
      const parts = url.pathname.split('/');
      const targetId = parts[3];
      if (targetId && (request.method === 'DELETE' || request.method === 'POST')) {
        if (!(await requireSyncSecret(request, env))) return syncDenied();
        try {
          if (env && env.SUGGESTIONS_KV) {
            let list = [];
            const raw = await env.SUGGESTIONS_KV.get("pending_suggestions");
            if (raw) { try { list = JSON.parse(raw); } catch (_) { list = []; } }
            const filtered = list.filter(s => s && s.id !== targetId);
            await env.SUGGESTIONS_KV.put("pending_suggestions", JSON.stringify(filtered));
          }
          return new Response(JSON.stringify({ success: true, message: "Purged from Cloudflare KV" }), {
            status: 200,
            headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
          });
        } catch (err) {
          return new Response(JSON.stringify({ success: false, error: err.message }), {
            status: 500,
            headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
          });
        }
      }
    }

    // 4. /api/suggestions (Serverless Suggestion Store in Cloudflare KV)
    if (url.pathname === '/api/suggestions') {
      if (request.method === 'POST') {
        // Client submissions: require the public app key (anti-spam parity with Node backend)
        if (request.headers.get('x-app-key') !== APP_DATA_KEY) {
          return new Response(JSON.stringify({ success: false, error: 'Accès interdit.' }), {
            status: 403,
            headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
          });
        }
        try {
          const body = await request.json();
          const suggestionId = `sug_${Date.now()}_${Math.random().toString(36).substring(2, 9)}`;
          const newSuggestion = {
            id: suggestionId,
            type: body.type || 'edit',
            catId: body.catId || null,
            timestamp: Date.now(),
            status: 'pending',
            data: body.data || {}
          };

          if (env && env.SUGGESTIONS_KV) {
            let list = [];
            const raw = await env.SUGGESTIONS_KV.get("pending_suggestions");
            if (raw) { try { list = JSON.parse(raw); } catch (_) { list = []; } }
            list.unshift(newSuggestion);
            await env.SUGGESTIONS_KV.put("pending_suggestions", JSON.stringify(list));
          }

          return new Response(JSON.stringify({
            success: true,
            message: "Proposition envoyée à l'administrateur pour validation.",
            suggestion: newSuggestion
          }), {
            status: 200,
            headers: {
              "Content-Type": "application/json",
              "Access-Control-Allow-Origin": "*"
            }
          });
        } catch (err) {
          return new Response(JSON.stringify({ success: false, error: err.message }), {
            status: 400,
            headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
          });
        }
      }

      // GET /api/suggestions — Fetch un-acknowledged suggestions from Cloudflare KV
      // (server-to-server sync only — leaks user suggestion content, gated by SYNC_SECRET)
      if (!(await requireSyncSecret(request, env))) return syncDenied();
      try {
        let list = [];
        if (env && env.SUGGESTIONS_KV) {
          const raw = await env.SUGGESTIONS_KV.get("pending_suggestions");
          if (raw) {
            try { list = JSON.parse(raw); } catch (_) { list = []; }
          }
        }
        return new Response(JSON.stringify(list), {
          status: 200,
          headers: {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*"
          }
        });
      } catch (err) {
        return new Response(JSON.stringify([]), {
          status: 200,
          headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
        });
      }
    }

    // 5. /api/telemetry (Crash reports & mobile debug telemetry with Incident Aggregation)
    if (url.pathname === '/api/telemetry') {
      if (request.method === 'POST') {
        try {
          const body = await request.json();
          const now = Date.now();
          
          // Generate or extract fingerprint
          let fingerprint = body.fingerprint;
          if (!fingerprint) {
            const cleanErr = String(body.error || '').trim().split('\n')[0].replace(/:\d+:\d+/g, '');
            const cleanStack = String(body.stack || '').split('\n')[0].replace(/https?:\/\/[^\/]+\//g, '').replace(/:\d+:\d+/g, '');
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
              // Existing Incident -> Bump occurrences & update severity
              const item = list[existingIdx];
              item.occurrences = (item.occurrences || 1) + 1;
              item.lastSeen = now;

              if (item.occurrences >= 20) {
                item.severity = 'critical'; // 🔴 Global Outage
              } else if (item.occurrences >= 5) {
                item.severity = 'warning';  // 🟠 Recurring
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
              // New Incident Group
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
                appVersion: String(body.appVersion || '1.16.0').substring(0, 20),
                installId: String(body.installId || '').substring(0, 50),
                logs: Array.isArray(body.logs) ? body.logs.slice(-20) : [],
                userNote: String(body.userNote || '').substring(0, 500)
              };
              list.unshift(newIncident);
            }

            if (list.length > 50) list = list.slice(0, 50);
            await env.SUGGESTIONS_KV.put("telemetry_reports", JSON.stringify(list));
          }

          return new Response(JSON.stringify({
            success: true,
            id: reportId,
            fingerprint,
            message: "Rapport de diagnostic transmis au Dr. Ali."
          }), {
            status: 200,
            headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
          });
        } catch (err) {
          return new Response(JSON.stringify({ success: false, error: err.message }), {
            status: 400,
            headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
          });
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
          return new Response(JSON.stringify(list), {
            status: 200,
            headers: {
              "Content-Type": "application/json",
              "Access-Control-Allow-Origin": "*",
              "Cache-Control": "no-store, no-cache, must-revalidate"
            }
          });
        } catch (err) {
          return new Response(JSON.stringify([]), {
            status: 200,
            headers: {
              "Content-Type": "application/json",
              "Access-Control-Allow-Origin": "*",
              "Cache-Control": "no-store, no-cache, must-revalidate"
            }
          });
        }
      }
    }

    // 6. Delete telemetry report: DELETE /api/admin/telemetry/:id
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
        return new Response(JSON.stringify({ success: true, message: "Rapport supprimé" }), {
          status: 200,
          headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
        });
      } catch (err) {
        return new Response(JSON.stringify({ success: false, error: err.message }), {
          status: 500,
          headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
        });
      }
    }

    // Helper: fetch static asset with CORS headers (query strings stripped via clean asset URL)
    async function fetchStaticAsset(assetPath) {
      try {
        const assetUrl = new URL(assetPath, request.url);
        const res = await env.ASSETS.fetch(assetUrl);
        const newRes = new Response(res.body, res);
        newRes.headers.set('Access-Control-Allow-Origin', '*');
        newRes.headers.set('Access-Control-Allow-Methods', 'GET, HEAD, OPTIONS');
        newRes.headers.set('Access-Control-Allow-Headers', '*');
        newRes.headers.set('Content-Type', 'application/json; charset=utf-8');
        return newRes;
      } catch (err) {
        return new Response(JSON.stringify({ error: err.message }), {
          status: 500,
          headers: { 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' }
        });
      }
    }

    // 5. GET /api/cats -> Native Edge Serverless Alias for /data/cats_db.json
    if (url.pathname === '/api/cats') {
      return fetchStaticAsset('/data/cats_db.json');
    }

    // 6. GET /api/pdfs -> Native Edge Serverless Alias for /data/pdf_list.json
    if (url.pathname === '/api/pdfs') {
      return fetchStaticAsset('/data/pdf_list.json');
    }

    // 7. GET /api/pdf-index-status -> Native Edge Serverless Alias for /data/pdf_index.json
    if (url.pathname === '/api/pdf-index-status') {
      return fetchStaticAsset('/data/pdf_index.json');
    }

    // 8. GET /api/server-providers
    if (url.pathname === '/api/server-providers') {
      return new Response(JSON.stringify({
        primaryProvider: "cloudflare",
        servers: [
          { url: "https://drcat.dr-cat.workers.dev", provider: "cloudflare", priority: 1 }
        ]
      }), {
        status: 200,
        headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
      });
    }

    // 9. GET /api/search-status
    if (url.pathname === '/api/search-status') {
      return new Response(JSON.stringify({
        isIndexing: false,
        totalFiles: 76,
        indexedFiles: 76,
        currentFile: ""
      }), {
        status: 200,
        headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
      });
    }

    // 10. GET /api/version
    if (url.pathname === '/api/version') {
      return new Response(JSON.stringify({
        version: "1.16.3",
        minVersion: "1.0.0"
      }), {
        status: 200,
        headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
      });
    }

    // 8. Serve static assets (HTML, CSS, JS, PDFs)
    if (env && env.ASSETS) {
      return env.ASSETS.fetch(request);
    }

    return fetch(request);
  }
};
