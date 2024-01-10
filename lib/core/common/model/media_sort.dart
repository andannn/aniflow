import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_sort.g.dart';

@JsonEnum(alwaysCreate: true)
enum MediaSort {
  @JsonValue('TRENDING_DESC')
  trending,
  @JsonValue('UPDATED_AT_DESC')
  newest,
  @JsonValue('UPDATED_AT')
  oldest,
  @JsonValue('SCORE_DESC')
  averageScore,
  @JsonValue('FAVOURITES_DESC')
  favorite,
  @JsonValue('POPULARITY_DESC')
  popularity;

  const MediaSort();

  String toJson() => _$MediaSortEnumMap[this]!;

  factory MediaSort.fromJson(String json) =>
      _$MediaSortEnumMap.map((key, value) => MapEntry(value, key))[json]!;
}
