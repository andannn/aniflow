import 'package:aniflow/core/database/aniflow_database.dart';
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

  Future<StudioEntity?> getStudioById(String staffId);

  Stream<StudioEntity?> getStudioByIdStream(String staffId);
}

class StudioDaoImpl extends StudioDao {
  final AniflowDatabase database;

  /// staffId to notifiers dict.
  // final Map<String, ValueNotifier<int>> _notifiers = {};

  StudioDaoImpl(this.database);

  @override
  Future<StudioEntity?> getStudioById(String staffId) async {
    final results = await database.aniflowDB.query(Tables.studioTable,
        where: '${StudioColumns.id} = $staffId', limit: 1);
    final staffJson = results.firstOrNull;
    return staffJson != null ? StudioEntity.fromJson(staffJson) : null;
  }


  @override
  Stream<StudioEntity?> getStudioByIdStream(String staffId) {
    throw UnimplementedError();
  }

  @override
  Future insertStudioEntitiesOfMedia(
      {required String mediaId,
      required List<StudioEntity> entities,
      ConflictAlgorithm algorithm = ConflictAlgorithm.replace}) async {
    final batch = database.aniflowDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.studioTable,
        entity.toJson(),
        conflictAlgorithm: algorithm,
      );
      batch.insert(Tables.studioMediaCrossRefTable, {
        StudioMediaCrossRefColumns.mediaId: mediaId,
        StudioMediaCrossRefColumns.studioId: entity.id,
      });
    }
    await batch.commit(noResult: true);

    // for (var e in entities) {
    //   notifyStaffChanged(e.id);
    // }
  }
}
