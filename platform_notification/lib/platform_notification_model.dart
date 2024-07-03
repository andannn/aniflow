// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:platform_notification/platform_notification_channel_model.dart';

part 'platform_notification_model.freezed.dart';

part 'platform_notification_model.g.dart';

@freezed
class PlatformNotificationModel with _$PlatformNotificationModel {
  const factory PlatformNotificationModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "body") String? body,
    @JsonKey(name: "notification_channel")
    PlatformNotificationChannelModel? notificationChannel,
    @JsonKey(name: "pending_intent_uri") String? pendingIntentUri,
    @JsonKey(name: "pending_intent_class") String? pendingIntentClass,
  }) = _NotificationModel;

  factory PlatformNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$PlatformNotificationModelFromJson(json);
}
