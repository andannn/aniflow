import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/hi_animation_repository.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/data/mocks/auth_repository_mock.dart';
import '../../../core/data/mocks/media_information_repository_mock.dart';
import '../../../core/data/mocks/mock_favorite_repository.dart';
import '../../../core/data/mocks/mock_hi_animation_repository.dart';
import '../../../core/data/mocks/mock_media_list_repository.dart';

void main() {
  group('detail_media_bloc_test', () {
    late UserDataRepository userDataRepository;
    late MediaInformationRepository mediaRepository;
    late FavoriteRepository favoriteRepository;
    late AuthRepository authRepository;
    late MediaListRepository mediaListRepository;
    late HiAnimationRepository hiAnimationRepository;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});

      final sharedPref = await SharedPreferences.getInstance();
      UserDataPreferences preferences = UserDataPreferences(sharedPref);
      userDataRepository = UserDataRepository(preferences);
      mediaRepository = MockMediaInformationRepository();
      authRepository = MockAuthRepository();
      favoriteRepository = MockFavoriteRepository();
      mediaListRepository = MockMediaListRepository();
      hiAnimationRepository = MockHiAnimationRepository();
    });

    tearDown(() async {});

    blocTest(
      'Init state',
      build: () => DetailMediaBloc(
          '1',
          authRepository,
          favoriteRepository,
          userDataRepository,
          mediaRepository,
          mediaListRepository,
          hiAnimationRepository,
          MessageRepository()),
      expect: () => isNotEmpty,
    );
  });
}
