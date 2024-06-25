import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'platform_notification_method_channel.dart';

abstract class PlatformNotificationPlatform extends PlatformInterface {
  /// Constructs a PlatformNotificationPlatform.
  PlatformNotificationPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlatformNotificationPlatform _instance = MethodChannelPlatformNotification();

  /// The default instance of [PlatformNotificationPlatform] to use.
  ///
  /// Defaults to [MethodChannelPlatformNotification].
  static PlatformNotificationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlatformNotificationPlatform] when
  /// they register themselves.
  static set instance(PlatformNotificationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
