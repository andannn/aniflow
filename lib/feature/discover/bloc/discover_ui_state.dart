import 'package:anime_tracker/core/data/model/page_loading_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_ui_state.freezed.dart';

@freezed
class DiscoverUiState with _$DiscoverUiState {
  factory DiscoverUiState({
    @Default('') String isShowSuggestionBoard,
    @Default(PageLoading(data: [], page: 1)) PagingState currentSeasonAnimePagingState,
    @Default(PageLoading(data: [], page: 1)) PagingState nextSeasonAnimePagingState,
    @Default(PageLoading(data: [], page: 1)) PagingState trendingAnimePagingState,
  }) = _DiscoverUiState;
}
