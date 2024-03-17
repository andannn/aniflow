import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum MediaStatus {
  /// Has completed and is no longer being released
  @JsonValue('FINISHED')
  finished('FINISHED'),

  /// Currently releasing
  @JsonValue('RELEASING')
  releasing('RELEASING'),

  /// To be released at a later date
  @JsonValue('NOT_YET_RELEASED')
  notYetReleased('NOT_YET_RELEASED'),

  /// Ended before the work could be finished
  @JsonValue('CANCELLED')
  cancelled('CANCELLED'),

  // ignore: lines_longer_than_80_chars
  /// Version 2 only. Is currently paused from releasing and will resume at a later date.
  @JsonValue('HIATUS')
  hiatus('HIATUS');

  final String sqlTypeString;

  const MediaStatus(this.sqlTypeString);

  String toJson() => _$MediaStatusEnumMap[this]!;

  static MediaStatus? fromJson(String? json) =>
      _$MediaStatusEnumMap.map((key, value) => MapEntry(value, key))[json];
}
