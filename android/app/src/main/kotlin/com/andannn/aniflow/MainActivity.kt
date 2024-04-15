package com.andannn.aniflow

import android.content.Intent
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

private const val TAG = "MainActivity"

class MainActivity : FlutterActivity() {
    private lateinit var authChannel: EventChannel
    private lateinit var methodChannel: MethodChannel
    private var authEventSink: EventChannel.EventSink? = null

    override fun getInitialRoute(): String? {
        Log.d(TAG, "getInitialRoute uri: ${intent?.data?.toString()}")

        return intent?.data?.toString() ?: super.getInitialRoute()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        authChannel = EventChannel(
            /* messenger = */ flutterEngine.dartExecutor.binaryMessenger,
            /* name = */ "com.andannn.animetracker/auth"
        )
        methodChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "com.andannn.animetracker/navi"
        )
        authChannel.setStreamHandler(
            /* handler = */ object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
                    authEventSink = events
                }

                override fun onCancel(arguments: Any?) {
                    authEventSink = null
                }
            })
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)

        val action = intent.action
        val data = intent.data

        Log.d(TAG, "onNewIntent: action $action, data $data")

        if (intent.data?.scheme == "animetracker") {
            // app received the redirect link from anilist.
            authEventSink?.success(intent.data?.toString()?.replace('#', '?'))
            authEventSink?.endOfStream()
        }

        data?.let {
            // Launched by deep link, let flutter handle the uri.
            flutterEngine?.navigationChannel?.pushRouteInformation(it.toString())
        }
    }
}

