package com.drcat.app;

import android.os.Bundle;
import androidx.core.view.WindowCompat;
import com.getcapacitor.BridgeActivity;

public class MainActivity extends BridgeActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Overrides Capacitor 8 default window fit for Android 14 (Fixes Capacitor Bug #8408)
        WindowCompat.setDecorFitsSystemWindows(getWindow(), false);
    }
}
