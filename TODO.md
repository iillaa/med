# Dr.CAT — Todo & Improvements

> [!IMPORTANT]
> **Strategic Roadmap Prioritization**: Focus first on stabilizing core app features and functional robustness (printing, navigation state retention, sharing, offline connection checks). High-performance animations and final UI polishing will be prioritized immediately after all features are 100% stable.

## 🔧 Technical Debt (Fix When Possible)

- `[x]` **Replace `zoom: 0.9` hack on `.dashboard-container`**
  - Current: non-standard CSS, ignored by Firefox, affects all screen sizes including desktop
  - Fix: remove `zoom: 0.9` from base rule, replace with a proper `@media (min-width: 681px) and (max-width: 1280px)` breakpoint that surgically reduces `padding`, `gap`, `font-size`, and card heights to achieve the same result natively

---

## 🚨 High Priority

- `[x]` **Add favicon** — browser tab shows blank icon; logo (`drcat_logo.png`) is ready, just needs a `<link rel="icon">` in the `<head>`
- `[x]` **Add meta description** — needed for SEO and proper link previews when sharing
- `[x]` **Offline support** — clarify/implement behavior when the connection drops; data loading should not silently fail
- `[ ]` **Diagnostic & Logging Tools Panel** — (Prioritized before UI polish & performance) Add a diagnostics drawer/modal to test local server pings, change `REMOTE_SERVER_URL` at runtime, view offline override states, check loaded PDF index status, and trace console warnings.

---

## 🟡 Medium Priority

- `[x]` **Light mode toggle** — add a sun/moon switch in the sidebar header; use `prefers-color-scheme` as the default, allow manual override saved to localStorage
- `[x]` **Progress persistence notice** — make it clear to users that progress is saved locally (localStorage) and will be lost if they clear the browser; add an export/backup button
- `[x]` **Export progress** — allow downloading study progress as JSON (or PDF summary) so doctors can back up or transfer their data
- `[x]` **Better empty states** — the dashboard when no study progress exists looks sparse; add illustrated/helpful empty states with a call to action

---

## 🟢 Nice to Have

- `[x]` **PWA support** — add `manifest.json` + service worker so the app can be installed directly on the tablet home screen like a native app (best fit for medical professional workflow)
- `[x]` **Keyboard shortcuts** — e.g. `S` to focus search, `Esc` to close modals, arrow keys to navigate the CAT list
- `[x]` **Progress bar entrance animation** — animate the sidebar progress bar and dashboard stats on page load for a polished feel
- `[x]` **Print / PDF view** — a clean, printable layout for individual CAT fiches so doctors can print a reference sheet
