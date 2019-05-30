package com.perry.flutter_doubanmovie;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.widget.Toast;

import java.util.HashMap;
import java.util.Map;

import io.flutter.app.FlutterActivity;
import io.flutter.embedding.engine.systemchannels.PlatformChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private MethodChannel methodChannel;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        initMethodChannel();
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        Map<String,Object> map = new HashMap();
        map.put("index",1);
        
        methodChannel.invokeMethod("selIndex", map, new MethodChannel.Result() {
            @Override
            public void success(@android.support.annotation.Nullable Object o) {
                Toast.makeText(MainActivity.this, o.toString(), Toast.LENGTH_LONG).show();
            }

            @Override
            public void error(String errorCode, @android.support.annotation.Nullable String errorMsg, @android.support.annotation.Nullable Object errorDetail) {
                Toast.makeText(MainActivity.this, errorMsg, Toast.LENGTH_LONG).show();
            }

            @Override
            public void notImplemented() {

            }
        });
    }

    private void initMethodChannel() {
        methodChannel = new MethodChannel(getFlutterView(), "douBan.movie");
        methodChannel.setMethodCallHandler(MainActivity.this::handlerMethod);
    }

    private void handlerMethod(MethodCall methodCall, MethodChannel.Result result) {
        switch (methodCall.method) {
            case "buyTicket":
                buyTicket((String) methodCall.arguments);
                result.success("You buy ticket succeed!");
                break;
            default:
        }
    }

    private void buyTicket(String movieName) {
        new AlertDialog.Builder(this)
                .setTitle("Buy ticket")
                .setMessage(movieName)
                .show();
    }
}
