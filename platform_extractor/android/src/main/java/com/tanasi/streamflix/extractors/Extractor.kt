package com.tanasi.streamflix.extractors

import com.tanasi.streamflix.models.Video

abstract class Extractor {

    abstract val name: String
    abstract val mainUrl: String

    abstract suspend fun extract(link: String): Video


    companion object {
        private val extractors = listOf(
            RabbitstreamExtractor(),
            RabbitstreamExtractor.MegacloudExtractor(),
            RabbitstreamExtractor.DokicloudExtractor(),
            RabbitstreamExtractor.PremiumEmbedingExtractor(),
            StreamhubExtractor(),
            VoeExtractor(),
            StreamtapeExtractor(),
            VidozaExtractor(),
            VidsrcToExtractor(),
            VidplayExtractor(),
            FilemoonExtractor(),
            VidplayExtractor.MyCloud(),
            VidplayExtractor.VidplayOnline(),
            MyFileStorageExtractor(),
            MoflixExtractor(),
            VidsrcNetExtractor(),
            StreamWishExtractor(),
            StreamWishExtractor.UqloadsXyz(),
            TwoEmbedExtractor(),
            ChillxExtractor(),
            ChillxExtractor.JeanExtractor(),
            MoviesapiExtractor(),
        )

        suspend fun extract(link: String): Video {
            val urlRegex = Regex("^(https?://)?(www\\.)?")
            val compareUrl = link.lowercase().replace(urlRegex, "")

            for (extractor in extractors) {
                if (compareUrl.startsWith(extractor.mainUrl.replace(urlRegex, ""))) {
                    return extractor.extract(link)
                }
            }
            for (extractor in extractors) {
                if (compareUrl.startsWith(
                        extractor.mainUrl.replace(
                            Regex("^(https?://)?(www\\.)?(.*?)(\\.[a-z]+)"),
                            "$3"
                        )
                    )
                ) {
                    return extractor.extract(link)
                }
            }

            throw Exception("No extractors found")
        }
    }
}