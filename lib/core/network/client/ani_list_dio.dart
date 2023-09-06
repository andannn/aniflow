import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class AniListDio {
  static AniListDio? _instance;

  factory AniListDio() => _instance ??= AniListDio._();

  static String aniListUrl = "https://graphql.anilist.co";

  AniListDio._() {
    dio.options = BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        });

    dio.interceptors.add(LogInterceptor());

    /// Test code.
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
      client.findProxy = (uri) {
        return "PROXY 127.0.0.1:7890";
      };
      return null;
    };
    /// Test code.
  }

  final Dio dio = Dio();
}
