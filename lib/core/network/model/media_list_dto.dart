
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/network/model/fuzzy_date_dto.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_list_dto.freezed.dart';
part 'media_list_dto.g.dart';

@freezed
class MediaListDto with _$MediaListDto {
  factory MediaListDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @Default(-1) @JsonKey(name: 'userId') int userId,
    @JsonKey(name: 'score') double? score,
    @JsonKey(name: 'status') MediaListStatus? status,
    @JsonKey(name: 'progress') int? progress,
    @JsonKey(name: 'progressVolumes') int? progressVolumes,
    @JsonKey(name: 'notes') String? notes,
    @Default(-1) @JsonKey(name: 'updatedAt') int updatedAt,
    @JsonKey(name: 'repeat') int? repeat,
    @Default(false) @JsonKey(name: 'private') bool private,
    @JsonKey(name: 'startedAt') FuzzyDateDto? startedAt,
    @JsonKey(name: 'completedAt') FuzzyDateDto? completedAt,
    @JsonKey(name: 'media') MediaDto? media,
  }) = _MediaListDto;

  factory MediaListDto.fromJson(Map<String, dynamic> json) =>
      _$$MediaListDtoImplFromJson(json);
}
