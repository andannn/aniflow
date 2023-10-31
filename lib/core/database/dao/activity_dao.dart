import 'package:aniflow/core/common/model/activity_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/user_data_dao.dart';
import 'package:aniflow/core/database/model/activity_entity.dart';
import 'package:sqflite/sqflite.dart';

/// [Tables.activityTable]
mixin ActivityTableColumns {
  static const String id = 'activity_id';
  static const String userId = 'activity_userId';
  static const String text = 'activity_text';
  static const String status = 'activity_status';
  static const String progress = 'activity_progress';
  static const String type = 'activity_type';
  static const String replyCount = 'activity_replyCount';
  static const String siteUrl = 'activity_siteUrl';
  static const String isLocked = 'activity_isLocked';
  static const String isLiked = 'activity_isLiked';
  static const String likeCount = 'activity_likeCount';
  static const String isPinned = 'activity_isPinned';
  static const String createdAt = 'activity_createdAt';
}

abstract class ActivityDao {
  Future upsertActivityEntities(List<ActivityEntity> entities);

  Future getActivityEntities(
      [int page, int perPage, int? userId, List<ActivityType> types]);
}

class ActivityDaoImpl extends ActivityDao {
  final AniflowDatabase database;

  ActivityDaoImpl(this.database);

  @override
  Future upsertActivityEntities(List<ActivityEntity> entities) async {
    final batch = database.aniflowDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.activityTable,
        entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return batch.commit(noResult: true);
  }

  @override
  Future getActivityEntities(
      [int page = 1,
      int perPage = Config.defaultPerPageCount,
      int? userId,
      List<ActivityType> types = const []]) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    String sql = 'select * from ${Tables.activityTable} as a '
        'join ${Tables.userDataTable}  as u '
        '  on ${ActivityTableColumns.userId} = ${UserDataTableColumns.id} '
        'where true ';

    if (userId != null) {
      sql += 'and ${UserDataTableColumns.id} = \'$userId\' ';
    }

    String typeSelection = types.map((e) => e.toJson()).join(',');
    if (typeSelection.isNotEmpty) {
      sql += 'and ${ActivityTableColumns.type} in ($typeSelection)  ';
    }

    sql += 'order by ${ActivityTableColumns.id} desc '
        'limit $limit '
        'offset $offset ';

    final List<Map<String, dynamic>> result =
        await database.aniflowDB.rawQuery(sql);

    print(result);
  }
}
