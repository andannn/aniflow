import 'package:json_annotation/json_annotation.dart';

part 'media_external_link_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MediaExternalLinkType {
  @JsonValue('INFO')
  info,
  @JsonValue('STREAMING')
  streaming,
  @JsonValue('SOCIAL')
  social;

  String toJson() => _$MediaExternalLinkTypeEnumMap[this]!;

  static MediaExternalLinkType? fromJson(String? json) =>
      _$MediaExternalLinkTypeEnumMap
          .map((key, value) => MapEntry(value, key))[json];
}
