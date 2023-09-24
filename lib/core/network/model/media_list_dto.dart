
import 'package:anime_tracker/core/data/repository/user_anime_list_repository.dart';
import 'package:anime_tracker/core/network/model/detail_anime_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_list_dto.freezed.dart';
part 'media_list_dto.g.dart';

@freezed
class MediaListDto with _$MediaListDto {
  factory MediaListDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @Default(-1) @JsonKey(name: 'userId') int userId,
    @JsonKey(name: 'score') int? score,
    @JsonKey(name: 'status') AnimeListStatus? status,
    @Default(-1) @JsonKey(name: 'progress') int progress,
    @Default(-1) @JsonKey(name: 'updatedAt') int updatedAt,
    @JsonKey(name: 'media') DetailAnimeDto? media,
  }) = _MediaListDto;

  factory MediaListDto.fromJson(Map<String, dynamic> json) =>
      _$$_MediaListDtoFromJson(json);
}
