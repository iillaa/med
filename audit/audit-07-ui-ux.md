# 🎨 Audit 07 — UI/UX Design & Usability
> Date: 2026-08-01 | Role: Senior Product Designer | Mode: Audit-Only
> Note: Audit is based on code analysis of JS components, CSS structure, and HTML patterns.
> A live visual review would be needed for complete WCAG compliance verification.

---

## UI-01
- **Component/screen:** `showToast()` — `public/js/utils.js` lines 9-40
- **Severity:** 🟠 HIGH
- **Problem:** Only ONE toast can exist at a time — new toasts immediately `remove()` the existing one. If two errors occur simultaneously (common during network failures), the first error message disappears instantly, giving the user zero information about the first failure.
- **Fix:** Use a toast queue with max 3 stacked toasts, dismissed FIFO, each with their own dismiss button.
- **Accessibility/UX note:** `role="status"` and `aria-live="polite"` are present ✅. However, removing the existing toast before showing the new one means screen readers may not announce the new one if the DOM removal interrupts the live region announcement.

---

## UI-02
- **Component/screen:** Error handling — `main.js` lines 96-102
- **Severity:** 🟠 HIGH
- **Problem:** The global error toast messages are vague: "Une erreur d'exécution est survenue. Détails enregistrés dans l'onglet Diagnostic." — a non-technical medical student has no idea what "l'onglet Diagnostic" is or how to access it. The error is unhelpful.
- **Fix:** Show a simpler message: "Oops, quelque chose s'est mal passé. Rechargez l'application." with a "Recharger" button that calls `location.reload()`.
- **Accessibility/UX note:** Error states should always offer a clear recovery action, not just a description.

---

## UI-03
- **Component/screen:** Admin login — `main.js` line 63 (uses `prompt()`)
- **Severity:** 🟠 HIGH
- **Problem:** Admin authentication is triggered via the browser's native `prompt()` dialog. This is jarring UX (breaks the app's visual design), blocks the main thread, cannot be styled, and does not work in some mobile WebView contexts (Capacitor WebView may intercept `prompt()`).
- **Fix:** Replace `prompt()` with a proper modal dialog component that matches the app's design system, with a masked password input and accessible labels.
- **Accessibility/UX note:** `prompt()` is not accessible to screen readers and cannot receive keyboard focus management via ARIA.

---

## UI-04
- **Component/screen:** Mobile keyboard handling — `components/native.js`
- **Severity:** 🟠 HIGH
- **Problem:** The file handles keyboard show/hide events (4,688 bytes). However, on Android, the soft keyboard can push up content, resize the viewport, or overlap fixed elements — particularly the bottom tab bar. Without seeing the implementation, common issues in Capacitor apps include: modal content scrolling under the keyboard, search bars becoming inaccessible, and the `env(safe-area-inset-bottom)` not accounting for keyboard height.
- **Fix:** Ensure the keyboard handler explicitly adjusts `padding-bottom` on active modal containers when the keyboard is open. Test on a physical device.
- **Accessibility/UX note:** Korean/Arabic/RTL language keyboards may resize the viewport differently — test with multiple keyboard types if the app is used internationally.

---

## UI-05
- **Component/screen:** `showToast` touch targets — `utils.js` line 22
- **Severity:** 🟡 MEDIUM
- **Problem:** The toast close button `.t-close` has no explicit size defined in this file. Touch targets smaller than 44×44px (WCAG 2.5.5) cause frustration for users with motor difficulties, and on a 5-inch phone screen, small targets are easy to miss. Without CSS access, we flag this for visual verification.
- **Fix:** Ensure `.t-close` has `min-width: 44px; min-height: 44px; padding: 12px` in the CSS.
- **Accessibility/UX note:** WCAG 2.5.5 (Level AAA) recommends 44×44px touch targets; WCAG 2.5.8 (Level AA, WCAG 2.2) requires 24×24px minimum.

---

## UI-06
- **Component/screen:** Offline indicator — `main.js` line 146-150+
- **Severity:** 🟡 MEDIUM
- **Problem:** An offline indicator is set up in the bootstrap function. However, in a Capacitor Android app, `navigator.onLine` is unreliable (as commented in `api.js` line 79). If the indicator shows "online" when the device is actually disconnected from the server tunnel, users may be confused why content doesn't load despite seeing "online."
- **Fix:** Replace the `navigator.onLine` check with an actual server ping result (the app already has a ping mechanism in `api.js`) to determine true connectivity.
- **Accessibility/UX note:** Offline state should be communicated persistently (banner, not just toast) so users understand why interactive features are unavailable.

---

## UI-07
- **Component/screen:** `workspace.js` — 37 KB component with loading states
- **Severity:** 🟡 MEDIUM
- **Problem:** The workspace component is 37 KB. In large components, loading skeleton states are often forgotten for secondary elements (images, sub-panels, related items). Without a full code read, the size alone suggests some loading states may show raw empty divs instead of skeletons during data fetch.
- **Fix:** Audit all async data-fetch points in workspace.js and ensure each has an explicit loading → content → error state cycle with appropriate visual feedback.
- **Accessibility/UX note:** Loading spinners need `aria-busy="true"` and `aria-label="Chargement..."` for screen reader compatibility.

---

## UI-08
- **Component/screen:** Navigation — sidebar component (`sidebar.js` 15 KB)
- **Severity:** 🟡 MEDIUM
- **Problem:** A 15 KB sidebar component on a mobile-first medical app suggests complex navigation. On small screens (360px wide), sidebar overlays need careful z-index and backdrop management to avoid trapping keyboard focus behind the overlay. Common issue: focus not returned to the trigger element when sidebar closes.
- **Fix:** Ensure sidebar open/close cycles include: `trapFocus()` when open, return focus to the open-trigger when closed, and `aria-expanded` attribute on the trigger button.
- **Accessibility/UX note:** WCAG 2.4.3 Focus Order — focus must not get trapped in hidden UI.

---

## UI-09
- **Component/screen:** PWA install prompt / service worker update
- **Severity:** 🟡 LOW
- **Problem:** The SW update flow (`main.js` lines 125-135) shows a toast "Mise à jour disponible. Rechargez pour l'appliquer." The toast auto-dismisses after 8 seconds with no action button. A user who doesn't read French or misses the toast will never get the update until they manually reload — which could mean running stale code for days.
- **Fix:** Add a persistent "Recharger" button to the update toast that calls `window.location.reload()`, and keep the toast visible until the user interacts.
- **Accessibility/UX note:** Important action prompts should not auto-dismiss.

---

## UI-10
- **Component/screen:** `applyThemeChrome()` — `main.js` lines 34-57
- **Severity:** 🟡 LOW
- **Problem:** The theme function applies the native Android status bar color via `StatusBar.setBackgroundColor()`. This is a nice touch. However, the `THEME_BG` map only has two entries (light/dark). If a user's system has a custom high-contrast mode or forced-colors media query, the status bar color may clash with the accessible high-contrast palette.
- **Fix:** Check `window.matchMedia('(prefers-contrast: more)')` and apply a high-contrast color variant to the status bar accordingly.
- **Accessibility/UX note:** Windows High Contrast / Android Accessibility Settings override CSS colors — the app should respect `prefers-contrast: more`.

