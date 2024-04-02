package com.andannn.aniflow.player

import android.os.Bundle
import androidx.activity.viewModels
import androidx.fragment.app.FragmentActivity
import androidx.media3.ui.PlayerView

class PlayerActivity: FragmentActivity() {

    private val viewModel by viewModels<PlayerViewModel>()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.activity_player_layout)

        val playerView = findViewById<PlayerView>(R.id.player)
        playerView.player = viewModel.player
    }

    companion object {
        const val VIDEO_URL_KEY = "video_url"
    }
}