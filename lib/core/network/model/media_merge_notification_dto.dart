import 'package:aniflow/core/data/model/notification_type.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_merge_notification_dto.freezed.dart';

part 'media_merge_notification_dto.g.dart';

@freezed
class MediaMergeNotificationDto extends AniNotification
    with _$MediaMergeNotificationDto {
  factory MediaMergeNotificationDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'type') NotificationType? type,
    @JsonKey(name: 'mediaId') String? mediaId,
    @JsonKey(name: 'deletedMediaTitle') List<String>? deletedMediaTitle,
    @JsonKey(name: 'reason') String? reason,
    @Default([]) @JsonKey(name: 'contexts') List<String> contexts,
    @JsonKey(name: 'media') MediaDto? media,
  }) = _MediaMergeNotificationDto;

  factory MediaMergeNotificationDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_MediaMergeNotificationDtoFromJson(json);
}
