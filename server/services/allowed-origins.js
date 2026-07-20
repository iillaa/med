// Live, mutable set of CORS-allowed origins.
//
// Source of truth = remote_server_config.json. Both server startup and the
// runtime diagnostics endpoint call recompute() to mutate THIS set in place,
// so the CORS middleware (which closes over this same reference) reflects URL
// changes immediately — no server restart required.
const { serverProviders, buildAllowedOrigins } = require('../config/providers');

const allowedOrigins = new Set();

function recompute(configuredUrls) {
  allowedOrigins.clear();
  const computed = buildAllowedOrigins(serverProviders, configuredUrls || []);
  for (const origin of computed) allowedOrigins.add(origin);
}

// Seed with localhost defaults until the real config is loaded.
recompute([]);

module.exports = { allowedOrigins, recompute };
