import 'dart:async';
import 'dart:convert';

import 'package:aniflow/app/di/env.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DIFirebaseRemoteConfigModule {
  @preResolve
  @Environment(AfEnvironment.impl)
  @lazySingleton
  Future<FirebaseRemoteConfig> get remoteConfig async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 12),
      ),
    );
    final defaultValue =
        await rootBundle.loadString('assets/json/remote_config_defaults.json');
    await remoteConfig.setDefaults(jsonDecode(defaultValue));
    await remoteConfig.activate();
    unawaited(remoteConfig.fetch());
    return remoteConfig;
  }
}
