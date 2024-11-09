import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_player_platform_interface.dart';

/// An implementation of [PlatformPlayerPlatform] that uses method channels.
class MethodChannelPlatformPlayer extends PlatformPlayerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('platform_player');

  @override
  Future<String?> navigateToPlayer(String source) async {
    final version = await methodChannel.invokeMethod<String>(
      'navigateToPlayer',
      {
        'source': source,
      },
    );
    return version;
  }
}
