# Lessons Learned — Android Nav Bar Gap Fix

## Capacitor Android — Navigation Bar Dark Gap

**Problem**: Dark empty space between app content and Android 3-button navigation bar in Capacitor APK. Gap is native (outside WebView) — cannot be selected by DOM inspector (Eruda). `window.innerHeight < screen.height` by more than just status + nav bar height.

**Diagnostic**: Inject JS overlay showing `screen.h - win.h` and `env(safe-area-inset-bottom)`. If `safe-bot = 0`, Capacitor has reverted edge-to-edge mode and the window is smaller than the full screen.

**Root Cause**: `adjustMarginsForEdgeToEdge: "disable"` causes Capacitor's `BridgeActivity.super.onCreate()` to call `WindowCompat.setDecorFitsSystemWindows(window, true)`, shrinking the window and creating a native gap. Note: `"none"` is NOT a valid value — it silently falls back to `"auto"`.

**Fix** — `MainActivity.java`:
```java
import androidx.core.view.WindowCompat;

public class MainActivity extends BridgeActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Override Capacitor's revert — must be AFTER super.onCreate()
        WindowCompat.setDecorFitsSystemWindows(getWindow(), false);
    }
}
```

**Supporting config** (`capacitor.config.json`):
- `"adjustMarginsForEdgeToEdge": "disable"` (Capacitor won't add its own margins)
- `"Keyboard": { "resize": "none" }` (prevents keyboard plugin padding body)

**Supporting CSS** (content above nav bar buttons):
```css
.tab-content-container {
  padding-bottom: max(16px, env(safe-area-inset-bottom));
}
```

**Also change** `activity_main.xml`: `CoordinatorLayout` → `FrameLayout`

**Do NOT try**:
- `adjustMarginsForEdgeToEdge: "none"` — invalid, silently ignored
- `windowSoftInputMode="adjustNothing"` — breaks top (status bar inset inflates, pushes header down)
- `setOnApplyWindowInsetsListener` on WebView parent — doesn't help when Capacitor reverts at window level

# App Versioning & Mandatory Prompt Protocol

## Automatic Version Bump Proposal Requirement
Whenever completing work on code updates, bug fixes, performance improvements, or new features:
1. **Assess Change Severity & Semantic Version Bump**:
   - **PATCH (`1.0.X`)**: Bug fixes, minor styling tweaks, internal code refactoring, non-breaking asset updates.
   - **MINOR (`1.X.0`)**: New user-facing features, new UI views/modals, DB schema expansion, new API endpoints.
   - **MAJOR (`X.0.0`)**: Massive application overhaul, breaking API/schema changes, major redesign.
2. **Mandatory End-of-Task Prompt**:
   - At the conclusion of every response where code/files were modified, **Gemini MUST propose a new app version** based on the changes made.
   - Example prompt format:
     > 📌 **App Version Proposal**:
     > - **Current Version**: `1.0.0`
     > - **Proposed Version**: `1.0.1` (Patch: bug fix / minor update)
     > - **Reason**: Fixed navbar inset and updated search cache.
     > - *Would you like me to update `package.json` and stamp the build with `1.0.1` now?*
3. **Server-Controlled Force Update Gate**:
   - App update enforcement is controlled via server configuration (`version.json` / Admin API).
   - When `forceUpdateActive` is set to `true` on the server and client version < `minVersion`, the server signals a mandatory app update to clients (Android APK & PWA).

# Security Lock Gate & User Storage Protection Protocol

## Kill Switch / Force Update Storage Rule
- **CRITICAL**: The Security Lock Gate (`public/js/version-checker.js`) MUST NEVER call `localStorage.clear()`, `sessionStorage.clear()`, or `indexedDB.deleteDatabase()`.
- **Reason**: Calling `localStorage.clear()` on lock screen activation permanently destroys the user's personal medical notes (`dr_cat_notes_*`), reading history (`dr_cat_user_progress`), Leitner spaced repetition stats (`dr_cat_leitner`), and study streaks (`dr_cat_streak`).
- **Rule**: Lock screens must strictly block UI interaction. Purge ONLY temporary HTTP network cache keys (`dr_cat_synced_db`). When the lock is lifted or the user updates the app binary, `window.location.reload()` must be called to restore active UI with 100% of user data preserved.
