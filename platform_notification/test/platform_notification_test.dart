import 'package:flutter_test/flutter_test.dart';
import 'package:platform_notification/platform_notification_model.dart';
import 'package:platform_notification/platform_notification.dart';
import 'package:platform_notification/platform_notification_platform_interface.dart';
import 'package:platform_notification/platform_notification_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPlatformNotificationPlatform
    with MockPlatformInterfaceMixin
    implements PlatformNotificationPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> areNotificationsEnabled() {
    // TODO: implement areNotificationsEnabled
    throw UnimplementedError();
  }

  @override
  Future<bool> sendNotification(PlatformNotificationModel model) {
    // TODO: implement sendNotification
    throw UnimplementedError();
  }
}

void main() {
  final PlatformNotificationPlatform initialPlatform = PlatformNotificationPlatform.instance;

  test('$MethodChannelPlatformNotification is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPlatformNotification>());
  });

  test('getPlatformVersion', () async {
    PlatformNotification platformNotificationPlugin = PlatformNotification();
    MockPlatformNotificationPlatform fakePlatform = MockPlatformNotificationPlatform();
    PlatformNotificationPlatform.instance = fakePlatform;

    expect(await platformNotificationPlugin.getPlatformVersion(), '42');
  });
}
