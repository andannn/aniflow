import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_list_status.g.dart';

/// User anime list status.
@JsonEnum(alwaysCreate: true)
enum MediaListStatus {
  @JsonValue('CURRENT')
  current('CURRENT'),
  @JsonValue('COMPLETED')
  completed('COMPLETED'),
  @JsonValue('DROPPED')
  dropped('DROPPED'),
  @JsonValue('PAUSED')
  paused('PAUSED'),
  @JsonValue('PLANNING')
  planning('PLANNING');

  final String sqlTypeString;

  const MediaListStatus(this.sqlTypeString);

  String toJson() => _$MediaListStatusEnumMap[this]!;

  static MediaListStatus? fromJson(String? json) =>
      _$MediaListStatusEnumMap.map((key, value) => MapEntry(value, key))[json];
}
