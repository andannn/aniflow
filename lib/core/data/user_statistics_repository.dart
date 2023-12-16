// ignore_for_file: avoid_dynamic_calls

import 'package:aniflow/core/common/model/stats_type.dart';
import 'package:aniflow/core/common/model/user_statics_sort.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/user_statistics_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:dio/dio.dart';

abstract class UserStatisticsRepository {
  Future<LoadResult<List<UserStatisticsModel>>> getUserStatics(
      {required String userId,
      required StatsType type,
      required UserStaticsSort sort,
      CancelToken? cancelToken});

  Future<LoadResult<List<MediaModel>>> getMediasById(
      {required List<String> ids, CancelToken? cancelToken});
}

class UserStatisticsRepositoryImpl extends UserStatisticsRepository {
  final dataSource = AniListDataSource();
  final mediaDao = AniflowDatabase().getMediaDao();

  @override
  Future<LoadResult<List<UserStatisticsModel>>> getUserStatics(
      {required String userId,
      required StatsType type,
      required UserStaticsSort sort,
      CancelToken? cancelToken}) async {
    try {
      final List statsDto;
      switch (type) {
        case StatsType.aimeGenres:
        case StatsType.animeTags:
        case StatsType.animeVoiceActors:
        case StatsType.animeStudios:
        case StatsType.animeStaff:
        case StatsType.mangaGenres:
        case StatsType.mangaTags:
        case StatsType.mangaStaff:
          statsDto = await dataSource.getUserAnimeGenresStats(
              userId, sort, cancelToken);
      }
      return LoadSuccess(
          data:
              statsDto.map((dto) => UserStatisticsModel.fromDto(dto)).toList());
    } on Exception catch (e) {
      return LoadError(e);
    }
  }

  @override
  Future<LoadResult<List<MediaModel>>> getMediasById(
      {required List<String> ids, CancelToken? cancelToken}) async {
    try {
      final cachedMediaEntities = await mediaDao.getMedias(ids);
      if (cachedMediaEntities.length == ids.length) {
        final result = cachedMediaEntities
            .map((e) => MediaModel.fromDatabaseModel(e))
            .toList();
        return LoadSuccess(data: result);
      }

      final mediaDtoList = await dataSource.getMediasById(ids, cancelToken);

      final mediaModelList =
          mediaDtoList.map((e) => MediaModel.fromDto(e)).toList();

      return LoadSuccess(data: mediaModelList);
    } on DioException catch (e) {
      return LoadError(e);
    }
  }
}
