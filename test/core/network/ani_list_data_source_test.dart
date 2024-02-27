import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ani_list_data_source_api_test', () {
    // late AniListDataSource dataSource;
    setUp(() async {
      isUnitTest = true;
      SharedPreferences.setMockInitialValues({});
      await AniFlowPreferences().init();
      // dataSource = AniListDataSource();
    });

    test('__', () async {});
  });
}
