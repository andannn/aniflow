// ignore_for_file: avoid_dynamic_calls

import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/network/api/ani_auth_mution_graphql.dart';
import 'package:aniflow/core/network/api/ani_save_media_list_mution_graphql.dart';
import 'package:aniflow/core/network/client/ani_list_dio.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';
import 'package:aniflow/core/network/model/user_data_dto.dart'
    show UserDataDto;
import 'package:aniflow/core/network/util/http_status_util.dart';
import 'package:aniflow/core/shared_preference/aniflow_prefrences.dart';
import 'package:dio/dio.dart';

class AuthDataSource {
  static AuthDataSource? _instance;

  factory AuthDataSource() => _instance ??= AuthDataSource._();

  AuthDataSource._();

  String _testToken = '';

  void setTestToken(String token) {
    _testToken = token;
  }

  String? get _token =>
      isUnitTest ? _testToken : AniFlowPreferences().getAuthToken();

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
      if (e.response?.statusCode == StatusCode.unauthorized) {
        logger.d('token is expired');
      }
      return false;
    }

    return true;
  }

  Future<UserDataDto> getUserDataDto() async {
    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          queryParameters: {'query': userInfoMotionGraphQLString},
          options: _createQueryOptions(),
        );

    final resultJson = response.data['data']['UpdateUser'];
    return UserDataDto.fromJson(resultJson);
  }

  Future<MediaListDto> saveMediaToMediaList(
      MediaListMutationParam param) async {
    final variablesMap = <String, dynamic>{
      'mediaId': param.mediaId,
    };
    if (param.entryId != null) {
      variablesMap['id'] = param.entryId;
    }
    if (param.progress != null) {
      variablesMap['progress'] = param.progress;
    }
    if (param.status != null) {
      variablesMap['status'] = param.status!.sqlTypeString;
    }
    if (param.status != null) {
      variablesMap['score'] = param.score;
    }

    try {
      final response = await AniListDio().dio.post(
            AniListDio.aniListUrl,
            data: {
              'query': saveMediaListMotionGraphQLString,
              'variables': variablesMap,
            },
            options: _createQueryOptions(),
          );

      Map<String, dynamic> resultJson =
          response.data['data']['SaveMediaListEntry'];
      return MediaListDto.fromJson(resultJson);
    } on DioException catch (e) {
      throw e.covertToNetWorkException();
    }
  }

  Options _createQueryOptions() {
    return Options(
      headers: {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }
}
