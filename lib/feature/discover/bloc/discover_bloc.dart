import 'dart:async';

import 'package:anime_tracker/app/local/anime_tracker_localizations.dart';
import 'package:anime_tracker/core/data/logger/logger.dart';
import 'package:anime_tracker/core/data/model/page_loading_state.dart';
import 'package:anime_tracker/core/data/model/shortcut_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/designsystem/widget/anime_tracker_snackbar.dart';
import 'package:anime_tracker/feature/discover/bloc/discover_ui_state.dart';
import 'package:bloc/bloc.dart';

import '../../../core/common/global_static_constants.dart';
import '../../../core/data/model/user_data_model.dart';
import '../../../core/data/repository/auth_repository.dart';
import '../../../core/data/repository/userDataRepository.dart';
import '../../../util/anime_season_util.dart';

sealed class DiscoverEvent {}

class _OnAnimeLoaded extends DiscoverEvent {
  _OnAnimeLoaded(this.animeList, this.category);

  final List<ShortcutAnimeModel> animeList;
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

extension DiscoverUiStateEx on DiscoverUiState {
  bool get isLoggedIn => userData != null;
}

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverUiState> {
  DiscoverBloc(
      {required AuthRepository authRepository,
      required userDataRepository,
      required aniListRepository})
      : _userDataRepository = userDataRepository,
        _aniListRepository = aniListRepository,
        _authRepository = authRepository,
        super(DiscoverUiState()) {
    on<_OnAnimeLoaded>(_onAnimeLoaded);
    on<_OnAnimeLoadError>(_onAnimeLoadError);
    on<_OnUserDataChanged>(_onUserDataChanged);

    _userDataSub =
        authRepository.getUserDataStream().listen((userDataNullable) {
      add(_OnUserDataChanged(userDataNullable));
    });

    _init();
  }

  final UserDataRepository _userDataRepository;
  final AniListRepository _aniListRepository;
  final AuthRepository _authRepository;

  StreamSubscription? _userDataSub;

  @override
  void onChange(Change<DiscoverUiState> change) {
    super.onChange(change);
  }

  @override
  Future<void> close() {
    _userDataSub?.cancel();

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
    ]);

    if (lastSyncTime == null) {
      if (!initialLoadResult.any((e) => e == false)) {
        logger.d('AimeTracker first sync success');

        /// first sync success.
        await _userDataRepository.setLastSuccessSync(DateTime.now());

        showSnackBarMessage(label: ATLocalizations.of().dataRefreshed);
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
    ]);
    if (!result.any((e) => e == false)) {
      logger.d('AimeTracker refresh success');

      /// data sync success and show snack bar message.
      showSnackBarMessage(label: ATLocalizations.of().dataRefreshed);

      /// refresh success, update sync time.
      await _userDataRepository.setLastSuccessSync(DateTime.now());
    } else {
      /// data sync failed and show snack bar message.
      showSnackBarMessage(label: ATLocalizations.of().dataRefreshFailed);
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
      case LoadSuccess<ShortcutAnimeModel>(data: final data):
        add(_OnAnimeLoaded(data, category));
        return true;
      case LoadError<ShortcutAnimeModel>(exception: final exception):
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
        emit(state.copyWith(nextSeasonAnimePagingState: result));
      case AnimeCategory.currentSeason:
        emit(state.copyWith(currentSeasonAnimePagingState: result));
      case AnimeCategory.trending:
        emit(state.copyWith(trendingAnimePagingState: result));
    }
  }

  FutureOr<void> _onAnimeLoadError(
      _OnAnimeLoadError event, Emitter<DiscoverUiState> emit) {}

  FutureOr<void> _onUserDataChanged(
      _OnUserDataChanged event, Emitter<DiscoverUiState> emit) {
    emit(state.copyWith(userData: event.userData));
  }
}
