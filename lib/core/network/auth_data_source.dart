import 'package:anime_tracker/core/network/api/ani_auth_mution_graphql.dart';
import 'package:anime_tracker/core/network/client/ani_list_dio.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:dio/dio.dart';

import '../common/global_static_constants.dart';
import '../data/logger/logger.dart';
import 'model/user_data_dto.dart';

class UnauthorizedException implements Exception {
  const UnauthorizedException();
}

class AuthDataSource {
  static AuthDataSource? _instance;

  factory AuthDataSource() => _instance ??= AuthDataSource._();

  AuthDataSource._();

  String _testToken = '';

  void setTestToken(String token) {
    _testToken = token;
  }

  String? get _token =>
      isUnitTest ? _testToken : AnimeTrackerPreferences().getAuthToken();

  Future<bool> isTokenValid() async {
    if (_token == null) {
      return false;
    }

    try {
      await AniListDio().dio.post(
            AniListDio.aniListUrl,
            queryParameters: {'query': authCheckMotion},
            options: Options(
              headers: {
                'Authorization': 'Bearer $_token',
                'Content-Type': 'application/json',
                'Accept': 'application/json',
              },
            ),
          );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        logger.d('token is expired');
      }
      return false;
    }

    return true;
  }

  Future<UserDataDto> getUserDataDto() async {
    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          queryParameters: {'query': createUserInfoMotionGraphQLString()},
          options: Options(
            headers: {
              'Authorization': 'Bearer $_token',
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        );

    final resultJson = response.data['data']['UpdateUser'];
    return UserDataDto.fromJson(resultJson);
  }
}
