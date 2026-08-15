// Helper to sync pending suggestions from Cloudflare KV storage into local Termux suggestions.json
const https = require('https');
const path = require('path');
const { state: cache } = require('./cache');
const { safeWriteJsonAsync } = require('./data-store');

const SUGGESTIONS_FILE = path.join(__dirname, '..', '..', 'suggestions.json');
const CLOUDFLARE_URL = 'https://drcat.dr-cat.workers.dev/api/suggestions';

async function ackCloudflareSuggestions(syncedIds) {
  if (!Array.isArray(syncedIds) || syncedIds.length === 0) return;
  return new Promise((resolve) => {
    const payload = JSON.stringify({ ids: syncedIds });
    const req = https.request(`${CLOUDFLARE_URL}/ack`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(payload),
        'User-Agent': 'Node-Termux-Sync'
      }
    }, () => resolve());
    req.on('error', () => resolve());
    req.write(payload);
    req.end();
  });
}

async function syncCloudflareSuggestions() {
  return new Promise((resolve) => {
    https.get(CLOUDFLARE_URL, { headers: { 'User-Agent': 'Node-Termux-Sync' } }, (res) => {
      let rawData = '';
      res.on('data', chunk => rawData += chunk);
      res.on('end', async () => {
        try {
          if (res.statusCode === 200) {
            const cloudSuggestions = JSON.parse(rawData);
            if (Array.isArray(cloudSuggestions) && cloudSuggestions.length > 0) {
              let addedCount = 0;
              const syncedIds = [];
              for (const cs of cloudSuggestions) {
                if (!cs || !cs.id) continue;
                syncedIds.push(cs.id);
                const exists = cache.suggestionsCache.some(ls => ls.id === cs.id);
                if (!exists) {
                  cache.suggestionsCache.unshift(cs);
                  addedCount++;
                }
              }
              if (addedCount > 0) {
                await safeWriteJsonAsync(SUGGESTIONS_FILE, cache.suggestionsCache);
                console.log(`[CloudSync] Synced ${addedCount} new suggestion(s) from Cloudflare KV.`);
              }
              if (syncedIds.length > 0) {
                await ackCloudflareSuggestions(syncedIds);
              }
            }
          }
        } catch (e) {
          // Ignore sync errors gracefully
        }
        resolve();
      });
    }).on('error', () => {
      resolve();
    });
  });
}

async function purgeCloudflareSuggestion(id) {
  if (!id) return;
  return new Promise((resolve) => {
    const req = https.request(`${CLOUDFLARE_URL}/${encodeURIComponent(id)}`, {
      method: 'DELETE',
      headers: { 'User-Agent': 'Node-Termux-Sync' }
    }, () => resolve());
    req.on('error', () => resolve());
    req.end();
  });
}

module.exports = { syncCloudflareSuggestions, purgeCloudflareSuggestion, ackCloudflareSuggestions };
