import 'dart:convert';

import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:aniflow/core/common/util/change_notifier_util.dart';
import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:aniflow/core/firebase/remote_config/model/home_struct_remote_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

mixin FirebaseRemoteConfigKeys {
  static String homeStruct = 'home_struct_list';
  static String isHiAnimationFeatureEnabled = 'enable_hi_animation_feature';
  static String isSocialFeatureEnabled = 'enable_social_tab';
  static String isAdultContentsFeatureEnabled = 'show_sensitive_contents';
  static String latestAppVersion = 'latest_app_version';
  static String enableGithubLinkFeature = 'enable_github_link_feature';
}

@lazySingleton
class RemoteConfigManager {
  RemoteConfigManager(this.config) {
    config.onConfigUpdated.listen((event) async {
      await config.activate();
      _changeNotifier.notifyChanged();
    });
  }

  final FirebaseRemoteConfig config;

  final _changeNotifier = ValueNotifier(0);

  Stream<HomeStructRemoteModel> getHomeStructStream() =>
      StreamUtil.createStream(
        _changeNotifier,
        () => Future.value(_getHomeStruct()),
      ).distinct();

  HomeStructRemoteModel _getHomeStruct() {
    return HomeStructRemoteModel.fromJson(
      jsonDecode(config.getString(FirebaseRemoteConfigKeys.homeStruct)),
    );
  }

  Stream<bool> isHiAnimationFeatureEnabledStream() => StreamUtil.createStream(
        _changeNotifier,
        () => Future.value(_isHiAnimationFeatureEnabled()),
      ).distinct();

  bool _isHiAnimationFeatureEnabled() {
    return config.getBool(FirebaseRemoteConfigKeys.isHiAnimationFeatureEnabled);
  }

  Stream<bool> isSocialFeatureEnabledStream() => StreamUtil.createStream(
        _changeNotifier,
        () => Future.value(
          _isSocialFeatureEnabled(),
        ),
      ).distinct();

  bool _isSocialFeatureEnabled() {
    return config.getBool(FirebaseRemoteConfigKeys.isSocialFeatureEnabled);
  }

  bool isAdultContentsFeatureEnabled() {
    return config
        .getBool(FirebaseRemoteConfigKeys.isAdultContentsFeatureEnabled);
  }

  bool isGithubLinkFeatureEnabled() {
    return config
        .getBool(FirebaseRemoteConfigKeys.enableGithubLinkFeature);
  }

  Stream<AppVersion?> latestAppVersionStream() => StreamUtil.createStream(
        _changeNotifier,
        () => Future.value(_latestAppVersion()),
      ).distinct();

  AppVersion? _latestAppVersion() {
    return AppVersionUtil.mapToVersion(
      config.getString(FirebaseRemoteConfigKeys.latestAppVersion),
    );
  }

  Future<AppVersion?> refreshAndGetLatestAppVersion() async {
    await config.fetchAndActivate();
    return _latestAppVersion();
  }
}
