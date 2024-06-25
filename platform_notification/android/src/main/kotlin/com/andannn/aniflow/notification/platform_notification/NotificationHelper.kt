package com.andannn.aniflow.notification.platform_notification

import android.content.Context
import androidx.core.app.NotificationChannelCompat
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat


data class NotificationChannel(
    val id: String,
    val name: String,
    val description: String,
    val importance: Int
)

data class Notification(
    val id: Int,
    val title: String,
    val body: String,
    val notificationChannel: NotificationChannel,
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
            .build()
        notificationManager.notify(notificationModel.id, notification)
    }
}