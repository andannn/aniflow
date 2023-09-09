import 'dart:async';

import 'package:anime_tracker/core/channel/auth_event_channel.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/user_data_entity.dart';
import 'package:anime_tracker/core/database/user_data_dao.dart';
import 'package:anime_tracker/core/network/auth_data_source.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/user_data_model.dart';

const String _clientId = '14409';

const String authUrl =
    'https://anilist.co/api/v2/oauth/authorize?client_id={client_id}&response_type=token';

abstract class AuthRepository {
  Future<bool> awaitAuthLogin();

  FutureOr<bool> isTokenValid();

  Stream<UserData?> getUserDataStream();

  Future logout();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthEventChannel authEventChannel = AuthEventChannel();

  final AnimeTrackerPreferences preferences = AnimeTrackerPreferences();

  final AuthDataSource authDataSource = AuthDataSource();

  final UserDataDao userDataDao = AnimeDatabase().getUserDataDao();

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
        final userEntity = UserDataEntity.fromNetworkModel(userDto);
        await userDataDao.updateUserData(userEntity);

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
  Future logout() => userDataDao.removeUserData();

  @override
  Stream<UserData?> getUserDataStream() =>
      userDataDao.getUserDataStream().map((e) => UserData.fromDatabaseModel(e));
}
