import 'package:aniflow/core/network/model/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_reply_dto.freezed.dart';
part 'activity_reply_dto.g.dart';

@freezed
class ActivityReplyDto with _$ActivityReplyDto {
  const factory ActivityReplyDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'likeCount') int? likeCount,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'user') UserDto? user,
    @JsonKey(name: 'isLiked') bool? isLiked,
    @JsonKey(name: 'createdAt') int? createdAt,
  }) = _ActivityReplyDto;

  factory ActivityReplyDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityReplyDtoFromJson(json);
}