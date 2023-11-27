
import 'package:aniflow/core/common/model/setting/score_format.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_list_option_dto.freezed.dart';
part 'media_list_option_dto.g.dart';

@freezed
class MediaListOptionDto with _$MediaListOptionDto {
  factory MediaListOptionDto({
    @JsonKey(name: 'scoreFormat') ScoreFormat? scoreFormat,
  }) = _MediaListOptionDto;

  factory MediaListOptionDto.fromJson(Map<String, dynamic> json) =>
      _$$MediaListOptionDtoImplFromJson(json);
}
