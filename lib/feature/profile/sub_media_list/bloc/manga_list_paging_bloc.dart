import 'dart:async';

import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_bloc.dart';
import 'package:dio/dio.dart';

class ReadingMangaListPagingBloc extends PagingBloc<MediaListItemModel> {
  ReadingMangaListPagingBloc(
    this.userId, {
    required MediaListRepository mediaListRepository,
  })  : _mediaListRepository = mediaListRepository,
        super(const PageInit(data: []));

  final String userId;
  final MediaListRepository _mediaListRepository;

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
      perPage: Config.profilePageDefaultPerPageCount,
      token: cancelToken,
    );
  }
}

class DroppedMangaListPagingBloc extends PagingBloc<MediaListItemModel> {
  DroppedMangaListPagingBloc(
    this.userId, {
    required MediaListRepository mediaListRepository,
  })  : _mediaListRepository = mediaListRepository,
        super(const PageInit(data: []));

  final String userId;
  final MediaListRepository _mediaListRepository;

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
      perPage: Config.profilePageDefaultPerPageCount,
      token: cancelToken,
    );
  }
}
