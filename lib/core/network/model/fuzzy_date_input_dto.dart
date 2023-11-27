import 'package:aniflow/core/network/model/notification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fuzzy_date_input_dto.freezed.dart';

part 'fuzzy_date_input_dto.g.dart';

@freezed
class FuzzyDateInputDto extends AniNotification with _$FuzzyDateInputDto {
  factory FuzzyDateInputDto({
    @JsonKey(name: 'year') int? year,
    @JsonKey(name: 'month') int? month,
    @JsonKey(name: 'day') int? day,
  }) = _FuzzyDateInputDto;

  factory FuzzyDateInputDto.fromJson(Map<String, dynamic> json) =>
      _$$FuzzyDateInputDtoImplFromJson(json);
}

extension DateTimeEx on DateTime? {
  FuzzyDateInputDto? toFuzzyDateInput() {
    final date = this;
    if (date == null) {
      return null;
    }

    return FuzzyDateInputDto(year: date.year, month: date.month, day: date.day);
  }
}
