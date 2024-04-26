import 'package:aniflow/core/common/definitions/activity_type.dart';
import 'package:aniflow/core/data/mappers/activity_reply_mapper.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/mappers/user_mapper.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/database/relations/activity_and_user_relation.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/list_activity_dto.dart';
import 'package:aniflow/core/network/model/text_activity_dto.dart';

extension ActivityMapper on ActivityAndUserRelation {
  ActivityModel toModel() {
    final type = ActivityType.fromJson(activity.type!);
    switch (type) {
      case ActivityType.text:
        return TextActivityModel(
          id: activity.id,
          text: activity.textContent ?? '',
          replyCount: activity.replyCount,
          siteUrl: activity.siteUrl!,
          isLocked: activity.isLocked ?? false,
          isLiked: activity.isLiked,
          likeCount: activity.likeCount,
          isPinned: activity.isPinned ?? false,
          createdAt: activity.createdAt!,
          user: user!.toModel(),
          replies: const [],
        );

      case ActivityType.animeList:
      case ActivityType.mangaList:
      case ActivityType.mediaList:
        return ListActivityModel(
          id: activity.id,
          replyCount: activity.replyCount,
          siteUrl: activity.siteUrl!,
          isLocked: activity.isLocked ?? false,
          isLiked: activity.isLiked,
          likeCount: activity.likeCount,
          isPinned: activity.isPinned ?? false,
          createdAt: activity.createdAt!,
          user: user?.toModel(),
          status: activity.status ?? '',
          progress: activity.progress ?? '',
          media: media?.toModel(),
          replies: const [],
        );
      case ActivityType.message:
        throw Exception('Invalid type');
    }
  }
}

extension ActivityMapper3 on AniActivity {
  ActivityModel toModel() {
    final dto = this;
    switch (dto) {
      case TextActivityDto():
        return TextActivityModel(
          id: dto.id?.toString() ?? '',
          text: dto.text ?? '',
          replyCount: dto.replyCount ?? 0,
          siteUrl: dto.siteUrl ?? '',
          isLocked: dto.isLocked ?? false,
          isLiked: dto.isLiked ?? false,
          likeCount: dto.likeCount ?? 0,
          isPinned: dto.isPinned ?? false,
          createdAt: dto.createdAt ?? 0,
          user: dto.user == null ? UserModel() : dto.user!.toModel(),
          replies: dto.replies.map((e) => e.toModel()).toList(),
        );
      case ListActivityDto():
        return ListActivityModel(
          id: dto.id?.toString() ?? '',
          replyCount: dto.replyCount ?? 0,
          siteUrl: dto.siteUrl ?? '',
          isLocked: dto.isLocked ?? false,
          isLiked: dto.isLiked ?? false,
          likeCount: dto.likeCount ?? 0,
          isPinned: dto.isPinned ?? false,
          createdAt: dto.createdAt ?? 0,
          user: dto.user == null ? UserModel() : dto.user!.toModel(),
          status: dto.status ?? '',
          progress: dto.progress ?? '',
          media: dto.media == null ? MediaModel() : dto.media!.toModel(),
          replies: dto.replies.map((e) => e.toModel()).toList(),
        );
      default:
        throw Exception('Invalid type');
    }
  }
}
