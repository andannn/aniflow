import 'package:aniflow/feature/profile/sub_favorite/favorite_item_model.dart';
import 'package:aniflow/feature/profile/sub_favorite/profile_favorite_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_favorite_state.freezed.dart';

@freezed
class ProfileFavoriteState with _$ProfileFavoriteState {
  factory ProfileFavoriteState({
    @Default({})
    Map<ProfileFavoriteType, List<FavoriteItemModel>> favoriteItems,
  }) = _ProfileFavoriteState;
}
