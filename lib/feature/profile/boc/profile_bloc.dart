import 'dart:async';

import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/profile/boc/profile_state.dart';
import 'package:bloc/bloc.dart';

sealed class ProfileEvent {}

class _OnUserDataLoaded extends ProfileEvent {
  _OnUserDataLoaded({required this.userData});

  final UserData userData;
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required MediaListRepository mediaListRepository,
    required AuthRepository authRepository,
    required UserDataRepository userDataRepository,
    String? userId,
  }) : super(ProfileState()) {
    on<_OnUserDataLoaded>(_onUserDataLoaded);

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
}
