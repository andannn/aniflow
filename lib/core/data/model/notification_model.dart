// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

import 'package:aniflow/core/data/mappers/activity_mapper.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/mappers/user_mapper.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/network/model/activity_like_notification_dto.dart';
import 'package:aniflow/core/network/model/activity_message_notification_dto.dart';
import 'package:aniflow/core/network/model/activity_reply_like_notification_dto.dart';
import 'package:aniflow/core/network/model/activity_reply_notification_dto.dart';
import 'package:aniflow/core/network/model/activity_reply_subscription_notification_dto.dart';
import 'package:aniflow/core/network/model/airing_notification_dto.dart';
import 'package:aniflow/core/network/model/following_notification_dto.dart';
import 'package:aniflow/core/network/model/media_data_change_notification_dto.dart';
import 'package:aniflow/core/network/model/media_deletion_notification_dto.dart';
import 'package:aniflow/core/network/model/media_merge_notification_dto.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:aniflow/core/network/model/related_media_addition_notification_dto.dart';
import 'package:equatable/equatable.dart';

sealed class NotificationModel extends Equatable {
  const NotificationModel({required this.context, required this.createdAt});

  final String context;
  final int createdAt;

  @override
  List<Object?> get props => [context, createdAt];

  static NotificationModel fromDto(AniNotification dto) {
    switch (dto) {
      case AiringNotificationDto():
        return AiringNotification(
          createdAt: dto.createdAt ?? 0,
          episode: dto.episode ?? 0,
          media: dto.media!.toModel(),
          context: jsonEncode(dto.contexts),
        );
      case FollowingNotificationDto():
        return FollowNotification(
          user: dto.user!.toModel(),
          context: dto.context ?? '',
          createdAt: dto.createdAt ?? 0,
        );
      case ActivityLikeNotificationDto():
        return ActivityLikeNotification(
          user: dto.user!.toModel(),
          activity: dto.activity!.toModel(),
          context: dto.context ?? '',
          createdAt: dto.createdAt ?? 0,
        );
      case ActivityReplyNotificationDto():
        return ActivityReplyNotification(
          user: dto.user!.toModel(),
          activity: dto.activity!.toModel(),
          context: dto.context ?? '',
          createdAt: dto.createdAt ?? 0,
        );
      case ActivityReplyLikeNotificationDto():
        return ActivityReplyLikeNotification(
          user: dto.user!.toModel(),
          activity: dto.activity!.toModel(),
          context: dto.context ?? '',
          createdAt: dto.createdAt ?? 0,
        );
      case ActivityReplySubscribedNotificationDto():
        return ActivityReplySubscribedNotification(
          user: dto.user!.toModel(),
          activity: dto.activity!.toModel(),
          context: dto.context ?? '',
          createdAt: dto.createdAt ?? 0,
        );
      case ActivityMessageNotificationDto():
        return ActivityMessageNotification(
          user: dto.user!.toModel(),
          activity: dto.activity!.toModel(),
          context: dto.context ?? '',
          createdAt: dto.createdAt ?? 0,
        );

      case MediaDataChangeNotificationDto():
        return MediaDataChangeNotification(
          createdAt: dto.createdAt ?? 0,
          context: dto.context ?? '',
          media: dto.media!.toModel(),
          reason: dto.reason ?? '',
        );
      case RelatedMediaAdditionNotificationDto():
        return RelatedMediaAdditionNotification(
          createdAt: dto.createdAt ?? 0,
          context: dto.context ?? '',
          media: dto.media!.toModel(),
        );
      case MediaDeletionNotificationDto():
        return MediaDeletionNotification(
          createdAt: dto.createdAt ?? 0,
          context: dto.context ?? '',
          deletedMediaTitle: dto.deletedMediaTitle ?? '',
          reason: dto.reason ?? '',
        );
      case MediaMergeNotificationDto():
        return MediaMergeNotification(
          createdAt: dto.createdAt ?? 0,
          context: dto.context ?? '',
          media: dto.media!.toModel(),
        );
      default:
        throw Exception('Invalid type');
    }
  }
}

class AiringNotification extends NotificationModel {
  const AiringNotification(
      {required this.episode,
      required super.context,
      required super.createdAt,
      required this.media});

  final int episode;
  final MediaModel media;

  @override
  List<Object?> get props => [...super.props, episode, media];
}

class FollowNotification extends NotificationModel {
  const FollowNotification({
    required super.context,
    required super.createdAt,
    required this.user,
  });

  final UserModel user;

  @override
  List<Object?> get props => [...super.props, user];
}

abstract class ActivityNotification extends NotificationModel {
  final UserModel user;
  final ActivityModel activity;

  const ActivityNotification(
      {required this.user,
      required this.activity,
      required super.context,
      required super.createdAt});

  @override
  List<Object?> get props => [...super.props, user, activity];
}

class ActivityMentionNotification extends ActivityNotification {
  const ActivityMentionNotification(
      {required super.user,
      required super.activity,
      required super.context,
      required super.createdAt});
}

class ActivityReplyNotification extends ActivityNotification {
  const ActivityReplyNotification(
      {required super.user,
      required super.activity,
      required super.context,
      required super.createdAt});
}

class ActivityReplyLikeNotification extends ActivityNotification {
  const ActivityReplyLikeNotification(
      {required super.user,
      required super.activity,
      required super.context,
      required super.createdAt});
}

class ActivityLikeNotification extends ActivityNotification {
  const ActivityLikeNotification(
      {required super.user,
      required super.activity,
      required super.context,
      required super.createdAt});
}

class ActivityMessageNotification extends ActivityNotification {
  const ActivityMessageNotification(
      {required super.user,
      required super.activity,
      required super.context,
      required super.createdAt});
}

class ActivityReplySubscribedNotification extends ActivityNotification {
  const ActivityReplySubscribedNotification(
      {required super.user,
      required super.activity,
      required super.context,
      required super.createdAt});
}

abstract class MediaNotification extends NotificationModel {
  const MediaNotification({
    required super.context,
    required super.createdAt,
    required this.media,
  });

  final MediaModel media;

  @override
  List<Object?> get props => [...super.props, media];
}

class RelatedMediaAdditionNotification extends MediaNotification {
  const RelatedMediaAdditionNotification({
    required super.context,
    required super.createdAt,
    required super.media,
  });
}

class MediaDataChangeNotification extends MediaNotification {
  const MediaDataChangeNotification({
    required super.context,
    required super.createdAt,
    required super.media,
    required this.reason,
  });

  final String reason;
}

class MediaMergeNotification extends MediaNotification {
  const MediaMergeNotification({
    required super.context,
    required super.createdAt,
    required super.media,
  });
}

class MediaDeletionNotification extends NotificationModel {
  const MediaDeletionNotification({
    required super.context,
    required super.createdAt,
    required this.deletedMediaTitle,
    required this.reason,
  });

  final String deletedMediaTitle;
  final String reason;

  @override
  List<Object?> get props => [...super.props, deletedMediaTitle, reason];
}
