import 'package:anime_tracker/core/network/model/user_data_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:anime_tracker/core/network/model/anime_dto.dart';

part 'thread_dto.freezed.dart';

part 'thread_dto.g.dart';

@freezed
class ThreadDto with _$ThreadDto {
  factory ThreadDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'user') UserDataDto? user,
    @JsonKey(name: 'body') String? body,
    @JsonKey(name: 'replyCommentId') int? replyCommentId,
    @JsonKey(name: 'replyCount') int? replyCount,
    @JsonKey(name: 'viewCount') int? viewCount,
    @JsonKey(name: 'likeCount') int? likeCount,
    @JsonKey(name: 'isLiked') int? isLiked,
    @JsonKey(name: 'repliedAt') int? repliedAt,
    @JsonKey(name: 'createdAt') int? createdAt,
    @JsonKey(name: 'updatedAt') int? updatedAt,
    @JsonKey(name: 'siteUrl') String? siteUrl,
    @JsonKey(name: 'isLocked') bool? isLocked,
  }) = _ThreadDto;

  factory ThreadDto.fromJson(Map<String, dynamic> json) =>
      _$$_ThreadDtoFromJson(json);
}
