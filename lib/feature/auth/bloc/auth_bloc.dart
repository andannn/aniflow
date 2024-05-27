import 'dart:async';

import 'package:aniflow/app/app.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/design_system/widget/aniflow_snackbar.dart';
import 'package:aniflow/feature/auth/bloc/auth_ui_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository) : super(AuthState()) {
    on<OnLoginButtonTapped>(_onLoginButtonTapped);
    on<OnLogoutButtonTapped>(_onLogoutButtonTapped);
    on<_OnUserDataChanged>(_onUserDataChanged);

    _userDataSub = _authRepository
        .getAuthedUserStream()
        .distinct()
        .listen((userDataNullable) {
      add(_OnUserDataChanged(userDataNullable));
    });
  }

  final AuthRepository _authRepository;

  StreamSubscription? _userDataSub;

  @override
  Future<void> close() {
    _userDataSub?.cancel();

    return super.close();
  }

  Future<void> _onLoginButtonTapped(
      OnLoginButtonTapped event, Emitter<AuthState> emit) async {
    final isSuccess = await _authRepository.awaitAuthLogin();
    if (isSuccess) {
      logger.d('login success');
      showSnackBarMessage(
          label: globalContext!.appLocal.loginSuccessMessage);
    } else {
      showSnackBarMessage(
          label: globalContext!.appLocal.loginFailedMessage);
    }
  }

  FutureOr<void> _onLogoutButtonTapped(
      OnLogoutButtonTapped event, Emitter<AuthState> emit) async {
    await _authRepository.logout();

    if (globalContext != null) {
      Navigator.pop(globalContext!);
    }

    showSnackBarMessage(
        label: globalContext!.appLocal.logoutSuccessMessage);
  }

  FutureOr<void> _onUserDataChanged(
      _OnUserDataChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(userData: event.userData));
  }
}
