import 'dart:async';

import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/anime_season_util.dart';
import 'package:aniflow/core/common/util/collection_util.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/aniflow_snackbar.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/discover/bloc/discover_ui_state.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';

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

  final UserData? userData;
}

class _OnTrackingMediaIdsChanged extends DiscoverEvent {
  _OnTrackingMediaIdsChanged(this.ids);

  final Set<String> ids;
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

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverUiState> {
  DiscoverBloc(
      {required AuthRepository authRepository,
      required userDataRepository,
      required aniListRepository,
      required MediaListRepository animeTrackListRepository})
      : _userDataRepository = userDataRepository,
        _authRepository = authRepository,
        _mediaInfoRepository = aniListRepository,
        _mediaListRepository = animeTrackListRepository,
        super(DiscoverUiState()) {
    on<_OnMediaLoaded>(_onMediaLoaded);
    on<_OnMediaLoadError>(_onMediaLoadError);
    on<_OnUserDataChanged>(_onUserDataChanged);
    on<_OnTrackingMediaIdsChanged>(_onTrackingMediaIdsChanged);
    on<_OnMediaTypeChanged>(_onMediaTypeChanged);
    on<_OnLoadStateChanged>(_onLoadStateChanged);

    _init();
  }

  final UserDataRepository _userDataRepository;
  final AuthRepository _authRepository;
  final MediaInformationRepository _mediaInfoRepository;
  final MediaListRepository _mediaListRepository;

  StreamSubscription? _userDataSub;
  StreamSubscription? _mediaTypeSub;
  StreamSubscription? _trackedMediaIdsSub;

  Set<String> _followingMediaIds = {};
  String? _userId;

  final Set<MediaType> _syncedMediaTypes = {};

  @override
  void onChange(Change<DiscoverUiState> change) {
    super.onChange(change);
  }

  @override
  Future<void> close() {
    _userDataSub?.cancel();
    _trackedMediaIdsSub?.cancel();
    _mediaTypeSub?.cancel();

    return super.close();
  }

  void _init() async {
    /// calculate the current anime season.
    final AnimeSeasonParam currentAnimeSeasonParam =
        AnimeSeasonUtil.getAnimeSeasonByDataTime(DateTime.now());

    /// get the saved anime season.
    final savedAnimeSeasonParam = _userDataRepository.getAnimeSeasonParam();

    if (currentAnimeSeasonParam != savedAnimeSeasonParam) {
      // season changed.
      await _userDataRepository.setAnimeSeasonParam(currentAnimeSeasonParam);
    }

    _userDataSub ??= _authRepository.getUserDataStream().listen(
      (userDataNullable) {
        add(_OnUserDataChanged(userDataNullable));
      },
    );

    _mediaTypeSub = _userDataRepository.getMediaTypeStream().distinct().listen(
      (mediaType) {
        logger.d(mediaType);
        add(_OnMediaTypeChanged(mediaType));
      },
    );
  }

  Future<void> _onMediaTypeChanged(
      _OnMediaTypeChanged event, Emitter<DiscoverUiState> emit) async {
    final type = event.mediaType;

    emit(state.copyWith(currentMediaType: type));

    /// load all media from db cache first.
    await _reloadAllMedia(mediaType: type, isRefresh: false);

    if (!_syncedMediaTypes.contains(type)) {
      /// Media's order may changed, refresh all media again.
      unawaited(_reloadAllMedia(mediaType: type, isRefresh: true));
    }

    /// re-collecting following media ids, because of media type changed.
    _startListenFollowingIds();
  }

  Future onPullToRefreshTriggered() {
    return Future.wait([
      _reloadAllMedia(mediaType: state.currentMediaType, isRefresh: true),
      if (_userId != null) _syncAllMediaList(_userId!) else Future.value(),
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
        loadType: const Append(page: 1, perPage: Config.defaultPerPageCount),
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

  Future<void> _onUserDataChanged(
      _OnUserDataChanged event, Emitter<DiscoverUiState> emit) async {
    emit(state.copyWith(userData: event.userData));

    if (event.userData != null) {
      _userId = event.userData!.id;

      /// user login, start listen following anime changed.
      _startListenFollowingIds();

      /// post event to sync user anime list.
      unawaited(_syncAllMediaList(event.userData!.id));
    } else {
      /// user logout, cancel following stream.
      await _trackedMediaIdsSub?.cancel();
    }
  }

  FutureOr<void> _onTrackingMediaIdsChanged(
      _OnTrackingMediaIdsChanged event, Emitter<DiscoverUiState> emit) {
    _followingMediaIds = event.ids;
    emit(DiscoverUiState.copyWithTrackedIds(state, event.ids));
  }

  FutureOr<void> _onLoadStateChanged(
      _OnLoadStateChanged event, Emitter<DiscoverUiState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  void _startListenFollowingIds() async {
    final userId = _userId;

    if (userId == null) return;

    await _trackedMediaIdsSub?.cancel();
    _trackedMediaIdsSub = _mediaListRepository
        .getMediaListMediaIdsByUserStream(
            userId: userId,
            status: [MediaListStatus.planning, MediaListStatus.current],
            type: state.currentMediaType)
        .distinct(
            (pre, next) => const DeepCollectionEquality().equals(pre, next))
        .listen(
      (ids) {
        add(_OnTrackingMediaIdsChanged(ids));
      },
    );
  }

  Future _syncAllMediaList(String userId) async {
    return Future.wait([
      _mediaListRepository.syncUserAnimeList(
          userId: userId,
          status: [MediaListStatus.current, MediaListStatus.planning],
          mediaType: MediaType.manga),
      _mediaListRepository.syncUserAnimeList(
          userId: userId,
          status: [MediaListStatus.current, MediaListStatus.planning],
          mediaType: MediaType.anime),
    ]);
  }
}
