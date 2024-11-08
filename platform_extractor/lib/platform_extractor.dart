
import 'platform_extractor_platform_interface.dart';

class PlatformExtractor {
  Future<String?> getPlatformVersion() {
    return PlatformExtractorPlatform.instance.getPlatformVersion();
  }
}
