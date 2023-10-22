import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    @Default(false) bool isLoading,
    UserData? userData,
    @Default({
      FavoriteType.anime: PageLoading(data: [], page: 1),
      FavoriteType.manga: PageLoading(data: [], page: 1),
      FavoriteType.staff: PageLoading(data: [], page: 1),
      FavoriteType.character: PageLoading(data: [], page: 1),
    })
    Map<FavoriteType, PagingState<List>> favoriteDataMap,
  }) = _ProfileState;
}
