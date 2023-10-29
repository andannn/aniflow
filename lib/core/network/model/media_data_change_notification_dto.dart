import 'package:aniflow/core/data/model/notification_type.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_data_change_notification_dto.freezed.dart';

part 'media_data_change_notification_dto.g.dart';

@freezed
class MediaDataChangeNotificationDto extends AniNotification
    with _$MediaDataChangeNotificationDto {
  factory MediaDataChangeNotificationDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'type') NotificationType? type,
    @JsonKey(name: 'mediaId') int? mediaId,
    @Default([]) @JsonKey(name: 'contexts') List<String> contexts,
    @JsonKey(name: 'createdAt') int? createdAt,
    @JsonKey(name: 'reason') String? reason,
    @JsonKey(name: 'media') MediaDto? media,
  }) = _MediaDataChangeNotificationDto;

  factory MediaDataChangeNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$$_MediaDataChangeNotificationDtoFromJson(json);
}
