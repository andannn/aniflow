import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_extractor_platform_interface.dart';

/// An implementation of [PlatformExtractorPlatform] that uses method channels.
class MethodChannelPlatformExtractor extends PlatformExtractorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('platform_extractor');

  @override
  Future<String> extract(String link) async {
    final source = await methodChannel.invokeMethod<String>('extract', {'link': link });
    if (source == null) {
      throw PlatformException(
        code: 'UNAVAILABLE',
        details: 'PlatformExtractor is not available',
      );
    }
    return source;
  }
}
