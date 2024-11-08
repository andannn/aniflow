import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_extractor_platform_interface.dart';

/// An implementation of [PlatformExtractorPlatform] that uses method channels.
class MethodChannelPlatformExtractor extends PlatformExtractorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('platform_extractor');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
