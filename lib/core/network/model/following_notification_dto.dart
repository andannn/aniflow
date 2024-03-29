import 'package:aniflow/core/common/definitions/notification_type.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:aniflow/core/network/model/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'following_notification_dto.freezed.dart';

part 'following_notification_dto.g.dart';

@freezed
class FollowingNotificationDto extends AniNotification
    with _$FollowingNotificationDto {
  factory FollowingNotificationDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'type') NotificationType? type,
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'context') String? context,
    @JsonKey(name: 'createdAt') int? createdAt,
    @JsonKey(name: 'user') UserDto? user,
  }) = _FollowingNotificationDto;

  factory FollowingNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$$FollowingNotificationDtoImplFromJson(json);
}
