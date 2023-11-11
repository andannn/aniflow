import 'package:aniflow/core/data/model/notification_type.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:aniflow/core/network/model/user_data_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_reply_subscription_notification_dto.freezed.dart';
part 'activity_reply_subscription_notification_dto.g.dart';

@freezed
class ActivityReplySubscribedNotificationDto extends AniNotification
    with _$ActivityReplySubscribedNotificationDto {
  factory ActivityReplySubscribedNotificationDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'type') NotificationType? type,
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'activityId') int? activityId,
    @JsonKey(name: 'context') String? context,
    @JsonKey(name: 'createdAt') int? createdAt,
    @JsonKey(name: 'user') UserDataDto? user,
    @JsonKey(includeFromJson: false, includeToJson: false)
    AniActivity? activity,
  }) = _ActivityReplySubscribedNotificationDto;

  factory ActivityReplySubscribedNotificationDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_ActivityReplySubscribedNotificationDtoFromJson(json);

  static ActivityReplySubscribedNotificationDto fromJsonWithActivity(
      Map<String, dynamic> json) {
    return ActivityReplySubscribedNotificationDto.fromJson(json).copyWith(
      activity: AniActivity.mapToAniActivity(json['activity']),
    );
  }
}
