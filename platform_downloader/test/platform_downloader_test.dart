import 'package:flutter_test/flutter_test.dart';
import 'package:platform_downloader/platform_downloader.dart';
import 'package:platform_downloader/platform_downloader_platform_interface.dart';
import 'package:platform_downloader/platform_downloader_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPlatformDownloaderPlatform
    with MockPlatformInterfaceMixin
    implements PlatformDownloaderPlatform {
  @override
  Future<void> downloadImageToExternalStorage(
      String url, String subPath, String? fileName) {
    return Future.value(null);
  }
}

void main() {
  final PlatformDownloaderPlatform initialPlatform =
      PlatformDownloaderPlatform.instance;

  test('$MethodChannelPlatformDownloader is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPlatformDownloader>());
  });

  test('downloadImageToExternalStorage', () async {
    PlatformDownloader platformDownloaderPlugin = PlatformDownloader();
    MockPlatformDownloaderPlatform fakePlatform =
        MockPlatformDownloaderPlatform();
    PlatformDownloaderPlatform.instance = fakePlatform;

    await platformDownloaderPlugin.downloadImageToExternalStorage("a", "b");
  });
}
