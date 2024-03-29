import 'dart:async';

import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/refresh_paging_bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteAnimePagingBloc extends RefreshPagingBloc<MediaModel> {
  FavoriteAnimePagingBloc(
    @factoryParam this.userId,
    @factoryParam this.perPageCount,
    this._favoriteRepository,
  ) : super(const PageInit(data: []));

  final String userId;
  final int perPageCount;
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
          ? Refresh(perPageCount)
          : Append(page: page, perPage: perPageCount),
      token: cancelToken,
    );
  }
}
