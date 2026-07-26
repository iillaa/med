package com.drcat.app;

import android.os.Bundle;
import androidx.core.view.WindowCompat;
import com.getcapacitor.BridgeActivity;

public class MainActivity extends BridgeActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Force true edge-to-edge AFTER Capacitor's super.onCreate().
        // With adjustMarginsForEdgeToEdge:"disable", Capacitor calls
        // setDecorFitsSystemWindows(true) which shrinks the window and
        // leaves a native dark gap above the nav bar.
        // This call overrides that, extending the WebView to the full screen.
        // CSS env(safe-area-inset-bottom) handles content padding above nav buttons.
        WindowCompat.setDecorFitsSystemWindows(getWindow(), false);
    }
}


