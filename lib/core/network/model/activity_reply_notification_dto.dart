import 'package:aniflow/core/data/model/notification_type.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:aniflow/core/network/model/user_data_dto.dart';
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
    @Default([]) @JsonKey(name: 'contexts') List<String> contexts,
    @JsonKey(name: 'createdAt') int? createdAt,
    @JsonKey(name: 'user') UserDataDto? user,
  }) = _ActivityReplyNotificationDto;

  factory ActivityReplyNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$$_ActivityReplyNotificationDtoFromJson(json);
}
