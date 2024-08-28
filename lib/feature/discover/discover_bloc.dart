import 'dart:async';

import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/home_sector_category.dart';
import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/definitions/refresh_time_key.dart';
import 'package:aniflow/core/common/util/anime_season_util.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/loading_state_mixin.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/character_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/discover/discover_ui_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

sealed class DiscoverEvent {}

class _OnUserDataChanged extends DiscoverEvent {
  _OnUserDataChanged(this.userData);

  final UserModel? userData;
}

class _OnLoadStateChanged extends DiscoverEvent {
  _OnLoadStateChanged(this.isLoading);

  final bool isLoading;
}

class _OnMediaTypeChanged extends DiscoverEvent {
  _OnMediaTypeChanged(this.mediaType);

  final MediaType mediaType;
}

class _OnHomeSectorChanged extends DiscoverEvent {
  final List<HomeSectorCategory> sectors;

  _OnHomeSectorChanged(this.sectors);
}

extension DiscoverUiStateEx on DiscoverUiState {
  bool get isLoggedIn => userData != null;
}

@injectable
class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverUiState>
    with LoadingControllerMixin, AutoCancelMixin {
  DiscoverBloc(
    this._authRepository,
    this._mediaInfoRepository,
    this._mediaListRepository,
    this._userDataRepository,
    this._messageRepository,
    this._characterRepository,
  ) : super(DiscoverUiState()) {
    on<_OnUserDataChanged>(
      (event, emit) => emit(state.copyWith(userData: event.userData)),
    );
    on<_OnMediaTypeChanged>(
      (event, emit) => emit(state.copyWith(currentMediaType: event.mediaType)),
    );
    on<_OnLoadStateChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );
    on<_OnHomeSectorChanged>(
      (event, emit) => emit(state.copyWith(sectors: event.sectors)),
    );

    _init();
  }

  final AuthRepository _authRepository;
  final MediaInformationRepository _mediaInfoRepository;
  final MediaListRepository _mediaListRepository;
  final UserDataRepository _userDataRepository;
  final MessageRepository _messageRepository;
  final CharacterRepository _characterRepository;

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

    autoCancel(
      () => _authRepository.getAuthedUserStream().listen(
        (userDataNullable) {
          safeAdd(_OnUserDataChanged(userDataNullable));
        },
      ),
    );

    autoCancel(
      () => _userDataRepository.userDataStream
          .map((event) => event.mediaType)
          .distinct()
          .listen(
        (mediaType) {
          safeAdd(_OnMediaTypeChanged(mediaType));
        },
      ),
    );

    stream.map((e) => e.currentMediaType).distinct().listen((type) {
      _refreshAllMediaPreview(type);
    });

    autoCancel(
      () => stream
          .map((e) => e.userData?.id)
          .distinct()
          .whereNotNull()
          .listen((userId) {
        /// post event to sync user media list.
        unawaited(_refreshAllMediaList(userId));

        /// post event to update user condition.
        unawaited(_authRepository.syncUserCondition());
      }),
    );

    autoCancel(
      () => _userDataRepository.homeSectorsStream.listen(
        (event) => safeAdd(
          _OnHomeSectorChanged(event),
        ),
      ),
    );

    unawaited(_refreshBirthdayCharacters());
    unawaited(_refreshAiringSchedule());
    unawaited(_refreshRecentMovies());
  }

  Future onPullToRefreshTriggered() {
    final userId = state.userData?.id;
    return Future.wait([
      _refreshAllMediaPreview(state.currentMediaType, true),
      _refreshBirthdayCharacters(true),
      _refreshAiringSchedule(true),
      if (userId != null)
        _refreshAllMediaList(userId, true)
      else
        Future.value(),
    ]);
  }

  Future _refreshAllMediaPreview(MediaType type, [bool isForce = false]) async {
    final categories = MediaCategory.getAllCategoryByType(type);
    for (final category in categories) {
      unawaited(_refreshMediaPreviewOfCategory(category, isForce));
    }
  }

  Future _refreshMediaPreviewOfCategory(MediaCategory category,
          [bool isForce = false]) =>
      doRefreshOrRejected(
        _userDataRepository,
        RefreshTimeKey.mediaCategory(category: category),
        () => _mediaInfoRepository.loadMediaPageByCategory(
          category: category,
          loadType: const Refresh(AfConfig.mediaCategoryPreviewItemCount),
          displayAdultContent: _userDataRepository.displayAdultContent,
        ),
        isForce,
      );

  Future _refreshAllMediaList(String userId, [bool isForce = false]) =>
      doRefreshOrRejected(
        _userDataRepository,
        RefreshTimeKey.mediaList(
          userId: userId,
          status: [MediaListStatus.current, MediaListStatus.planning],
          type: _userDataRepository.mediaType,
        ),
        () => _mediaListRepository.syncMediaList(
          userId: userId,
          status: [MediaListStatus.current, MediaListStatus.planning],
          mediaType: _userDataRepository.mediaType,
        ),
        isForce,
      );

  Future _refreshBirthdayCharacters([bool isForce = false]) =>
      doRefreshOrRejected(
        _userDataRepository,
        const RefreshTimeKey.birthdayCharacters(),
        () => _characterRepository.loadBirthdayCharacterPage(
          loadType: const Refresh(12),
        ),
        isForce,
      );

  Future _refreshAiringSchedule([bool isForce = false]) => doRefreshOrRejected(
        _userDataRepository,
        const RefreshTimeKey.airingSchedule(),
        () => _mediaInfoRepository.refreshAiringSchedule(DateTime.now()),
        isForce,
      );

  Future _refreshRecentMovies([bool isForce = false]) => doRefreshOrRejected(
        _userDataRepository,
        const RefreshTimeKey.recentMovies(),
        () => _mediaInfoRepository.refreshMoviesPage(
          startDateGreater: DateTime.now().subtract(
              const Duration(days: AfConfig.daysBeforeOfMoviesInHome)),
          endDateLesser: DateTime.now()
              .add(const Duration(days: AfConfig.daysAfterOfMoviesInHome)),
          isAdult: _userDataRepository.displayAdultContent,
        ),
        isForce,
      );

  @override
  void onLoadingFinished(List<LoadError> errors) {
    _messageRepository.handleException(errors.first.exception);
  }

  @override
  void onLoadingStateChanged(bool isLoading) {
    add(_OnLoadStateChanged(isLoading));
  }
}
