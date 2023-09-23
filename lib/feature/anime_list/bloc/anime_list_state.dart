import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:anime_tracker/core/data/model/page_loading_state.dart';

part 'anime_list_state.freezed.dart';

@freezed
class AnimeListState with _$AnimeListState {
  factory AnimeListState({
    @Default(PageLoading(data: [], page: 1))
    PagingState<List<AnimeModel>> animePagingState,
  }) = _AnimeListState;
}
