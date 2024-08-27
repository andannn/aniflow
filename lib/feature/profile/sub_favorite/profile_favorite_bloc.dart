import 'package:aniflow/core/common/definitions/favorite_category.dart';
import 'package:aniflow/core/common/definitions/refresh_time_key.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/loading_state_mixin.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/model/favorite_item_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/profile/sub_favorite/profile_favorite_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
    @factoryParam this._loadingStateRepository,
    this._favoriteRepository,
    this._userDataRepository,
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
  final LoadingStateRepository _loadingStateRepository;
  final UserDataRepository _userDataRepository;
  final CancelToken _token = CancelToken();

  Future _syncFavoriteInfo() async {
    await _loadingStateRepository.doRefreshOrRejected(
      _userDataRepository,
      RefreshTimeKey.userFavorite(userId: userId),
      () => _favoriteRepository.refreshFavoriteInfo(
        userId: userId,
        token: _token,
      ),
    );
  }
}
