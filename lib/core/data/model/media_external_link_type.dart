
import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum MediaExternalLinkType {
  @JsonValue('INFO')
  info,
  @JsonValue('STREAMING')
  streaming,
  @JsonValue('SOCIAL')
  social;
}
