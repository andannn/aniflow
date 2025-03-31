import 'package:aniflow/core/platform/auth_event_channel.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PlatformEventChannelModule {
  @lazySingleton
  AuthEventChannel getAuthEventChannel() => AuthEventChannel();
}
