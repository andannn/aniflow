import 'package:aniflow/core/common/definitions/favorite_category.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/favorite_item_model.dart';
import 'package:aniflow/feature/profile/sub_favorite/profile_favorite_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class ProfileFavoriteEvent {}

class _OnFavoriteInfoChanged extends ProfileFavoriteEvent {
  final FavoriteType type;
  final List<FavoriteItemModel> items;

  _OnFavoriteInfoChanged(this.type, this.items);
}

@injectable
class ProfileFavoriteBloc
    extends Bloc<ProfileFavoriteEvent, ProfileFavoriteState>
    with AutoCancelMixin {
  ProfileFavoriteBloc(
    @factoryParam this.userId,
    this._favoriteRepository,
  ) : super(ProfileFavoriteState()) {
    on<_OnFavoriteInfoChanged>(
      (event, emit) => emit(
        state.copyWith(
          favoriteItems: {
            ...state.favoriteItems,
            event.type: event.items,
          },
        ),
      ),
    );

    for (final type in FavoriteType.values) {
      autoCancel(
        () => _favoriteRepository
            .getFavoriteItemsByCategory(type: type, userId: userId, limit: 50)
            .listen(
              (event) => add(_OnFavoriteInfoChanged(type, event)),
            ),
      );
    }

    _syncFavoriteInfo();
  }

  final String userId;
  final FavoriteRepository _favoriteRepository;

  Future _syncFavoriteInfo() async {
    return Future.wait([
      _favoriteRepository.loadFavoriteMediaByPage(
        type: MediaType.anime,
        userId: userId,
        loadType: const Refresh(50),
      ),
      _favoriteRepository.loadFavoriteMediaByPage(
        type: MediaType.manga,
        userId: userId,
        loadType: const Refresh(50),
      ),
      _favoriteRepository.loadFavoriteStaffByPage(
        userId: userId,
        loadType: const Refresh(50),
      ),
      _favoriteRepository.loadFavoriteCharacterByPage(
        userId: userId,
        loadType: const Refresh(50),
      ),
    ]);
  }
}
