import 'package:aniflow/core/database/dao/activity_dao.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_entity.freezed.dart';

part 'activity_entity.g.dart';

@freezed
class ActivityEntity with _$ActivityEntity {
  factory ActivityEntity({
    @Default('') @JsonKey(name: ActivityTableColumns.id) String id,
    @Default('') @JsonKey(name: ActivityTableColumns.userId) String userId,
    @JsonKey(name: ActivityTableColumns.text) String? text,
    @JsonKey(name: ActivityTableColumns.status) String? status,
    @JsonKey(name: ActivityTableColumns.progress) String? progress,
    @JsonKey(name: ActivityTableColumns.type) String? type,
    @JsonKey(name: ActivityTableColumns.replyCount) int? replyCount,
    @JsonKey(name: ActivityTableColumns.siteUrl) String? siteUrl,
    @JsonKey(name: ActivityTableColumns.isLocked) bool? isLocked,
    @JsonKey(name: ActivityTableColumns.isLiked) bool? isLiked,
    @JsonKey(name: ActivityTableColumns.likeCount) int? likeCount,
    @JsonKey(name: ActivityTableColumns.isPinned) bool? isPinned,
    @JsonKey(name: ActivityTableColumns.createdAt) int? createdAt,
  }) = _ActivityEntity;

  factory ActivityEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ActivityEntityFromJson(json);
}
