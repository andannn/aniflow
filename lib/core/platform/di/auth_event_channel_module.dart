import 'package:aniflow/core/platform/auth_event_channel.dart';
import 'package:injectable/injectable.dart';
import 'package:platform_extractor/platform_extractor.dart';

@module
abstract class PlatformEventChannelModule {
  @lazySingleton
  AuthEventChannel getAuthEventChannel() => AuthEventChannel();

  @lazySingleton
  PlatformExtractor getPlatformExtractor() => PlatformExtractor();
}
