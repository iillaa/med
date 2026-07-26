const zlib = require('zlib');

/**
 * Lightweight native Node.js Gzip Compression Middleware (zero external dependencies).
 * Automatically compresses text, JSON, JS, CSS, and HTML responses for clients supporting gzip.
 */
function gzipMiddleware(req, res, next) {
  const acceptEncoding = req.headers['accept-encoding'] || '';
  if (!acceptEncoding.includes('gzip')) {
    return next();
  }

  const oldWrite = res.write;
  const oldEnd = res.end;
  const chunks = [];

  res.write = function (chunk, ...args) {
    if (chunk) {
      chunks.push(Buffer.isBuffer(chunk) ? chunk : Buffer.from(chunk));
    }
  };

  res.end = function (chunk, ...args) {
    if (chunk) {
      chunks.push(Buffer.isBuffer(chunk) ? chunk : Buffer.from(chunk));
    }

    const buffer = Buffer.concat(chunks);
    const contentType = res.getHeader('Content-Type') || '';
    
    // Only gzip text-based formats & json
    const isCompressible = 
      /text|javascript|json|css|svg|xml|wasm/i.test(contentType) ||
      req.path.endsWith('.js') ||
      req.path.endsWith('.css') ||
      req.path.endsWith('.json');

    if (isCompressible && buffer.length > 512 && !res.getHeader('Content-Encoding')) {
      try {
        const compressed = zlib.gzipSync(buffer);
        res.setHeader('Content-Encoding', 'gzip');
        res.setHeader('Content-Length', compressed.length);
        res.removeHeader('ETag'); // Prevents stale ETag mismatch
        return oldEnd.call(res, compressed);
      } catch (err) {
        console.error('[Gzip Middleware Error]:', err.message);
      }
    }

    return oldEnd.call(res, buffer);
  };

  next();
}

module.exports = { gzipMiddleware };
