import 'package:aniflow/core/common/model/stats_type.dart';
import 'package:aniflow/core/common/model/user_statics_sort.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/user_statistics_model.dart';
import 'package:aniflow/core/data/user_statistics_repository.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('activity_repository_test', () {
    UserStatisticsRepository repository = UserStatisticsRepositoryImpl();

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      SharedPreferences.setMockInitialValues({});
      await AniFlowPreferences().init();
      isUnitTest = true;
    });

    test('get_statics', () async {
      final result = await repository.getUserStatics(
          userId: '6378393',
          type: StatsType.aimeGenres,
          sort: UserStaticsSort.count);
      expect(result.runtimeType, LoadSuccess<List<UserStatisticsModel>>);
    });
  });
}
