import 'dart:async';

import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/refresh_paging_bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteCharacterPagingBloc extends RefreshPagingBloc<CharacterModel> {
  FavoriteCharacterPagingBloc(
    @factoryParam this.userId,
    this._favoriteRepository,
    @factoryParam this.perPageCount,
  ) : super(const PageInit(data: []));

  final String userId;
  final FavoriteRepository _favoriteRepository;
  final int perPageCount;

  @override
  Future<LoadResult<List<CharacterModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _favoriteRepository.loadFavoriteCharacterByPage(
      userId: userId,
      loadType: isRefresh
          ? Refresh(perPageCount)
          : Append(page: page, perPage: perPageCount),
      token: cancelToken,
    );
  }
}
