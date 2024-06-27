package com.andannn.aniflow.notification.platform_notification

import android.app.NotificationManager
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlin.test.Test
import org.mockito.Mockito
import kotlin.test.assertEquals

internal class PlatformNotificationPluginTest {
    @Test
    fun onMethodCall_getPlatformVersion_returnsExpectedValue() {
        val plugin = PlatformNotificationPlugin()

        val call = MethodCall("getPlatformVersion", null)
        val mockResult: MethodChannel.Result = Mockito.mock(MethodChannel.Result::class.java)
        plugin.onMethodCall(call, mockResult)

        Mockito.verify(mockResult).success("Android " + android.os.Build.VERSION.RELEASE)
    }

    @Test
    fun convert_notification_model_to_json() {
        val notification = Notification(
            id = 1,
            title = "title",
            body = "body",
            notificationChannel = NotificationChannel(
                id = "1",
                name = "name",
                description = "description",
                importance = NotificationManager.IMPORTANCE_NONE
            )
        )
        assertEquals(
            "{\"id\":1,\"title\":\"title\",\"body\":\"body\",\"notification_channel\":{\"id\":\"1\",\"name\":\"name\",\"description\":\"description\",\"importance\":0}}",
            Json.encodeToString(notification)
        )
    }
}
