package com.andannn.extractor.platform_extractor

import androidx.annotation.NonNull
import com.tanasi.streamflix.extractors.Extractor

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import kotlin.coroutines.CoroutineContext

/** PlatformExtractorPlugin */
class PlatformExtractorPlugin: FlutterPlugin, MethodCallHandler, CoroutineScope {
  private lateinit var channel : MethodChannel

  override val coroutineContext: CoroutineContext = Dispatchers.Main + Job()

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "platform_extractor")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "extract") {
      val link: String = call.argument<String>("link") ?: return result.error(
        /* errorCode = */ "ERROR",
        /* errorMessage = */ "param is null",
        /* errorDetails = */ null,
      )

      launch {
        try {
          val video = Extractor.extract(link = link)
          result.success(video.source)
        } catch (e: Exception) {
          throw e
          result.error("EXTRACTOR_ERROR", e.message, e)
        }
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    coroutineContext.cancel()
  }
}
