import 'package:freezed_annotation/freezed_annotation.dart';

part 'flavor.g.dart';

@JsonEnum(alwaysCreate: true)
enum Flavor {
  limitedFeature('LimitedFeature'),
  fullFeature('FullFeature');

  const Flavor(this.value);

  final String value;

  factory Flavor.fromJson(String json) =>
      _$FlavorEnumMap.map((key, value) => MapEntry(value, key))[json]!;
}
