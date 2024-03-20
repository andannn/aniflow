import 'dart:async';

import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReadingMangaListPagingBloc extends PagingBloc<MediaListItemModel> {
  ReadingMangaListPagingBloc(
    @factoryParam this.userId,
    this._mediaListRepository,
    @factoryParam this.perPageCount,
  ) : super(const PageInit(data: []));

  final String userId;
  final MediaListRepository _mediaListRepository;
  final int perPageCount;

  @override
  Future<LoadResult<List<MediaListItemModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _mediaListRepository.getMediaListByPage(
      status: [MediaListStatus.planning, MediaListStatus.current],
      type: MediaType.manga,
      userId: userId,
      page: page,
      perPage: perPageCount,
      token: cancelToken,
    );
  }
}

@injectable
class DroppedMangaListPagingBloc extends PagingBloc<MediaListItemModel> {
  DroppedMangaListPagingBloc(
    @factoryParam this.userId,
    this._mediaListRepository,
    @factoryParam this.perPageCount,
  ) : super(const PageInit(data: []));

  final String userId;
  final MediaListRepository _mediaListRepository;
  final int perPageCount;

  @override
  Future<LoadResult<List<MediaListItemModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _mediaListRepository.getMediaListByPage(
      status: [MediaListStatus.dropped],
      type: MediaType.manga,
      userId: userId,
      page: page,
      perPage: perPageCount,
      token: cancelToken,
    );
  }
}
