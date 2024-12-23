import 'package:aniflow/app/di/env.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  @Environment(AfEnvironment.mobile)
  @Environment(AfEnvironment.desktop)
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}