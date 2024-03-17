import 'package:aniflow/core/common/setting/setting.dart';
import 'package:json_annotation/json_annotation.dart';

part 'score_format.g.dart';

/// The language the user wants to see media titles in
@JsonEnum(alwaysCreate: true)
enum ScoreFormat implements Setting {
  /// An integer from 0-100
  @JsonValue('POINT_100')
  point100,

  /// A float from 0-10 with 1 decimal place
  @JsonValue('POINT_10_DECIMAL')
  point10Decimal,

  /// An integer from 0-10
  @JsonValue('POINT_10')
  point10,

  /// An integer from 0-5. Should be represented in Stars
  @JsonValue('POINT_5')
  point5,

  /// An integer from 0-3. Should be represented in Smileys.
  /// 0 => No Score, 1 => :(, 2 => :|, 3 => :)
  @JsonValue('POINT_3')
  point3;

  String toJson() => _$ScoreFormatEnumMap[this]!;

  factory ScoreFormat.fromJson(String json) => _$ScoreFormatEnumMap
      .map((key, value) => MapEntry(value, key))[json]!;
}
