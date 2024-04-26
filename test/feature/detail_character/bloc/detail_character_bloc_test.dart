import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:aniflow/feature/detail_character/bloc/detail_character_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/data/mocks/media_information_repository_mock.dart';
import '../../../core/data/mocks/mock_favorite_repository.dart';

void main() {
  group('detail_character_bloc_test', () {
    late UserDataRepository userDataRepository;
    late MediaInformationRepository mediaRepository;
    late FavoriteRepository favoriteRepository;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});

      final sharedPref = await SharedPreferences.getInstance();
      UserDataPreferences preferences = UserDataPreferences(sharedPref);
      userDataRepository = UserDataRepository(preferences);
      mediaRepository = MockMediaInformationRepository();
      favoriteRepository = MockFavoriteRepository();
    });

    tearDown(() async {});

    blocTest(
      'Init state',
      build: () => DetailCharacterBloc(
        '1',
        mediaRepository,
        favoriteRepository,
        userDataRepository,
      ),
      expect: () => isNotEmpty,
    );

    blocTest(
      'OnToggleLike event',
      build: () => DetailCharacterBloc(
        '1',
        mediaRepository,
        favoriteRepository,
        userDataRepository,
      ),
      act: (bloc) => bloc.add(OnToggleLike()),
      expect: () => isNotEmpty,
    );
  });
}
