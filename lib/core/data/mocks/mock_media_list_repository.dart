import 'dart:convert';

import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/definitions/track_list_filter.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/media_list_mapper.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/core/data/model/sorted_group_media_list_model.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [AfEnvironment.mock], as: MediaListRepository)
class MockMediaListRepository implements MediaListRepository {
  @override
  Stream<Set<String>> getMediaIdsInMediaListStream(
      {required String userId,
      required List<MediaListStatus> status,
      required MediaType type}) {
    return Stream.value({});
  }

  @override
  Future<LoadResult<List<MediaWithListModel>>> getMediaListByPage(
      {required List<MediaListStatus> status,
      required MediaType type,
      required int page,
      required int perPage,
      String? userId,
      CancelToken? token}) {
    return Future.value(LoadSuccess(data: []));
  }

  @override
  Future<MediaWithListModel?> getMediaListItemByMediaId(
      {required String mediaId}) {
    return Future.value(null);
  }

  @override
  Stream<MediaListItemModel?> getMediaListItemByUserAndIdStream(
      {required String userId, required String animeId}) {
    return Stream.value(null);
  }

  @override
  Stream<List<MediaWithListModel>> getMediaListStream(
      {required List<MediaListStatus> status,
      required String userId,
      required MediaType type}) {
    return Stream.value([]);
  }

  @override
  Stream<SortedGroupMediaListModel> getSortedMediaListStream(
      {required List<MediaListStatus> status,
      required String userId,
      required MediaType type}) async* {
    final newUpdateListJsonString =
        await rootBundle.loadString('assets/json/media_list_data_1.json');
    final newUpdateDto = (jsonDecode(newUpdateListJsonString) as List)
        .map((e) => MediaListDto.fromJson(e))
        .toList();
    final newUpdateList = newUpdateDto.map((e) => e.toModel()).toList();

    final otherListJsonString =
        await rootBundle.loadString('assets/json/media_list_data_2.json');
    final otherDto = (jsonDecode(otherListJsonString) as List)
        .map((e) => MediaListDto.fromJson(e))
        .toList();
    final otherList = otherDto.map((e) => e.toModel()).toList();
    yield SortedGroupMediaListModel(newUpdateList, otherList);
  }

  @override
  Stream<TrackListFilter> getTrackListFilterStream() {
    return Stream.value(TrackListFilter.all);
  }

  @override
  void setTrackListFilter(TrackListFilter trackListFilter) {}

  @override
  Future<LoadResult<void>> syncMediaList(
      {String? userId,
      List<MediaListStatus> status = const [],
      int page = -1,
      MediaType? mediaType,
      CancelToken? token}) {
    return Future.value(LoadSuccess(data: []));
  }

  @override
  Future<LoadResult> syncMediaListItem(
      {String? userId,
      required String mediaId,
      required ScoreFormat format,
      CancelToken? token}) {
    return Future.value(LoadSuccess(data: []));
  }

  @override
  Future<LoadResult<void>> updateMediaList(
      {required String animeId,
      MediaListStatus? status,
      String? entryId,
      int? progress,
      int? progressVolumes,
      double? score,
      int? repeat,
      bool private = false,
      String? notes,
      DateTime? startedAt,
      DateTime? completedAt,
      CancelToken? cancelToken}) {
    return Future.value(LoadSuccess(data: []));
  }
}
