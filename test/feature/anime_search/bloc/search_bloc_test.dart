import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/firebase/remote_config/remote_config_manager.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:aniflow/feature/search/bloc/search_bloc.dart';
import 'package:aniflow/feature/search/bloc/search_state.dart';
import 'package:aniflow/feature/search/bloc/search_type.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/data/mocks/mock_github_release_dao.dart';
import '../../../core/data/mocks/mock_remote_config_manager.dart';

void main() {
  group('search_bloc_test', () {
    late UserDataRepository userDataRepository;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});

      final sharedPref = await SharedPreferences.getInstance();
      UserDataPreferences preferences = UserDataPreferences(sharedPref);
      RemoteConfigManager remoteConfigManager = MockRemoteConfigManager();
      final githubReleaseDao = MockGithubReleaseDao();
      userDataRepository = UserDataRepository(
          preferences, remoteConfigManager, githubReleaseDao);
    });

    tearDown(() async {});

    blocTest(
      'OnSearchStringCommit Event',
      build: () => SearchBloc(userDataRepository),
      act: (bloc) => bloc.add(OnSearchStringCommit("Test")),
      expect: () => [
        const SearchState(keyword: 'Test', selectedSearchType: SearchType.anime)
      ],
    );

    blocTest(
      'OnSearchTypeSelected Event',
      build: () => SearchBloc(userDataRepository),
      act: (bloc) => bloc.add(OnSearchTypeSelected(SearchType.manga)),
      expect: () => [
        const SearchState(keyword: null, selectedSearchType: SearchType.manga)
      ],
    );
  });
}
