import 'dart:async';

import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/anime_category.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/anime_season_util.dart';
import 'package:aniflow/core/common/util/collection_util.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/aniflow_snackbar.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/feature/discover/bloc/discover_ui_state.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

sealed class DiscoverEvent {}

class _OnMediaLoaded extends DiscoverEvent {
  _OnMediaLoaded(this.animeList, this.category);

  final List<MediaModel> animeList;
  final MediaCategory category;
}

class _OnMediaLoadError extends DiscoverEvent {
  _OnMediaLoadError(this.exception, this.category);

  final MediaCategory category;
  final Exception exception;
}

class _OnUserDataChanged extends DiscoverEvent {
  _OnUserDataChanged(this.userData);

  final UserModel? userData;
}

class _OnAniListSettingsChanged extends DiscoverEvent {
  _OnAniListSettingsChanged(this.settings);

  final AniListSettings settings;
}

class _OnTrackingMediaIdsChanged extends DiscoverEvent {
  _OnTrackingMediaIdsChanged(this.ids);

  final Set<String> ids;
}

class _OnNextToWatchMediaChanged extends DiscoverEvent {
  _OnNextToWatchMediaChanged(this.mediaList);

  final List<MediaListItemModel> mediaList;
}

class _OnLoadStateChanged extends DiscoverEvent {
  _OnLoadStateChanged(this.isLoading);

  final bool isLoading;
}

class _OnMediaTypeChanged extends DiscoverEvent {
  _OnMediaTypeChanged(this.mediaType);

  final MediaType mediaType;
}

extension DiscoverUiStateEx on DiscoverUiState {
  bool get isLoggedIn => userData != null;
}

@injectable
class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverUiState> {
  DiscoverBloc(
    this._authRepository,
    this._mediaInfoRepository,
    this._mediaListRepository,
    this._userDataRepository,
  ) : super(DiscoverUiState()) {
    on<_OnMediaLoaded>(_onMediaLoaded);
    on<_OnMediaLoadError>(_onMediaLoadError);
    on<_OnUserDataChanged>(
      (event, emit) => emit(state.copyWith(userData: event.userData)),
    );
    on<_OnAniListSettingsChanged>(
      (event, emit) => emit(state.copyWith(settings: event.settings)),
    );
    on<_OnNextToWatchMediaChanged>(
      (event, emit) =>
          emit(state.copyWith(nextToWatchMediaList: event.mediaList)),
    );
    on<_OnTrackingMediaIdsChanged>(_onTrackingMediaIdsChanged);
    on<_OnMediaTypeChanged>(
      (event, emit) => emit(state.copyWith(currentMediaType: event.mediaType)),
    );
    on<_OnLoadStateChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );

    _userDataSub ??= _authRepository.getAuthedUserStream().listen(
      (userDataNullable) {
        add(_OnUserDataChanged(userDataNullable));
      },
    );

    _mediaTypeSub = _userDataRepository.userDataStream
        .map((event) => event.mediaType)
        .distinct()
        .listen(
      (mediaType) {
        add(_OnMediaTypeChanged(mediaType));
      },
    );

    _settingsSub ??= _authRepository.getAniListSettingsStream().listen(
      (settings) {
        add(_OnAniListSettingsChanged(settings));
      },
    );

    stream
        .map((e) => (e.userData?.id, e.currentMediaType))
        .distinct()
        .listen((record) async {
      var (String? userNullable, MediaType type) = record;

      await _trackedMediaIdsSub?.cancel();
      await _nextToWatchMediaSub?.cancel();
      if (userNullable != null) {
        /// user id changed, start listen following media.
        _trackedMediaIdsSub = _startListenFollowingIds(userNullable, type);
        _nextToWatchMediaSub = _startListenNextToWatchList(userNullable, type);
      }
    });

    stream
        .map((e) => e.userData?.id)
        .distinct()
        .whereNotNull()
        .listen((userId) {
      /// post event to sync user media list.
      unawaited(_syncAllMediaList(userId));

      /// post event to update user condition.
      unawaited(_authRepository.syncUserCondition());
    });

    stream.map((e) => e.currentMediaType).distinct().listen((type) async {
      /// load all media from db cache first.
      await _reloadAllMedia(mediaType: type, isRefresh: false);
      if (!_syncedMediaTypes.contains(type)) {
        /// Media's order may changed, refresh all media again.
        unawaited(_reloadAllMedia(mediaType: type, isRefresh: true));
      }
    });

    /// calculate the current anime season.
    final AnimeSeasonParam currentAnimeSeasonParam =
        AnimeSeasonUtil.getAnimeSeasonByDataTime(DateTime.now());

    /// get the saved anime season.
    final savedAnimeSeasonParam = _userDataRepository.getAnimeSeasonParam();

    if (currentAnimeSeasonParam != savedAnimeSeasonParam) {
      // season changed.
      unawaited(
        _userDataRepository.setAnimeSeasonParam(currentAnimeSeasonParam),
      );
    }
  }

  final AuthRepository _authRepository;
  final MediaInformationRepository _mediaInfoRepository;
  final MediaListRepository _mediaListRepository;
  final UserDataRepository _userDataRepository;

  StreamSubscription? _userDataSub;
  StreamSubscription? _settingsSub;
  StreamSubscription? _mediaTypeSub;
  StreamSubscription? _trackedMediaIdsSub;
  StreamSubscription? _nextToWatchMediaSub;

  Set<String> _followingMediaIds = {};

  final Set<MediaType> _syncedMediaTypes = {};

  @override
  Future<void> close() {
    _userDataSub?.cancel();
    _trackedMediaIdsSub?.cancel();
    _mediaTypeSub?.cancel();
    _settingsSub?.cancel();

    return super.close();
  }

  Future onPullToRefreshTriggered() {
    final userId = state.userData?.id;
    return Future.wait([
      _reloadAllMedia(mediaType: state.currentMediaType, isRefresh: true),
      if (userId != null) _syncAllMediaList(userId) else Future.value(),
    ]);
  }

  Future<void> _reloadAllMedia(
      {required MediaType mediaType, required bool isRefresh}) async {
    add(_OnLoadStateChanged(true));

    /// wait refresh tasks.
    final result =
        await Future.wait(_getAllLoadTask(mediaType, isRefresh: isRefresh));

    if (!result.any((e) => e == false)) {
      if (isRefresh) {
        _syncedMediaTypes.add(mediaType);
      }
    } else {
      logger.d('AimeTracker refresh failed');

      /// data sync failed and show snack bar message.
      showSnackBarMessage(label: AFLocalizations.of().dataRefreshFailed);
    }

    add(_OnLoadStateChanged(false));
  }

  List<Future<bool>> _getAllLoadTask(MediaType type,
      {required bool isRefresh}) {
    return MediaCategory.getALlCategoryByType(type)
        .map((e) => _createLoadMediaPageTask(e, isRefresh: isRefresh))
        .toList();
  }

  Future<bool> _createLoadMediaPageTask(MediaCategory category,
      {bool isRefresh = false}) async {
    final LoadResult result;
    if (isRefresh) {
      result = await _mediaInfoRepository.loadMediaPageByCategory(
          loadType: const Refresh(), category: category);
    } else {
      result = await _mediaInfoRepository.loadMediaPageByCategory(
        category: category,
        loadType: const Append(page: 1, perPage: AfConfig.defaultPerPageCount),
      );
    }
    switch (result) {
      case LoadSuccess<List<MediaModel>>(data: final data):
        add(_OnMediaLoaded(data, category));
        return true;
      case LoadError<List<MediaModel>>(exception: final exception):
        add(_OnMediaLoadError(exception, category));
        return false;
      default:
        return false;
    }
  }

  FutureOr<void> _onMediaLoaded(
      _OnMediaLoaded event, Emitter<DiscoverUiState> emit) {
    final result = PageReady(data: event.animeList, page: 1);
    final category = event.category;

    Map<MediaCategory, PagingState<List<MediaModel>>> stateMap =
        state.categoryMediaMap.toMutableMap()..[category] = result;

    final DiscoverUiState newState = state.copyWith(categoryMediaMap: stateMap);

    emit(DiscoverUiState.copyWithTrackedIds(newState, _followingMediaIds));
  }

  FutureOr<void> _onMediaLoadError(
      _OnMediaLoadError event, Emitter<DiscoverUiState> emit) {}

  FutureOr<void> _onTrackingMediaIdsChanged(
      _OnTrackingMediaIdsChanged event, Emitter<DiscoverUiState> emit) {
    _followingMediaIds = event.ids;
    emit(DiscoverUiState.copyWithTrackedIds(state, event.ids));
  }

  StreamSubscription<Set<String>> _startListenFollowingIds(
      String userId, MediaType type) {
    final sub = _mediaListRepository
        .getMediaListMediaIdsByUserStream(
            userId: userId,
            status: [MediaListStatus.planning, MediaListStatus.current],
            type: type)
        .distinct(
            (pre, next) => const DeepCollectionEquality().equals(pre, next))
        .listen(
      (ids) {
        add(_OnTrackingMediaIdsChanged(ids));
      },
    );

    return sub;
  }

  StreamSubscription _startListenNextToWatchList(
    String userId,
    MediaType type,
  ) {
    final sub = _mediaListRepository.getMediaListStream(
      status: [MediaListStatus.current, MediaListStatus.planning],
      userId: userId,
      type: type,
    ).listen((sorted) {
      final nextToWatchMedia = sorted.newUpdateList;
      add(_OnNextToWatchMediaChanged(nextToWatchMedia));
    });
    return sub;
  }

  Future _syncAllMediaList(String userId) async {
    return Future.wait([
      _mediaListRepository.syncMediaList(
        userId: userId,
        status: [MediaListStatus.current, MediaListStatus.planning],
        mediaType: _userDataRepository.userData.mediaType,
      ),
    ]);
  }
}
