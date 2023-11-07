import 'dart:async';

import 'package:aniflow/core/channel/auth_event_channel.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
import 'package:aniflow/core/database/dao/user_data_dao.dart';
import 'package:aniflow/core/database/model/user_entity.dart';
import 'package:aniflow/core/network/auth_data_source.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

const String _clientId = '14409';

const String authUrl =
    'https://anilist.co/api/v2/oauth/authorize?client_id={client_id}&response_type=token';

abstract class AuthRepository {
  Future<bool> awaitAuthLogin();

  FutureOr<bool> isTokenValid();

  Stream<UserModel?> getAuthedUserStream();

  Future logout();
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
              DateTime.now().millisecondsSinceEpoch + authResult.expiresInTime),
        );

        /// retrieve user data from ani list api;
        final userDto = await authDataSource.getUserDataDto();
        final userEntity = UserEntity.fromNetworkModel(userDto);
        await userDataDao.updateUserData(userEntity);
        await preferences.setAuthedUserId(userEntity.id);

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
}
