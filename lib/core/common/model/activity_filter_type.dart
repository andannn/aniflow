import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_filter_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum ActivityFilterType {
  /// no filter.
  @JsonValue('ALL')
  all,

  /// only test activity.
  @JsonValue('TEXT')
  text,

  /// only list activity
  @JsonValue('LIST')
  list;

  String toJson() => _$ActivityFilterTypeEnumMap[this]!;

  factory ActivityFilterType.fromJson(String json) =>
      _$ActivityFilterTypeEnumMap
          .map((key, value) => MapEntry(value, key))[json]!;
}
