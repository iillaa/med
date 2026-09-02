// Native Cloudflare Worker Entrypoint (worker.js)
// Modular, lightweight router with CORS, secret verification, KV suggestion relay, telemetry and asset serving.

import { handleCorsPreflight } from './worker/cors.js';
import { handleSuggestionsRoute } from './worker/routes/suggestions.js';
import { handleTelemetryRoute } from './worker/routes/telemetry.js';
import { handleActiveDevicesRoute } from './worker/routes/active-devices.js';
import { handleStaticAliasRoute } from './worker/routes/static-alias.js';

export default {
  async fetch(request, env, ctx) {
    // 1. Universal CORS Preflight Handling
    if (request.method === 'OPTIONS') {
      return handleCorsPreflight();
    }

    const url = new URL(request.url);

    // 2. Suggestions & ACK Route Handler
    const suggestionsRes = await handleSuggestionsRoute(request, env, url);
    if (suggestionsRes) return suggestionsRes;

    // 3. Telemetry & Crash Reporting Route Handler
    const telemetryRes = await handleTelemetryRoute(request, env, url);
    if (telemetryRes) return telemetryRes;

    // 4. Active Devices & Heartbeat Route Handler
    const activeDevicesRes = await handleActiveDevicesRoute(request, env, url);
    if (activeDevicesRes) return activeDevicesRes;

    // 5. Static Alias & Metadata Route Handler
    const aliasRes = await handleStaticAliasRoute(request, env, url);
    if (aliasRes) return aliasRes;

    // 5. Static Assets Delivery (HTML, CSS, JS bundles, PDFs)
    if (env && env.ASSETS) {
      return env.ASSETS.fetch(request);
    }

    return fetch(request);
  }
};
