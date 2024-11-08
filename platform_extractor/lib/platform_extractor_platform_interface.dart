import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'platform_extractor_method_channel.dart';

abstract class PlatformExtractorPlatform extends PlatformInterface {
  /// Constructs a PlatformExtractorPlatform.
  PlatformExtractorPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlatformExtractorPlatform _instance = MethodChannelPlatformExtractor();

  /// The default instance of [PlatformExtractorPlatform] to use.
  ///
  /// Defaults to [MethodChannelPlatformExtractor].
  static PlatformExtractorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlatformExtractorPlatform] when
  /// they register themselves.
  static set instance(PlatformExtractorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
