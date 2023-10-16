import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/data/model/page_loading_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_list_state.freezed.dart';

@freezed
class AnimeListState with _$AnimeListState {
  factory AnimeListState({
    @Default(PageLoading(data: [], page: 1))
    PagingState<List<AnimeModel>> animePagingState,
  }) = _AnimeListState;

  static AnimeListState copyWithTrackedIds(
      AnimeListState state, Set<String> ids) {
    return state.copyWith(
        animePagingState: state.animePagingState.updateWith(
      (animeList) => animeList
          .map((e) => e.copyWith(isFollowing: ids.contains(e.id)))
          .toList(),
    ));
  }
}
