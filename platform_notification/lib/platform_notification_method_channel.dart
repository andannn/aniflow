import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:platform_notification/notification_model.dart';

import 'platform_notification_platform_interface.dart';

/// An implementation of [PlatformNotificationPlatform] that uses method channels.
class MethodChannelPlatformNotification extends PlatformNotificationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('platform_notification');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
        'getPlatformVersion');
    return version;
  }

  @override
  Future<bool> areNotificationsEnabled() async {
    final result = await methodChannel.invokeMethod<bool>(
        'areNotificationsEnabled');
    return result ?? false;
  }

  @override
  Future<bool> sendNotification(NotificationModel model) async {
    final result = await methodChannel.invokeMethod<bool>(
        'sendNotification', {'param': jsonEncode(model.toJson())});
    return result ?? false;
  }
}
