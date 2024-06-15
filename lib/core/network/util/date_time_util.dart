
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
