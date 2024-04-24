import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/user_info_repository.dart';
import 'package:aniflow/core/data/aniflow_preferences_repository.dart';
import 'package:aniflow/feature/profile/profile_state.dart';
import 'package:aniflow/main.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

mixin LoadingStateRepository<T> {
  final Map<T, bool> _loadingStateMap = {};

  bool _isLoading = true;

  @protected
  void onLoadingStateChanged(bool isLoading);

  void setLoadingState(T type, bool isLoading) {
    _loadingStateMap[type] = isLoading;
    logger.d(
        'loading state changed type $type , loadingStateMap $_loadingStateMap');
    final newState = _loadingStateMap.entries.any((entry) => entry.value);

    if (_isLoading != newState) {
      onLoadingStateChanged(newState);
      _isLoading = newState;
    }
  }
}

mixin LoadingStateNotifier<Event, State> on Bloc<Event, State> {
  LoadingStateRepository? loadingStateRepository;

  @override
  void onChange(Change<State> change) {
    super.onChange(change);

    loadingStateRepository?.setLoadingState(
      runtimeType,
      isLoading(change.nextState),
    );
  }

  bool isLoading(State state);
}

sealed class ProfileEvent {}

class _OnUserDataLoaded extends ProfileEvent {
  _OnUserDataLoaded({required this.userData});

  final UserModel userData;
}

class _LoadingStateChanged extends ProfileEvent {
  _LoadingStateChanged({required this.isLoading});

  final bool isLoading;
}

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState>
    with LoadingStateRepository<Type> {
  ProfileBloc(
    @factoryParam this._userId,
    this._userInfoRepository,
  ) : super(ProfileState()) {
    on<_OnUserDataLoaded>(
      (event, emit) => emit(state.copyWith(userData: event.userData)),
    );
    on<_LoadingStateChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );

    _init();
  }

  final String? _userId;
  final UserInfoRepository _userInfoRepository;

  void _init() async {
    final userId =
        _userId ?? getIt.get<AfPreferencesRepository>().userData.authedUserId;
    final userData = await _userInfoRepository.getUserDataById(userId!);
    add(_OnUserDataLoaded(userData: userData));
  }

  @override
  void onLoadingStateChanged(bool isLoading) {
    add(_LoadingStateChanged(isLoading: isLoading));
  }
}
