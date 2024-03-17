import 'package:aniflow/core/common/definitions/notification_type.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:aniflow/core/network/model/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_reply_notification_dto.freezed.dart';

part 'activity_reply_notification_dto.g.dart';

@freezed
class ActivityReplyNotificationDto extends AniNotification
    with _$ActivityReplyNotificationDto {
  factory ActivityReplyNotificationDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'type') NotificationType? type,
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'activityId') int? activityId,
    @JsonKey(name: 'context') String? context,
    @JsonKey(name: 'createdAt') int? createdAt,
    @JsonKey(name: 'user') UserDto? user,
    @JsonKey(includeFromJson: false, includeToJson: false)
    AniActivity? activity,
  }) = _ActivityReplyNotificationDto;

  factory ActivityReplyNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$$ActivityReplyNotificationDtoImplFromJson(json);

  static ActivityReplyNotificationDto fromJsonWithActivity(
      Map<String, dynamic> json) {
    return ActivityReplyNotificationDto.fromJson(json).copyWith(
      activity: AniActivity.mapToAniActivity(json['activity']),
    );
  }
}
