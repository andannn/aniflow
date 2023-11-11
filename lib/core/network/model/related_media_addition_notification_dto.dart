import 'package:aniflow/core/data/model/notification_type.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'related_media_addition_notification_dto.freezed.dart';

part 'related_media_addition_notification_dto.g.dart';

@freezed
class RelatedMediaAdditionNotificationDto extends AniNotification
    with _$RelatedMediaAdditionNotificationDto {
  factory RelatedMediaAdditionNotificationDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'type') NotificationType? type,
    @JsonKey(name: 'mediaId') int? mediaId,
    @JsonKey(name: 'context') String? context,
    @JsonKey(name: 'createdAt') int? createdAt,
    @JsonKey(name: 'media') MediaDto? media,
  }) = _RelatedMediaAdditionNotificationDto;

  factory RelatedMediaAdditionNotificationDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_RelatedMediaAdditionNotificationDtoFromJson(json);
}
