// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'platform_notification_channel_model.freezed.dart';

part 'platform_notification_channel_model.g.dart';

@freezed
class PlatformNotificationChannelModel with _$PlatformNotificationChannelModel {
  const factory PlatformNotificationChannelModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "importance") int? importance,
  }) = _NotificationChannelModel;

  factory PlatformNotificationChannelModel.fromJson(
          Map<String, dynamic> json) =>
      _$PlatformNotificationChannelModelFromJson(json);
}
