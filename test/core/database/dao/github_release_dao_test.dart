import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/github_release_dao.dart';
import 'package:aniflow/core/database/dao/user_dao.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('user dao test', () {
    late AniflowDatabase db;
    late GithubReleaseDao dao;

    setUp(() async {
      db = AniflowDatabase(NativeDatabase.memory());
      dao = db.githubReleaseDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('insert and get latest release package', () async {
      await dao.upsertReleasePackage([
        ReleasedPackageEntity(
          releasedTime: DateTime.now().subtract(const Duration(seconds: 1)),
          apkDownloadUrl: 'url',
          id: null,
          tagName: 'v1.1.1',
        ),
        ReleasedPackageEntity(
          releasedTime: DateTime.now(),
          apkDownloadUrl: 'url',
          id: null,
          tagName: 'v1.1.2',
        ),
        ReleasedPackageEntity(
          releasedTime: DateTime.now().subtract(const Duration(seconds: 2)),
          apkDownloadUrl: 'url',
          id: null,
          tagName: 'v1.1.3',
        ),
      ]);
      final package = await dao.getLatestReleasePackages().first;
      expect(package?.tagName, equals('v1.1.3'));
    });
  });
}
