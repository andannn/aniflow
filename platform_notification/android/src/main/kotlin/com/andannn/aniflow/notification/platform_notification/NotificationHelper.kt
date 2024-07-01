package com.andannn.aniflow.notification.platform_notification

import android.content.Context
import androidx.core.app.NotificationChannelCompat
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

@Serializable
data class NotificationChannel(
    @SerialName("id") val id: String,
    @SerialName("name") val name: String,
    @SerialName("description") val description: String,
    @SerialName("importance") val importance: Int
)

@Serializable
data class Notification(
    @SerialName("id") val id: Int,
    @SerialName("title") val title: String,
    @SerialName("body") val body: String,
    @SerialName("notification_channel") val notificationChannel: NotificationChannel,
)

class NotificationHelper(
    private val context: Context,
) {
    fun areNotificationsEnabled(): Boolean {
        return NotificationManagerCompat.from(context).areNotificationsEnabled()
    }

    fun sendNotification(notificationModel: Notification) {
        // create notification channel.
        val notificationManager = NotificationManagerCompat.from(context)
        val notificationChannel = notificationModel.notificationChannel
        val channel = NotificationChannelCompat.Builder(
            notificationChannel.id,
            notificationChannel.importance,
        )
            .setName(notificationChannel.name)
            .setDescription(notificationChannel.description)
            .build()
        notificationManager.createNotificationChannel(channel)

        // send notification.
        val notification = NotificationCompat.Builder(
            context,
            notificationChannel.id,
        )
            .setContentTitle(notificationModel.title)
            .setContentText(notificationModel.body)
            .setSmallIcon(android.R.drawable.ic_dialog_info)
            .setPriority(NotificationCompat.PRIORITY_DEFAULT)
            .build()
        notificationManager.notify(notificationModel.id, notification)
    }
}