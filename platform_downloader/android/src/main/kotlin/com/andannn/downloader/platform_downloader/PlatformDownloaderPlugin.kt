package com.andannn.downloader.platform_downloader

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** PlatformDownloaderPlugin */
class PlatformDownloaderPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var downloader: Downloader

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "platform_downloader")
        channel.setMethodCallHandler(this)

        downloader = DownloaderImpl(flutterPluginBinding.applicationContext)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "downloadImageToExternalStorage") {
            onDownloadImageToExternalStorageCall(call, result)
        } else {
            result.notImplemented()
        }
    }

    private fun onDownloadImageToExternalStorageCall(call: MethodCall, result: Result) {
        val url = call.argument<String>(PARAM_URL) ?: return result.notImplemented()
        val subPath = call.argument<String>(PARAM_SUB_PATH) ?: return result.notImplemented()
        val fileName = call.argument<String?>(PARAM_FILE_NAME)
        downloader.downloadImageToExternalStorage(url, subPath, fileName)
        result.success(null)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
