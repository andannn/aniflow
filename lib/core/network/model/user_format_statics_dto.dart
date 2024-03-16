import 'package:aniflow/core/common/model/media_list_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_format_statics_dto.freezed.dart';
part 'user_format_statics_dto.g.dart';

@freezed
class UserFormatStaticsDto with _$UserFormatStaticsDto {
  const factory UserFormatStaticsDto({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'meanScore') double? meanScore,
    @JsonKey(name: 'minutesWatched') int? minutesWatched,
    @JsonKey(name: 'chaptersRead') int? chaptersRead,
    @Default([]) @JsonKey(name: 'mediaIds') List<int> mediaIds,
    @JsonKey(name: 'status') MediaListStatus? status,
  }) = _UserFormatStaticsDto;

  factory UserFormatStaticsDto.fromJson(Map<String, dynamic> json) =>
      _$UserFormatStaticsDtoFromJson(json);
}
