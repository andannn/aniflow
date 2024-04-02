package com.andannn.aniflow.player

import com.google.gson.GsonBuilder
import okhttp3.ResponseBody
import retrofit2.Converter
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Header
import retrofit2.http.Headers
import retrofit2.http.Query
import retrofit2.http.Url
import java.lang.reflect.Type

interface MagaCloudService {
    companion object {
        fun build(baseUrl: String): MagaCloudService {
            val retrofit = Retrofit.Builder()
                .baseUrl(baseUrl)
                .addConverterFactory(StringConverterFactory.create())
                .addConverterFactory(
                    GsonConverterFactory.create(
                        GsonBuilder()
                            .registerTypeAdapter(
                                SourcesResponse::class.java,
                                SourcesResponse.Deserializer(),
                            )
                            .create()
                    )
                )
                .build()

            return retrofit.create(MagaCloudService::class.java)
        }
    }

    @GET
    @Headers(
        "Accept: */*",
        "Accept-Language: en-US,en;q=0.5",
        "Connection: keep-alive",
        "TE: trailers",
        "X-Requested-With: XMLHttpRequest",
    )
    suspend fun getSources(
        @Url url: String,
        @Query("id") id: String,
        @Header("referer") referer: String,
    ): SourcesResponse

    @GET
    suspend fun getScript(@Url url: String, @Query("v") v: Long): String
}

class StringConverterFactory : Converter.Factory() {

    override fun responseBodyConverter(
        type: Type,
        annotations: Array<out Annotation>,
        retrofit: Retrofit
    ): Converter<ResponseBody, *>? = when (type) {
        String::class.java -> StringConverter()
        else -> null
    }

    companion object {
        fun create() = StringConverterFactory()
    }
}

class StringConverter : Converter<ResponseBody, String> {

    override fun convert(value: ResponseBody): String {
        return value.bytes().toString(Charsets.UTF_8)
    }
}
