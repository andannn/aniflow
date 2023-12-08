import 'dart:async';

import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/staff_character_and_media_connection.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_bloc.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';

class VoiceActorContentsPagingBloc
    extends PagingBloc<CharacterAndMediaConnection> {
  VoiceActorContentsPagingBloc(
    this.staffId, {
    required this.mediaRepository,
  }) : super(const PageInit(data: []));

  final String staffId;
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
    );
  }
}

class ItemsWithYear<T> {
  final String year;
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
    final groupMap =
        groupFoldBy((item) => item.media?.seasonYear?.toString() ?? 'TBA',
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
