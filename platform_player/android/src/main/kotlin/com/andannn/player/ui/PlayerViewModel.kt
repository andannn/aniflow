package com.andannn.player.ui

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.SavedStateHandle
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import androidx.media3.exoplayer.ExoPlayer
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import java.lang.Exception

private const val TAG = "PlayerViewModel"

class PlayerViewModel(
    application: Application,
    savedStateHandle: SavedStateHandle,
) : AndroidViewModel(application) {

    private val source = savedStateHandle.get<String>("source") ?: error("source is null")

    private val _uiState = MutableStateFlow<UiState>(UiState.Loading)
    val uiState = _uiState.asStateFlow()

    val exoPlayer = ExoPlayer.Builder(application).build()

    private val listener = object : Player.Listener {
        override fun onPlaybackStateChanged(playbackState: Int) {
            if (playbackState == Player.STATE_READY || playbackState == Player.STATE_ENDED) {
                _uiState.value = UiState.Ready
            }
        }
    }

    init {
        exoPlayer.addListener(listener)
        exoPlayer.setMediaItem(MediaItem.fromUri(source))
        exoPlayer.prepare()
        exoPlayer.play()
    }

    override fun onCleared() {
        exoPlayer.release()
    }
}

sealed interface UiState {
    data object Loading : UiState
    data object Ready : UiState
    data class Error(val exception: Exception) : UiState
}