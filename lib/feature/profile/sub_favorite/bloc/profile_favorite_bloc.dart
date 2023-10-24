import 'dart:async';

import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/collection_util.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/design_system/widget/aniflow_snackbar.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/profile_favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class ProfileFavoriteEvent {}

class _OnLoadStateChanged extends ProfileFavoriteEvent {
  _OnLoadStateChanged(this.isLoading);

  final bool isLoading;
}

class _OnMediaLoaded extends ProfileFavoriteEvent {
  _OnMediaLoaded(this.dataList, this.type);

  final List dataList;
  final FavoriteType type;
}

class ProfileFavoriteBloc
    extends Bloc<ProfileFavoriteEvent, ProfileFavoriteState> {
  ProfileFavoriteBloc(
    String userId,
    FavoriteRepository favoriteRepository,
  )   : _userId = userId,
        _favoriteRepository = favoriteRepository,
        super(ProfileFavoriteState()) {
    on<_OnLoadStateChanged>(_onLoadStateChanged);
    on<_OnMediaLoaded>(_onMediaLoaded);

    _init();
  }

  final String _userId;
  final FavoriteRepository _favoriteRepository;

  void _init() async {
    unawaited(_reloadAllFavoriteData(isRefresh: false));
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
    final loadType = isRefresh
        ? const Refresh()
        : const Append(page: 1, perPage: Config.defaultPerPageCount);

    switch (favoriteType) {
      case FavoriteType.anime:
        result = await _favoriteRepository.loadFavoriteMediaByPage(
            type: MediaType.anime, userId: _userId, loadType: loadType);
      case FavoriteType.manga:
        result = await _favoriteRepository.loadFavoriteMediaByPage(
            type: MediaType.manga, userId: _userId, loadType: loadType);
      case FavoriteType.character:
        result = await _favoriteRepository.loadFavoriteCharacterByPage(
            userId: _userId, loadType: loadType);
      case FavoriteType.staff:
        result = await _favoriteRepository.loadFavoriteStaffByPage(
            userId: _userId, loadType: loadType);
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
      _OnMediaLoaded event, Emitter<ProfileFavoriteState> emit) {
    final result = PageReady(data: event.dataList, page: 1);
    final favoriteType = event.type;

    Map<FavoriteType, PagingState<List>> stateMap =
        state.favoriteDataMap.toMutableMap()..[favoriteType] = result;

    final newState = state.copyWith(favoriteDataMap: stateMap);

    emit(newState);
  }

  FutureOr<void> _onLoadStateChanged(
      _OnLoadStateChanged event, Emitter<ProfileFavoriteState> emit) {}
}
