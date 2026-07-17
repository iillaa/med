function isLocalhostConnection(req) {
  const LOCAL_IPS = new Set(['127.0.0.1', '::1', '::ffff:127.0.0.1']);
  const rawIp = (req.socket.remoteAddress || '').replace(/^::ffff:/, '');

  const forwarded = req.headers['x-forwarded-for'];
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
