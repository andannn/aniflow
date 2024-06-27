
import 'package:platform_notification/notification_model.dart';

import 'platform_notification_platform_interface.dart';

class PlatformNotification {
  Future<String?> getPlatformVersion() {
    return PlatformNotificationPlatform.instance.getPlatformVersion();
  }

  Future<bool> areNotificationsEnabled() {
    return PlatformNotificationPlatform.instance.areNotificationsEnabled();
  }

  Future<bool> sendNotification(NotificationModel model) {
    return PlatformNotificationPlatform.instance.sendNotification(model);
  }
}
