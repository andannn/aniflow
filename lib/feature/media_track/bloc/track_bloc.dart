import 'dart:async';

import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/definitions/track_list_filter.dart';
import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/message/snack_bar_message.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/extension/media_list_item_model_extension.dart';
import 'package:aniflow/core/data/model/sorted_group_media_list_model.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/media_list_update_page/media_list_modify_result.dart';
import 'package:aniflow/feature/media_track/bloc/track_ui_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

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
  final SortedGroupMediaListModel sortedGroupMediaListModel;

  _OnWatchingAnimeListChanged({required this.sortedGroupMediaListModel});
}

class OnSelectTrackListFilter extends TrackEvent {
  OnSelectTrackListFilter(this.filter);

  final TrackListFilter filter;
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

class _OnTrackListFilterChanged extends TrackEvent {
  _OnTrackListFilterChanged(this.trackListFilter);

  final TrackListFilter trackListFilter;
}

class OnItemMediaListModified extends TrackEvent {
  OnItemMediaListModified({required this.mediaId, required this.result});

  final String mediaId;
  final MediaListModifyResult result;
}

@injectable
class TrackBloc extends Bloc<TrackEvent, TrackUiState> with AutoCancelMixin {
  TrackBloc(
    this._mediaListRepository,
    this._authRepository,
    this._userDataRepository,
    this._messageRepository,
  ) : super(TrackUiState()) {
    on<_OnUserStateChanged>(
      (event, emit) => emit(state.copyWith(userData: event.userData)),
    );
    on<_OnLoadStateChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );
    on<_OnWatchingAnimeListChanged>(
      (event, emit) => emit(state.copyWith(
          sortedGroupMediaListModel: event.sortedGroupMediaListModel)),
    );
    on<_OnMediaTypeChanged>(
      (event, emit) => emit(state.copyWith(currentMediaType: event.mediaType)),
    );
    on<_OnTrackListFilterChanged>(
      (event, emit) => emit(
        state.copyWith(trackListFilter: event.trackListFilter),
      ),
    );

    on<OnSelectTrackListFilter>(
      (event, emit) => _mediaListRepository.setTrackListFilter(event.filter),
    );
    on<OnAnimeMarkWatched>(_onMediaMarkWatched);
    on<OnItemMediaListModified>(_onMediaListModified);

    /// start listen user changed event.
    autoCancel(
      () => _authRepository.getAuthedUserStream().listen((userData) {
        safeAdd(_OnUserStateChanged(userData: userData));
      }),
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

    autoCancel(
      () => _mediaListRepository
          .getTrackListFilterStream()
          .distinct()
          .listen((showReleasedOnly) {
        safeAdd(_OnTrackListFilterChanged(showReleasedOnly));
      }),
    );

    final sortedGroupMediaListStream = stream
        .map((e) => (e.userData?.id, e.currentMediaType))
        .distinct()
        .switchMap((record) {
      final (userNullable, type) = record;

      if (userNullable != null) {
        return _mediaListRepository.getMediaListStream(
          status: [MediaListStatus.planning, MediaListStatus.current],
          type: type,
          userId: userNullable,
        );
      } else {
        return Stream.value(const SortedGroupMediaListModel([], []));
      }
    });
    final trackListFilterStream =
        stream.map((e) => (e.trackListFilter)).distinct();
    CombineLatestStream.combine2(
      sortedGroupMediaListStream,
      trackListFilterStream,
      (a, b) => (a, b),
    ).distinct().listen((record) {
      final (sortedGroupMediaList, trackListFilter) = record;
      switch (trackListFilter) {
        case TrackListFilter.all:
          safeAdd(_OnWatchingAnimeListChanged(
              sortedGroupMediaListModel: sortedGroupMediaList));
        case TrackListFilter.newAired:
          safeAdd(
            _OnWatchingAnimeListChanged(
              sortedGroupMediaListModel: SortedGroupMediaListModel(
                sortedGroupMediaList.newUpdateList,
                [],
              ),
            ),
          );
        case TrackListFilter.hasNext:
          final newList = sortedGroupMediaList.newUpdateList
              .where(
                (e) => e.hasNextReleasedEpisode,
              )
              .toList();
          final otherList = sortedGroupMediaList.otherList
              .where(
                (e) => e.hasNextReleasedEpisode,
              )
              .toList();
          safeAdd(
            _OnWatchingAnimeListChanged(
              sortedGroupMediaListModel: SortedGroupMediaListModel(
                newList,
                otherList,
              ),
            ),
          );
      }
    });
  }

  final MediaListRepository _mediaListRepository;
  final AuthRepository _authRepository;
  final UserDataRepository _userDataRepository;
  final MessageRepository _messageRepository;

  Future syncUserAnimeList({String? userId}) async {
    safeAdd(_OnLoadStateChanged(isLoading: true));
    final result = await _mediaListRepository.syncMediaList(
      userId: userId,
      status: [MediaListStatus.current, MediaListStatus.planning],
      mediaType: _userDataRepository.mediaType,
    );
    safeAdd(_OnLoadStateChanged(isLoading: false));

    if (result is LoadError) {
      _messageRepository.handleException(result.exception);
    }
  }

  Future<void> _onMediaMarkWatched(
      OnAnimeMarkWatched event, Emitter<TrackUiState> emit) async {
    final isFinished = event.progress == event.totalEpisode;
    final MediaListStatus status =
        isFinished ? MediaListStatus.completed : MediaListStatus.current;

    safeAdd(_OnLoadStateChanged(isLoading: true));
    final result = await _mediaListRepository.updateMediaList(
        animeId: event.animeId, status: status, progress: event.progress);
    safeAdd(_OnLoadStateChanged(isLoading: false));

    if (result is LoadError) {
      _messageRepository.handleException(result.exception);
    } else {
      if (isFinished) {
        _messageRepository.showMessage(const MediaCompletedMessage());
      } else {
        _messageRepository.showMessage(const MediaMarkWatchedMessage());
      }
    }
  }

  FutureOr<void> _onMediaListModified(
      OnItemMediaListModified event, Emitter<TrackUiState> emit) async {

    safeAdd(_OnLoadStateChanged(isLoading: true));
    final state = event.result;
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
    safeAdd(_OnLoadStateChanged(isLoading: false));
    if (result is LoadError) {
      _messageRepository.handleException(result.exception);
    }
  }
}
