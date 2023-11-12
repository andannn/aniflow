import 'package:aniflow/core/common/model/ani_list_settings.dart';
import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discover_ui_state.freezed.dart';

@freezed
class DiscoverUiState with _$DiscoverUiState {
  factory DiscoverUiState({
    @Default(false) bool isLoading,
    @Default({
      MediaCategory.currentSeasonAnime: PageLoading(data: [], page: 1),
      MediaCategory.nextSeasonAnime: PageLoading(data: [], page: 1),
      MediaCategory.trendingAnime: PageLoading(data: [], page: 1),
      MediaCategory.movieAnime: PageLoading(data: [], page: 1),
      MediaCategory.trendingManga: PageLoading(data: [], page: 1),
      MediaCategory.allTimePopularManga: PageLoading(data: [], page: 1),
      MediaCategory.topManhwa: PageLoading(data: [], page: 1),
    })
    Map<MediaCategory, PagingState<List<MediaModel>>> categoryMediaMap,
    @Default(MediaType.anime) MediaType currentMediaType,
    UserModel? userData,
    AniListSettings? settings,
  }) = _DiscoverUiState;

  static DiscoverUiState copyWithTrackedIds(
      DiscoverUiState state, Set<String> ids) {
    Map<MediaCategory, PagingState<List<MediaModel>>> stateMap =
        state.categoryMediaMap.map(
      (key, value) => MapEntry(
        key,
        value.updateWith(
          (animeList) => animeList
              .map((e) => e.copyWith(isFollowing: ids.contains(e.id)))
              .toList(),
        ),
      ),
    );

    return state.copyWith(categoryMediaMap: stateMap);
  }
}
