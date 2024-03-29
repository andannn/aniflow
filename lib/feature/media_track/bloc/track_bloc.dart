import 'dart:async';

import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/extension/media_list_item_model_extension.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/settings_repository.dart';
import 'package:aniflow/core/design_system/widget/aniflow_snackbar.dart';
import 'package:aniflow/core/design_system/widget/update_media_list_bottom_sheet.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/media_track/bloc/track_ui_state.dart';
import 'package:aniflow/feature/media_track/bloc/user_anime_list_load_state.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

sealed class TrackEvent {}

class _OnUserStateChanged extends TrackEvent {
  final UserModel? userData;

  _OnUserStateChanged({required this.userData});
}

class _OnLoadStateChanged extends TrackEvent {
  final bool isLoading;

  _OnLoadStateChanged({required this.isLoading});
}

class _OnWatchingAnimeListChanged extends TrackEvent {
  final List<MediaListItemModel> animeList;

  _OnWatchingAnimeListChanged({required this.animeList});
}

class _OnAniListSettingsChanged extends TrackEvent {
  _OnAniListSettingsChanged(this.settings);

  final AniListSettings settings;
}

class OnToggleShowFollowOnly extends TrackEvent {}

class OnAnimeMarkWatched extends TrackEvent {
  final String animeId;
  final int progress;
  final int? totalEpisode;

  OnAnimeMarkWatched(
      {required this.animeId,
      required this.progress,
      required this.totalEpisode});
}

class _OnMediaTypeChanged extends TrackEvent {
  _OnMediaTypeChanged(this.mediaType);

  final MediaType mediaType;
}

class _OnShowFollowOnlyStateChanged extends TrackEvent {
  _OnShowFollowOnlyStateChanged(this.isShowFollowOnly);

  final bool isShowFollowOnly;
}

class OnMediaListModified extends TrackEvent {
  OnMediaListModified({required this.mediaId, required this.result});

  final String mediaId;
  final MediaListModifyResult result;
}

@injectable
class TrackBloc extends Bloc<TrackEvent, TrackUiState> {
  TrackBloc(
    this._mediaListRepository,
    this._settingsRepository,
    this._authRepository,
  ) : super(TrackUiState()) {
    on<_OnUserStateChanged>(_onUserStateChanged);
    on<_OnLoadStateChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );
    on<_OnWatchingAnimeListChanged>(_onWatchingAnimeListChanged);
    on<_OnMediaTypeChanged>(_onMediaTypeChanged);
    on<_OnAniListSettingsChanged>(
      (event, emit) => emit(state.copyWith(settings: event.settings)),
    );
    on<_OnShowFollowOnlyStateChanged>(_onShowFollowOnlyStateChanged);
    on<OnToggleShowFollowOnly>(
      (_, __) =>
          _mediaListRepository.setIsReleasedOnly(!state.showReleasedOnly),
    );
    on<OnAnimeMarkWatched>(_onAnimeMarkWatched);
    on<OnMediaListModified>(_onMediaListModified);

    _init();
  }

  StreamSubscription? _userContentSub;
  StreamSubscription? _userStateSub;
  StreamSubscription? _mediaTypeSub;
  StreamSubscription? _settingsSub;
  StreamSubscription? _showReleasedOnlySub;

  final MediaListRepository _mediaListRepository;
  final SettingsRepository _settingsRepository;
  final AuthRepository _authRepository;
  String? _userId;

  var _watchingAnimeList = <MediaListItemModel>[];

  void _init() async {
    /// start listen user changed event.
    _userStateSub ??= _authRepository.getAuthedUserStream().listen((userData) {
      add(_OnUserStateChanged(userData: userData));
    });

    _mediaTypeSub = _settingsRepository.getMediaTypeStream().distinct().listen(
      (mediaType) {
        add(_OnMediaTypeChanged(mediaType));
      },
    );

    _settingsSub ??= _authRepository.getAniListSettingsStream().listen(
      (settings) {
        add(_OnAniListSettingsChanged(settings));
      },
    );

    _showReleasedOnlySub ??= _mediaListRepository
        .getIsReleasedOnlyStream()
        .distinct()
        .listen((showReleasedOnly) {
      add(_OnShowFollowOnlyStateChanged(showReleasedOnly));
    });
  }

  @override
  Future<void> close() {
    _userContentSub?.cancel();
    _userStateSub?.cancel();
    _mediaTypeSub?.cancel();
    _settingsSub?.cancel();
    _showReleasedOnlySub?.cancel();
    return super.close();
  }

  Future syncUserAnimeList({String? userId}) async {
    add(_OnLoadStateChanged(isLoading: true));
    final result = await _mediaListRepository.syncMediaList(
      userId: userId,
      status: [MediaListStatus.current, MediaListStatus.planning],
      mediaType: AniFlowPreferences().mediaType.value,
    );
    add(_OnLoadStateChanged(isLoading: false));

    if (result is LoadError) {
      ErrorHandler.handleException(exception: result.exception);
    }
  }

  Future<void> _onUserStateChanged(
    _OnUserStateChanged event,
    Emitter<TrackUiState> emit,
  ) async {
    if (event.userData == null) {
      await _userContentSub?.cancel();
      emit(state.copyWith(animeLoadState: const MediaStateNoUser()));
    } else {
      if (state.animeLoadState is MediaStateNoUser) {
        emit(state.copyWith(animeLoadState: const MediaStateInitState()));
      }

      /// start listening streams.
      _userId = event.userData!.id;
      _startListenFollowingMedias();
    }
  }

  FutureOr<void> _onWatchingAnimeListChanged(
      _OnWatchingAnimeListChanged event, Emitter<TrackUiState> emit) {
    final loadState = state.animeLoadState;
    if (loadState is MediaStateNoUser) {
      /// no login, just return.
      return null;
    }

    _watchingAnimeList = event.animeList;

    final needShowReleasedOnly = state.showReleasedOnly;

    /// trim anime list if needed.
    final mediaList = _getTrimmedMediaList(needShowReleasedOnly);

    emit(state.copyWith(
      animeLoadState: MediaStateLoaded(followingMediaList: mediaList),
    ));
  }

  FutureOr<void> _onShowFollowOnlyStateChanged(
      _OnShowFollowOnlyStateChanged event, Emitter<TrackUiState> emit) {
    final needShowReleasedOnly = event.isShowFollowOnly;
    emit(state.copyWith(showReleasedOnly: needShowReleasedOnly));

    final loadState = state.animeLoadState;
    if (loadState is MediaStateNoUser || loadState is MediaStateInitState) {
      /// no login, or not loaded, just return.
      return null;
    }

    /// trim anime list if needed.
    final animeList = _getTrimmedMediaList(needShowReleasedOnly);

    emit(
      state.copyWith(
        animeLoadState: MediaStateLoaded(followingMediaList: animeList),
      ),
    );
  }

  List<MediaListItemModel> _getTrimmedMediaList(bool needShowReleasedOnly) {
    List<MediaListItemModel> animeList;
    if (needShowReleasedOnly) {
      animeList =
          _watchingAnimeList.where((e) => e.hasNextReleasingEpisode).toList();
    } else {
      animeList = _watchingAnimeList;
    }
    final sorted =
        animeList.sorted((a, b) => a.updatedAt!.compareTo(b.updatedAt!));
    return sorted.reversed.toList();
  }

  Future<void> _onAnimeMarkWatched(
      OnAnimeMarkWatched event, Emitter<TrackUiState> emit) async {
    final isFinished = event.progress == event.totalEpisode;
    final MediaListStatus status =
        isFinished ? MediaListStatus.completed : MediaListStatus.current;

    add(_OnLoadStateChanged(isLoading: true));
    final result = await _mediaListRepository.updateMediaList(
        animeId: event.animeId, status: status, progress: event.progress);
    add(_OnLoadStateChanged(isLoading: false));

    if (result is LoadError) {
      ErrorHandler.handleException(exception: result.exception);
    } else {
      if (isFinished) {
//TODO: change to score dialog.
        showSnackBarMessage(
          label: AFLocalizations.of().animeCompleted,
          duration: SnackBarDuration.short,
        );
      } else {
        showSnackBarMessage(
          label: AFLocalizations.of().animeMarkWatched,
          duration: SnackBarDuration.short,
        );
      }
    }
  }

  FutureOr<void> _onMediaTypeChanged(
      _OnMediaTypeChanged event, Emitter<TrackUiState> emit) {
    final type = event.mediaType;

    emit(state.copyWith(currentMediaType: type));

    /// re-collecting following medias, because of media type changed.
    _startListenFollowingMedias();
  }

  void _startListenFollowingMedias() async {
    final userId = _userId;

    if (userId == null) return;

    await _userContentSub?.cancel();
    _userContentSub = _mediaListRepository.getMediaListStream(
      status: [MediaListStatus.planning, MediaListStatus.current],
      type: state.currentMediaType,
      userId: userId,
    ).listen((animeList) {
      add(_OnWatchingAnimeListChanged(animeList: animeList));
    });
  }

  FutureOr<void> _onMediaListModified(
      OnMediaListModified event, Emitter<TrackUiState> emit) async {
    final state = event.result;
    // add(_OnLoadingStateChanged(isLoading: true));
    final result = await _mediaListRepository.updateMediaList(
      animeId: event.mediaId,
      status: state.status,
      progress: state.progress,
      progressVolumes: state.progressVolumes,
      score: state.score,
      private: state.private,
      repeat: state.repeat,
      notes: state.notes,
      startedAt: state.startedAt,
      completedAt: state.completedAt,
    );
    // add(_OnLoadingStateChanged(isLoading: false));

    if (result is LoadError) {
      ErrorHandler.handleException(exception: result.exception);
    }
  }
}
