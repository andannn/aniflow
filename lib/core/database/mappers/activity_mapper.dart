import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
import 'package:aniflow/core/database/mappers/user_mapper.dart';
import 'package:aniflow/core/database/relations/activity_and_user_relation.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/list_activity_dto.dart';
import 'package:aniflow/core/network/model/text_activity_dto.dart';

extension ActivityMapper on AniActivity {
  ActivityAndUserRelation toEntity() {
    AniActivity dto = this;
    UserEntity? user;
    MediaEntity? media;

    switch (dto) {
      case ListActivityDto():
        user = dto.user?.toEntity();
        media = dto.media?.toEntity();
      case TextActivityDto():
        user = dto.user?.toEntity();
      default:
        throw Exception('Invalid type');
    }

    return ActivityAndUserRelation(
      user: user,
      activity: _toEntity(dto),
      media: media,
    );
  }
}

ActivityEntity _toEntity(AniActivity dto) {
  switch (dto) {
    case ListActivityDto():
      return ActivityEntity(
        id: dto.id.toString(),
        userId: dto.userId.toString(),
        mediaId: dto.media?.id.toString(),
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
