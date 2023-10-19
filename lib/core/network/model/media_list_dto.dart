
import 'package:anime_tracker/core/data/media_list_repository.dart';
import 'package:anime_tracker/core/network/model/anime_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_list_dto.freezed.dart';
part 'media_list_dto.g.dart';

@freezed
class MediaListDto with _$MediaListDto {
  factory MediaListDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @Default(-1) @JsonKey(name: 'userId') int userId,
    @JsonKey(name: 'score') int? score,
    @JsonKey(name: 'status') MediaListStatus? status,
    @Default(-1) @JsonKey(name: 'progress') int progress,
    @Default(-1) @JsonKey(name: 'updatedAt') int updatedAt,
    @JsonKey(name: 'media') AnimeDto? media,
  }) = _MediaListDto;

  factory MediaListDto.fromJson(Map<String, dynamic> json) =>
      _$$_MediaListDtoFromJson(json);
}
