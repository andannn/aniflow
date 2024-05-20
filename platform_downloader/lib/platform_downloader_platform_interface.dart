import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'platform_downloader_method_channel.dart';

abstract class PlatformDownloaderPlatform extends PlatformInterface {
  /// Constructs a PlatformDownloaderPlatform.
  PlatformDownloaderPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlatformDownloaderPlatform _instance = MethodChannelPlatformDownloader();

  /// The default instance of [PlatformDownloaderPlatform] to use.
  ///
  /// Defaults to [MethodChannelPlatformDownloader].
  static PlatformDownloaderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlatformDownloaderPlatform] when
  /// they register themselves.
  static set instance(PlatformDownloaderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> downloadImageToExternalStorage(
      String url, String subPath, String? fileName) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
