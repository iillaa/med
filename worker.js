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

    // 5. /api/telemetry (Crash reports & mobile debug telemetry)
    if (url.pathname === '/api/telemetry') {
      if (request.method === 'POST') {
        try {
          const body = await request.json();
          const reportId = `tel_${Date.now()}_${Math.random().toString(36).substring(2, 9)}`;
          const report = {
            id: reportId,
            timestamp: Date.now(),
            type: body.type || 'unhandled_error',
            error: String(body.error || 'Erreur non spécifiée').substring(0, 1000),
            stack: String(body.stack || '').substring(0, 5000),
            device: typeof body.device === 'object' && body.device !== null ? body.device : {},
            appVersion: String(body.appVersion || 'inconnu').substring(0, 20),
            installId: String(body.installId || '').substring(0, 50),
            logs: Array.isArray(body.logs) ? body.logs.slice(-50) : [],
            userNote: String(body.userNote || '').substring(0, 500)
          };

          if (env && env.SUGGESTIONS_KV) {
            let list = [];
            const raw = await env.SUGGESTIONS_KV.get("telemetry_reports");
            if (raw) { try { list = JSON.parse(raw); } catch (_) { list = []; } }
            list.unshift(report);
            if (list.length > 100) list = list.slice(0, 100);
            await env.SUGGESTIONS_KV.put("telemetry_reports", JSON.stringify(list));
          }

          return new Response(JSON.stringify({
            success: true,
            id: reportId,
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
            headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
          });
        } catch (err) {
          return new Response(JSON.stringify([]), {
            status: 200,
            headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
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
        version: "1.16.0",
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
