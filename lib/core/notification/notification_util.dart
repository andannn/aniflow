import 'package:permission_handler/permission_handler.dart';
import 'package:platform_notification/platform_notification.dart';

mixin NotificationUtil {
  Future<bool> canSendNotificationToChannel(String channelId) async {
    final permissionStatus = await Permission.notification.status;
    final isChannelEnabled =
        await PlatformNotification().isNotificationChannelEnabled(channelId);
    return isChannelEnabled && permissionStatus == PermissionStatus.granted;
  }
}
