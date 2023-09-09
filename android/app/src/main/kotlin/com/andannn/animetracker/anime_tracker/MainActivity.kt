package com.andannn.animetracker.anime_tracker

import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private lateinit var authChannel: EventChannel
    var authEventSink: EventChannel.EventSink? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        authChannel = EventChannel(
            /* messenger = */ flutterEngine.dartExecutor.binaryMessenger,
            /* name = */ "com.andannn.animetracker/auth"
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
        if (intent.data?.scheme == "animetracker") {
            authEventSink?.success(intent.data?.toString()?.replace('#', '?'))
            Log.d("JQN", "onNewIntent: ${intent.data?.toString()?.substringAfter("#")}")
            authEventSink?.endOfStream()
        }
    }
}
