import 'package:anime_tracker/core/data/model/media_model.dart';
import 'package:anime_tracker/core/data/model/user_data_model.dart';
import 'package:anime_tracker/feature/common/page_loading_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_ui_state.freezed.dart';

@freezed
class DiscoverUiState with _$DiscoverUiState {
  factory DiscoverUiState({
    @Default(false) bool isLoading,
    @Default('') String isShowSuggestionBoard,
    @Default(PageLoading(data: [], page: 1))
    PagingState<List<MediaModel>> currentSeasonPagingState,
    @Default(PageLoading(data: [], page: 1))
    PagingState<List<MediaModel>> nextSeasonPagingState,
    @Default(PageLoading(data: [], page: 1))
    PagingState<List<MediaModel>> trendingPagingState,
    @Default(PageLoading(data: [], page: 1))
    PagingState<List<MediaModel>> moviePagingState,
    UserData? userData,
  }) = _DiscoverUiState;

  static DiscoverUiState copyWithTrackedIds(
      DiscoverUiState state, Set<String> ids) {
    return state.copyWith(
      currentSeasonPagingState: state.currentSeasonPagingState.updateWith(
        (animeList) => animeList
            .map((e) => e.copyWith(isFollowing: ids.contains(e.id)))
            .toList(),
      ),
      nextSeasonPagingState: state.nextSeasonPagingState.updateWith(
        (animeList) => animeList
            .map((e) => e.copyWith(isFollowing: ids.contains(e.id)))
            .toList(),
      ),
      trendingPagingState: state.trendingPagingState.updateWith(
        (animeList) => animeList
            .map((e) => e.copyWith(isFollowing: ids.contains(e.id)))
            .toList(),
      ),
      moviePagingState: state.moviePagingState.updateWith(
        (animeList) => animeList
            .map((e) => e.copyWith(isFollowing: ids.contains(e.id)))
            .toList(),
      ),
    );
  }
}
