import 'package:flutter_test/flutter_test.dart';
import 'package:platform_extractor/platform_extractor.dart';
import 'package:platform_extractor/platform_extractor_platform_interface.dart';
import 'package:platform_extractor/platform_extractor_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPlatformExtractorPlatform
    with MockPlatformInterfaceMixin
    implements PlatformExtractorPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PlatformExtractorPlatform initialPlatform = PlatformExtractorPlatform.instance;

  test('$MethodChannelPlatformExtractor is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPlatformExtractor>());
  });

  test('getPlatformVersion', () async {
    PlatformExtractor platformExtractorPlugin = PlatformExtractor();
    MockPlatformExtractorPlatform fakePlatform = MockPlatformExtractorPlatform();
    PlatformExtractorPlatform.instance = fakePlatform;

    expect(await platformExtractorPlugin.getPlatformVersion(), '42');
  });
}
