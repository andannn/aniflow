// ignore_for_file: avoid_dynamic_calls

import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/ani_auth_mution_graphql.dart';
import 'package:aniflow/core/network/api/ani_save_media_list_mution_graphql.dart';
import 'package:aniflow/core/network/api/notification_query_graphql.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:aniflow/core/network/model/user_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthDataSource {
  AuthDataSource(this.dio);

  final Dio dio;

  Future<UserDto> getAuthedUserDataDto() async {
    final response = await dio.post(
      aniListUrl,
      queryParameters: {'query': updateUserMotionGraphQLString},
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
      'resetNotificationCount': param.resetNotificationCount,
      'type_in': param.type.map((e) => e.typeName).toList(),
    };

    final response = await dio.post(
      aniListUrl,
      data: {
        'query': notificationQueryGraphql,
        'variables': variablesMap,
      },
      cancelToken: token,
    );
    List resultJson = response.data['data']['Page']['notifications'];
    return resultJson
        .map((e) => AniNotification.mapToAniNotification(e))
        .nonNulls
        .toList();
  }
}
