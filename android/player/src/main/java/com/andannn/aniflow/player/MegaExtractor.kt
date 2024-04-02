package com.andannn.aniflow.player

import android.util.Log
import java.util.Date

private const val TAG = "MegaExtractor"

data class Video(
    val url: String,
    val subtitles: List<Subtitle> = listOf(),
)

data class Subtitle(
    val label: String,
    val file: String,
)

interface MegaExtractor {
    suspend fun extract(link: String): Video?
}

class MegaExtractorImpl : MegaExtractor {
    private val name = "Megacloud"
    private val mainUrl = "https://megacloud.tv"
    private val embed = "embed-2/ajax/e-1"
    private val scriptUrl = "$mainUrl/js/player/a/prod/e1-player.min.js"

    private val service = MagaCloudService.build(mainUrl)

    override suspend fun extract(link: String): Video? {
        try {
            val response = service.getSources(
                url = "$mainUrl/$embed/getSources",
                id = link.substringAfterLast("/").substringBefore("?"),
                referer = mainUrl,
            )

            val sources = when (response) {
                is Sources -> response
                is Sources.Encrypted -> {
                    val (key, sources) = extractRealKey(response.sources)
                    response.sources = sources
                    response.decrypt(key)
                }
            }
            return sources.sources.firstOrNull()?.let { source ->
                Video(
                    url = source.file,
                    subtitles = sources.tracks
                        .filter { it.kind == "captions" }
                        .map {
                            Subtitle(
                                label = it.label,
                                file = it.file,
                            )
                        }
                )
            }
        } catch (e: Exception) {
            Log.e(TAG, "extract: failed: error")
            return null
        }
    }

    private suspend fun extractRealKey(source: String): Pair<String, String> {
        val rawKeys = getKeys()

        var secret = ""
        var encryptedSource = source
        var totalInc = 0
        for (i in 0 until rawKeys[0]) {
            val start = rawKeys[(i + 1) * 2]
            val inc = rawKeys[(i + 1) * 2 - 1]

            val from = start + totalInc
            val to = from + inc

            secret += source.slice(from until to)
            encryptedSource = encryptedSource.replace(
                source.substring(from, to),
                ""
            )
            totalInc += inc
        }

        return secret to encryptedSource
    }

    private suspend fun getKeys(): List<Int> {
        val script = service.getScript(scriptUrl, Date().time / 1000)

        val keys = Regex("const \\w{1,2}=new URLSearchParams.+?;(?=function)")
            .findAll(script).toList().lastOrNull()?.let { match ->
                match.value
                    .substring(0, match.value.length - 1)
                    .split("=")
                    .drop(1)
                    .mapNotNull { pair ->
                        pair.split(",").first().replace("0x", "").toIntOrNull(16)
                    }
            }
            ?: throw Exception("Can't retrieve encryption key")

        return keys
    }

}