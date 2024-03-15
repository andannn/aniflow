import 'package:aniflow/core/common/model/activity_type.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/mappers/user_mapper.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/database_drift/relations/activity_and_user_relation.dart';

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
          user: user.toModel(),
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
          user: user.toModel(),
          status: activity.status ?? '',
          progress: activity.progress ?? '',
          media: media!.toModel(),
          replies: const [],
        );
      case ActivityType.message:
        throw Exception('Invalid type');
    }
  }
}
