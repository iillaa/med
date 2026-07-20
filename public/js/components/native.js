/**
 * Native hardware back-button handling (Phase 4.2).
 *
 * Wires Capacitor's App `backButton` event when running inside the native
 * Android shell. Priority order:
 *   1. Close any open modal/overlay
 *   2. Close an open sidebar drawer
 *   3. Leave a deeper view (quiz/workspace) back to the dashboard
 *   4. At the root (dashboard): ask the host to exit (or show confirm)
 *
 * On the web (no Capacitor App plugin) this is a no-op — browsers manage their
 * own back stack. The handler is defensively coded so it never throws when the
 * plugin is absent.
 *
 * @param {object} handlers
 * @param {() => boolean} [handlers.isModalOpen]   - true if a modal is open.
 * @param {() => void}    [handlers.closeModal]    - close the open modal.
 * @param {() => boolean} [handlers.isDrawerOpen]  - true if sidebar drawer open.
 * @param {() => void}    [handlers.closeDrawer]   - close the sidebar drawer.
 * @param {() => boolean} [handlers.isDeepView]    - true if on quiz/workspace.
 * @param {() => void}    [handlers.goToDashboard] - return to dashboard.
 * @param {() => void}    [handlers.confirmExit]   - root-level exit request.
 */
export function setupHardwareBackButton(handlers = {}) {
  const App = window.Capacitor && window.Capacitor.Plugins && window.Capacitor.Plugins.App;
  if (!App || typeof App.addListener !== 'function') return false;

  App.addListener('backButton', () => {
    try {
      if (handlers.isModalOpen && handlers.isModalOpen()) {
        if (handlers.closeModal) handlers.closeModal();
        return;
      }
      if (handlers.isDrawerOpen && handlers.isDrawerOpen()) {
        if (handlers.closeDrawer) handlers.closeDrawer();
        return;
      }
      if (handlers.isDeepView && handlers.isDeepView()) {
        if (handlers.goToDashboard) handlers.goToDashboard();
        return;
      }
      if (handlers.confirmExit) handlers.confirmExit();
    } catch (e) {
      console.warn('[BackButton] handler error:', e);
    }
  });

  return true;
}

/**
 * Native keyboard handling (Phase 4.6).
 *
 * Wires Capacitor's Keyboard plugin when running inside the native Android
 * shell. On show it exposes the keyboard height as `--capacitor-keyboard-height`
 * (so fixed/floating UI can avoid being hidden) and smoothly scrolls the
 * focused input into view. On hide it clears the offset. Dismissing the
 * keyboard when the user scrolls is handled natively by the WebView; this
 * only keeps layout honest.
 *
 * On the web (no Capacitor Keyboard plugin) this is a no-op.
 *
 * @returns {boolean} true if listeners were registered.
 */
export function setupKeyboardHandling() {
  const Keyboard = window.Capacitor && window.Capacitor.Plugins && window.Capacitor.Plugins.Keyboard;
  if (!Keyboard || typeof Keyboard.addListener !== 'function') return false;

  const setOffset = (px) => {
    document.documentElement.style.setProperty('--capacitor-keyboard-height', `${px}px`);
  };

  Keyboard.addListener('keyboardWillShow', (info) => {
    try {
      const h = (info && typeof info.keyboardHeight === 'number') ? info.keyboardHeight : 0;
      setOffset(h);
      const active = document.activeElement;
      if (active && (active.tagName === 'INPUT' || active.tagName === 'TEXTAREA')) {
        active.scrollIntoView({ block: 'center', behavior: 'smooth' });
      }
    } catch (e) {
      console.warn('[Keyboard] show error:', e);
    }
  });

  Keyboard.addListener('keyboardWillHide', () => {
    try {
      setOffset(0);
    } catch (e) {
      console.warn('[Keyboard] hide error:', e);
    }
  });

  return true;
}

/**
 * Native app foreground/background lifecycle (Phase 4.5).
 *
 * Wires Capacitor's App `pause` / `resume` events when running inside the
 * native Android shell. Used to stop periodic polling (battery + correctness)
 * when backgrounded and to refresh + restart it on return to the foreground.
 *
 * On the web (no Capacitor App plugin) this is a no-op.
 *
 * @param {{ onPause?: () => void, onResume?: () => void }} handlers
 * @returns {boolean} true if listeners were registered.
 */
export function setupAppLifecycle(handlers = {}) {
  const App = window.Capacitor && window.Capacitor.Plugins && window.Capacitor.Plugins.App;
  if (!App || typeof App.addListener !== 'function') return false;

  if (typeof handlers.onPause === 'function') {
    App.addListener('pause', () => {
      try { handlers.onPause(); } catch (e) { console.warn('[Lifecycle] pause error:', e); }
    });
  }
  if (typeof handlers.onResume === 'function') {
    App.addListener('resume', () => {
      try { handlers.onResume(); } catch (e) { console.warn('[Lifecycle] resume error:', e); }
    });
  }

  return true;
}
