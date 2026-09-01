// Cloudflare Worker — Suggestions Route Handler
import { APP_DATA_KEY, requireSyncSecret, syncDenied } from '../auth.js';
import { jsonResponse } from '../cors.js';

export async function handleSuggestionsRoute(request, env, url) {
  // 1. ACK handler: POST /api/suggestions/ack — Termux acknowledges receipt
  if (url.pathname === '/api/suggestions/ack' && request.method === 'POST') {
    if (!(await requireSyncSecret(request, env))) return syncDenied();
    try {
      const { ids } = await request.json();
      if (Array.isArray(ids) && ids.length > 0 && env && env.SUGGESTIONS_KV) {
        let list = [];
        const raw = await env.SUGGESTIONS_KV.get("pending_suggestions");
        if (raw) { try { list = JSON.parse(raw); } catch (_) { list = []; } }
        
        const filtered = list.filter(s => s && !ids.includes(s.id));
        await env.SUGGESTIONS_KV.put("pending_suggestions", JSON.stringify(filtered));
      }
      return jsonResponse({ success: true, message: "Acknowledged receipt" });
    } catch (err) {
      return jsonResponse({ success: false, error: err.message }, 500);
    }
  }

  // 2. Delete/Purge specific suggestion: DELETE/POST /api/suggestions/:id
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
        return jsonResponse({ success: true, message: "Purged from Cloudflare KV" });
      } catch (err) {
        return jsonResponse({ success: false, error: err.message }, 500);
      }
    }
  }

  // 3. /api/suggestions
  if (url.pathname === '/api/suggestions') {
    if (request.method === 'POST') {
      if (request.headers.get('x-app-key') !== APP_DATA_KEY) {
        return jsonResponse({ success: false, error: 'Accès interdit.' }, 403);
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

        return jsonResponse({
          success: true,
          message: "Proposition envoyée à l'administrateur pour validation.",
          suggestion: newSuggestion
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
          const raw = await env.SUGGESTIONS_KV.get("pending_suggestions");
          if (raw) {
            try { list = JSON.parse(raw); } catch (_) { list = []; }
          }
        }
        return jsonResponse(list);
      } catch (_) {
        return jsonResponse([]);
      }
    }
  }

  return null;
}
