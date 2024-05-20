package com.andannn.downloader.platform_downloader

import android.annotation.TargetApi
import android.app.DownloadManager
import android.content.Context
import android.net.Uri
import android.os.Build
import android.os.Environment

interface Downloader {
    fun downloadImageToExternalStorage(
        url: String,
        subFolder: String,
        name: String? = null
    ): Long
}

@TargetApi(Build.VERSION_CODES.M)
internal class DownloaderImpl(
    private val context: Context,
) : Downloader {
    private val downloadManager = context.getSystemService(DownloadManager::class.java)
    override fun downloadImageToExternalStorage(
        url: String,
        subFolder: String,
        name: String?
    ): Long {
        val fileName = name ?: url.substringAfterLast('/').substringBeforeLast('.')
        val request = DownloadManager.Request(Uri.parse(url))
            .setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE)
            .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_ONLY_COMPLETION)
            .setTitle("Image download completed.")
            .setDestinationInExternalPublicDir(
                Environment.DIRECTORY_PICTURES,
                "$subFolder/$fileName"
            )
        return downloadManager.enqueue(request)
    }
}