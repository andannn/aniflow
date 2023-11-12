import 'package:aniflow/core/data/model/notification_type.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:aniflow/core/network/model/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_like_notification_dto.freezed.dart';

part 'activity_like_notification_dto.g.dart';

@freezed
class ActivityLikeNotificationDto extends AniNotification
    with _$ActivityLikeNotificationDto {
  factory ActivityLikeNotificationDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'type') NotificationType? type,
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'context') String? context,
    @JsonKey(name: 'createdAt') int? createdAt,
    @JsonKey(name: 'user') UserDto? user,
    @JsonKey(includeFromJson: false, includeToJson: false)
    AniActivity? activity,
  }) = _ActivityLikeNotificationDto;

  factory ActivityLikeNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$$_ActivityLikeNotificationDtoFromJson(json);

  static ActivityLikeNotificationDto fromJsonWithActivity(
      Map<String, dynamic> json) {
    return ActivityLikeNotificationDto.fromJson(json).copyWith(
      activity: AniActivity.mapToAniActivity(json['activity']),
    );
  }
}
