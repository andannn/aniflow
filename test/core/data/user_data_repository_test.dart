import 'package:aniflow/core/common/definitions/refresh_time_key.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mock_github_release_dao.dart';
import 'mocks/mock_remote_config_manager.dart';

class MockUserDataPreferences extends Fake implements UserDataPreferences {
  final timeMap = <RefreshTimeKey, DateTime>{};

  @override
  DateTime? getLastSuccessRefreshTime(RefreshTimeKey key) {
    return timeMap[key];
  }

  @override
  Future setLastSuccessRefreshTime(RefreshTimeKey key, DateTime time) async {
    timeMap[key] = time;
  }
}

void main() {
  group('user data repository test', () {
    late UserDataRepository repository;

    setUp(() async {
      final remoteConfig = MockRemoteConfigManager();
      final userDataPref = MockUserDataPreferences();
      final githubReleaseDao = MockGithubReleaseDao();

      repository =
          UserDataRepository(userDataPref, remoteConfig, githubReleaseDao);
    });

    test('can refresh without set', () async {
      final res = repository.canRefresh(const BirthdayCharacters());
      expect(res, true);
    });

// TODO: set DateTime.now()
    // test('can refresh without set last hour', () async {
    //   await repository.setLastSuccessRefreshTime(
    //       const MediaList(userId: '1'),
    //       DateTime.now()
    //           .subtract(Duration(
    //               minutes: RefreshTimeKey.mediaListRefreshInterval))
    //           .add(const Duration(seconds: 1)));
    //   final res = repository.canRefresh(const MediaList(userId: '1'));
    //   expect(res, true);
    // });
  });
}
