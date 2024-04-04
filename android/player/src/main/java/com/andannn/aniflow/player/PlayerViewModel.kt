package com.andannn.aniflow.player

import android.app.Application
import android.net.Uri
import android.util.Log
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.viewModelScope
import androidx.media3.common.AudioAttributes
import androidx.media3.common.C
import androidx.media3.common.MediaItem
import androidx.media3.common.MimeTypes
import androidx.media3.exoplayer.ExoPlayer
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.filterNotNull
import kotlinx.coroutines.launch

private const val TAG = "PlayerViewModel"

class PlayerViewModel(
    application: Application,
    savedStateHandle: SavedStateHandle
) : AndroidViewModel(application = application) {

    val player = ExoPlayer.Builder(application)
        .setAudioAttributes(
            AudioAttributes.Builder()
                .setUsage(C.USAGE_MEDIA)
                .setContentType(C.AUDIO_CONTENT_TYPE_MOVIE)
                .build(),
            true,
        ).build()

    private val megaExtractor: MegaExtractor = MegaExtractorImpl()
    private val url = savedStateHandle.get<String>(PlayerActivity.VIDEO_URL_KEY) ?: error("no url")

    private val videoStateFlow = MutableStateFlow<Video?>(null)
    private var job: Job? = null

    init {
        job = viewModelScope.launch {
            extractVideo()
        }

        viewModelScope.launch {
            videoStateFlow.filterNotNull().collect {
                Log.d(TAG, "video extracted: $it")
                val mediaItem = MediaItem.Builder().setUri(Uri.parse(it.url))
                    .setSubtitleConfigurations(it.subtitles.map {
                        MediaItem.SubtitleConfiguration.Builder(Uri.parse(it.file))
                            .setMimeType(MimeTypes.TEXT_VTT)
                            .setLabel(it.label)
                            .build()
                    })
                    .build()
                player.setMediaItem(mediaItem)
                player.prepare()
                player.play()
            }
        }
    }

    private fun retryExtractVideo() {
        job?.cancel()
        job = viewModelScope.launch {
            extractVideo()
        }
    }

    private suspend fun extractVideo() {
        val video = megaExtractor.extract(url)

        videoStateFlow.value = video
    }

    override fun onCleared() {
        super.onCleared()
        player.stop()
        player.release()
    }
}