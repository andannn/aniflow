import 'package:aniflow/core/data/github_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/github_user_model.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mocks/mock_github_data_source.dart';
import 'mocks/mock_github_release_dao.dart';

void main() {
  group('github_repository_test', () {
    late GithubRepository repository;
    late UserDataPreferences preferences;
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      final sharedPref = await SharedPreferences.getInstance();
      preferences = UserDataPreferences(sharedPref);
      final githubReleaseDao = MockGithubReleaseDao();
      repository = GithubRepository(
          MockGithubDataSource(), preferences, githubReleaseDao);
    });

    test('refresh Github Info', () async {
      final res = await repository.refreshGithubInfo();
      expect(res, isA<LoadSuccess>());
    });

    test('refresh Github Info', () async {
      final stream = repository.getMineGithubUserStream();
      await preferences.setMineGithubUserInfo('{"id": 121212}');
      final expectation1 = expectLater(
        stream,
        emitsInOrder([const GithubUserModel(id: 121212)]),
      );

      await expectation1;
    });
  });
}
