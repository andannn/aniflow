import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:aniflow/feature/search/bloc/search_bloc.dart';
import 'package:aniflow/feature/search/bloc/search_state.dart';
import 'package:aniflow/feature/search/bloc/search_type.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('search_bloc_test', () {
    late UserDataRepository userDataRepository;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});

      final sharedPref = await SharedPreferences.getInstance();
      UserDataPreferences preferences = UserDataPreferences(sharedPref);
      userDataRepository = UserDataRepository(preferences);
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
