// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/model/notification_type.dart';
import 'package:aniflow/core/network/api/notification_query_graphql.dart';
import 'package:aniflow/core/network/auth_data_source.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    isUnitTest = true;
  });

  group('auth_data_source_test', () {
    late AuthDataSource authDataSource;
    setUp(() async {
      isUnitTest = true;
      SharedPreferences.setMockInitialValues({});
      await AniFlowPreferences().init();
      authDataSource = AuthDataSource();
    });

    test('notification_query', () async {
      await authDataSource.getNotifications(
          param: NotificationQueryParam(
              page: 1,
              perPage: 2,
              type: [NotificationType.relatedMediaAddition]));
    });
  });
}
