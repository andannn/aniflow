import 'dart:ui';

import 'package:aniflow/core/network/web_source/subject_matcher.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_config.freezed.dart';

@freezed
class SearchConfig with _$SearchConfig {
  const factory SearchConfig({
    required String baseUrl,
    required String searchUrl,
    required SubjectMatcher matcher,
    String? iconUrl,
    @Default([]) List<Locale> validLocal,
  }) = _SearchConfig;
}

