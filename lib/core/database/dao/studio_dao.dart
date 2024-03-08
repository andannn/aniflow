import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/dao_change_notifier_mixin.dart';
import 'package:aniflow/core/database/model/studio_entity.dart';
import 'package:sqflite/sqflite.dart';

/// [Tables.studioTable]
mixin StudioColumns {
  static const String id = 'studio_id';
  static const String name = 'studio_name';
  static const String siteUrl = 'studio_site_url';
  static const String isAnimationStudio = 'studio_is_animation_studio';
  static const String isFavourite = 'studio_is_favourite';
}

/// [Tables.studioMediaCrossRefTable]
mixin StudioMediaCrossRefColumns {
  static const String studioId = 'studio_id';
  static const String mediaId = 'media_id';
}

abstract class StudioDao {
  Future insertStudioEntitiesOfMedia(
      {required String mediaId,
      required List<StudioEntity> entities,
      ConflictAlgorithm algorithm = ConflictAlgorithm.replace});

  Future insertStudioEntities(
      {required List<StudioEntity> entities,
      ConflictAlgorithm algorithm = ConflictAlgorithm.replace});

  Future<StudioEntity?> getStudioById(String id);

  Stream<StudioEntity?> getStudioStream(String id);
}

class StudioDaoImpl extends StudioDao with DbChangedNotifierMixin<String> {
  final AniflowDatabase database;

  StudioDaoImpl(this.database);

  @override
  Future<StudioEntity?> getStudioById(String id) async {
    final results = await database.aniflowDB.query(Tables.studioTable,
        where: '${StudioColumns.id} = $id', limit: 1);
    final staffJson = results.firstOrNull;
    return staffJson != null ? StudioEntity.fromJson(staffJson) : null;
  }

  @override
  Stream<StudioEntity?> getStudioStream(String id) =>
      createStreamWithKey(id, () => getStudioById(id));

  @override
  Future insertStudioEntitiesOfMedia({
    required String mediaId,
    required List<StudioEntity> entities,
    ConflictAlgorithm algorithm = ConflictAlgorithm.replace,
  }) async {
    final batch = database.aniflowDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.studioTable,
        entity.toJson(),
        conflictAlgorithm: algorithm,
      );
      batch.insert(
          Tables.studioMediaCrossRefTable,
          {
            StudioMediaCrossRefColumns.mediaId: mediaId,
            StudioMediaCrossRefColumns.studioId: entity.id,
          },
          conflictAlgorithm: ConflictAlgorithm.ignore);
    }
    await batch.commit(noResult: true);

    final keys = entities.map((e) => e.id).toList();
    notifyChanged(keys);
  }

  @override
  Future insertStudioEntities({
    required List<StudioEntity> entities,
    ConflictAlgorithm algorithm = ConflictAlgorithm.replace,
  }) async {
    final batch = database.aniflowDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.studioTable,
        entity.toJson(),
        conflictAlgorithm: algorithm,
      );
    }
    await batch.commit(noResult: true);

    final keys = entities.map((e) => e.id).toList();
    notifyChanged(keys);
  }
}
