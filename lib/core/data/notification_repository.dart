import 'package:aniflow/core/common/definitions/notification_type.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/notification_model.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/user_dao.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
import 'package:aniflow/core/database/mappers/user_mapper.dart';
import 'package:aniflow/core/network/api/notification_query_graphql.dart';
import 'package:aniflow/core/network/auth_data_source.dart';
import 'package:aniflow/core/network/model/notification.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

enum NotificationCategory {
  all,
  airing,
  activity,
  follows,
  media;
}

@lazySingleton
class NotificationRepository {
  NotificationRepository(
    this.dataSource,
    this.userDao,
    this.mediaDao,
  );

  final AuthDataSource dataSource;
  final UserDao userDao;
  final MediaDao mediaDao;

  Future<LoadResult<List<NotificationModel>>> loadNotificationsByPage({
    required int page,
    required int perPage,
    required NotificationCategory category,
    required bool resetNotificationCount,
    CancelToken? token,
  }) {
    final types = switch (category) {
      NotificationCategory.all => NotificationType.values,
      NotificationCategory.airing => [
          NotificationType.airing,
        ],
      NotificationCategory.activity => [
          NotificationType.activityLike,
          NotificationType.activityReply,
          NotificationType.activityMention,
          NotificationType.activityReplyLike,
          NotificationType.activityMessage,
        ],
      NotificationCategory.follows => [
          NotificationType.following,
        ],
      NotificationCategory.media => [
          NotificationType.mediaDataChange,
          NotificationType.relatedMediaAddition,
          NotificationType.mediaMerge,
        ],
    };
    return LoadPageUtil.loadPageWithoutOrderingCache(
      page: page,
      perPage: perPage,
      onGetNetworkRes: (int page, int perPage) => dataSource.getNotifications(
        param: NotificationQueryParam(
          page: page,
          perPage: perPage,
          resetNotificationCount: resetNotificationCount,
          type: types,
        ),
        token: token,
      ),
      mapDtoToModel: (dto) => NotificationModel.fromDto(dto),
      onInsertToDB: (dto) async {
        final userEntities = dto
            .map((e) => e.userDto)
            .whereNotNull()
            .map((e) => e.toEntity())
            .toList();

        await userDao.insertOrIgnoreUsers(userEntities);

        final mediaEntities = dto
            .map((e) => e.mediaDto)
            .whereNotNull()
            .map((e) => e.toEntity())
            .toList();

        await mediaDao.insertOrIgnoreMedia(mediaEntities);
      },
    );
  }
}
