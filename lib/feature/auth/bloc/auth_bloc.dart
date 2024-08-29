import 'dart:async';

import 'package:aniflow/core/common/message/snack_bar_message.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/feature/auth/bloc/auth_ui_state.dart';
import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class AuthEvent {}

class OnLoginButtonTapped extends AuthEvent {}

class OnLogoutButtonTapped extends AuthEvent {}

class _OnUserDataChanged extends AuthEvent {
  _OnUserDataChanged(this.userData);

  final UserModel? userData;
}

extension AuthStateEx on AuthState {
  bool get isLoggedIn => userData != null;
}

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> with AutoCancelMixin {
  AuthBloc(
    this._authRepository,
    this._messageRepository,
  ) : super(AuthState()) {
    on<OnLoginButtonTapped>(_onLoginButtonTapped);
    on<OnLogoutButtonTapped>(_onLogoutButtonTapped);
    on<_OnUserDataChanged>(_onUserDataChanged);

    autoCancel(
      () => _authRepository
          .getAuthedUserStream()
          .distinct()
          .listen((userDataNullable) {
        safeAdd(_OnUserDataChanged(userDataNullable));
      }),
    );
  }

  final AuthRepository _authRepository;
  final MessageRepository _messageRepository;

  CancelableOperation<bool?>? _loginOperation;

  Future<void> _onLoginButtonTapped(
      OnLoginButtonTapped event, Emitter<AuthState> emit) async {
    final operation = _authRepository.loginProcessOperation();

    await _loginOperation?.cancel();
    final result = await operation.valueOrCancellation();
    if (result == null) {
      return;
    }

    if (result) {
      logger.d('login success');
      _messageRepository.showMessage(const LoginSuccessMessage());
    } else {
      _messageRepository.showMessage(const LoginFailedMessage());
    }
  }

  FutureOr<void> _onLogoutButtonTapped(
      OnLogoutButtonTapped event, Emitter<AuthState> emit) async {
    await _authRepository.logout();
    _messageRepository.showMessage(const LogoutMessage());
  }

  FutureOr<void> _onUserDataChanged(
      _OnUserDataChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(userData: event.userData));
  }
}
