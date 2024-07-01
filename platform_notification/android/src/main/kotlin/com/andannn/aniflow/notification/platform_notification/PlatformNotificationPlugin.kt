package com.andannn.aniflow.notification.platform_notification

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.serialization.json.Json

/** PlatformNotificationPlugin */
class PlatformNotificationPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var notificationHelper: NotificationHelper
    private lateinit var json: Json

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "platform_notification")
        channel.setMethodCallHandler(this)
        notificationHelper = NotificationHelper(context = flutterPluginBinding.applicationContext)
        json = Json {
            ignoreUnknownKeys = true
            isLenient = true
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "areNotificationsEnabled" -> {
                result.success(notificationHelper.areNotificationsEnabled())
            }

            "sendNotification" -> {
                val param = call.argument<String>("param") ?: return result.error(
                    /* errorCode = */ "ERROR",
                    /* errorMessage = */ "param is null",
                    /* errorDetails = */ null,
                )
                val notification = json.decodeFromString<Notification>(param)
                notificationHelper.sendNotification(notification)
                result.success(true)
            }

            "isNotificationChannelEnabled" -> {
                val channelId = call.argument<String>("channelId") ?: return result.error(
                    /* errorCode = */ "ERROR",
                    /* errorMessage = */ "channelId is null",
                    /* errorDetails = */ null,
                )
                result.success(notificationHelper.isNotificationChannelEnabled(channelId))
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
