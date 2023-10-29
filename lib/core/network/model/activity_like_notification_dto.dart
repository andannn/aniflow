import 'package:aniflow/core/data/model/notification_type.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:aniflow/core/network/model/user_data_dto.dart';
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
    @Default([]) @JsonKey(name: 'contexts') List<String> contexts,
    @JsonKey(name: 'createdAt') int? createdAt,
    @JsonKey(name: 'user') UserDataDto? user,
  }) = _ActivityLikeNotificationDto;

  factory ActivityLikeNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$$_ActivityLikeNotificationDtoFromJson(json);
}
