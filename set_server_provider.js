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
 *     -> non-interactive
 *
 * Multi-server / failover / pools: list as many URLs as you like. The first is
 * the primary; clients try them in order and load-balance among healthy ones.
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

function persist(urls) {
  if (!urls.length) {
    console.error('No valid http(s) URLs provided. Exiting.');
    process.exit(1);
  }
  const saved = spc.saveConfig({ servers: urls });
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

if (process.argv[2]) {
  persist(parseUrls(process.argv[2]));
} else {
  const rl = readline.createInterface({ input: process.stdin, output: process.stdout });
  console.log('Configure Dr. CAT remote server(s).');
  console.log('Paste URLs (comma or newline separated), in priority order.');
  console.log('Example: https://a.ngrok.dev, https://b.cloudflare.dev\n');
  rl.question('Server URLs: ', (answer) => {
    rl.close();
    persist(parseUrls(answer || ''));
  });
}
