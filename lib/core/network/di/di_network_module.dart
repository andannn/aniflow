import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/main.dart';
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
    ..interceptors.addAll([
      LogInterceptor(),
      getIt.get<AniListTokenHeaderInterceptor>(),
    ]);
}

@injectable
class AniListTokenHeaderInterceptor extends Interceptor {
  final UserDataRepository _preferences;

  AniListTokenHeaderInterceptor(this._preferences);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = <String, dynamic>{};
    final token = _preferences.userData.authToken;

    if (aniListUrl.contains(options.uri.host) &&
        token != null &&
        token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    final newOption =
        options.copyWith(headers: {...options.headers, ...headers});
    handler.next(newOption);
  }
}
