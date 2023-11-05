import 'package:aniflow/core/database/dao/activity_dao.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/list_activity_dto.dart';
import 'package:aniflow/core/network/model/text_activity_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_entity.freezed.dart';

part 'activity_entity.g.dart';

@freezed
class ActivityEntity with _$ActivityEntity {
  factory ActivityEntity({
    @Default('') @JsonKey(name: ActivityTableColumns.id) String id,
    @Default('') @JsonKey(name: ActivityTableColumns.userId) String userId,
    @JsonKey(name: ActivityTableColumns.mediaId) String? mediaId,
    @JsonKey(name: ActivityTableColumns.text) String? text,
    @JsonKey(name: ActivityTableColumns.status) String? status,
    @JsonKey(name: ActivityTableColumns.progress) String? progress,
    @JsonKey(name: ActivityTableColumns.type) String? type,
    @JsonKey(name: ActivityTableColumns.replyCount) int? replyCount,
    @JsonKey(name: ActivityTableColumns.siteUrl) String? siteUrl,
    @JsonKey(name: ActivityTableColumns.isLocked) int? isLocked,
    @JsonKey(name: ActivityTableColumns.isLiked) int? isLiked,
    @JsonKey(name: ActivityTableColumns.likeCount) int? likeCount,
    @JsonKey(name: ActivityTableColumns.isPinned) int? isPinned,
    @JsonKey(name: ActivityTableColumns.createdAt) int? createdAt,
  }) = _ActivityEntity;

  factory ActivityEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ActivityEntityFromJson(json);

  static ActivityEntity fromDto(AniActivity dto) {
    switch (dto) {
      case ListActivityDto():
        return ActivityEntity(
          id: dto.id.toString(),
          userId: dto.userId.toString(),
          mediaId: dto.media!.id.toString(),
          text: null,
          status: dto.status,
          progress: dto.progress,
          type: dto.type?.toJson(),
          replyCount: dto.replyCount,
          siteUrl: dto.siteUrl,
          isLocked: dto.isLocked.toInteger(),
          isLiked: dto.isLiked.toInteger(),
          likeCount: dto.likeCount,
          isPinned: dto.isPinned.toInteger(),
          createdAt: dto.createdAt,
        );
      case TextActivityDto():
        return ActivityEntity(
          id: dto.id.toString(),
          userId: dto.userId.toString(),
          mediaId: null,
          text: dto.text,
          status: null,
          progress: null,
          type: dto.type?.toJson(),
          replyCount: dto.replyCount,
          siteUrl: dto.siteUrl,
          isLocked: dto.isLocked.toInteger(),
          isLiked: dto.isLiked.toInteger(),
          likeCount: dto.likeCount,
          isPinned: dto.isPinned.toInteger(),
          createdAt: dto.createdAt,
        );
      default:
        throw Exception('Invalid type');
    }
  }
}
