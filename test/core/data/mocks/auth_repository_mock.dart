import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

class MockAuthRepository extends Fake implements AuthRepository {
  ReplaySubject<UserModel?> model = ReplaySubject(maxSize: 1);

  @override
  Future<bool> awaitAuthLogin() async {
    model.add(UserModel(id: '1', name: "User1"));
    return true;
  }

  @override
  Future logout() async {
    model.add(null);
  }

  @override
  Stream<UserModel?> getAuthedUserStream() {
    return model;
  }
}
