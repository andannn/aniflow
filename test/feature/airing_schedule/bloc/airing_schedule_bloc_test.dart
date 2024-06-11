import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:aniflow/feature/airing_schedule/bloc/airing_schedule_page_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/data/mocks/media_information_repository_mock.dart';

void main() {
  group('airing_schedule_bloc_test', () {
    late MediaInformationRepository mediaInformationRepository;
    late UserDataRepository userDataRepository;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});

      final sharedPref = await SharedPreferences.getInstance();
      UserDataPreferences preferences = UserDataPreferences(sharedPref);
      userDataRepository = UserDataRepository(preferences);
      mediaInformationRepository = MockMediaInformationRepository();
    });

    tearDown(() async {});

    blocTest(
      'initial state',
      build: () => AiringSchedulePageBloc(
        mediaInformationRepository,
        userDataRepository,
        MessageRepository(),
      ),
      expect: () => isNotEmpty,
    );

    blocTest(
      'OnRequestScheduleData event state.',
      build: () => AiringSchedulePageBloc(
        mediaInformationRepository,
        userDataRepository,
        MessageRepository(),
      ),
      act: (bloc) => bloc.add(OnRequestScheduleData(1)),
      expect: () => isNotEmpty,
    );
  });
}
