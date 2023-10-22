import 'dart:async';

import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/core/common/util/collection_util.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/aniflow_snackbar.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/discover/bloc/profile_tab_category.dart';
import 'package:aniflow/feature/profile/boc/profile_state.dart';
import 'package:bloc/bloc.dart';

sealed class ProfileEvent {}

class _OnUserDataLoaded extends ProfileEvent {
  _OnUserDataLoaded({required this.userData});

  final UserData userData;
}

class _OnLoadStateChanged extends ProfileEvent {
  _OnLoadStateChanged(this.isLoading);

  final bool isLoading;
}

class _OnMediaLoaded extends ProfileEvent {
  _OnMediaLoaded(this.dataList, this.type);

  final List dataList;
  final FavoriteType type;
}

class OnTabViewVisible extends ProfileEvent {
  final ProfileTabType type;

  OnTabViewVisible({required this.type});
}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required MediaListRepository mediaListRepository,
    required FavoriteRepository favoriteRepository,
    required AuthRepository authRepository,
    required UserDataRepository userDataRepository,
    String? userId,
  })  : _favoriteRepository = favoriteRepository,
        super(ProfileState()) {
    on<_OnUserDataLoaded>(_onUserDataLoaded);
    on<_OnLoadStateChanged>(_onLoadStateChanged);
    on<_OnMediaLoaded>(_onMediaLoaded);
    on<OnTabViewVisible>(onTabViewVisible);

    _userDataSub =
        authRepository.getUserDataStream().distinct().listen((userData) {
      if (userData != null) {
        add(_OnUserDataLoaded(userData: userData));
      }
    });

    _onInit();
  }

  final FavoriteRepository _favoriteRepository;
  StreamSubscription? _userDataSub;

  void _onInit() {
    add(OnTabViewVisible(type: ProfileTabType.favorite));
  }

  @override
  Future<void> close() {
    _userDataSub?.cancel();

    return super.close();
  }

  FutureOr<void> _onUserDataLoaded(
      _OnUserDataLoaded event, Emitter<ProfileState> emit) {
    emit(state.copyWith(userData: event.userData));
  }

  Future<void> _reloadAllFavoriteData({required bool isRefresh}) async {
    add(_OnLoadStateChanged(true));

    /// wait refresh tasks.
    final result = await Future.wait(_getAllLoadTask(isRefresh: isRefresh));

    if (result.any((e) => e == false)) {
      logger.d('AimeTracker refresh failed');

      /// data sync failed and show snack bar message.
      showSnackBarMessage(label: AFLocalizations.of().dataRefreshFailed);
    }

    add(_OnLoadStateChanged(false));
  }

  List<Future<bool>> _getAllLoadTask({required bool isRefresh}) {
    return FavoriteType.values
        .map((e) => _createLoadFavoriteTask(e, isRefresh: isRefresh))
        .toList();
  }

  Future<bool> _createLoadFavoriteTask(FavoriteType favoriteType,
      {bool isRefresh = false}) async {
    final LoadResult result;
    if (isRefresh) {
      result = await _favoriteRepository.loadFavoriteAnimeByPage(
          loadType: const Refresh());
    } else {
      result = await _favoriteRepository.loadFavoriteAnimeByPage(
        loadType: const Append(page: 1, perPage: Config.defaultPerPageCount),
      );
    }
    switch (result) {
      case LoadSuccess<List>(data: final data):
        add(_OnMediaLoaded(data, favoriteType));
        return true;
      case LoadError<List>(exception: final _):
        return false;
      default:
        return false;
    }
  }

  FutureOr<void> _onMediaLoaded(
      _OnMediaLoaded event, Emitter<ProfileState> emit) {
    final result = PageReady(data: event.dataList, page: 1);
    final favoriteType = event.type;

    Map<FavoriteType, PagingState<List>> stateMap =
        state.favoriteDataMap.toMutableMap()..[favoriteType] = result;

    final ProfileState newState = state.copyWith(favoriteDataMap: stateMap);

    emit(newState);
  }

  FutureOr<void> _onLoadStateChanged(
      _OnLoadStateChanged event, Emitter<ProfileState> emit) {}

  FutureOr<void> onTabViewVisible(
      OnTabViewVisible event, Emitter<ProfileState> emit) async {
    switch (event.type) {
      case ProfileTabType.favorite:
        await _reloadAllFavoriteData(isRefresh: false);

      case ProfileTabType.myList:
    }
  }
}
