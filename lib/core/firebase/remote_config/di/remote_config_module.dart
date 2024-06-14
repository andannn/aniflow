import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DIFirebaseRemoteConfigModule {
  @preResolve
  @lazySingleton
  Future<FirebaseRemoteConfig> get remoteConfig async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
    await remoteConfig.setDefaults(const {
      "home_struct_list": """{
          "anime": [
            "birthdayCharacters",
            "todaySchedule",
            "currentSeasonAnime",
            "nextSeasonAnime",
            "trendingAnime",
            "movieAnime"
          ],
          "manga": [
            "birthdayCharacters",
            "trendingManga",
            "allTimePopularManga",
            "topManhwa"
          ]
        }""",
    });
    await remoteConfig.activate();
    unawaited(remoteConfig.fetch());
    return remoteConfig;
  }
}
