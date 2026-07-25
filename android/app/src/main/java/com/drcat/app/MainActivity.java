package com.drcat.app;

import android.os.Bundle;
import com.getcapacitor.BridgeActivity;

public class MainActivity extends BridgeActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Prevent the WebView from adding its own system-window padding on top of
        // the Android activity insets. This removes the extra dark gap that appears
        // above the navigation bar while keeping the system bars opaque/normal.
        if (getBridge() != null && getBridge().getWebView() != null) {
            getBridge().getWebView().setFitsSystemWindows(false);
        }
    }
}
