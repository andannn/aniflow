import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_downloader_platform_interface.dart';

/// An implementation of [PlatformDownloaderPlatform] that uses method channels.
class MethodChannelPlatformDownloader extends PlatformDownloaderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('platform_downloader');

  @override
  Future<void> downloadImageToExternalStorage(
      String url, String subPath, String? fileName) async {
    await methodChannel.invokeMethod<String>(
      'downloadImageToExternalStorage',
      {
        'url': url,
        'subPath': subPath,
        'fileName': fileName,
      },
    );
  }
}
