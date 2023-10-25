import 'dart:async';

import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/refresh_paging_bloc.dart';

class FavoriteCharacterPagingBloc extends RefreshPagingBloc<CharacterModel> {
  FavoriteCharacterPagingBloc(
    this.userId, {
    required FavoriteRepository favoriteRepository,
  })  : _favoriteRepository = favoriteRepository,
        super(const PageInit(data: []));

  final String userId;
  final FavoriteRepository _favoriteRepository;

  @override
  Future<LoadResult<List<CharacterModel>>> loadPage(
      {required int page, bool isRefresh = false}) {
    return _favoriteRepository.loadFavoriteCharacterByPage(
      userId: userId,
      loadType: isRefresh
          ? const Refresh(Config.profilePageDefaultPerPageCount)
          : Append(page: page, perPage: Config.profilePageDefaultPerPageCount),
    );
  }
}
