import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [AfEnvironment.mock], as: AuthRepository)
class MockAuthRepository implements AuthRepository {
  @override
  Future<bool> awaitAuthLogin() {
    return Future.value(true);
  }

  @override
  Future<UserModel?> getAuthedUser() {
    return Future.value(null);
  }

  @override
  Stream<UserModel?> getAuthedUserStream() {
    return Stream.value(UserModel(
      id: '1',
      name: 'User1',
    ));
  }

  @override
  Future logout() async {}

  @override
  Future<LoadResult> syncUserCondition() {
    return Future.value(LoadSuccess(data: null));
  }

  @override
  Future<LoadResult> updateUserSettings(
      {UserTitleLanguage? userTitleLanguage,
      UserStaffNameLanguage? userStaffNameLanguage,
      bool? displayAdultContent,
      ScoreFormat? scoreFormat,
      CancelToken? token}) {
    return Future.value(LoadSuccess(data: null));
  }
}
