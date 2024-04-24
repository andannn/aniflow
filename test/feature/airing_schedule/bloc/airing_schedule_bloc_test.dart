import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:aniflow/feature/airing_schedule/bloc/airing_schedule_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'airing_schedule_bloc_test.mocks.dart';

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
      build: () =>
          AiringScheduleBloc(mediaInformationRepository, userDataRepository),
      expect: () => isNotEmpty,
    );
  });
}
