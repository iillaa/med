// Native Cloudflare Worker entrypoint (worker.js)
// Handles API routes natively on Cloudflare edge network and serves static assets

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);

    // 1. CORS Preflight
    if (request.method === 'OPTIONS') {
      return new Response(null, {
        status: 204,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET, POST, DELETE, OPTIONS, PUT, PATCH",
          "Access-Control-Allow-Headers": "*",
          "Access-Control-Max-Age": "86400"
        }
      });
    }

    // 2. ACK handler: POST /api/suggestions/ack — Termux acknowledges receipt of suggestions
    if (url.pathname === '/api/suggestions/ack' && request.method === 'POST') {
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
        version: "1.8.0",
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
