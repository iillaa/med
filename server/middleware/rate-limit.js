const fs = require('fs');
const path = require('path');

// Configuration Constants
const BAN_DURATION_MS = 10 * 60 * 1000; // 10 minutes temporary IP ban
const RATE_LIMIT_WINDOW_MS = 60 * 1000; // 1 minute window

// Generous limits per window (tuned to never block search typing, lab batch operations, or development)
const LIMITS = {
  api: 600,       // Generous limit for API endpoints (600 req/min)
  static: 2000,   // High limit for static files (2000 req/min)
  critical: 300,  // Smooth limit for live search, auth, and version check (300 req/min)
};

// In-Memory Storage (extremely fast O(1) lookups)
const rateLimitMap = new Map();
const bannedIps = new Map();

/**
 * Checks if an IP address belongs to local host or private LAN subnets
 */
function isLocalAddress(ip) {
  if (!ip) return true;
  const cleanIp = ip.replace(/^::ffff:/, '').trim();

  // Loopback
  if (cleanIp === '127.0.0.1' || cleanIp === '::1' || cleanIp === 'localhost' || cleanIp === 'unknown') {
    return true;
  }

  // Private Subnets (192.168.x.x, 10.x.x.x, 172.16.x.x - 172.31.x.x)
  if (/^192\.168\./.test(cleanIp) || /^10\./.test(cleanIp)) {
    return true;
  }
  const match172 = cleanIp.match(/^172\.(\d+)\./);
  if (match172 && parseInt(match172[1], 10) >= 16 && parseInt(match172[1], 10) <= 31) {
    return true;
  }

  return false;
}

// Pre-compiled WAF Signatures for performance (avoid ReDoS)
const SUSPICIOUS_UA_KEYWORDS = [
  'nmap', 'sqlmap', 'nikto', 'dirbuster', 'gobuster', 'acunetix', 
  'censys', 'shodan', 'masscan', 'libwww-perl', 'zgrab', 'mj12bot'
];

const SUSPICIOUS_PATH_KEYWORDS = [
  '.env', 'wp-admin', 'wp-login', 'xmlrpc', '.git', 'etc/passwd', 
  'cmd.exe', '/bin/sh', '/bin/bash', 'phpinfo', 'web-inf', 'meta-inf',
  '.php', '.aspx', '.asp', '.jsp', 'config.php', 'setup.php'
];

const SUSPICIOUS_QUERY_REGEX = /union\s+select|<script|javascript:|exec\s*\(|eval\s*\(/i;

// Log file for blocked attacks
const LOG_FILE = path.join(__dirname, '..', '..', 'audit.log');

function logWafIncident(ip, reason, req) {
  const timestamp = new Date().toISOString();
  const logMessage = `[${timestamp}] [WAF_BLOCKED] IP: ${ip} | Reason: ${reason} | Path: ${req.originalUrl} | Method: ${req.method} | UA: ${req.headers['user-agent'] || 'none'}\n`;
  console.warn(`[WAF Warning] ${logMessage.trim()}`);
  try {
    fs.appendFileSync(LOG_FILE, logMessage);
  } catch (err) {
    // Ignore log write errors to avoid crashing the server
  }
}

function rateLimitMiddleware(req, res, next) {
  const now = Date.now();

  // Determine the real client IP safely.
  // X-Forwarded-For is ONLY trusted when the TCP socket itself comes from a local/trusted
  // proxy address — this prevents external attackers from spoofing a 127.0.0.1 header
  // to bypass rate limiting entirely.
  const socketIp = (req.socket.remoteAddress || '').replace(/^::ffff:/, '');
  const ip = (isLocalAddress(socketIp) && req.headers['x-forwarded-for'])
    ? req.headers['x-forwarded-for'].split(',')[0].trim().replace(/^::ffff:/, '')
    : socketIp || 'unknown';

  // Determine endpoint category and limit first (for header values)
  let limitType = 'static';
  let limit = LIMITS.static;
  if (req.path.startsWith('/api/')) {
    limitType = 'api';
    limit = LIMITS.api;
    if (req.path.includes('/auth') || req.path.includes('/search') || req.path.includes('/diagnostics')) {
      limitType = 'critical';
      limit = LIMITS.critical;
    }
  }

  // Set standard rate limit headers before any early return
  res.setHeader('X-RateLimit-Limit', String(limit));
  res.setHeader('X-RateLimit-Reset', String(Math.ceil((now + RATE_LIMIT_WINDOW_MS) / 1000)));

  // 1. Skip rate limits for local host and private network IPs
  if (isLocalAddress(ip)) {
    res.setHeader('X-RateLimit-Remaining', String(limit));
    return next();
  }

  // 2. Check if IP is currently banned
  const banInfo = bannedIps.get(ip);
  if (banInfo) {
    if (now - banInfo.banTime < BAN_DURATION_MS) {
      res.setHeader('Retry-After', Math.ceil((BAN_DURATION_MS - (now - banInfo.banTime)) / 1000));
      return res.status(403).json({ 
        error: "Accès interdit: Votre adresse IP a été temporairement bloquée en raison d'activités suspectes." 
      });
    } else {
      bannedIps.delete(ip); // Ban expired, clean up
    }
  }

  // 3. WAF: Inspect User-Agent
  const userAgent = (req.headers['user-agent'] || '').toLowerCase();
  for (const bot of SUSPICIOUS_UA_KEYWORDS) {
    if (userAgent.includes(bot)) {
      bannedIps.set(ip, { banTime: now });
      logWafIncident(ip, `Suspicious User-Agent (${bot})`, req);
      return res.status(403).json({ error: "Accès interdit." });
    }
  }

  // 4. WAF: Inspect URL Path (use req.path instead of req.originalUrl to prevent query false positives)
  const lowerPath = req.path.toLowerCase();
  for (const keyword of SUSPICIOUS_PATH_KEYWORDS) {
    if (lowerPath.includes(keyword)) {
      bannedIps.set(ip, { banTime: now });
      logWafIncident(ip, `Suspicious Path Keyword (${keyword})`, req);
      return res.status(403).json({ error: "Accès interdit." });
    }
  }

  // 5. WAF: Inspect Query String
  const queryStr = req.query ? JSON.stringify(req.query) : '';
  if (SUSPICIOUS_QUERY_REGEX.test(queryStr)) {
    bannedIps.set(ip, { banTime: now });
    logWafIncident(ip, "SQLi/XSS Pattern in Query String", req);
    return res.status(403).json({ error: "Accès interdit." });
  }

  // 6. Rate Limiting: Get or initialize rate limit entry
  let clientLimit = rateLimitMap.get(ip);
  if (!clientLimit || (now - clientLimit.windowStart) > RATE_LIMIT_WINDOW_MS) {
    clientLimit = {
      windowStart: now,
      apiCount: 0,
      staticCount: 0,
      criticalCount: 0
    };
    rateLimitMap.set(ip, clientLimit);
  }

  // Increment respective count
  if (limitType === 'critical') {
    clientLimit.criticalCount++;
    clientLimit.apiCount++; // Critical also counts towards API limit
  } else if (limitType === 'api') {
    clientLimit.apiCount++;
  } else {
    clientLimit.staticCount++;
  }

  const currentCount = clientLimit[`${limitType}Count`];

  // Set the remaining count
  res.setHeader('X-RateLimit-Remaining', String(Math.max(0, limit - currentCount)));

  // 7. Handle Rate Limit Exceeded
  if (currentCount > limit) {
    // If the attacker keeps hammering (e.g. exceeds 2.5x the limit), escalate to a temporary IP ban
    if (currentCount > limit * 2.5) {
      bannedIps.set(ip, { banTime: now });
      logWafIncident(ip, `Rate Limit Flood Escalation (Limit: ${limit}, Count: ${currentCount})`, req);
      return res.status(403).json({ 
        error: "Accès interdit: Trop de requêtes abusives. Votre IP a été temporairement bloquée." 
      });
    }

    res.setHeader('Retry-After', Math.ceil((RATE_LIMIT_WINDOW_MS - (now - clientLimit.windowStart)) / 1000));
    return res.status(429).json({ 
      error: "Trop de requêtes. Veuillez réessayer dans une minute." 
    });
  }

  next();
}

// Memory Safety Guard: Periodically clear memory map to prevent memory leak attacks
setInterval(() => {
  const now = Date.now();
  
  // Clean rate limits
  for (const [ip, entry] of rateLimitMap.entries()) {
    if (now - entry.windowStart > RATE_LIMIT_WINDOW_MS) {
      rateLimitMap.delete(ip);
    }
  }

  // Clean expired bans
  for (const [ip, entry] of bannedIps.entries()) {
    if (now - entry.banTime > BAN_DURATION_MS) {
      bannedIps.delete(ip);
    }
  }
}, 5 * 60 * 1000); // Run garbage collection every 5 minutes

module.exports = { rateLimitMiddleware };
