const { isOriginAllowedDynamic } = require('../config/providers');

function corsMiddleware(allowedOrigins, serverProviders) {
  return (req, res, next) => {
    res.setHeader('X-Frame-Options', 'DENY');
    res.setHeader('X-Content-Type-Options', 'nosniff');
    res.setHeader('Referrer-Policy', 'strict-origin-when-cross-origin');

    const origin = req.headers.origin;
    const requestHost = req.headers.host;
    const isSameOrigin = origin && (origin === `http://${requestHost}` || origin === `https://${requestHost}`);

    const isAlwaysAllowed = !origin
      || isSameOrigin
      || origin === 'http://localhost'
      || origin === 'https://localhost'
      || origin === 'capacitor://localhost'
      || origin.startsWith('http://localhost:')
      || origin.startsWith('https://localhost:')
      || origin.startsWith('http://127.0.0.1:')
      || origin.startsWith('https://127.0.0.1:');

    const allowAll = isAlwaysAllowed || isOriginAllowedDynamic(origin, allowedOrigins);

    if (['POST', 'PUT', 'DELETE'].includes(req.method)) {
      if (origin && !allowAll) {
        return res.status(403).json({ error: 'CORS/CSRF validation failed: Origin not allowed.' });
      }
    }

    if (allowAll) {
      const requestedHeaders = req.headers['access-control-request-headers'];
      const providerHeaders = serverProviders.flatMap(p => Object.keys(p.extraHeaders || {}));
      const defaultHeaders = [
        'Content-Type',
        'Authorization',
        'X-App-Version',
        'x-app-version',
        'X-Install-ID',
        'x-install-id',
        'x-device-platform',
        'x-api-key',
        'x-admin-token',
        'x-app-key',
        'x-capacitor-platform',
        'ngrok-skip-browser-warning',
        ...providerHeaders
      ];
      const allowHeadersString = requestedHeaders || defaultHeaders.join(', ');

      if (origin) {
        res.setHeader('Access-Control-Allow-Origin', origin);
        res.setHeader('Access-Control-Allow-Credentials', 'true');
      } else {
        res.setHeader('Access-Control-Allow-Origin', '*');
      }
      res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
      res.setHeader('Access-Control-Allow-Headers', allowHeadersString);
    }

    if (req.method === 'OPTIONS') {
      return res.sendStatus(204);
    }

    next();
  };
}

module.exports = { corsMiddleware };
