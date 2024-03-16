import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/list_activity_dto.dart';
import 'package:aniflow/core/network/model/text_activity_dto.dart';

extension ActivityMapper on AniActivity {
   ActivityEntity toEntity() {
     final dto = this;
    switch (dto) {
      case ListActivityDto():
        return ActivityEntity(
          id: dto.id.toString(),
          userId: dto.userId.toString(),
          mediaId: dto.media!.id.toString(),
          textContent: null,
          status: dto.status,
          progress: dto.progress,
          type: dto.type?.toJson(),
          replyCount: dto.replyCount ?? 0,
          siteUrl: dto.siteUrl,
          isLocked: dto.isLocked,
          isLiked: dto.isLiked ?? false,
          likeCount: dto.likeCount ?? 0,
          isPinned: dto.isPinned,
          createdAt: dto.createdAt,
        );
      case TextActivityDto():
        return ActivityEntity(
          id: dto.id.toString(),
          userId: dto.userId.toString(),
          mediaId: null,
          textContent: dto.text,
          status: null,
          progress: null,
          type: dto.type?.toJson(),
          replyCount: dto.replyCount ?? 0,
          siteUrl: dto.siteUrl,
          isLocked: dto.isLocked,
          isLiked: dto.isLiked ?? false,
          likeCount: dto.likeCount ?? 0,
          isPinned: dto.isPinned,
          createdAt: dto.createdAt,
        );
      default:
        throw Exception('Invalid type');
    }
  }
}
