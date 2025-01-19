import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/tables/released_package_table.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

part 'github_release_dao.g.dart';

@DriftAccessor(tables: [
  ReleasedPackageTable,
])
class GithubReleaseDao extends DatabaseAccessor<AniflowDatabase>
    with _$GithubReleaseDaoMixin {
  GithubReleaseDao(super.db);

  Future upsertReleasePackage(
    List<ReleasedPackageEntity> entities,
  ) {
    return batch((batch) {
      batch.insertAll(
        releasedPackageTable,
        entities,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Stream<ReleasedPackageEntity?> getLatestReleasePackages() {
    return select(releasedPackageTable).watch().map((entities) {
      entities.sortByCompare(
        (entity) => entity.tagName,
        (a, b) => AppVersion.parse(b).compareTo(AppVersion.parse(a)),
      );
      return entities.firstOrNull;
    });
  }
}
