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
