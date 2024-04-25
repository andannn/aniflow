import 'package:aniflow/core/data/search_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:aniflow/feature/anime_search/bloc/anime_search_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/data/mocks/search_repository_mock.dart';

void main() {
  group('search_bloc_test', () {
    late SearchRepository searchRepository;
    late UserDataRepository userDataRepository;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});

      final sharedPref = await SharedPreferences.getInstance();
      UserDataPreferences preferences = UserDataPreferences(sharedPref);
      userDataRepository = UserDataRepository(preferences);
      searchRepository = MockSearchRepository();
    });

    tearDown(() async {});

    blocTest(
      'OnSearchStringCommit',
      build: () => SearchPageBloc(searchRepository, userDataRepository),
      act: (bloc) => bloc.add(OnSearchStringCommit(searchString: "Test")),
      expect: () => isNotEmpty,
    );
  });
}
