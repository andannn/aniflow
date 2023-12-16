import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/user_info_repository.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/profile/profile_state.dart';
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
    required UserInfoRepository userInfoRepository,
    String? userId,
  })  : _userId = userId,
        _userInfoRepository = userInfoRepository,
        super(ProfileState()) {
    on<_OnUserDataLoaded>(
      (event, emit) => emit(state.copyWith(userData: event.userData)),
    );
    on<OnFavoritePageLoadingStateChanged>(
      (event, emit) => emit(state.copyWith(isFavoriteLoading: event.isLoading)),
    );
    on<OnMediaPageLoadingStateChanged>(
      (event, emit) =>
          emit(state.copyWith(isMediaListPageLoading: event.isLoading)),
    );

    _init();
  }

  final String? _userId;
  final UserInfoRepository _userInfoRepository;

  void _init() async {
    final userId = _userId ?? AniFlowPreferences().getAuthedUserId();
    final userData = await _userInfoRepository.getUserDataById(userId!);
    add(_OnUserDataLoaded(userData: userData));
  }
}
