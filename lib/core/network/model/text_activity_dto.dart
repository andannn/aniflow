import 'package:aniflow/core/common/model/activity_type.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_activity_dto.freezed.dart';

part 'text_activity_dto.g.dart';

@freezed
class TextActivityDto extends AniActivity with _$TextActivityDto {
  factory TextActivityDto({
  @JsonKey(name: 'id') int? id,
  @JsonKey(name: 'text') String? text,
  @JsonKey(name: 'userId') int? userId,
  @JsonKey(name: 'type') ActivityType? type,
  @JsonKey(name: 'replyCount') int? replyCount,
  @JsonKey(name: 'siteUrl') String? siteUrl,
  @JsonKey(name: 'isLocked') bool? isLocked,
  @JsonKey(name: 'isLiked') bool? isLiked,
  @JsonKey(name: 'likeCount') int? likeCount,
  @JsonKey(name: 'isPinned') bool? isPinned,
  @JsonKey(name: 'createdAt') int? createdAt,
  @JsonKey(name: 'user') UserDto? user,
  }) = _TextActivityDto;

  factory TextActivityDto.fromJson(Map<String, dynamic> json) =>
      _$$_TextActivityDtoFromJson(json);
}
