import 'dart:async';

import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_bloc.dart';
import 'package:aniflow/feature/detail_staff/bloc/voice_actor_contents_paging_bloc.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';

class StudioContentsPagingBloc extends PagingBloc<MediaModel> {
  StudioContentsPagingBloc(
    this.studioId, {
    required this.mediaRepository,
  }) : super(const PageInit(data: []));

  final String studioId;
  final MediaInformationRepository mediaRepository;

  @override
  Future<LoadResult<List<MediaModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return mediaRepository.loadStudioContentsPage(
      token: cancelToken,
      page: page,
      perPage: 25,
      studioId: studioId,
    );
  }
}

class MediaItemsWithYear extends ItemsWithYear<MediaModel> {
  MediaItemsWithYear({required super.year, required super.items});
}

extension MediaItemGroupListEx on List<MediaModel> {
  List<MediaItemsWithYear> get mediaGroupList {
    final groupMap =
        groupFoldBy((item) => item.seasonYear ?? item.startDate?.year,
            (List<MediaModel>? previous, item) {
      List<MediaModel> itemList = previous ?? [];
      return [...itemList, item];
    });

    return groupMap.entries
        .map((entry) => MediaItemsWithYear(year: entry.key, items: entry.value))
        .toList();
  }
}
