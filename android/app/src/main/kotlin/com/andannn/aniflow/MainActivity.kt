package com.andannn.aniflow

import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugins.GeneratedPluginRegistrant
import java.io.File

private const val TAG = "MainActivity"

class MainActivity : FlutterFragmentActivity() {
    private lateinit var authChannel: EventChannel
    private lateinit var methodChannel: MethodChannel
    private var authEventSink: EventChannel.EventSink? = null

    override fun getInitialRoute(): String? {
        Log.d(TAG, "getInitialRoute uri: ${intent?.data?.toString()}")
        return intent?.data?.toString() ?: super.getInitialRoute()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        Log.d(TAG, "configureFlutterEngine: ${this.hashCode()}")
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        authChannel = EventChannel(
            /* messenger = */ flutterEngine.dartExecutor.binaryMessenger,
            /* name = */ "com.andannn.animetracker/auth"
        )
        methodChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "com.andannn.animetracker/platform_method"
        )
        authChannel.setStreamHandler(
            /* handler = */ object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
                    Log.d(TAG, "onListen: ")
                    authEventSink = events
                }

                override fun onCancel(arguments: Any?) {
                    authEventSink = null
                }
            })
        methodChannel.setMethodCallHandler { call, result ->
            onMethodCall(call, result)
        }
    }

    private fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "installPackage") {
            val path: String = call.argument<String>("path") ?: return result.error(
                /* errorCode = */ "ERROR",
                /* errorMessage = */ "param is null",
                /* errorDetails = */ null,
            )

            installApk(this, path)
            result.success(null)
        } else {
            result.notImplemented()
        }
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

    private fun installApk(context: Context, path: String) {
        val intent = Intent(Intent.ACTION_VIEW).also { intent ->
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            intent.putExtra(Intent.EXTRA_NOT_UNKNOWN_SOURCE, true)
            intent.data = FileProvider.getUriForFile(
                context,
                BuildConfig.APPLICATION_ID + ".provider",
                File(path)
            )
        }
        context.startActivity(intent)
    }
}

