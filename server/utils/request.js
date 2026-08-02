function isLocalhostConnection(req) {
  if (!req) return false;
  const LOCAL_IPS = new Set(['127.0.0.1', '::1', '::ffff:127.0.0.1', 'localhost']);
  const socketIp = req.socket?.remoteAddress || req.ip || req.connection?.remoteAddress || '';
  const rawIp = socketIp.replace(/^::ffff:/, '');

  const forwarded = req.headers ? req.headers['x-forwarded-for'] : null;
  if (forwarded && LOCAL_IPS.has(rawIp)) {
    const clientIp = forwarded.split(',')[0].trim();
    const cleanClient = clientIp.replace(/^::ffff:/, '');
    if (!LOCAL_IPS.has(cleanClient) && cleanClient !== 'localhost') {
      return false;
    }
    return true;
  }

  return LOCAL_IPS.has(rawIp);
}

module.exports = { isLocalhostConnection };
