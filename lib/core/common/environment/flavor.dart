import 'package:freezed_annotation/freezed_annotation.dart';

part 'flavor.g.dart';

@JsonEnum(alwaysCreate: true)
enum Flavor {
  @JsonValue('limited')
  limitedFeature,
  @JsonValue('full')
  fullFeature;

  factory Flavor.fromJson(String json) =>
      _$FlavorEnumMap.map((key, value) => MapEntry(value, key))[json]!;
}
