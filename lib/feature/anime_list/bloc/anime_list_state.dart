import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:anime_tracker/core/data/model/page_loading_state.dart';
import 'package:anime_tracker/core/data/model/short_anime_model.dart';

part 'anime_list_state.freezed.dart';

@freezed
class AnimeListState with _$AnimeListState {
  factory AnimeListState({
    @Default(PageLoading(data: [], page: 1))
    PagingState<List<ShortAnimeModel>> animePagingState,
  }) = _AnimeListState;
}
