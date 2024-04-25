import 'package:aniflow/core/common/definitions/staff_language.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:aniflow/feature/character_page/bloc/character_page_bloc.dart';
import 'package:aniflow/feature/character_page/bloc/character_page_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('character_page_bloc_test', () {
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
      'Init state',
      build: () => CharacterPageBloc(userDataRepository),
      expect: () => [],
    );

    blocTest(
      'OnStaffLanguageChanged',
      build: () => CharacterPageBloc(userDataRepository),
      act: (bloc) =>
          bloc.add(OnStaffLanguageChanged(staffLanguage: StaffLanguage.german)),
      expect: () => [CharacterPageState(language: StaffLanguage.german)],
    );
  });
}
