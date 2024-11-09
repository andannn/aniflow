package com.andannn.player.ui

import android.graphics.Color
import android.os.Build
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.wrapContentSize
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.dynamicDarkColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.viewinterop.AndroidView
import androidx.core.view.WindowCompat
import androidx.core.view.WindowInsetsCompat
import androidx.core.view.WindowInsetsControllerCompat
import androidx.media3.common.Player
import androidx.media3.ui.PlayerView

class PlayerActivity : ComponentActivity() {
    private val viewModel: PlayerViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val windowInsetsController =
            WindowCompat.getInsetsController(window, window.decorView)
        windowInsetsController.systemBarsBehavior =
            WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE
        windowInsetsController.hide(WindowInsetsCompat.Type.systemBars())

        setContent {
            MaterialTheme(
                colorScheme = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S)
                    dynamicDarkColorScheme(LocalContext.current)
                else darkColorScheme()
            ) {
                val uiState by viewModel.uiState.collectAsState()

                Player(
                    modifier = Modifier
                        .fillMaxSize(),
                    player = viewModel.exoPlayer,
                    uiState = uiState
                )
            }
        }
    }
}

@Composable
fun Player(
    modifier: Modifier = Modifier,
    player: Player,
    uiState: UiState
) {
    Box(modifier = modifier) {
        AndroidView(
            modifier = Modifier
                .fillMaxSize(),
            factory = { context ->
                PlayerView(context).apply {
                    this.player = player
                    setBackgroundColor(Color.BLACK)
                }
            },
        )

        if (uiState is UiState.Loading) {
            CircularProgressIndicator(
                modifier
                    .wrapContentSize()
                    .align(Alignment.Center)
            )
        }
    }
}