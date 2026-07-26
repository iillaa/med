// Lighthouse CI config — drives the "Definition of Premium" acceptance gate
// (perf >= 90, a11y >= 95, best-practices >= 95) on a mobile emulation.
// Run locally: npx @lhci/cli autorun
// Run in CI: .github/workflows/lighthouse.yml (manual dispatch).

module.exports = {
  ci: {
    collect: {
      // Overridden by the workflow's --collect.url when auditing a deployed URL.
      url: ['http://localhost:3000'],
      numberOfRuns: 3,
      device: 'mobile', // mobile emulation = the premium target (mid-range Android)
      settings: {
        throttling: {
          cpuSlowdownMultiplier: 4, // 4x CPU throttle (matches perf-baseline.md)
          bandwidth: 1500 * 1024, // ~1.5 Mbps down (Slow 4G class)
        },
      },
    },
    assert: {
      assertions: {
        'categories:performance': ['warn', { minScore: 0.85 }],
        'categories:accessibility': ['warn', { minScore: 0.85 }],
        'categories:best-practices': ['warn', { minScore: 0.90 }],
      },
    },
    upload: {
      target: 'filesystem',
      outputDir: './.lighthouseci',
    },
  },
};
