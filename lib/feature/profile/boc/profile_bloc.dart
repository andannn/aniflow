import 'dart:async';

import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/feature/profile/boc/profile_state.dart';
import 'package:bloc/bloc.dart';

sealed class ProfileEvent {}

class _OnUserDataLoaded extends ProfileEvent {
  _OnUserDataLoaded({required this.userData});

  final UserModel userData;
}

class OnFavoritePageLoadingStateChanged extends ProfileEvent {
  OnFavoritePageLoadingStateChanged({required this.isLoading});

  final bool isLoading;
}

class OnMediaPageLoadingStateChanged extends ProfileEvent {
  OnMediaPageLoadingStateChanged({required this.isLoading});

  final bool isLoading;
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required AuthRepository authRepository,
    String? userId,
  }) : super(ProfileState()) {
    on<_OnUserDataLoaded>(_onUserDataLoaded);
    on<OnFavoritePageLoadingStateChanged>(_onFavoritePageLoadingStateChanged);
    on<OnMediaPageLoadingStateChanged>(_onMediaPageLoadingStateChanged);

    _userDataSub =
        authRepository.getUserDataStream().distinct().listen((userData) {
      if (userData != null) {
        add(_OnUserDataLoaded(userData: userData));
      }
    });
  }

  StreamSubscription? _userDataSub;

  @override
  Future<void> close() {
    _userDataSub?.cancel();

    return super.close();
  }

  FutureOr<void> _onUserDataLoaded(
      _OnUserDataLoaded event, Emitter<ProfileState> emit) {
    emit(state.copyWith(userData: event.userData));
  }

  FutureOr<void> _onFavoritePageLoadingStateChanged(
      OnFavoritePageLoadingStateChanged event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isFavoriteLoading: event.isLoading));
  }

  FutureOr<void> _onMediaPageLoadingStateChanged(
      OnMediaPageLoadingStateChanged event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isMediaListPageLoading: event.isLoading));
  }
}
