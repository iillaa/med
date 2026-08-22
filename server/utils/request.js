/**
 * Dr.CAT — Security Utilities: Localhost Connection Verifier
 * 
 * Enforces Zero-Trust Localhost-Only Isolation for Admin Routes.
 * Hardened against HTTP header spoofing, proxy chaining, and tunnel tampering.
 */

function isLocalhostConnection(req) {
  if (!req) return false;
  const LOCAL_IPS = new Set(['127.0.0.1', '::1', '::ffff:127.0.0.1', 'localhost']);
  
  // 1. Physical Socket Connection Validation
  const socketIp = req.socket?.remoteAddress || req.ip || req.connection?.remoteAddress || '';
  const rawIp = socketIp.replace(/^::ffff:/, '').trim();
  if (!LOCAL_IPS.has(rawIp)) {
    return false; // Direct remote connection over LAN / WAN / external interface
  }

  const headers = req.headers || {};

  // 2. Tunnel Signature Detection (Immutable headers injected by Cloudflare & Ngrok edge nodes)
  if (headers['cf-ray'] || headers['cf-connecting-ip'] || headers['cf-visitor']) {
    return false; // Request traversed Cloudflare edge tunnel
  }
  if (headers['ngrok-trace-id']) {
    return false; // Request traversed Ngrok edge tunnel
  }

  // 3. X-Forwarded-For Chain Inspection (All entries in chain must be strictly localhost)
  const forwarded = headers['x-forwarded-for'];
  if (forwarded) {
    const ips = forwarded.split(',').map(ip => ip.trim().replace(/^::ffff:/, ''));
    for (const ip of ips) {
      if (!LOCAL_IPS.has(ip) && ip !== 'localhost') {
        return false; // External IP detected anywhere in forwarded chain
      }
    }
  }

  // 4. X-Real-IP Inspection
  const realIp = headers['x-real-ip'];
  if (realIp) {
    const cleanReal = realIp.trim().replace(/^::ffff:/, '');
    if (!LOCAL_IPS.has(cleanReal) && cleanReal !== 'localhost') {
      return false;
    }
  }

  return true;
}

module.exports = { isLocalhostConnection };
