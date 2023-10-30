import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum MediaRelation {
  /// An adaption of this media into a different format.
  @JsonValue('ADAPTATION')
  adaption,

  /// Released before.
  @JsonValue('PREQUEL')
  preQuel,

  /// Released after the relation.
  @JsonValue('SEQUEL')
  sequel,

  /// The media a side story is from.
  @JsonValue('PARENT')
  parent,

  /// A side story of the parent media.
  @JsonValue('SIDE_STORY')
  sideStory,

  /// Shares at least 1 character.
  @JsonValue('CHARACTER')
  character,

  /// A shortened and summarized version.
  @JsonValue('SUMMARY')
  summary,

  ///An alternative version of the same media.
  @JsonValue('ALTERNATIVE')
  alternative,

  /// An alternative version of the media with a different primary focus.
  @JsonValue('SPIN_OFF')
  spinOff,

  /// Other.
  @JsonValue('OTHER')
  other,

  /// Version 2 only. The source material the media was adapted from.
  @JsonValue('SOURCE')
  source,

  /// Version 2 only.
  @JsonValue('COMPILATION')
  compilation,

  /// Version 2 only.
  @JsonValue('CONTAINS')
  contains;

  const MediaRelation();
}
