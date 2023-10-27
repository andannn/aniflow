import 'dart:async';

import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/paging_bloc.dart';

class WatchingAnimeListPagingBloc
    extends PagingBloc<MediaListItemModel> {
  WatchingAnimeListPagingBloc(
    this.userId, {
    required MediaListRepository mediaListRepository,
  })  : _mediaListRepository = mediaListRepository,
        super(const PageInit(data: []));

  final String userId;
  final MediaListRepository _mediaListRepository;

  @override
  Future<LoadResult<List<MediaListItemModel>>> loadPage(
      {required int page, bool isRefresh = false}) {
    return _mediaListRepository.getMediaListByPage(
      status: [MediaListStatus.planning, MediaListStatus.current],
      type: MediaType.anime,
      userId: userId,
      page: page,
      perPage: Config.profilePageDefaultPerPageCount,
    );
  }
}

class DroppedAnimeListPagingBloc extends PagingBloc<MediaListItemModel> {
  DroppedAnimeListPagingBloc(
    this.userId, {
    required MediaListRepository mediaListRepository,
  })  : _mediaListRepository = mediaListRepository,
        super(const PageInit(data: []));

  final String userId;
  final MediaListRepository _mediaListRepository;

  @override
  Future<LoadResult<List<MediaListItemModel>>> loadPage(
      {required int page, bool isRefresh = false}) {
    return _mediaListRepository.getMediaListByPage(
      status: [MediaListStatus.dropped],
      type: MediaType.anime,
      userId: userId,
      page: page,
      perPage: Config.profilePageDefaultPerPageCount,
    );
  }
}

class CompleteAnimeListPagingBloc
    extends PagingBloc<MediaListItemModel> {
  CompleteAnimeListPagingBloc(
    this.userId, {
    required MediaListRepository mediaListRepository,
  })  : _mediaListRepository = mediaListRepository,
        super(const PageInit(data: []));

  final String userId;
  final MediaListRepository _mediaListRepository;

  @override
  Future<LoadResult<List<MediaListItemModel>>> loadPage(
      {required int page, bool isRefresh = false}) {
    return _mediaListRepository.getMediaListByPage(
      status: [MediaListStatus.completed],
      type: MediaType.anime,
      userId: userId,
      page: page,
      perPage: Config.profilePageDefaultPerPageCount,
    );
  }
}
