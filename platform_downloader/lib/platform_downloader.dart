import 'platform_downloader_platform_interface.dart';

class PlatformDownloader {
  Future<void> downloadImageToExternalStorage(String url, String subFolder,
      [String? fileName]) {
    return PlatformDownloaderPlatform.instance
        .downloadImageToExternalStorage(url, subFolder, fileName);
  }
}
