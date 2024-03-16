import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/tables/character_table.dart';
import 'package:aniflow/core/database/tables/favorite_info_table.dart';
import 'package:aniflow/core/database/tables/media_table.dart';
import 'package:aniflow/core/database/tables/staff_table.dart';
import 'package:drift/drift.dart';

part 'favorite_dao.g.dart';

@DriftAccessor(tables: [
  FavoriteInfoTable,
  MediaTable,
  CharacterTable,
  StaffTable,
])
class FavoriteDao extends DatabaseAccessor<AniflowDatabase2>
    with _$FavoriteDaoMixin {
  FavoriteDao(super.db);

  Future insertFavoritesCrossRef(
      String userId, FavoriteType type, List<String> ids) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(
        favoriteInfoTable,
        ids.map(
          (id) => FavoriteInfoTableCompanion.insert(
            favoriteType: type.contentValues,
            infoId: id,
            userId: userId,
          ),
        ),
      );
    });
  }

  Future<List<MediaEntity>> getFavoriteMediaByPage(
      MediaType mediaType, String userId, int page, int perPage) {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;
    final favoriteValue = mediaType == MediaType.manga
        ? FavoriteType.manga.contentValues
        : FavoriteType.anime.contentValues;
    final query = select(favoriteInfoTable).join([
      innerJoin(mediaTable, favoriteInfoTable.infoId.equalsExp(mediaTable.id))
    ])
      ..where(favoriteInfoTable.favoriteType.equals(favoriteValue))
      ..orderBy([OrderingTerm.asc(favoriteInfoTable.id)])
      ..limit(limit, offset: offset);

    return (query.map((row) => row.readTable(mediaTable))).get();
  }

  Future<List<CharacterEntity>> getFavoriteCharacters(
      String userId, int page, int perPage) {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;
    final query = select(favoriteInfoTable).join([
      innerJoin(
          characterTable, favoriteInfoTable.infoId.equalsExp(characterTable.id))
    ])
      ..where(favoriteInfoTable.favoriteType
          .equals(FavoriteType.character.contentValues))
      ..orderBy([OrderingTerm.asc(favoriteInfoTable.id)])
      ..limit(limit, offset: offset);

    return (query.map((row) => row.readTable(characterTable))).get();
  }

  Future<List<StaffEntity>> getFavoriteStaffs(
      String userId, int page, int perPage) {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;
    final query = select(favoriteInfoTable).join([
      innerJoin(staffTable, favoriteInfoTable.infoId.equalsExp(staffTable.id))
    ])
      ..where(favoriteInfoTable.favoriteType
          .equals(FavoriteType.staff.contentValues))
      ..orderBy([OrderingTerm.asc(favoriteInfoTable.id)])
      ..limit(limit, offset: offset);

    return (query.map((row) => row.readTable(staffTable))).get();
  }

  Future clearFavorites(String userId, FavoriteType type) {
    return (delete(favoriteInfoTable)
          ..where((tbl) =>
              favoriteInfoTable.userId.equals(userId) &
              favoriteInfoTable.favoriteType.equals(type.contentValues)))
        .go();
  }
}