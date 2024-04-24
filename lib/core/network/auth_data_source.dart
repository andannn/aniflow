// ignore_for_file: avoid_dynamic_calls

import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/ani_auth_mution_graphql.dart';
import 'package:aniflow/core/network/api/ani_save_media_list_mution_graphql.dart';
import 'package:aniflow/core/network/api/notification_query_graphql.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:aniflow/core/network/model/user_dto.dart';
import 'package:aniflow/core/network/util/auth_request_util.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthDataSource {
  AuthDataSource(this.dio, this.preferences);

  final Dio dio;
  final UserDataPreferences preferences;

  String get _token => isUnitTest
      ? testToken
      : preferences.userData.authToken ?? '';

  Future<bool> isTokenValid() async {
    try {
      await dio.post(
        aniListUrl,
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

  Future<UserDto> getAuthedUserDataDto() async {
    final response = await dio.post(
      aniListUrl,
      queryParameters: {'query': updateUserMotionGraphQLString},
      options: createQueryOptions(_token),
    );

    final resultJson = response.data['data']['UpdateUser'];
    return UserDto.fromJson(resultJson);
  }

  Future<UserDto> updateUserSettings({
    required UpdateUserMotionParam param,
    CancelToken? token,
  }) async {
    final queryGraphQL = updateUserMotionGraphQLString;
    final hasTitleLanguage = param.titleLanguage != null;
    final hasDisplayAdultContent = param.displayAdultContent != null;
    final hasUserStaffNameLanguage = param.userStaffNameLanguage != null;
    final hasScoreFormat = param.scoreFormat != null;
    final variablesMap = <String, dynamic>{};
    if (hasTitleLanguage) {
      variablesMap['titleLanguage'] = param.titleLanguage;
    }
    if (hasDisplayAdultContent) {
      variablesMap['displayAdultContent'] = param.displayAdultContent;
    }
    if (hasUserStaffNameLanguage) {
      variablesMap['userStaffNameLanguage'] = param.userStaffNameLanguage;
    }
    if (hasScoreFormat) {
      variablesMap['scoreFormat'] = param.scoreFormat;
    }

    final response = await dio.post(
      aniListUrl,
      data: {'query': queryGraphQL, 'variables': variablesMap},
      options: createQueryOptions(_token),
      cancelToken: token,
    );

    final resultJson = response.data['data']['UpdateUser'];
    return UserDto.fromJson(resultJson);
  }

  Future<MediaListDto> saveMediaToMediaList({
    required MediaListMutationParam param,
    CancelToken? token,
  }) async {
    final variablesMap = <String, dynamic>{
      'mediaId': param.mediaId,
      'private': param.private,
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
    if (param.score != null) {
      variablesMap['score'] = param.score;
    }
    if (param.progressVolumes != null) {
      variablesMap['progressVolumes'] = param.progressVolumes;
    }
    if (param.repeat != null) {
      variablesMap['repeat'] = param.repeat;
    }
    if (param.notes != null) {
      variablesMap['notes'] = param.notes;
    }
    if (param.startedAt != null) {
      variablesMap['startedAt'] = param.startedAt!.toJson();
    }
    if (param.completedAt != null) {
      variablesMap['completedAt'] = param.completedAt!.toJson();
    }

    final response = await dio.post(
      aniListUrl,
      data: {
        'query': saveMediaListMotionGraphQLString,
        'variables': variablesMap,
      },
      options: createQueryOptions(_token),
      cancelToken: token,
    );

    Map<String, dynamic> resultJson =
        response.data['data']['SaveMediaListEntry'];
    return MediaListDto.fromJson(resultJson);
  }

  Future<List<AniNotification>> getNotifications({
    required NotificationQueryParam param,
    CancelToken? token,
  }) async {
    final variablesMap = <String, dynamic>{
      'page': param.page,
      'perPage': param.perPage,
      'type_in': param.type.map((e) => e.typeName).toList(),
    };

    final response = await dio.post(
      aniListUrl,
      options: _createQueryOptions(),
      data: {
        'query': notificationQueryGraphql,
        'variables': variablesMap,
      },
      cancelToken: token,
    );
    List resultJson = response.data['data']['Page']['notifications'];
    return resultJson
        .map((e) => AniNotification.mapToAniNotification(e))
        .whereNotNull()
        .toList();
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
