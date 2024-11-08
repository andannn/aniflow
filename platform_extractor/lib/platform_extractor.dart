
import 'platform_extractor_platform_interface.dart';

class PlatformExtractor {
  Future<String> extract(String link) {
    return PlatformExtractorPlatform.instance.extract(link);
  }
}
