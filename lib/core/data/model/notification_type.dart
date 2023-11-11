import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum NotificationType {
  @JsonValue('AIRING')
  airing('AIRING'),
  @JsonValue('ACTIVITY_LIKE')
  activityLike('ACTIVITY_LIKE'),
  @JsonValue('ACTIVITY_REPLY')
  activityReply('ACTIVITY_REPLY'),
  @JsonValue('ACTIVITY_MENTION')
  activityMention('ACTIVITY_MENTION'),
  @JsonValue('ACTIVITY_REPLY_LIKE')
  activityReplyLike('ACTIVITY_REPLY_LIKE'),
  @JsonValue('ACTIVITY_MESSAGE')
  activityMessage('ACTIVITY_MESSAGE'),
  @JsonValue('FOLLOWING')
  following('FOLLOWING'),
  @JsonValue('MEDIA_DATA_CHANGE')
  mediaDataChange('MEDIA_DATA_CHANGE'),
  @JsonValue('RELATED_MEDIA_ADDITION')
  relatedMediaAddition('RELATED_MEDIA_ADDITION'),
  @JsonValue('MEDIA_DELETION')
  mediaDeletion('MEDIA_DELETION'),
  @JsonValue('MEDIA_MERGE')
  mediaMerge('MEDIA_MERGE');

  final String typeName;

  const NotificationType(this.typeName);

  static NotificationType resolveType(String name) {
    return NotificationType.values.firstWhere((e) => e.name == name);
  }
}
