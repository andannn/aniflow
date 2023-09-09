import 'dart:async';

import 'package:anime_tracker/core/data/model/user_data_model.dart';
import 'package:anime_tracker/core/data/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';

import '../../../core/data/logger/logger.dart';
import 'auth_ui_state.dart';

sealed class AuthEvent {}

class OnLoginButtonTapped extends AuthEvent {}

class OnLogoutButtonTapped extends AuthEvent {}

class _OnUserDataChanged extends AuthEvent {
  _OnUserDataChanged(this.userData);

  final UserData? userData;
}

extension AuthStateEx on AuthState {
  bool get isLoggedIn => userData != null;
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthState()) {
    on<OnLoginButtonTapped>(_onLoginButtonTapped);
    on<OnLogoutButtonTapped>(_onLogoutButtonTapped);
    on<_OnUserDataChanged>(_onUserDataChanged);

    _userDataSub = authRepository.getUserDataStream().listen((userDataNullable) {
      add(_OnUserDataChanged(userDataNullable));
    });
  }

  StreamSubscription? _userDataSub;

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    logger.d('JQN change ${change.nextState}');
  }
  @override
  Future<void> close() {
    _userDataSub?.cancel();

    return super.close();
  }

  final AuthRepository _authRepository;

  Future<void> _onLoginButtonTapped(
      OnLoginButtonTapped event, Emitter<AuthState> emit) async {
    final isSuccess = await _authRepository.awaitAuthLogin();
    if (isSuccess) {
      logger.d('login success');
    } else {
// TODO: add auth failed process.
    }
  }

  FutureOr<void> _onLogoutButtonTapped(
      OnLogoutButtonTapped event, Emitter<AuthState> emit) {}

  FutureOr<void> _onUserDataChanged(
      _OnUserDataChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(userData: event.userData));
  }
}
