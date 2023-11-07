// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:equatable/equatable.dart';

sealed class NotificationModel extends Equatable {
  const NotificationModel({required this.context, required this.createdAt});

  final String context;
  final int createdAt;

  @override
  List<Object?> get props => [context, createdAt];

  // static NotificationModel fromDto(AniNotification dto) {
  //   switch (dto) {
  //     case ActivityLikeNotificationDto():
  //       return ActivityLikeNotification(
  //         user: UserModel.fromDto(dto.user!),
  //         activity: ActivityModel(),
  //         context: jsonEncode(dto.contexts),
  //         createdAt: dto.createdAt ?? 0,
  //       );
  //     case AiringNotificationDto():
  //       return AiringNotification(episode: dto.episode ?? 0, context: dto.contexts );
  //     case ActivityReplyNotification():
  //       return ActivityReplyNotificationDto.fromJson(jsonMap);
  //     case ActivityReplyLikeNotification():
  //       return ActivityReplyLikeNotificationDto.fromJson(jsonMap);
  //     case ActivityReplySubscribedNotification():
  //       return ActivityReplySubscribedNotificationDto.fromJson(jsonMap);
  //     case ActivityMessageNotification():
  //       return ActivityMessageNotificationDto.fromJson(jsonMap);
  //
  //     case FollowingNotification():
  //       return FollowingNotificationDto.fromJson(jsonMap);
  //     case MediaDataChangeNotification():
  //       return MediaDataChangeNotificationDto.fromJson(jsonMap);
  //     case RelatedMediaAdditionNotification():
  //       return RelatedMediaAdditionNotificationDto.fromJson(jsonMap);
  //     case MediaDeletionNotification():
  //       return MediaDeletionNotificationDto.fromJson(jsonMap);
  //     case MediaMergeNotification():
  //       return MediaMergeNotificationDto.fromJson(jsonMap);
  //   }
  // }
}

class AiringNotification extends NotificationModel {
  const AiringNotification({required this.episode,
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

  const ActivityNotification({required this.user,
    required this.activity,
    required super.context,
    required super.createdAt});

  @override
  List<Object?> get props => [...super.props, user, activity];
}

class ActivityMentionNotification extends ActivityNotification {
  const ActivityMentionNotification({required super.user,
    required super.activity,
    required super.context,
    required super.createdAt});
}

class ActivityReplyNotification extends ActivityNotification {
  const ActivityReplyNotification({required super.user,
    required super.activity,
    required super.context,
    required super.createdAt});
}

class ActivityReplyLikeNotification extends ActivityNotification {
  const ActivityReplyLikeNotification({required super.user,
    required super.activity,
    required super.context,
    required super.createdAt});
}

class ActivityLikeNotification extends ActivityNotification {
  const ActivityLikeNotification({required super.user,
    required super.activity,
    required super.context,
    required super.createdAt});
}

class ActivityMessageNotification extends ActivityNotification {
  const ActivityMessageNotification({required super.user,
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
  });
}

class MediaMergeNotification extends MediaNotification {
  const MediaMergeNotification({
    required super.context,
    required super.createdAt,
    required super.media,
  });
}

class MediaDeletionNotification extends MediaNotification {
  const MediaDeletionNotification({
    required super.context,
    required super.createdAt,
    required super.media,
  });
}
