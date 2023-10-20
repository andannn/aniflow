
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum MediaStatus {
  @JsonValue('RELEASING')
  releasing('RELEASING'),
  @JsonValue('FINISHED')
  finished('FINISHED'),
  @JsonValue('NOT_YET_RELEASED')
  notYetReleased('NOT_YET_RELEASED');

  final String sqlTypeString;

  const MediaStatus(this.sqlTypeString);
}

