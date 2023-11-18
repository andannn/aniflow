import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/airing_schedule/bloc/airing_schedule_bloc.dart';
import 'package:aniflow/feature/airing_schedule/bloc/schedule_page_key.dart';
import 'package:aniflow/feature/airing_schedule/bloc/schedule_page_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('airing_schedule_bloc_test', () {
    late AiringScheduleBloc airingScheduleBloc;
    final animeDatabase = AniflowDatabase();

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await AniFlowPreferences().init();
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      await animeDatabase.initDatabase(path: inMemoryDatabasePath);
      airingScheduleBloc = AiringScheduleBloc(
          mediaInfoRepository: MediaInformationRepositoryImpl());
    });

    test('test_data_time', () async {
      await Future.delayed(const Duration(seconds: 4));
      expect(airingScheduleBloc.state.schedulePageMap.keys,
          equals([SchedulePageKey(dayFromNow: 0, dateTime: DateTime.now())]));

      expect(
          airingScheduleBloc.state.schedulePageMap[
                  SchedulePageKey(dayFromNow: 0, dateTime: DateTime.now())]
              is SchedulePageReady,
          equals(true));
    });
  });
}
