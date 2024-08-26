
import 'package:aniflow/core/network/model/fuzzy_date_dto.dart';
import 'package:aniflow/core/network/model/fuzzy_date_input_dto.dart';

extension DateTimeEx on DateTime? {
  FuzzyDateInputDto? toFuzzyDateInput() {
    final date = this;
    if (date == null) {
      return null;
    }

    return FuzzyDateInputDto(year: date.year, month: date.month, day: date.day);
  }
}

extension DateTimeEx2 on DateTime {
  String toFuzzyDateInt() {
    String yearString = year.toString();
    String monthString = month.toString().length == 1
        ? '0${month.toString()}'
        : month.toString();
    String dayString = day.toString().length == 1
        ? '0${day.toString()}'
        : day.toString();

    return '$yearString$monthString$dayString';
  }
}

extension FuzzyDateDtoNullableEx on FuzzyDateDto? {
  DateTime? toDateTime() {
    final date = this;
    if (date == null) {
      return null;
    }

    if (date.year == null && date.month == null && date.day == null) {
      return null;
    }

    return DateTime.utc(
        date.year ?? -1, date.month ?? 1, date.day ?? 1);
  }
}
