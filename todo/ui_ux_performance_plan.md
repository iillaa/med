# 🩺 Dr. CAT — UI/UX Performance & Aesthetics Architectural Plan

> **Status:** Pending Execution (Scheduled for Future Milestone)  
> **Target:** 60 FPS Mobile WebView (Capacitor Android APK) & High-Contrast Clinical Aesthetics

---

## 1. Executive Summary & Root Cause Analysis

Recent UI enhancements introduced rich dark-mode aesthetics (glassmorphism, soft glow shadows, multi-property transitions). While visually pleasing on high-end desktop hardware, these picks introduce severe rendering penalties on **mobile WebViews (Capacitor Android APK)** and low-to-mid tier mobile browsers.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                      CURRENT CAUSES OF UI LAG / STUTTER                 │
├───────────────────────────────┬─────────────────────────────────────────┤
│ 🚨 Real-time `backdrop-filter`│ Forces Android GPU to perform offscreen │
│    blur on overlays/modals    │ screen buffer copies on every frame.    │
├───────────────────────────────┼─────────────────────────────────────────┤
│ 🚨 Multi-Property Transitions │ Animating `box-shadow`, `border-color`, │
│    (`transition: all`)        │ and `width` triggers CPU Layout/Paint.  │
├───────────────────────────────┼─────────────────────────────────────────┤
│ 🚨 Heavy Box Shadow Blurs    │ Soft `30px` Gaussian shadows on 55+     │
│    on Scrollable Lists        │ sidebar cards cause scroll repaint jank.│
├───────────────────────────────┼─────────────────────────────────────────┤
│ 🚨 Un-isolated DOM Repaints   │ Lack of `contain: content;` causes any  │
│    during Filtering & Tabs    │ single item update to recalculate page. │
└───────────────────────────────┴─────────────────────────────────────────┘
```

---

## 2. Detailed Performance Bottlenecks & Fix Strategy

### ⚡ Bottleneck 1: Real-time `backdrop-filter: blur(...)`
* **Current Issue:** `#modal-overlay`, `.toast`, and `#overlay` use `backdrop-filter: blur(4px..12px)`. On Android Blink WebViews, this causes a real-time pixel-by-pixel re-render of the entire backdrop, dropping frame rates from **60 FPS down to ~20 FPS**.
* **Modern Replacement:** 
  * On mobile (`@media (max-width: 850px)`): Use hardware-friendly solid translucent layers (`background: rgba(15, 23, 42, 0.95)`).
  * On desktop (`@media (min-width: 851px)`): Retain GPU-accelerated glassmorphism blur.

### ⚡ Bottleneck 2: Layout-Triggering Transitions
* **Current Issue:** CSS tokens like `--transition-smooth` animate 5 properties simultaneously (`opacity`, `transform`, `background-color`, `border-color`, `box-shadow`).
* **Modern Replacement:** Split transitions into **GPU Composite Tokens**:
  * `--transition-gpu: transform 0.2s cubic-bezier(0.16, 1, 0.3, 1), opacity 0.2s ease;` (0 layout reflows, locked 60 FPS).
  * `--transition-paint: background-color 0.15s ease, border-color 0.15s ease;`

### ⚡ Bottleneck 3: Surface Elevation vs. Heavy Gaussian Box Shadows
* **Current Issue:** Cards rely on `box-shadow: 0 10px 25px rgba(0,0,0,0.5)`, forcing mobile GPUs to render complex shadow blurs while scrolling through 55+ medical CATs.
* **Modern Replacement (Material Design 3 Surface Luminosity):** 
  * Replace heavy shadows with **Surface Elevation Levels**:
    * `--surface-base`: `#0b1120` (App Background)
    * `--surface-card`: `#131d31` (Sidebar & Cards)
    * `--surface-hover`: `#1e293b` (Active Cards & Hover)
    * `--surface-modal`: `#1e293b` (Floating Modals & Tooltips)
  * Uses crisp 1px subtle borders (`border: 1px solid var(--border-color)`) with zero-overhead box shadows (`0 2px 4px rgba(0,0,0,0.2)`).

### ⚡ Bottleneck 4: Isolated Scroll Containers (`contain: content;`)
* **Current Issue:** Scrolling the sidebar or workspace forces the browser to check layout constraints for the entire page body.
* **Modern Replacement:** Add `contain: content;` and `will-change: transform;` to `.sidebar-content` and `.workspace-content`. This creates an isolated GPU compositing layer, isolating all scroll calculations.

---

## 3. High-Performance Clinical Design System Tokens

Below are the proposed performance-first design tokens to replace our existing token set in `public/css/variables.css`:

```css
/* ── GPU Hardware-Accelerated Tokens ───────────────────────── */
:root {
  /* Surface Elevation Levels (Zero-Shadow Luminosity Hierarchy) */
  --surface-base: #0b1120;       /* Darkest background */
  --surface-card: #131d31;       /* Level 1: Sidebar cards */
  --surface-hover: #1e293b;      /* Level 2: Active / Hover state */
  --surface-modal: #1e293b;      /* Level 3: Floating dialogs */

  /* High-Contrast Clinical Palette (WCAG AA Compliant >= 4.5:1) */
  --color-primary: #0ea5e9;      /* Cyan 500 — Key actions & headers */
  --color-primary-glow: rgba(14, 165, 233, 0.15);
  --color-success: #10b981;      /* Emerald 500 — Terminé / Passed */
  --color-warning: #f59e0b;      /* Amber 500 — En cours / Caution */
  --color-danger: #ef4444;       /* Rose 500 — Urgence / Red Flags */

  /* Locked 60 FPS Motion Tokens (Only Composite Layer Props) */
  --motion-fast: 120ms;
  --motion-base: 200ms;
  --ease-out-smooth: cubic-bezier(0.16, 1, 0.3, 1);
  
  --transition-gpu: transform var(--motion-base) var(--ease-out-smooth), opacity var(--motion-base) ease;
  --transition-paint: background-color var(--motion-fast) ease, border-color var(--motion-fast) ease;
}
```

---

## 4. Preservation Matrix of Commit `90d88ac` & PR #15/#16

| Optimization Area | Status & Compatibility |
| :--- | :--- |
| **Commit `90d88ac` (HTTPS Scheme & Touch Throttling)** | **100% Preserved & Enhanced:** Event delegation and `requestAnimationFrame` gesture throttling remain active. Scoping GPU blurs allows `rAF` touch tracking to run at a locked 60 FPS. |
| **PR #15 / #16 Mobile Gestures** | **100% Preserved:** Sidebar swipe-to-open / swipe-to-close physics and `{ passive: true }` listeners remain untouched. |
| **PR #15 / #16 Specialty Badges & Colors** | **100% Preserved:** Cyan/emerald/rose clinical badges and Outfit/Inter typography standards are fully maintained. |

---

## 5. Execution Steps (For Future Implementation)

1. **Step 1: CSS Variables & Performance Tokens Update (`public/css/variables.css`)**
   * Refactor `--transition-smooth` into separate GPU composite tokens.
   * Add surface luminosity levels (`--surface-base`, `--surface-card`, `--surface-hover`).
2. **Step 2: Mobile Glassmorphism & Shadow Audit (`public/css/modal.css`, `toast.css`, `sidebar.css`)**
   * Scope `backdrop-filter: blur(...)` to desktop (`@media (min-width: 851px)`).
   * Apply lightweight 1px borders & surface luminosity for mobile overlays.
3. **Step 3: Scroll & Container Layer Isolation (`public/css/sidebar.css`, `workspace.css`)**
   * Add `contain: content;` to `.sidebar-content` and `.workspace-body`.
4. **Step 4: Verification & Asset Build**
   * Run `node build.js` and test test suite (`tests/run_all_tests.js`).
