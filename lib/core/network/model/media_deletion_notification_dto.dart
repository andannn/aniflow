import 'package:aniflow/core/data/model/notification_type.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_deletion_notification_dto.freezed.dart';

part 'media_deletion_notification_dto.g.dart';

@freezed
class MediaDeletionNotificationDto extends AniNotification
    with _$MediaDeletionNotificationDto {
  factory MediaDeletionNotificationDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'type') NotificationType? type,
    @JsonKey(name: 'deletedMediaTitle') String? deletedMediaTitle,
    @JsonKey(name: 'reason') String? reason,
    @Default([]) @JsonKey(name: 'contexts') List<String> contexts,
    @JsonKey(name: 'createdAt') int? createdAt,
  }) = _MediaDeletionNotificationDto;

  factory MediaDeletionNotificationDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_MediaDeletionNotificationDtoFromJson(json);
}
