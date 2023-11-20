import 'package:freezed_annotation/freezed_annotation.dart';

part 'likeable_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum LikeableType {
  @JsonValue('THREAD')
  thread,
  @JsonValue('THREAD_COMMENT')
  threadComment,
  @JsonValue('ACTIVITY')
  activity,
  @JsonValue('ACTIVITY_REPLY')
  activityReply;

  String toJson() => _$LikeableTypeEnumMap[this]!;
}
