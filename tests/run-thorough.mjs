/**
 * Master orchestrator for Dr.CAT thorough testing.
 *
 * Runs all test suites in sequence:
 *   1. Build verification (no server needed)
 *   2. API endpoint tests (server required)
 *   3. Client-side unit tests (server + headless browser required)
 *
 * Usage:
 *   node tests/run-thorough.mjs           # Requires server running on PORT
 *   CHROME_TEST_START_SERVER=1 node tests/run-thorough.mjs  # Auto-starts server
 */
import { spawn } from 'node:child_process';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '..');

let passed = 0;
let failed = 0;
let skipped = 0;

function runSuite(name, scriptPath) {
  return new Promise((resolve) => {
    console.log(`\n${'='.repeat(60)}`);
    console.log(`🚀 Running: ${name}`);
    console.log(`${'='.repeat(60)}`);

    const child = spawn('node', [scriptPath], {
      cwd: ROOT,
      env: { ...process.env },
      stdio: ['inherit', 'pipe', 'pipe'],
      shell: false,
    });

    let output = '';
    child.stdout.on('data', (d) => { output += d.toString(); process.stdout.write(d); });
    child.stderr.on('data', (d) => { output += d.toString(); process.stderr.write(d); });

    child.on('close', (code) => {
      // Parse results from output
      const resultMatch = output.match(/📊 Results: (\d+) passed, (\d+) failed/);
      if (resultMatch) {
        passed += parseInt(resultMatch[1]);
        failed += parseInt(resultMatch[2]);
      } else {
        // If we can't parse, use exit code
        if (code === 0) {
          // Count test lines
          const testLines = output.split('\n').filter(l => l.includes('✅') || l.includes('❌'));
          const passing = output.split('\n').filter(l => l.includes('✅')).length;
          const failing = output.split('\n').filter(l => l.includes('❌')).length;
          passed += passing;
          failed += failing;
        } else {
          failed++;
        }
      }
      console.log(`[Done] ${name} (exit code: ${code})`);
      resolve();
    });

    child.on('error', (err) => {
      console.error(`[Error] Failed to run ${name}: ${err.message}`);
      skipped++;
      resolve();
    });
  });
}

async function main() {
  console.log('🧪 Dr.CAT Thorough Test Suite — Master Orchestrator');
  console.log(`   Root: ${ROOT}`);
  console.log(`   Auto-start server: ${process.env.CHROME_TEST_START_SERVER === '1' ? 'yes' : 'no (must be running)'}`);

  const suites = [
    { name: 'Build Verification', script: 'tests/thorough-build.mjs' },
    { name: 'API Endpoint Tests', script: 'tests/thorough-api.mjs' },
    { name: 'Client-Side Unit Tests', script: 'tests/thorough-client.mjs' },
  ];

  for (const suite of suites) {
    await runSuite(suite.name, path.join(ROOT, suite.script));
  }

  console.log(`\n${'='.repeat(60)}`);
  console.log(`📊 FINAL RESULTS`);
  console.log(`${'='.repeat(60)}`);
  console.log(`   ✅ Passed:  ${passed}`);
  console.log(`   ❌ Failed:  ${failed}`);
  console.log(`   ⏭️  Skipped: ${skipped}`);
  console.log(`   Total:     ${passed + failed + skipped}`);
  console.log(`${'='.repeat(60)}`);

  if (failed > 0) {
    console.log('\n⚠️  Some tests FAILED. Review output above for details.');
    process.exitCode = 1;
  } else if (skipped > 0) {
    console.log('\n⚠️  Some suites were SKIPPED. Check errors above.');
    process.exitCode = 1;
  } else {
    console.log('\n✅ All tests PASSED!');
  }
}

main();
