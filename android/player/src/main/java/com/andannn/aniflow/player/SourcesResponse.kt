package com.andannn.aniflow.player

import android.util.Base64
import com.google.gson.Gson
import com.google.gson.JsonDeserializationContext
import com.google.gson.JsonDeserializer
import com.google.gson.JsonElement
import com.google.gson.JsonObject
import java.lang.reflect.Type
import java.nio.charset.StandardCharsets
import java.security.MessageDigest
import javax.crypto.Cipher
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec

sealed class SourcesResponse {
    class Deserializer : JsonDeserializer<SourcesResponse> {
        override fun deserialize(
            json: JsonElement?,
            typeOfT: Type?,
            context: JsonDeserializationContext?
        ): SourcesResponse {
            val jsonObject = json?.asJsonObject ?: JsonObject()

            return when (jsonObject.get("sources")?.isJsonArray ?: false) {
                true -> Gson().fromJson(json, Sources::class.java)
                false -> Gson().fromJson(json, Sources.Encrypted::class.java)
            }
        }
    }
}

data class Sources(
    val sources: List<Source> = listOf(),
    val sourcesBackup: List<Source> = listOf(),
    val tracks: List<Track> = listOf(),
    val server: Int? = null,
) : SourcesResponse() {

    data class Encrypted(
        var sources: String,
        val sourcesBackup: String? = null,
        val tracks: List<Track> = listOf(),
        val server: Int? = null,
    ) : SourcesResponse() {
        fun decrypt(key: String): Sources {
            fun decryptSourceUrl(decryptionKey: ByteArray, sourceUrl: String): String {
                val cipherData = Base64.decode(sourceUrl, Base64.DEFAULT)
                val encrypted = cipherData.copyOfRange(16, cipherData.size)
                val aesCBC = Cipher.getInstance("AES/CBC/PKCS5Padding")!!

                aesCBC.init(
                    Cipher.DECRYPT_MODE,
                    SecretKeySpec(
                        decryptionKey.copyOfRange(0, 32),
                        "AES"
                    ),
                    IvParameterSpec(decryptionKey.copyOfRange(32, decryptionKey.size))
                )
                val decryptedData = aesCBC.doFinal(encrypted)
                return String(decryptedData, StandardCharsets.UTF_8)
            }

            fun generateKey(salt: ByteArray, secret: ByteArray): ByteArray {
                fun md5(input: ByteArray) = MessageDigest.getInstance("MD5").digest(input)

                var output = md5(secret + salt)
                var currentKey = output
                while (currentKey.size < 48) {
                    output = md5(output + secret + salt)
                    currentKey += output
                }
                return currentKey
            }

            val decrypted = decryptSourceUrl(
                generateKey(
                    Base64.decode(sources, Base64.DEFAULT).copyOfRange(8, 16),
                    key.toByteArray(),
                ),
                sources,
            )

            return Sources(
                sources = Gson().fromJson(decrypted, Array<Source>::class.java).toList(),
                tracks = tracks
            )
        }
    }

    data class Source(
        val file: String = "",
        val type: String = "",
    )

    data class Track(
        val file: String = "",
        val label: String = "",
        val kind: String = "",
        val default: Boolean = false,
    )
}
