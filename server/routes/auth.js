const { state: cache } = require('../services/cache');
const { checkIsAdmin, hashPassword, createToken, loginAttempts } = require('../services/auth-service');
const { isLocalhostConnection } = require('../utils/request');
const { logAuditEvent } = require('../services/data-store');

function registerAuthRoutes(app) {
  app.get('/api/is-admin', (req, res) => {
    res.json({ isAdmin: checkIsAdmin(req, cache.activeTokens) });
  });

  app.get('/api/is-local', (req, res) => {
    res.json({ isLocal: isLocalhostConnection(req) });
  });

  app.post('/api/login', (req, res) => {
    if (!isLocalhostConnection(req)) {
      return res.status(403).json({ error: "Connexion interdite depuis un appareil distant." });
    }

    const ip = req.socket.remoteAddress || 'unknown';
    const now = Date.now();
    const attempt = loginAttempts.get(ip);

    if (attempt && attempt.count >= 5 && (now - attempt.lastAttempt) < 5 * 60 * 1000) {
      return res.status(429).json({ error: "Trop de tentatives. Réessayez dans 5 minutes." });
    }

    const { password } = req.body;

    let isPasswordCorrect = false;
    if (password && cache.adminPasswordHash && cache.adminPasswordSalt) {
      const inputHash = hashPassword(password, cache.adminPasswordSalt);
      const inputBuffer = Buffer.from(inputHash, 'hex');
      const storedBuffer = Buffer.from(cache.adminPasswordHash, 'hex');
      if (inputBuffer.length === storedBuffer.length && require('crypto').timingSafeEqual(inputBuffer, storedBuffer)) {
        isPasswordCorrect = true;
      }
    }

    if (!isPasswordCorrect) {
      if (attempt) {
        attempt.count++;
        attempt.lastAttempt = now;
      } else {
        loginAttempts.set(ip, { count: 1, lastAttempt: now });
      }
      logAuditEvent('login_failed', { ip }, req);
      return res.status(401).json({ error: "Mot de passe incorrect." });
    }

    loginAttempts.delete(ip);
    const token = createToken();
    cache.activeTokens.set(token, { expiresAt: Date.now() + 12 * 60 * 60 * 1000 });
    logAuditEvent('login_success', {}, req);
    res.json({ success: true, token });
  });

  app.post('/api/logout', (req, res) => {
    const token = req.headers['x-admin-token'];
    if (token) {
      cache.activeTokens.delete(token);
    }
    logAuditEvent('logout', {}, req);
    res.json({ success: true });
  });
}

module.exports = { registerAuthRoutes };
