import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/tables/search_result_table.dart';
import 'package:drift/drift.dart';

part 'search_result_cache_dao.g.dart';

@DriftAccessor(tables: [
  SearchResultTable,
])
class SearchResultCacheDao extends DatabaseAccessor<AniflowDatabase>
    with _$SearchResultCacheDaoMixin {
  SearchResultCacheDao(super.attachedDatabase);

  Future saveCache(List<SearchResultEntity> entities) async {
    return attachedDatabase.transaction(() async {
      await batch((batch) async {
        batch.insertAllOnConflictUpdate(
          searchResultTable,
          entities,
        );
      });
    });
  }

  Future<SearchResultEntity?> getCache(
      String mediaId, String mediaSource) async {
    final query = select(searchResultTable)
      ..where(
          (t) => t.mediaId.equals(mediaId) & t.mediaSource.equals(mediaSource));
    return query.getSingleOrNull();
  }
}
