#!/usr/bin/env node
/**
 * Configure the Dr. CAT server-provider list (remote servers).
 *
 * This is the SINGLE place to set your server URL(s). It persists to
 * remote_server_config.json, which the server loads as the source of truth
 * (and derives CORS origins from). The Android APK still bakes its URL from the
 * REMOTE_SERVER_URL CI secret at build time.
 *
 * Usage:
 *   node set_server_provider.js
 *     -> interactive: paste URLs (comma or newline separated), ordered by priority
 *   node set_server_provider.js "https://a.ngrok.dev,https://b.cloudflare.dev"
 *     -> non-interactive, MERGES with existing URLs (no duplicates)
 *   node set_server_provider.js --reset "https://new-only.ngrok.dev"
 *     -> replaces all existing URLs with the new list
 *
 * Default behavior is MERGE: existing URLs are preserved, new ones are appended.
 * This makes the config portable across machines.
 */
const readline = require('readline');
const spc = require('./server/services/server-providers-config');

function parseUrls(raw) {
  return raw
    .split(/[\n,]+/)
    .map(u => u.trim())
    .filter(Boolean)
    .filter(u => /^https?:\/\//.test(u));
}

function persist(urls, reset) {
  if (!urls.length && !reset) {
    console.error('No valid http(s) URLs provided. Exiting.');
    process.exit(1);
  }

  spc.loadConfig();

  let nextServers;
  if (reset) {
    nextServers = urls;
  } else {
    const existing = spc.getServers().map(s => s.url);
    const seen = new Set(existing);
    const merged = [...existing];
    for (const u of urls) {
      if (!seen.has(u)) {
        merged.push(u);
        seen.add(u);
      }
    }
    nextServers = merged;
  }

  const saved = spc.saveConfig({ servers: nextServers });
  console.log('\n=================================================');
  console.log('[SUCCESS] Server provider list updated!');
  console.log('Servers (by priority):');
  saved.servers.forEach((s, i) => console.log(`  ${i + 1}. [${s.provider}] ${s.url}`));
  console.log(`\nPrimary provider: ${saved.primaryProvider}`);
  console.log('=================================================');
  console.log('[INFO] Restart the server for changes to take effect:');
  console.log('   node server.js');
  process.exit(0);
}

const argv = process.argv.slice(2);
const resetFlag = argv.includes('--reset');
const urlsArg = argv.find(a => !a.startsWith('--'));

if (urlsArg) {
  persist(parseUrls(urlsArg), resetFlag);
} else {
  const rl = readline.createInterface({ input: process.stdin, output: process.stdout });
  console.log('Configure Dr. CAT remote server(s).');
  console.log('Paste URLs (comma or newline separated), in priority order.');
  console.log('New URLs will be MERGED with existing ones (no duplicates).');
  console.log('Use --reset flag to replace all existing URLs.');
  console.log('Example: https://a.ngrok.dev, https://b.cloudflare.dev\n');
  rl.question('Server URLs: ', (answer) => {
    rl.close();
    persist(parseUrls(answer || ''), resetFlag);
  });
}
