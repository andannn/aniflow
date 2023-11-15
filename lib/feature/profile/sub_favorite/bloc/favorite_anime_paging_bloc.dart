import 'dart:async';

import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/refresh_paging_bloc.dart';
import 'package:dio/dio.dart';

class FavoriteAnimePagingBloc extends RefreshPagingBloc<MediaModel> {
  FavoriteAnimePagingBloc(
    this.userId, {
    required FavoriteRepository favoriteRepository,
  })  : _favoriteRepository = favoriteRepository,
        super(const PageInit(data: []));

  final String userId;
  final FavoriteRepository _favoriteRepository;

  @override
  Future<LoadResult<List<MediaModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _favoriteRepository.loadFavoriteMediaByPage(
      type: MediaType.anime,
      userId: userId,
      loadType: isRefresh
          ? const Refresh(Config.profilePageDefaultPerPageCount)
          : Append(page: page, perPage: Config.profilePageDefaultPerPageCount),
      token: cancelToken,
    );
  }
}
