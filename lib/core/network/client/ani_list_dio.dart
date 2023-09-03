import 'package:dio/dio.dart';

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
  }

  final Dio dio = Dio();
}
