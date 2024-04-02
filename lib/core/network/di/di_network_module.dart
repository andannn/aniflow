import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DINetworkModule {
  @lazySingleton
  Dio get dio => Dio()
    ..options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    )
    ..interceptors.add(LogInterceptor());
}
