package com.drcat.app;

import android.os.Bundle;
import android.view.View;
import androidx.core.view.ViewCompat;
import com.getcapacitor.BridgeActivity;

public class MainActivity extends BridgeActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Capacitor's super.onCreate() installs its own OnApplyWindowInsetsListener
        // on the WebView's parent view. On Android 15+ (targetSdk 35), this listener
        // adds a bottom margin equal to the navigation bar height, creating a dark gap.
        // We override it AFTER super.onCreate() to be a no-op, letting CSS
        // env(safe-area-inset-bottom) handle insets instead.
        getBridge().getWebView().post(() -> {
            View parent = (View) getBridge().getWebView().getParent();
            ViewCompat.setOnApplyWindowInsetsListener(parent, (v, insets) -> insets);
        });
    }
}

