import 'package:aniflow/core/common/model/activity_type.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/database/model/relations/activity_and_user_relation.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
import 'package:equatable/equatable.dart';

sealed class ActivityModel extends Equatable {
  final String id;
  final int replyCount;
  final String siteUrl;
  final bool isLocked;
  final bool isLiked;
  final int likeCount;
  final bool isPinned;
  final int createdAt;
  final UserModel user;

  const ActivityModel(
      {required this.id,
      required this.user,
      required this.replyCount,
      required this.siteUrl,
      required this.isLocked,
      required this.isLiked,
      required this.likeCount,
      required this.isPinned,
      required this.createdAt});

  @override
  List<Object?> get props => [
        id,
        replyCount,
        siteUrl,
        isLocked,
        isLiked,
        likeCount,
        isPinned,
        createdAt,
        user
      ];

  static ActivityModel fromEntity(ActivityAndUserRelation entity) {
    final type = ActivityType.fromJson(entity.activity.type!);
    final activity = entity.activity;
    final user = entity.user;
    final media = entity.media;
    switch (type) {
      case ActivityType.text:
        return TextActivityModel(
          id: activity.id,
          text: activity.text!,
          replyCount: activity.replyCount ?? 0,
          siteUrl: activity.siteUrl!,
          isLocked: activity.isLocked.toBoolean(),
          isLiked: activity.isLiked.toBoolean(),
          likeCount: activity.likeCount ?? 0,
          isPinned: activity.isPinned.toBoolean(),
          createdAt: activity.createdAt!,
          user: UserModel.fromEntity(user)!,
        );

      case ActivityType.animeList:
      case ActivityType.mangaList:
      case ActivityType.mediaList:
        return ListActivityModel(
          id: activity.id,
          replyCount: activity.replyCount ?? 0,
          siteUrl: activity.siteUrl!,
          isLocked: activity.isLocked.toBoolean(),
          isLiked: activity.isLiked.toBoolean(),
          likeCount: activity.likeCount ?? 0,
          isPinned: activity.isPinned.toBoolean(),
          createdAt: activity.createdAt!,
          user: UserModel.fromEntity(user)!,
          status: activity.status ?? '',
          progress: activity.progress ?? '',
          media: MediaModel.fromDatabaseModel(media!),
        );
      case ActivityType.message:
        throw Exception('Invalid type');
    }
  }
}

class ListActivityModel extends ActivityModel {
  final String status;
  final String progress;
  final MediaModel media;

  const ListActivityModel(
      {required super.id,
      required this.status,
      required this.progress,
      required this.media,
      required super.replyCount,
      required super.siteUrl,
      required super.isLocked,
      required super.isLiked,
      required super.likeCount,
      required super.isPinned,
      required super.createdAt,
      required super.user});

  @override
  List<Object?> get props => [...super.props, status, progress, media];
}

class TextActivityModel extends ActivityModel {
  final String text;

  const TextActivityModel(
      {required super.id,
      required this.text,
      required super.replyCount,
      required super.siteUrl,
      required super.isLocked,
      required super.isLiked,
      required super.likeCount,
      required super.isPinned,
      required super.createdAt,
      required super.user});

  @override
  List<Object?> get props => [...super.props, text];
}
