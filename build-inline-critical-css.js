/**
 * Inline critical (above-the-fold) CSS into index.html (Phase 5.4).
 *
 * The first paint of Dr.CAT is the boot splash (#app-loading-overlay). We
 * inline exactly the CSS needed to render that splash + base reset + theme
 * variables directly into <head>, so first paint never waits on the external
 * stylesheet network round-trip (kills a render-blocking request on slow
 * networks / low-end Androids).
 *
 * The full style.css still loads, but non-render-blocking (media-swap trick,
 * see index.html), and overrides/completes the critical block. The critical
 * block is extracted from the real CSS sources so the single source of truth
 * stays in css/*.css (no manual drift).
 */
const fs = require('fs');
const path = require('path');

const PUBLIC_DIR = path.join(__dirname, 'public');
const VARS = path.join(PUBLIC_DIR, 'css', 'variables.css');
const UTIL = path.join(PUBLIC_DIR, 'css', 'utilities.css');
const INDEX = path.join(PUBLIC_DIR, 'index.html');

// Pull a CSS rule block (selector { ... }) starting at the first occurrence of
// `start` (the selector line). Handles nested braces correctly.
function extractRule(css, start) {
  const i = css.indexOf(start);
  if (i === -1) return '';
  const open = css.indexOf('{', i);
  if (open === -1) return '';
  let depth = 0;
  let j = open;
  for (; j < css.length; j++) {
    if (css[j] === '{') depth++;
    else if (css[j] === '}') {
      depth--;
      if (depth === 0) break;
    }
  }
  return css.slice(i, j + 1).trim();
}

// Pull a block from `start` up to (but not including) `endMarker`.
function extractRange(css, start, endMarker) {
  const i = css.indexOf(start);
  if (i === -1) return '';
  const e = css.indexOf(endMarker, i);
  const end = e === -1 ? css.length : e;
  return css.slice(i, end).trim();
}

function buildCriticalCss() {
  const vars = fs.readFileSync(VARS, 'utf-8');
  const util = fs.readFileSync(UTIL, 'utf-8');

  const parts = [];

  // 1. Design tokens + light-theme override + a11y/theme guards.
  parts.push(extractRange(vars, ':root {', '/* ── Themed scrollbars'));
  parts.push(extractRule(vars, '.light-theme {'));
  parts.push(extractRange(vars, 'html.theme-booting *', '@media (prefers-reduced-motion'));
  parts.push(extractRange(vars, '@media (prefers-reduced-motion: reduce)', '/* ── Theme-toggle circular'));
  // 2. Reset + base.
  parts.push(extractRule(vars, '* {'));
  parts.push(extractRule(vars, 'html {'));
  parts.push(extractRule(vars, 'body {'));
  // 3. Loading overlay (boot splash) + spinner + brand.
  parts.push(extractRule(util, '.loading-overlay {'));
  parts.push(extractRule(util, '.loading-overlay-bar-bg {'));
  parts.push(extractRule(util, '.loading-overlay-bar-fill {'));
  parts.push(extractRule(util, '.loading-overlay-brand {'));
  parts.push(extractRule(util, '.spinner {'));
  // 4. Overlay state + pulsing logo keyframe.
  parts.push(extractRule(vars, '#app-loading-overlay {'));
  parts.push(extractRule(vars, '@keyframes pulse-glow {'));

  const critical = parts.filter(Boolean).join('\n\n');
  return `/* Critical CSS (Phase 5.4) — inlined for instant first paint */\n${critical}\n`;
}

function inlineIntoIndex() {
  const critical = buildCriticalCss();
  let html = fs.readFileSync(INDEX, 'utf-8');

  const marker = '<!-- CRITICAL_CSS_PLACEHOLDER -->';
  if (html.includes(marker)) {
    html = html.replace(marker, `<style>\n${critical}</style>`);
  } else if (html.includes('/* Critical CSS (Phase 5.4)')) {
    // Already inlined (idempotent rebuild): replace the existing block.
    html = html.replace(
      /<style>\s*\/\* Critical CSS \(Phase 5\.4\)[\s\S]*?<\/style>/,
      `<style>\n${critical}</style>`
    );
  } else {
    // Fallback: inject right after <meta name="viewport" ...> so it sits early.
    html = html.replace(
      /(<meta name="viewport"[^>]*>)/,
      `$1\n  <!-- CRITICAL_CSS_PLACEHOLDER -->`
    );
    html = html.replace(marker, `<style>\n${critical}</style>`);
  }

  fs.writeFileSync(INDEX, html, 'utf-8');
  const kb = Math.round(critical.length / 1024);
  console.log(`Inlined critical CSS into index.html (${kb} KB).`);
}

// Allow running directly.
if (require.main === module) {
  try {
    inlineIntoIndex();
  } catch (err) {
    console.error('[critical-css] failed:', err);
    process.exit(1);
  }
}

module.exports = { buildCriticalCss, inlineIntoIndex };
