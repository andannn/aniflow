import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart';
import 'package:aniflow/feature/auth/bloc/auth_ui_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../core/data/mocks/auth_repository_mock.dart';

void main() {
  group('auth_bloc_test', () {
    late AuthRepository authRepository;
    late MessageRepository messageRepository;

    setUp(() async {
      authRepository = MockAuthRepository();
      messageRepository = MessageRepository();
    });

    tearDown(() async {});

    blocTest(
      'Init state',
      build: () => AuthBloc(authRepository, messageRepository),
      expect: () => [],
    );

    blocTest(
      'OnLoginButtonTapped',
      build: () => AuthBloc(authRepository, messageRepository),
      act: (bloc) => bloc.add(OnLoginButtonTapped()),
      expect: () => [AuthState(userData: UserModel(id: '1', name: 'User1'))],
    );

    blocTest(
      'OnLogoutButtonTapped',
      build: () => AuthBloc(authRepository, messageRepository),
      seed: () => AuthState(userData: UserModel(id: '1', name: 'User1')),
      act: (bloc) => bloc.add(OnLogoutButtonTapped()),
      expect: () => [AuthState(userData: null)],
    );
  });
}
