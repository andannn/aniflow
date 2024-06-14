import 'dart:convert';

import 'package:aniflow/core/common/util/change_notifier_util.dart';
import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:aniflow/core/firebase/remote_config/model/home_struct_remote_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

mixin FirebaseRemoteConfigKeys {
  static String homeStruct = 'home_struct_list';
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
}
