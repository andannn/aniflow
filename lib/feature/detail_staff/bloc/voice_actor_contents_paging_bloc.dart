import 'dart:async';

import 'package:aniflow/core/common/definitions/media_sort.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/staff_character_and_media_connection.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_bloc.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

class _OnMediaSortChanged<CharacterAndMediaConnection>
    extends PagingEvent<CharacterAndMediaConnection> {}

@injectable
class VoiceActorContentsPagingBloc
    extends PagingBloc<CharacterAndMediaConnection> {
  VoiceActorContentsPagingBloc(
    @factoryParam this.staffId,
    this.mediaRepository,
    @factoryParam MediaSort mediaSort,
  )   : _mediaSort = mediaSort,
        super(const PageInit(data: [])) {
    on<_OnMediaSortChanged<CharacterAndMediaConnection>>(_onMediaSortChanged);
  }

  final String staffId;
  MediaSort _mediaSort;

  MediaSort get mediaSort => _mediaSort;

  set mediaSort(MediaSort mediaSort) {
    if (mediaSort != _mediaSort) {
      _mediaSort = mediaSort;
      safeAdd(_OnMediaSortChanged());
    }
  }

  final MediaInformationRepository mediaRepository;

  @override
  Future<LoadResult<List<CharacterAndMediaConnection>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return mediaRepository.loadVoiceActorContentsPage(
      token: cancelToken,
      page: page,
      perPage: 25,
      staffId: staffId,
      mediaSort: _mediaSort,
    );
  }

  FutureOr<void> _onMediaSortChanged(
      _OnMediaSortChanged<CharacterAndMediaConnection> event,
      Emitter<PagingState<List<CharacterAndMediaConnection>>> emit) {
    // clear paging state.
    emit(const PageInit(data: []));

    // Change state to loading.
    emit(state.toLoading());

    // launch event to get first page data.
    createLoadPageTask(page: 1, isRefresh: false);
  }
}

class ItemsWithYear<T> {
  final int? year;
  final List<T> items;

  ItemsWithYear({required this.year, required this.items});

  @override
  String toString() => 'Year: $year items: $items';
}

class CharacterItemsWithYear
    extends ItemsWithYear<CharacterAndMediaConnection> {
  CharacterItemsWithYear({required super.year, required super.items});
}

extension GroupListEx on List<CharacterAndMediaConnection> {
  List<CharacterItemsWithYear> get characterGroupList {
    final groupMap = groupFoldBy(
        (item) => item.media?.seasonYear ?? item.media?.startDate?.year,
        (List<CharacterAndMediaConnection>? previous, item) {
      List<CharacterAndMediaConnection> itemList = previous ?? [];
      return [...itemList, item];
    });

    return groupMap.entries
        .map((entry) =>
            CharacterItemsWithYear(year: entry.key, items: entry.value))
        .toList();
  }
}
