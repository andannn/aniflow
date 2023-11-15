import 'package:aniflow/core/data/model/notification_type.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:aniflow/core/network/model/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_message_notification_dto.freezed.dart';
part 'activity_message_notification_dto.g.dart';

@freezed
class ActivityMessageNotificationDto extends AniNotification
    with _$ActivityMessageNotificationDto {
  factory ActivityMessageNotificationDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'type') NotificationType? type,
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'activityId') int? activityId,
    @JsonKey(name: 'context') String? context,
    @JsonKey(name: 'createdAt') int? createdAt,
    @JsonKey(name: 'user') UserDto? user,
    @JsonKey(includeFromJson: false, includeToJson: false)
    AniActivity? activity,
  }) = _ActivityMessageNotificationDto;

  factory ActivityMessageNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$$_ActivityMessageNotificationDtoFromJson(json);

  static ActivityMessageNotificationDto fromJsonWithActivity(
      Map<String, dynamic> json) {
    return ActivityMessageNotificationDto.fromJson(json).copyWith(
      activity: AniActivity.mapToAniActivity(json['activity']),
    );
  }
}
