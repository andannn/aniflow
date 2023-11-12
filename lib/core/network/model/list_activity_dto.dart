import 'package:aniflow/core/common/model/activity_type.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:aniflow/core/network/model/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_activity_dto.freezed.dart';

part 'list_activity_dto.g.dart';

@freezed
class ListActivityDto extends AniActivity with _$ListActivityDto {
  factory ListActivityDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'progress') String? progress,
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
    @JsonKey(name: 'media') MediaDto? media,
  }) = _ListActivityDto;

  factory ListActivityDto.fromJson(Map<String, dynamic> json) =>
      _$$_ListActivityDtoFromJson(json);
}
