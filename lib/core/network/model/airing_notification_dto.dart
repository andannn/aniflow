import 'package:aniflow/core/data/model/notification_type.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'airing_notification_dto.freezed.dart';

part 'airing_notification_dto.g.dart';

@freezed
class AiringNotificationDto extends AniNotification
    with _$AiringNotificationDto {
  factory AiringNotificationDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'type') NotificationType? type,
    @JsonKey(name: 'animeId') int? animeId,
    @JsonKey(name: 'episode') int? episode,
    @Default([]) @JsonKey(name: 'contexts') List<String> contexts,
    @JsonKey(name: 'createdAt') int? createdAt,
    @JsonKey(name: 'media') MediaDto? media,
  }) = _AiringNotificationDto;

  factory AiringNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$$_AiringNotificationDtoFromJson(json);
}
