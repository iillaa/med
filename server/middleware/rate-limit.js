const RATE_LIMIT_WINDOW_MS = 60 * 1000;
const MAX_REQUESTS_PER_WINDOW = 60;
const apiRateLimits = new Map();

function rateLimitMiddleware(req, res, next) {
  if (req.path.startsWith('/api/')) {
    const LOCAL_IPS = new Set(['127.0.0.1', '::1', '::ffff:127.0.0.1']);
    const rawIp = (req.socket.remoteAddress || '').replace(/^::ffff:/, '');

    if (!LOCAL_IPS.has(rawIp)) {
      const now = Date.now();
      const ip = rawIp || 'unknown';
      let limit = apiRateLimits.get(ip);

      if (!limit || (now - limit.windowStart) > RATE_LIMIT_WINDOW_MS) {
        limit = { count: 1, windowStart: now };
        apiRateLimits.set(ip, limit);
      } else {
        limit.count++;
      }

      if (limit.count > MAX_REQUESTS_PER_WINDOW) {
        res.setHeader('Retry-After', Math.ceil((RATE_LIMIT_WINDOW_MS - (now - limit.windowStart)) / 1000));
        return res.status(429).json({ error: "Trop de requêtes. Veuillez réessayer dans une minute." });
      }
    }
  }

  next();
}

module.exports = { rateLimitMiddleware };
