import 'dart:async';

import 'package:anime_tracker/app/local/ani_flow_localizations.dart';
import 'package:anime_tracker/core/data/logger/logger.dart';
import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/data/model/page_loading_state.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/data/repository/anime_track_list_repository.dart';
import 'package:anime_tracker/core/design_system/widget/anime_tracker_snackbar.dart';
import 'package:anime_tracker/feature/discover/bloc/discover_ui_state.dart';
import 'package:bloc/bloc.dart';

import 'package:anime_tracker/core/common/global_static_constants.dart';
import 'package:anime_tracker/core/data/model/user_data_model.dart';
import 'package:anime_tracker/core/data/repository/auth_repository.dart';
import 'package:anime_tracker/core/data/repository/user_data_repository.dart';
import 'package:anime_tracker/util/anime_season_util.dart';

sealed class DiscoverEvent {}

class _OnAnimeLoaded extends DiscoverEvent {
  _OnAnimeLoaded(this.animeList, this.category);

  final List<AnimeModel> animeList;
  final AnimeCategory category;
}

class _OnAnimeLoadError extends DiscoverEvent {
  _OnAnimeLoadError(this.exception, this.category);

  final AnimeCategory category;
  final Exception exception;
}

class _OnUserDataChanged extends DiscoverEvent {
  _OnUserDataChanged(this.userData);

  final UserData? userData;
}

class _OnTrackingAnimeIdsChanged extends DiscoverEvent {
  _OnTrackingAnimeIdsChanged(this.ids);

  final Set<String> ids;
}

extension DiscoverUiStateEx on DiscoverUiState {
  bool get isLoggedIn => userData != null;
}

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverUiState> {
  DiscoverBloc(
      {required AuthRepository authRepository,
      required userDataRepository,
      required aniListRepository,
      required AnimeTrackListRepository animeTrackListRepository})
      : _userDataRepository = userDataRepository,
        _aniListRepository = aniListRepository,
        _animeTrackListRepository = animeTrackListRepository,
        super(DiscoverUiState()) {
    on<_OnAnimeLoaded>(_onAnimeLoaded);
    on<_OnAnimeLoadError>(_onAnimeLoadError);
    on<_OnUserDataChanged>(_onUserDataChanged);
    on<_OnTrackingAnimeIdsChanged>(_onTrackingAnimeIdsChanged);

    _userDataSub ??=
        authRepository.getUserDataStream().listen((userDataNullable) {
      add(_OnUserDataChanged(userDataNullable));
    });

    _init();
  }

  final UserDataRepository _userDataRepository;
  final AniListRepository _aniListRepository;
  final AnimeTrackListRepository _animeTrackListRepository;

  StreamSubscription? _userDataSub;
  StreamSubscription? _trackedAnimeIdsSub;

  @override
  void onChange(Change<DiscoverUiState> change) {
    super.onChange(change);
  }

  @override
  Future<void> close() {
    _userDataSub?.cancel();
    _trackedAnimeIdsSub?.cancel();

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

    /// request first page of Anime to show in home.
    final lastSyncTime = _userDataRepository.getLastSuccessSyncTime();
    final initialLoadResult = await Future.wait([
      _createLoadAnimePageTask(AnimeCategory.currentSeason),
      _createLoadAnimePageTask(AnimeCategory.nextSeason),
      _createLoadAnimePageTask(AnimeCategory.trending),
      _createLoadAnimePageTask(AnimeCategory.movie),
    ]);

    if (lastSyncTime == null) {
      if (!initialLoadResult.any((e) => e == false)) {
        logger.d('AimeTracker first sync success');

        /// first sync success.
        await _userDataRepository.setLastSuccessSync(DateTime.now());

        showSnackBarMessage(label: AFLocalizations.of().dataRefreshed);
        return;
      }
    }

    if (lastSyncTime != null &&
        DateTime.now().difference(lastSyncTime).inMinutes >
            Config.refreshIntervalInMinutes) {
      /// Refresh all data.
      await refreshAnime();
    }
  }

  Future<void> refreshAnime() async {
    /// wait refresh tasks.
    final result = await Future.wait([
      _createLoadAnimePageTask(AnimeCategory.currentSeason, isRefresh: true),
      _createLoadAnimePageTask(AnimeCategory.nextSeason, isRefresh: true),
      _createLoadAnimePageTask(AnimeCategory.trending, isRefresh: true),
      _createLoadAnimePageTask(AnimeCategory.movie, isRefresh: true),
    ]);
    if (!result.any((e) => e == false)) {
      logger.d('AimeTracker refresh success');

      /// data sync success and show snack bar message.
      showSnackBarMessage(label: AFLocalizations.of().dataRefreshed);

      /// refresh success, update sync time.
      await _userDataRepository.setLastSuccessSync(DateTime.now());
    } else {
      /// data sync failed and show snack bar message.
      showSnackBarMessage(label: AFLocalizations.of().dataRefreshFailed);
    }
  }

  Future<bool> _createLoadAnimePageTask(AnimeCategory category,
      {bool isRefresh = false}) async {
    final LoadResult result;
    if (isRefresh) {
      result =
          await _aniListRepository.refreshAnimeByCategory(category: category);
    } else {
      result = await _aniListRepository.getAnimePageByCategory(
          category: category, page: 1);
    }
    switch (result) {
      case LoadSuccess<AnimeModel>(data: final data):
        add(_OnAnimeLoaded(data, category));
        return true;
      case LoadError<AnimeModel>(exception: final exception):
        add(_OnAnimeLoadError(exception, category));
        return false;
      default:
        return false;
    }
  }

  FutureOr<void> _onAnimeLoaded(
      _OnAnimeLoaded event, Emitter<DiscoverUiState> emit) {
    final result = PageReady(data: event.animeList, page: 1);
    switch (event.category) {
      case AnimeCategory.nextSeason:
        emit(state.copyWith(nextSeasonPagingState: result));
      case AnimeCategory.currentSeason:
        emit(state.copyWith(currentSeasonPagingState: result));
      case AnimeCategory.trending:
        emit(state.copyWith(trendingPagingState: result));
      case AnimeCategory.movie:
        emit(state.copyWith(moviePagingState: result));
    }
  }

  FutureOr<void> _onAnimeLoadError(
      _OnAnimeLoadError event, Emitter<DiscoverUiState> emit) {}

  Future<void> _onUserDataChanged(
      _OnUserDataChanged event, Emitter<DiscoverUiState> emit) async {
    emit(state.copyWith(userData: event.userData));

    if (event.userData != null) {
      /// user login, start listen following anime changed.
      await _trackedAnimeIdsSub?.cancel();
      _trackedAnimeIdsSub =
          _animeTrackListRepository.getAnimeListAnimeIdsByUserStream(
        event.userData!.id,
        [AnimeListStatus.planning, AnimeListStatus.current],
      ).listen((ids) {
        add(_OnTrackingAnimeIdsChanged(ids));
      });

      /// post event to sync user anime list.
      _animeTrackListRepository.syncUserAnimeList(userId: event.userData!.id);
    } else {
      /// user logout, cancel following stream.
      await _trackedAnimeIdsSub?.cancel();
    }
  }

  FutureOr<void> _onTrackingAnimeIdsChanged(
      _OnTrackingAnimeIdsChanged event, Emitter<DiscoverUiState> emit) {
    emit(DiscoverUiState.copyWithTrackedIds(state, event.ids));
  }
}
