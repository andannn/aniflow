import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_list_filter.g.dart';

@JsonEnum(alwaysCreate: true)
enum TrackListFilter {
  @JsonValue('ALL')
  all,
  @JsonValue('NEW_AIRED')
  newAired,
  @JsonValue('HAS_NEXT')
  hasNext;

  String toJson() => _$TrackListFilterEnumMap[this]!;

  static TrackListFilter? fromJson(String? json) =>
      _$TrackListFilterEnumMap.map((key, value) => MapEntry(value, key))[json];
}