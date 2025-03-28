import 'package:freezed_annotation/freezed_annotation.dart';

part 'bangumi_subject_dto.freezed.dart';
part 'bangumi_subject_dto.g.dart';

@freezed
class BangumiSubjectDto with _$BangumiSubjectDto {
  const factory BangumiSubjectDto({
    @JsonKey(name: 'id') required int id,
  @JsonKey(name: 'name') required String name,
  @JsonKey(name: 'name_cn') required String nameCn,
}) = _BangumiSubjectDto;

  factory BangumiSubjectDto.fromJson(Map<String, dynamic> json) =>
      _$BangumiSubjectDtoFromJson(json);
}
