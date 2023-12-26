import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_statics_sort.g.dart';

@JsonEnum(alwaysCreate: true)
enum UserStaticsSort {
  @JsonValue('COUNT_DESC')
  count,
  @JsonValue('MEAN_SCORE_DESC')
  meanScore,
  @JsonValue('PROGRESS_DESC')
  timeWatched;

  String toJson() => _$UserStaticsSortEnumMap[this]!;

  static UserStaticsSort? fromJson(String? json) =>
      _$UserStaticsSortEnumMap.map((key, value) => MapEntry(value, key))[json];
}
