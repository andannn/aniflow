import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:platform_notification/notification_channel_model.dart';

part 'notification_model.freezed.dart';

part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "body") String? body,
    @JsonKey(name: "notification_channel")
    NotificationChannelModel? notificationChannel,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
