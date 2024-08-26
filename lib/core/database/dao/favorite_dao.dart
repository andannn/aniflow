import 'package:aniflow/core/common/definitions/favorite_category.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/tables/character_table.dart';
import 'package:aniflow/core/database/tables/favorite_info_table.dart';
import 'package:aniflow/core/database/tables/media_table.dart';
import 'package:aniflow/core/database/tables/staff_table.dart';
import 'package:aniflow/core/database/tables/studio_table.dart';
import 'package:drift/drift.dart';

part 'favorite_dao.g.dart';

@DriftAccessor(tables: [
  FavoriteInfoTable,
  MediaTable,
  CharacterTable,
  StaffTable,
  StudioTable,
])
class FavoriteDao extends DatabaseAccessor<AniflowDatabase>
    with _$FavoriteDaoMixin {
  FavoriteDao(super.db);

  Future insertOrIgnoreFavoritesCrossRef(
      String userId, FavoriteType type, List<String> ids) {
    return attachedDatabase.transaction(() async {
      return batch((batch) {
        batch.insertAll(
          favoriteInfoTable,
          ids.map(
            (id) => FavoriteInfoTableCompanion.insert(
              favoriteType: type.contentValues,
              infoId: id,
              userId: userId,
            ),
          ),
          mode: InsertMode.insertOrIgnore,
        );
      });
    });
  }

  Future deleteFavoriteCrossRef(String userId, FavoriteType type, String id) {
    return attachedDatabase.transaction(() async {
      return (delete(favoriteInfoTable)
            ..where((tbl) =>
                favoriteInfoTable.userId.equals(userId) &
                favoriteInfoTable.favoriteType.equals(type.contentValues) &
                favoriteInfoTable.infoId.equals(id)))
          .go();
    });
  }

  JoinedSelectStatement<HasResultSet, dynamic> _mediaQuery(
    limit,
    offset,
    userId,
    MediaType mediaType,
  ) {
    final favoriteValue = mediaType == MediaType.manga
        ? FavoriteType.manga.contentValues
        : FavoriteType.anime.contentValues;
    return select(favoriteInfoTable).join([
      innerJoin(mediaTable, favoriteInfoTable.infoId.equalsExp(mediaTable.id))
    ])
      ..where(favoriteInfoTable.favoriteType.equals(favoriteValue) &
          favoriteInfoTable.userId.equals(userId))
      ..orderBy([OrderingTerm.asc(favoriteInfoTable.id)])
      ..limit(limit, offset: offset);
  }

  Future<List<MediaEntity>> getFavoriteMediaByPage(
      MediaType mediaType, String userId, int page, int perPage) {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    return (_mediaQuery(limit, offset, userId, mediaType)
        .map((row) => row.readTable(mediaTable))).get();
  }

  Stream<List<MediaEntity>> getFavoriteMediaStream(
      MediaType mediaType, String userId, int limit) {
    return (_mediaQuery(limit, 0, userId, mediaType)
        .map((row) => row.readTable(mediaTable))).watch();
  }

  JoinedSelectStatement<HasResultSet, dynamic> _characterQuery(
          limit, offset, userId) =>
      select(favoriteInfoTable).join([
        innerJoin(characterTable,
            favoriteInfoTable.infoId.equalsExp(characterTable.id))
      ])
        ..where(
          favoriteInfoTable.favoriteType
                  .equals(FavoriteType.character.contentValues) &
              favoriteInfoTable.userId.equals(userId),
        )
        ..orderBy([OrderingTerm.asc(favoriteInfoTable.id)])
        ..limit(limit, offset: offset);

  Future<List<CharacterEntity>> getFavoriteCharacters(
      String userId, int page, int perPage) {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    return (_characterQuery(limit, offset, userId)
        .map((row) => row.readTable(characterTable))).get();
  }

  Stream<List<CharacterEntity>> getFavoriteCharactersStream(
      String userId, int limit) {
    return (_characterQuery(limit, 0, userId)
        .map((row) => row.readTable(characterTable))).watch();
  }

  JoinedSelectStatement<HasResultSet, dynamic> _staffQuery(
    limit,
    offset,
    userId,
  ) =>
      select(favoriteInfoTable).join([
        innerJoin(staffTable, favoriteInfoTable.infoId.equalsExp(staffTable.id))
      ])
        ..where(favoriteInfoTable.favoriteType
                .equals(FavoriteType.staff.contentValues) &
            favoriteInfoTable.userId.equals(userId))
        ..orderBy([OrderingTerm.asc(favoriteInfoTable.id)])
        ..limit(limit, offset: offset);

  Future<List<StaffEntity>> getFavoriteStaffs(
      String userId, int page, int perPage) {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;
    final query = _staffQuery(limit, offset, userId);

    return (query.map((row) => row.readTable(staffTable))).get();
  }

  Stream<List<StaffEntity>> getFavoriteStaffsStream(String userId, int limit) {
    final query = _staffQuery(limit, 0, userId);

    return (query.map((row) => row.readTable(staffTable))).watch();
  }

  JoinedSelectStatement<HasResultSet, dynamic> _studioQuery(
    limit,
    offset,
    userId,
  ) =>
      select(favoriteInfoTable).join([
        innerJoin(
            studioTable, favoriteInfoTable.infoId.equalsExp(studioTable.id))
      ])
        ..where(favoriteInfoTable.favoriteType
                .equals(FavoriteType.studio.contentValues) &
            favoriteInfoTable.userId.equals(userId))
        ..orderBy([OrderingTerm.asc(favoriteInfoTable.id)])
        ..limit(limit, offset: offset);

  Stream<List<StudioEntity>> getFavoriteStudiosStream(
      String userId, int limit) {
    final query = _studioQuery(limit, 0, userId);

    return (query.map((row) => row.readTable(studioTable))).watch();
  }

  Future clearFavorites(String userId, List<FavoriteType> type) {
    return attachedDatabase.transaction(() async {
      return (delete(favoriteInfoTable)
            ..where((tbl) =>
                favoriteInfoTable.userId.equals(userId) &
                favoriteInfoTable.favoriteType
                    .isIn(type.map((e) => e.contentValues).toList())))
          .go();
    });
  }
}
