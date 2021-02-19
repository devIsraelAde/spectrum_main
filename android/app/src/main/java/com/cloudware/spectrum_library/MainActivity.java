package com.cloudware.spectrum_library;

import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.GeneratedPluginRegistrant;

import android.os.Build;
import android.view.ViewTreeObserver;

import com.folioreader.Config;
import com.folioreader.Constants;
import com.folioreader.FolioReader;

public class MainActivity extends FlutterActivity {
    private static final String PLATFORM_CHANNEL = "com.cloudware.ng/spectrum/platform_channel";
    public FolioReader folioReader;
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), PLATFORM_CHANNEL).setMethodCallHandler(
                new MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, Result result) {
//                         if (call.method.equals("demoFunction")) { // INFO: method check
//                           String argument = call.argument("data"); // INFO: get arguments
//                           demoFunction(result, argument); // INFO: method call, every method call should pass result parameter
//                         } else
                        if (call.method.equals("epub")) {
                            openEpub(call.argument("epubfilepath"));
                        }
                        else if(call.method.equals("close")){
                            folioReader.close();
                        }else {
                            result.notImplemented(); // INFO: not implemented
                        }
                    }
                }
        );
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    boolean flutter_native_splash = true;
    int originalStatusBarColor = 0;
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        originalStatusBarColor = getWindow().getStatusBarColor();
        getWindow().setStatusBarColor(0xff024946);
    }
    int originalStatusBarColorFinal = originalStatusBarColor;

        if (!setSecureSurfaceView()) {
            Log.e("MainActivity", "Could not secure the MainActivity!");
            // React as appropriate.
        }


    }

    private void openEpub(String filepath){
        Config config = new Config()
                .setAllowedDirection(Config.AllowedDirection.VERTICAL_AND_HORIZONTAL)
//                .setDirection(Config.Direction.VERTICAL)
                .setFont(Constants.FONT_LATO)
                .setFontSize(2)
                .setThemeColorInt(Color.parseColor("#0b4e4b"))
                .setShowTts(true);

        FolioReader.get()
                .setConfig(config, true)
                .openBook(filepath);
    }

    private boolean  setSecureSurfaceView() {
        ViewGroup content = (ViewGroup) findViewById(android.R.id.content);
        if (!isNonEmptyContainer((View) content)) {
            return false;
        }
        View splashView = (ViewGroup) content.getChildAt(0);
        if (!isNonEmptyContainer(splashView)) {
            return false;
        }
        View flutterView = ((ViewGroup) splashView).getChildAt(0);
        if (!isNonEmptyContainer(flutterView)) {
            return false;
        }
        View surfaceView = ((ViewGroup)flutterView).getChildAt(0);
        if (!(surfaceView instanceof SurfaceView)) {
            return false;
        }
        ((SurfaceView)surfaceView).setSecure(true);
        this.getWindow().setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE);
        return true;
    }

    private final boolean isNonEmptyContainer(View view) {
        if (!(view instanceof ViewGroup)) {
            return false;
        } else {
            return ((ViewGroup)view).getChildCount() >= 1;
        }
    }
}