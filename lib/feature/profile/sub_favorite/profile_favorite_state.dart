import 'package:aniflow/core/common/definitions/favorite_category.dart';
import 'package:aniflow/core/data/model/favorite_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_favorite_state.freezed.dart';

@freezed
class ProfileFavoriteState with _$ProfileFavoriteState {
  factory ProfileFavoriteState({
    @Default({})
    Map<FavoriteType, List<FavoriteItemModel>> favoriteItems,
  }) = _ProfileFavoriteState;
}
