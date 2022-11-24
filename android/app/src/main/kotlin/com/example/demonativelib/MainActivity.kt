package com.example.demonativelib

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        flutterEngine?.let {
            GeneratedPluginRegistrant.registerWith(it)
            MethodChannel(
                it.dartExecutor.binaryMessenger,
                CHANNEL
            ).setMethodCallHandler { methodCall, result ->
                val arguments: Map<String, Any> = methodCall.arguments as Map<String, Any>
                if (methodCall.method.equals("getResult")) {

                    val from = arguments["from"]

                    val message = "Android say hi $from";

                    result.success(message);
                }
            }
        }

    }


    companion object {
        const val CHANNEL = "cobacoba"
    }
}
