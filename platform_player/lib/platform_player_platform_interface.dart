import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'platform_player_method_channel.dart';

abstract class PlatformPlayerPlatform extends PlatformInterface {
  /// Constructs a PlatformPlayerPlatform.
  PlatformPlayerPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlatformPlayerPlatform _instance = MethodChannelPlatformPlayer();

  /// The default instance of [PlatformPlayerPlatform] to use.
  ///
  /// Defaults to [MethodChannelPlatformPlayer].
  static PlatformPlayerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlatformPlayerPlatform] when
  /// they register themselves.
  static set instance(PlatformPlayerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> navigateToPlayer(String source) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
