import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/profile/sub_favorite/profile_favorite_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

enum ProfileFavoriteType {
  anime,
  manga,
  character,
  staff,
}

sealed class ProfileFavoriteEvent {}

@injectable
class ProfileFavoriteBloc
    extends Bloc<ProfileFavoriteEvent, ProfileFavoriteState> {
  ProfileFavoriteBloc(
    @factoryParam this.userId,
    this._favoriteRepository,
    this._userDataRepository,
  ) : super(ProfileFavoriteState()) {

    _syncFavoriteInfo();
  }

  final String userId;
  final FavoriteRepository _favoriteRepository;
  final UserDataRepository _userDataRepository;

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
