import 'dart:async';

import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:aniflow/core/common/model/ani_list_settings.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/extension/media_list_item_model_extension.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/settings_repository.dart';
import 'package:aniflow/core/design_system/widget/aniflow_snackbar.dart';
import 'package:aniflow/feature/media_track/bloc/track_ui_state.dart';
import 'package:aniflow/feature/media_track/bloc/user_anime_list_load_state.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';

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

class OnToggleShowFollowOnly extends TrackEvent {
  OnToggleShowFollowOnly();
}

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

class TrackBloc extends Bloc<TrackEvent, TrackUiState> {
  TrackBloc(
      {required MediaListRepository mediaListRepository,
      required AuthRepository authRepository,
      required SettingsRepository settingsRepository})
      : _animeTrackListRepository = mediaListRepository,
        _settingsRepository = settingsRepository,
        _authRepository = authRepository,
        super(TrackUiState()) {
    on<_OnUserStateChanged>(_onUserStateChanged);
    on<_OnLoadStateChanged>(_onLoadStateChanged);
    on<_OnWatchingAnimeListChanged>(_onWatchingAnimeListChanged);
    on<_OnMediaTypeChanged>(_onMediaTypeChanged);
    on<_OnAniListSettingsChanged>(_onAniListSettingsChanged);
    on<OnToggleShowFollowOnly>(_onToggleShowReleasedOnly);
    on<OnAnimeMarkWatched>(_onAnimeMarkWatched);

    _init();
  }

  StreamSubscription? _userContentSub;
  StreamSubscription? _userStateSub;
  StreamSubscription? _mediaTypeSub;
  StreamSubscription? _settingsSub;
  final MediaListRepository _animeTrackListRepository;
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
  }

  @override
  Future<void> close() {
    _userContentSub?.cancel();
    _userStateSub?.cancel();
    _mediaTypeSub?.cancel();
    _settingsSub?.cancel();
    return super.close();
  }

  Future syncUserAnimeList({String? userId}) async {
    add(_OnLoadStateChanged(isLoading: true));
    final result =
        await _animeTrackListRepository.syncMediaList(userId: userId);
    if (result is LoadError) {
      /// load error, show snack bar msg.
    }
    add(_OnLoadStateChanged(isLoading: false));
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

  FutureOr<void> _onLoadStateChanged(
      _OnLoadStateChanged event, Emitter<TrackUiState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
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

  FutureOr<void> _onToggleShowReleasedOnly(
      OnToggleShowFollowOnly event, Emitter<TrackUiState> emit) {
    final loadState = state.animeLoadState;
    if (loadState is MediaStateNoUser || loadState is MediaStateInitState) {
      /// no login, or not loaded, just return.
      return null;
    }

    final needShowReleasedOnly = !state.showReleasedOnly;
    emit(state.copyWith(showReleasedOnly: needShowReleasedOnly));

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
    final result = await _animeTrackListRepository.updateMediaList(
        animeId: event.animeId, status: status, progress: event.progress);
    add(_OnLoadStateChanged(isLoading: false));

    if (result is LoadSuccess) {
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
    } else {
//TODO: show error msg.
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
    _userContentSub = _animeTrackListRepository.getMediaListStream(
      status: [MediaListStatus.planning, MediaListStatus.current],
      type: state.currentMediaType,
      userId: userId,
    ).listen((animeList) {
      add(_OnWatchingAnimeListChanged(animeList: animeList));
    });
  }

  FutureOr<void> _onAniListSettingsChanged(
      _OnAniListSettingsChanged event, Emitter<TrackUiState> emit) {
    emit(state.copyWith(settings: event.settings));
  }
}
