import 'dart:async';

import 'package:aniflow/core/channel/auth_event_channel.dart';
import 'package:aniflow/core/common/model/ani_list_settings.dart';
import 'package:aniflow/core/common/model/setting/score_format.dart';
import 'package:aniflow/core/common/model/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/model/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/network_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
import 'package:aniflow/core/database/dao/user_data_dao.dart';
import 'package:aniflow/core/database/model/user_entity.dart';
import 'package:aniflow/core/network/api/ani_auth_mution_graphql.dart';
import 'package:aniflow/core/network/auth_data_source.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

const String _clientId = '14409';

const String authUrl =
    'https://anilist.co/api/v2/oauth/authorize?client_id={client_id}&response_type=token';

abstract class AuthRepository {
  Future<bool> awaitAuthLogin();

  FutureOr<bool> isTokenValid();

  Stream<UserModel?> getAuthedUserStream();

  Future<LoadResult> updateUserSettings({
    UserTitleLanguage? userTitleLanguage,
    UserStaffNameLanguage? userStaffNameLanguage,
    bool? displayAdultContent,
    ScoreFormat? scoreFormat,
    CancelToken? token,
  });

  Future logout();

  Stream<AniListSettings> getAniListSettingsStream();

  Future<LoadResult> syncUserCondition();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthEventChannel authEventChannel = AuthEventChannel();

  final AniFlowPreferences preferences = AniFlowPreferences();

  final AuthDataSource authDataSource = AuthDataSource();

  final UserDataDao userDataDao = AniflowDatabase().getUserDataDao();

  final MediaListDao animeTrackListDao = AniflowDatabase().getMediaListDao();

  @override
  Future<bool> awaitAuthLogin() async {
    final authUri = Uri.parse(authUrl.replaceFirst('{client_id}', _clientId));
    final canLaunch = await canLaunchUrl(authUri);
    if (!canLaunch) {
      /// auth fail because invalid uri.
      return false;
    } else {
      /// jump to web view and try to get access token.
      await launchUrl(authUri);
      try {
        final authResult = await authEventChannel
            .awaitAuthResult()
            .timeout(const Duration(minutes: 10));

        /// save token.
        await preferences.setAuthToken(authResult.token);
        await preferences.setAuthExpiredTime(
          DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch + authResult.expiresInTime,
          ),
        );

        /// retrieve user data from ani list api;
        final userDto = await authDataSource.getAuthedUserDataDto();
        final userEntity = UserEntity.fromDto(userDto);
        await userDataDao.updateUserData(userEntity);
        await preferences.setAuthedUserId(userEntity.id);
        await preferences.setAniListSettings(
          AniListSettings.fromDto(userDto.options!, userDto.mediaListOptions!),
        );

        /// login success.
        return true;
      } catch (e) {
        return false;
      }
    }
  }

  @override
  FutureOr<bool> isTokenValid() => authDataSource.isTokenValid();

  @override
  Future logout() async {
    final userId = preferences.getAuthedUserId();
    if (userId != null) {
      await animeTrackListDao.removeMediaListByUserId(userId);
      animeTrackListDao.notifyMediaListChanged(userId);
    }
    await preferences.setAuthExpiredTime(null);
    await preferences.setAuthToken(null);
    await preferences.clearAuthedUserId();
  }

  @override
  Stream<UserModel?> getAuthedUserStream() {
    Stream<String?> userIdStream = preferences.getAuthedUserStream();
    return userIdStream.asyncMap((userId) async {
      if (userId == null) {
        return null;
      } else {
        final userEntity = await userDataDao.getUserData(userId);
        return UserModel.fromEntity(userEntity);
      }
    });
  }

  @override
  Stream<AniListSettings> getAniListSettingsStream() {
    return preferences.getAniListSettingsStream();
  }

  @override
  Future<LoadResult> updateUserSettings({
    UserTitleLanguage? userTitleLanguage,
    UserStaffNameLanguage? userStaffNameLanguage,
    bool? displayAdultContent,
    ScoreFormat? scoreFormat,
    CancelToken? token,
  }) {
    return NetworkUtil.postMutationAndRevertWhenException(
      initialModel: preferences.getAniListSettings(),
      onModifyModel: (settings) {
        var newSettings = settings.copyWith();
        if (userTitleLanguage != null) {
          newSettings =
              newSettings.copyWith(userTitleLanguage: userTitleLanguage);
        }
        if (displayAdultContent != null) {
          newSettings =
              newSettings.copyWith(displayAdultContent: displayAdultContent);
        }
        if (userStaffNameLanguage != null) {
          newSettings = newSettings.copyWith(
              userStaffNameLanguage: userStaffNameLanguage);
        }
        if (scoreFormat != null) {
          newSettings = newSettings.copyWith(scoreFormat: scoreFormat);
        }
        return newSettings;
      },
      onSaveLocal: (settings) => preferences.setAniListSettings(settings),
      onSyncWithRemote: (settings) async {
        final user = await authDataSource.updateUserSettings(
          param: UpdateUserMotionParam(
            titleLanguage: userTitleLanguage,
            displayAdultContent: displayAdultContent,
            userStaffNameLanguage: userStaffNameLanguage,
            scoreFormat: scoreFormat
          ),
          token: token,
        );
        return AniListSettings.fromDto(user.options!, user.mediaListOptions!);
      },
    );
  }

  @override
  Future<LoadResult> syncUserCondition() async {
    final userId = preferences.getAuthedUserId();
    if (userId == null) {
      return LoadError(Exception('No user'));
    }

    try {
      final userDto = await authDataSource.getAuthedUserDataDto();
      final userEntity = UserEntity.fromDto(userDto);
      await userDataDao.updateUserData(userEntity);
      await preferences.setAniListSettings(
        AniListSettings.fromDto(userDto.options!, userDto.mediaListOptions!),
      );
      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      return LoadError(exception);
    }
  }
}
