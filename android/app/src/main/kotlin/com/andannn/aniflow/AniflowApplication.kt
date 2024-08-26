package com.andannn.aniflow

import android.app.Application
import android.util.Log

private const val TAG = "AniflowApplication"
class AniflowApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        Log.d(TAG, "onCreate: ${this.hashCode()}")
    }
}