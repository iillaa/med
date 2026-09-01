// Cloudflare Worker Authentication & Sync Secret Verification
const APP_DATA_KEY = 'drcat_pub_2f7a91c4e8';

export async function isValidSyncSecret(provided, expected) {
  if (!expected || typeof provided !== 'string' || provided.length === 0) return false;
  const enc = new TextEncoder();
  const a = await crypto.subtle.digest('SHA-256', enc.encode(provided));
  const b = await crypto.subtle.digest('SHA-256', enc.encode(expected));
  const av = new Uint8Array(a);
  const bv = new Uint8Array(b);
  let diff = 0;
  for (let i = 0; i < av.length; i++) diff |= av[i] ^ bv[i];
  return diff === 0;
}

export function requireSyncSecret(request, env) {
  const provided = request.headers.get('x-sync-secret');
  return isValidSyncSecret(provided, env && env.SYNC_SECRET);
}

export function syncDenied() {
  return new Response(JSON.stringify({
    success: false,
    error: 'Secret de synchronisation requis (en-tête x-sync-secret).'
  }), {
    status: 403,
    headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*" }
  });
}

export { APP_DATA_KEY };
