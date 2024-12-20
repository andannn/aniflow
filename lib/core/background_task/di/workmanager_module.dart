import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/callback_dispatcher.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:workmanager/workmanager.dart';

@module
abstract class DIWorkmanagerModule {
  @lazySingleton
  @preResolve
  @Environment(AfEnvironment.mobile)
  Future<Workmanager> get workManager async {
    final workManager = Workmanager();
    await Workmanager()
        .initialize(callbackDispatcher, isInDebugMode: kDebugMode);
    return workManager;
  }
}
