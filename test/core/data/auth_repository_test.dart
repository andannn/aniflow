import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/user_dao.dart';
import 'package:aniflow/core/network/auth_data_source.dart';
import 'package:aniflow/core/network/model/media_list_option_dto.dart';
import 'package:aniflow/core/network/model/user_dto.dart';
import 'package:aniflow/core/network/model/user_options.dart';
import 'package:aniflow/core/platform/auth_event_channel.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:async/src/cancelable_operation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

void main() {
  group('auth_repository_test', () {
    late AuthRepository repository;
    late UserDataPreferences preferences;
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final mock = setupMockUrlLauncher();
      UrlLauncherPlatform.instance = mock;
      SharedPreferences.setMockInitialValues({});
      final sharedPref = await SharedPreferences.getInstance();
      preferences = UserDataPreferences(sharedPref);
      AuthDataSource authDataSource = MockAuthDataSource();
      UserDao userDao = MockUserDataDao();
      AuthEventChannel eventChannel = MockAuthEventChannel();
      repository =
          AuthRepository(authDataSource, userDao, preferences, eventChannel);
    });

    test('cancel auth operation', () async {
      final operation = repository.loginProcessOperation();
      expect(operation.isCompleted, false);
      final res = await Future.wait([
        operation.valueOrCancellation(),
        Future.delayed(const Duration(milliseconds: 10)).then((_) async {
          await operation.cancel();
        }),
      ]);
      expect(res[0], null);
    });

    test('complete auth operation', () async {
      final operation = repository.loginProcessOperation();
      expect(operation.isCompleted, false);
      final res = await Future.wait([
        operation.valueOrCancellation(),
      ]);
      expect(res[0], true);
    });
  });
}

class MockAuthDataSource extends Fake implements AuthDataSource {
  @override
  Future<UserDto> getAuthedUserDataDto() {
    return Future.value(
      UserDto(
        id: 1,
        name: 'name',
        avatar: {'large': 'large'},
        bannerImage: 'bannerImage',
        unreadNotificationCount: 1,
        options: UserOptions(profileColor: 'profileColor'),
        mediaListOptions: MediaListOptionDto(),
        siteUrl: 'siteUrl',
      ),
    );
  }
}

class MockUrlLauncher extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {
  @override
  Future<bool> canLaunch(String url) {
    return Future.value(true);
  }
}

MockUrlLauncher setupMockUrlLauncher() {
  final mock = MockUrlLauncher();
  registerFallbackValue(const LaunchOptions());

  when(() => mock.launchUrl(any(), any())).thenAnswer((_) async => true);
  return mock;
}

class MockUserDataDao extends Fake implements UserDao {
  @override
  Future upsertUser(UserEntity user) async {}
}

class MockAuthEventChannel implements AuthEventChannel {
  @override
  CancelableOperation<AuthResult> awaitAuthResult() {
    return CancelableOperation.fromFuture(
      Future.delayed(const Duration(milliseconds: 20)).then(
        (_) => AuthResult(token: '', expiresInTime: 11222),
      ),
    );
  }
}
