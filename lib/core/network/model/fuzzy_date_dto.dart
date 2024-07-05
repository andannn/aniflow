import 'package:aniflow/core/network/model/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fuzzy_date_dto.freezed.dart';

part 'fuzzy_date_dto.g.dart';

@freezed
class FuzzyDateDto extends AniNotification with _$FuzzyDateDto {
  factory FuzzyDateDto({
    @JsonKey(name: 'year') int? year,
    @JsonKey(name: 'month') int? month,
    @JsonKey(name: 'day') int? day,
  }) = _FuzzyDateDto;

  factory FuzzyDateDto.fromJson(Map<String, dynamic> json) =>
      _$$FuzzyDateDtoImplFromJson(json);
}
