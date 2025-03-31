import 'dart:async';

import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/common/util/network_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/user_mapper.dart';
import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/database/dao/user_dao.dart';
import 'package:aniflow/core/database/mappers/user_mapper.dart';
import 'package:aniflow/core/network/api/ani_auth_mution_graphql.dart';
import 'package:aniflow/core/network/auth_data_source.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';
import 'package:aniflow/core/platform/auth_event_channel.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

const String _clientId = '14409';

const String authUrl =
    'https://anilist.co/api/v2/oauth/authorize?client_id={client_id}&response_type=token';

class CancelException implements Exception {}

@LazySingleton(env: [AfEnvironment.mobile, AfEnvironment.desktop])
class AuthRepository {
  AuthRepository(
    this._authDataSource,
    this._userDataDao,
    this._preferences,
    this._authEventChannel,
  );

  final AuthEventChannel _authEventChannel;
  final UserDataPreferences _preferences;
  final AuthDataSource _authDataSource;
  final UserDao _userDataDao;

  CancelableOperation<bool?> loginProcessOperation() {
    CancelableOperation<AuthResult>? authResultOperation;

    Future<bool?> awaitTask() async {
      final authUri = Uri.parse(authUrl.replaceFirst('{client_id}', _clientId));
      final canLaunch = await canLaunchUrl(authUri);
      if (!canLaunch) {
        /// auth fail because invalid uri.
        return false;
      }
      await launchUrl(authUri);

      authResultOperation = _authEventChannel.awaitAuthResult();

      final authResult = await authResultOperation?.valueOrCancellation();
      if (authResult == null) {
        return null;
      }

      /// save token.
      await _preferences.setAuthToken(authResult.token);
      await _preferences.setAuthExpiredTime(
        DateTime.fromMillisecondsSinceEpoch(
          DateTime.now().millisecondsSinceEpoch + authResult.expiresInTime,
        ),
      );

      /// retrieve user data from ani list api;
      final userDto = await _authDataSource.getAuthedUserDataDto();
      final userEntity = userDto.toEntity();
      await _userDataDao.upsertUser(userEntity);
      await _preferences.setAuthedUserId(userEntity.id);
      await _preferences.setAniListSettings(
        AniListSettings.fromDto(userDto.options!, userDto.mediaListOptions!),
      );

      return true;
    }

    return CancelableOperation.fromFuture(
      awaitTask(),
      onCancel: () {
        authResultOperation?.cancel();
        logger.d('auth login operation canceled');
      },
    );
  }

  Future logout() async {
    await _preferences.setAuthExpiredTime(null);
    await _preferences.setAuthToken(null);
    await _preferences.setAuthedUserId(null);
  }

  Stream<UserModel?> getAuthedUserStream() {
    Stream<String?> userIdStream =
        _preferences.userDataStream.map((e) => e.authedUserId);
    return userIdStream.asyncMap((userId) async {
      if (userId == null) {
        return null;
      } else {
        final userEntity = await _userDataDao.getUser(userId);
        return userEntity?.toModel();
      }
    });
  }

  Future<UserModel?> getAuthedUser() async {
    final userId = _preferences.userData.authedUserId;
    if (userId == null) return null;
    final userEntity = await _userDataDao.getUser(userId);
    return userEntity?.toModel();
  }

  Future<LoadResult> updateUserSettings({
    UserTitleLanguage? userTitleLanguage,
    UserStaffNameLanguage? userStaffNameLanguage,
    bool? displayAdultContent,
    ScoreFormat? scoreFormat,
    CancelToken? token,
  }) {
    return NetworkUtil.postMutationAndRevertWhenException(
      initialModel: _preferences.userData.aniListSettings,
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
      onSaveLocal: (settings) => _preferences.setAniListSettings(settings),
      onSyncWithRemote: (settings) async {
        final user = await _authDataSource.updateUserSettings(
          param: UpdateUserMotionParam(
              titleLanguage: userTitleLanguage,
              displayAdultContent: displayAdultContent,
              userStaffNameLanguage: userStaffNameLanguage,
              scoreFormat: scoreFormat),
          token: token,
        );
        return AniListSettings.fromDto(user.options!, user.mediaListOptions!);
      },
    );
  }

  Future<LoadResult> syncUserCondition() async {
    final userId = _preferences.userData.authedUserId;
    if (userId == null) {
      return LoadError(const UnauthorizedException());
    }

    try {
      final userDto = await _authDataSource.getAuthedUserDataDto();
      final userEntity = userDto.toEntity();
      await _userDataDao.upsertUser(userEntity);
      await _preferences.setAniListSettings(
        AniListSettings.fromDto(userDto.options!, userDto.mediaListOptions!),
      );
      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      return LoadError(exception);
    }
  }
}
