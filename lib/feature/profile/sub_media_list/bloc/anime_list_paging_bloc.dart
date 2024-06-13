import 'dart:async';

import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchingAnimeListPagingBloc extends PagingBloc<MediaWithListModel> {
  WatchingAnimeListPagingBloc(
    @factoryParam this.userId,
    this._mediaListRepository,
    @factoryParam this.perPageCount,
  ) : super(const PageInit(data: []));

  final String userId;
  final MediaListRepository _mediaListRepository;
  final int perPageCount;

  @override
  Future<LoadResult<List<MediaWithListModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _mediaListRepository.getMediaListByPage(
      status: [MediaListStatus.planning, MediaListStatus.current],
      type: MediaType.anime,
      userId: userId,
      page: page,
      perPage: perPageCount,
      token: cancelToken,
    );
  }
}

@injectable
class DroppedAnimeListPagingBloc extends PagingBloc<MediaWithListModel> {
  DroppedAnimeListPagingBloc(
    @factoryParam this.userId,
    this._mediaListRepository,
    @factoryParam this.perPageCount,
  ) : super(const PageInit(data: []));

  final String userId;
  final MediaListRepository _mediaListRepository;
  final int perPageCount;

  @override
  Future<LoadResult<List<MediaWithListModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _mediaListRepository.getMediaListByPage(
      status: [MediaListStatus.dropped],
      type: MediaType.anime,
      userId: userId,
      page: page,
      perPage: perPageCount,
      token: cancelToken,
    );
  }
}

@injectable
class CompleteAnimeListPagingBloc extends PagingBloc<MediaWithListModel> {
  CompleteAnimeListPagingBloc(
    @factoryParam this.userId,
    this._mediaListRepository,
    @factoryParam this.perPageCount,
  ) : super(const PageInit(data: []));

  final String userId;
  final MediaListRepository _mediaListRepository;
  final int perPageCount;

  @override
  Future<LoadResult<List<MediaWithListModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _mediaListRepository.getMediaListByPage(
      status: [MediaListStatus.completed],
      type: MediaType.anime,
      userId: userId,
      page: page,
      perPage: perPageCount,
      token: cancelToken,
    );
  }
}
