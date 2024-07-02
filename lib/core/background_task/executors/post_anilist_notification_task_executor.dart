import 'package:aniflow/core/background_task/executor.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/notification_model.dart';
import 'package:aniflow/core/data/notification_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';
import 'package:aniflow/core/notification/notification_channel.dart';
import 'package:aniflow/core/notification/notification_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:platform_notification/platform_notification.dart';
import 'package:platform_notification/platform_notification_model.dart';

const String _tag = "SendNotificationTaskExecutor";

@injectable
class PostAnilistNotificationExecutor implements Executor {
  const PostAnilistNotificationExecutor(
    this._notificationRepository,
    this._authRepository,
    this._userDataRepository,
  );

  final NotificationRepository _notificationRepository;
  final AuthRepository _authRepository;
  final UserDataRepository _userDataRepository;

  @override
  Future<bool> execute() async {
    final availableChannel = <NotificationChannel>[];
    for (final channel in _getAllAnilistNotificationChannel()) {
      final isSupport =
          await NotificationUtil.canSendNotificationToChannel(channel.id);
      if (isSupport) {
        availableChannel.add(channel);
      }
    }

    if (availableChannel.isEmpty) {
      logger.d('$_tag No available channel.');
      return true;
    }

    final result = await _authRepository.syncUserCondition();
    if (result is LoadError) {
      if (result.exception == const UnauthorizedException()) {
        // No Authed user, just finish the task.
        logger.d('$_tag No Authed user, just finish task.');
        return true;
      } else {
        // Network error, retry.
        logger.d('$_tag failed with exception ${result.exception}.');
        return false;
      }
    }

    final authedUser = await _authRepository.getAuthedUser();

    if (authedUser == null) {
      // No Authed user, just finish the task.
      logger.d('$_tag No Authed user, just finish task.');
      return true;
    }

    final unreadNotificationCount = authedUser.unreadNotificationCount;

    if (unreadNotificationCount == 0) {
      // No notification, just finish the task.
      logger.d('$_tag unreadNotificationCount is 0.');
      return true;
    }

    final notificationsResult =
        await _notificationRepository.loadNotificationsByPage(
      page: 1,
      perPage: unreadNotificationCount,
      category: NotificationCategory.all,
      resetNotificationCount: false,
    );

    if (notificationsResult is LoadError<List<NotificationModel>>) {
      if (notificationsResult.exception == const UnauthorizedException()) {
        logger.d('$_tag No Authed user, just finish task.');
        return true;
      } else {
        // Network error, retry.
        logger
            .d('$_tag failed with exception ${notificationsResult.exception}');
        return false;
      }
    }

    final notifications =
        (notificationsResult as LoadSuccess<List<NotificationModel>>).data;
    if (notifications.isEmpty) {
      logger.d('$_tag notifications of user is empty.');
      return true;
    }

    final sendUserNotificationIds =
        _userDataRepository.userData.sentNotificationIds;
    final matchedNotification = notifications
        .where(
          (e) =>
              !sendUserNotificationIds.contains(e.id) &&
              isAvailableNotification(e.runtimeType, availableChannel),
        )
        .toList();

    if (matchedNotification.isEmpty) {
      logger.d('$_tag No matched notification, just finish task.');
      return true;
    }

    final platFormNotifications = matchedNotification
        .map((e) => e.mapToPlatformModel())
        .whereNotNull()
        .toList();
    if (notifications.isEmpty) {
      logger.d('$_tag notification mapped null.');
      return true;
    }

    final tasks = platFormNotifications
        .take(AfConfig.maxSendNotificationCount)
        .map((notification) async {
      await PlatformNotification().sendNotification(notification);
      await _userDataRepository.addNotificationId(notification.id.toString());
    });

    await Future.wait(tasks);
    return true;
  }

  List<NotificationChannel> _getAllAnilistNotificationChannel() {
    return [
      AiredNotificationChannel(),
      NewFollowerNotificationChannel(),
      ActivityNotificationChannel(),
      MediaNotificationChannel(),
    ];
  }

  @visibleForTesting
  static bool isAvailableNotification(
      Type notificationType, List<NotificationChannel> availableChannel) {
    List<Type> availableType(NotificationChannel channel) {
      switch (channel) {
        case AiredNotificationChannel():
          return [
            AiringNotification,
          ];
        case NewFollowerNotificationChannel():
          return [FollowNotification];
        case ActivityNotificationChannel():
          return [
            ActivityLikeNotification,
            ActivityReplyNotification,
            ActivityReplyLikeNotification,
            ActivityReplySubscribedNotification,
            ActivityMessageNotification,
          ];
        case MediaNotificationChannel():
          return [
            MediaDataChangeNotification,
            RelatedMediaAdditionNotification,
            MediaMergeNotification,
          ];
      }
    }

    final availableTypes = availableChannel
        .map((channel) => availableType(channel))
        .flattened
        .toList();
    return availableTypes.contains(notificationType);
  }
}

extension on NotificationModel {
  UserTitleLanguage get userTitleLanguage =>
      GetIt.instance.get<UserDataRepository>().userData.userTitleLanguage;

  PlatformNotificationModel? mapToPlatformModel() {
    switch (this) {
      case AiringNotification():
        return PlatformNotificationModel(
          id: int.parse(id),
          title: 'New media aired',
          body: (this as AiringNotification).createText(userTitleLanguage),
          notificationChannel:
              AiredNotificationChannel().createPlatformNotificationChannel(),
        );
      case FollowNotification():
        return PlatformNotificationModel(
          id: int.parse(id),
          title: 'New follower',
          body: (this as FollowNotification).createText(),
          notificationChannel: NewFollowerNotificationChannel()
              .createPlatformNotificationChannel(),
        );
      case ActivityLikeNotification():
      case ActivityReplyNotification():
      case ActivityReplyLikeNotification():
      case ActivityReplySubscribedNotification():
      case ActivityMessageNotification():
        return PlatformNotificationModel(
          id: int.parse(id),
          title: 'New activity',
          body: (this as ActivityNotification).createText(),
          notificationChannel:
              ActivityNotificationChannel().createPlatformNotificationChannel(),
        );
      case MediaDataChangeNotification():
      case RelatedMediaAdditionNotification():
      case MediaMergeNotification():
        return PlatformNotificationModel(
          id: int.parse(id),
          title: 'Media',
          body: (this as MediaNotification).createText(userTitleLanguage),
          notificationChannel:
              MediaNotificationChannel().createPlatformNotificationChannel(),
        );
      case MediaDeletionNotification():
      default:
        return null;
    }
  }
}
