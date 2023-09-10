import 'package:anime_tracker/core/data/model/page_loading_state.dart';
import 'package:anime_tracker/core/data/model/shortcut_anime_model.dart';
import 'package:anime_tracker/core/data/model/user_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_ui_state.freezed.dart';

@freezed
class DiscoverUiState with _$DiscoverUiState {
  factory DiscoverUiState({
    @Default('') String isShowSuggestionBoard,
    @Default(PageLoading(data: [], page: 1))
    PagingState<List<ShortcutAnimeModel>> currentSeasonAnimePagingState,
    @Default(PageLoading(data: [], page: 1))
    PagingState<List<ShortcutAnimeModel>> nextSeasonAnimePagingState,
    @Default(PageLoading(data: [], page: 1))
    PagingState<List<ShortcutAnimeModel>> trendingAnimePagingState,
    UserData? userData,
  }) = _DiscoverUiState;
}
