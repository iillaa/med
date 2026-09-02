// Cloudflare Worker — Static Asset & Dynamic Meta Aliases
import { jsonResponse } from '../cors.js';

export async function fetchStaticAsset(request, env, assetPath) {
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
    return jsonResponse({ error: err.message }, 500);
  }
}

export async function handleStaticAliasRoute(request, env, url) {
  // 1. GET /api/cats -> Native Edge Serverless Alias for /data/cats_db.json
  if (url.pathname === '/api/cats') {
    return fetchStaticAsset(request, env, '/data/cats_db.json');
  }

  // 2. GET /api/pdfs -> Native Edge Serverless Alias for /data/pdf_list.json
  if (url.pathname === '/api/pdfs') {
    return fetchStaticAsset(request, env, '/data/pdf_list.json');
  }

  // 3. GET /api/pdf-index-status -> Native Edge Serverless Alias for /data/pdf_index.json
  if (url.pathname === '/api/pdf-index-status') {
    return fetchStaticAsset(request, env, '/data/pdf_index.json');
  }

  // 4. GET /api/server-providers
  if (url.pathname === '/api/server-providers') {
    return jsonResponse({
      primaryProvider: "cloudflare",
      servers: [
        { url: "https://drcat.is-an-app.workers.dev", provider: "cloudflare", priority: 1 }
      ]
    });
  }

  // 5. GET /api/search-status
  if (url.pathname === '/api/search-status') {
    return jsonResponse({
      isIndexing: false,
      totalFiles: 78,
      indexedFiles: 78,
      currentFile: ""
    });
  }

  // 6. GET /api/version
  if (url.pathname === '/api/version') {
    return jsonResponse({
      version: "1.22.0",
      minVersion: "1.0.0"
    });
  }

  // 7. GET /download or /app -> Serves /download.html
  if (url.pathname === '/download' || url.pathname === '/app') {
    if (env && env.ASSETS) {
      return env.ASSETS.fetch(new URL('/download.html', request.url));
    }
  }

  return null;
}
