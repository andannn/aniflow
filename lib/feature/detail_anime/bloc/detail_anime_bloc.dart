import 'dart:async';

import 'package:anime_tracker/core/data/model/detail_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:anime_tracker/feature/detail_anime/bloc/detail_anime_ui_state.dart';

sealed class DetailAnimeEvent {}

class _OnDetailAnimeModelChangedEvent extends DetailAnimeEvent {
  _OnDetailAnimeModelChangedEvent({required this.model});

  final DetailAnimeModel model;
}

class DetailAnimeBloc extends Bloc<DetailAnimeEvent, DetailAnimeUiState> {
  DetailAnimeBloc(
      {required String animeId, required AniListRepository aniListRepository})
      : super(DetailAnimeUiState()) {
    on<_OnDetailAnimeModelChangedEvent>(_onDetailAnimeModelChangedEvent);

    _detailAnimeSub =
        aniListRepository.getDetailAnimeInfoStream(animeId).listen(
      (animeModel) {
        add(_OnDetailAnimeModelChangedEvent(model: animeModel));
      },
    );

    /// start fetch detail anime info.
    /// detail info stream will emit new value when data ready.
    aniListRepository.startFetchDetailAnimeInfo(animeId);
  }

  StreamSubscription? _detailAnimeSub;

  @override
  Future<void> close() {
    _detailAnimeSub?.cancel();

    return super.close();
  }

  @override
  void onChange(Change<DetailAnimeUiState> change) {
    super.onChange(change);
  }

  FutureOr<void> _onDetailAnimeModelChangedEvent(
    _OnDetailAnimeModelChangedEvent event,
    Emitter<DetailAnimeUiState> emit,
  ) {
    emit(state.copyWith(detailAnimeModel: event.model));
  }
}
