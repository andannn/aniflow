
import 'platform_notification_platform_interface.dart';

class PlatformNotification {
  Future<String?> getPlatformVersion() {
    return PlatformNotificationPlatform.instance.getPlatformVersion();
  }
}
