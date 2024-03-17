import 'package:aniflow/core/data/model/activity_reply_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/user_model.dart';
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
  final UserModel? user;
  final List<ActivityReplyModel> replies;

  const ActivityModel({
    required this.id,
    required this.user,
    required this.replyCount,
    required this.siteUrl,
    required this.isLocked,
    required this.isLiked,
    required this.likeCount,
    required this.isPinned,
    required this.createdAt,
    required this.replies,
  });

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
        user,
        ...replies
      ];
}

class ListActivityModel extends ActivityModel {
  final String status;
  final String progress;
  final MediaModel? media;

  const ListActivityModel({
    required super.id,
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
    required super.user,
    required super.replies,
  });

  @override
  List<Object?> get props => [...super.props, status, progress, media];
}

class TextActivityModel extends ActivityModel {
  final String text;

  const TextActivityModel({
    required super.id,
    required this.text,
    required super.replyCount,
    required super.siteUrl,
    required super.isLocked,
    required super.isLiked,
    required super.likeCount,
    required super.isPinned,
    required super.createdAt,
    required super.user,
    required super.replies,
  });

  @override
  List<Object?> get props => [...super.props, text];
}
