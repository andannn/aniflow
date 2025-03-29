import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_title.g.dart';

part 'search_title.freezed.dart';

@freezed
class SearchTitle with _$SearchTitle {
  const factory SearchTitle({
    required String fullText,
    required Set<String> keyword,
    @LocaleConverter() required Locale locale,
  }) = _SearchTitle;

  factory SearchTitle.fromJson(Map<String, dynamic> json) =>
      _$SearchTitleFromJson(json);
}

class LocaleConverter implements JsonConverter<Locale, String> {
  const LocaleConverter();

  @override
  Locale fromJson(String json) {
    final parts = json.split('_');
    return Locale(parts[0], parts.length > 1 ? parts[1] : null);
  }

  @override
  String toJson(Locale locale) => locale.countryCode != null
      ? '${locale.languageCode}_${locale.countryCode}'
      : locale.languageCode;
}
