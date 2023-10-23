import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_favorite_state.freezed.dart';

@freezed
class ProfileFavoriteState with _$ProfileFavoriteState {
  factory ProfileFavoriteState({
    @Default(false) bool isLoading,
    @Default({
      FavoriteType.anime: PageLoading(data: [], page: 1),
      FavoriteType.manga: PageLoading(data: [], page: 1),
      FavoriteType.staff: PageLoading(data: [], page: 1),
      FavoriteType.character: PageLoading(data: [], page: 1),
    })
    Map<FavoriteType, PagingState<List>> favoriteDataMap,
  }) = _ProfileFavoriteState;
}