import 'package:aniflow/app/di/env.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  @Environment(AfEnvironment.impl)
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}