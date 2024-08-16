import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/episode_dao.dart';
import 'package:aniflow/core/network/hianime_data_source.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

class NotFoundEpisodeException implements Exception {
  final String message;
  final String searchUrl;

  NotFoundEpisodeException({required this.message, required this.searchUrl});
}

class Episode extends Equatable {
  final String url;
  final String title;
  final String epNumber;

  const Episode(this.url, this.title, this.epNumber);

  @override
  List<Object?> get props => [url, title, epNumber];
}

@LazySingleton(env: [AfEnvironment.impl])
class HiAnimationRepository {
  HiAnimationRepository(this._datasource, this._episodeDao);

  final HiAnimationDataSource _datasource;
  final EpisodeDao _episodeDao;

  Future<LoadResult<Episode>> searchPlaySourceByKeyword(
      String animeId, List<String> keywords, String episode,
      [CancelToken? cancelToken]) async {
    final episodeOrNull = await _episodeDao.findEpisode(animeId, episode);

    if (episodeOrNull != null) {
      return LoadSuccess(
        data: Episode(
          episodeOrNull.url,
          episodeOrNull.title,
          episodeOrNull.episodeNum.toString(),
        ),
      );
    }

    final searchWebUrl =
        Uri.http(hiAnimationDomain, '/search', {'keyword': keywords[0]})
            .toString();
    try {
      final animeHref =
          await _datasource.searchAnimationByKeyword(keywords, cancelToken);

      if (animeHref == null) {
        return LoadError(NotFoundEpisodeException(
          message: 'not find animation id.',
          searchUrl: searchWebUrl,
        ));
      }

      final episodes = await _datasource.getEpisodesById(animeHref, cancelToken);

      final epOrNull = episodes.firstWhereOrNull((e) => e.$3 == episode);

      if (epOrNull == null) {
        return LoadError(NotFoundEpisodeException(
          message: 'not find episode: $episode',
          searchUrl: searchWebUrl,
        ));
      }

      final (episodeId, title, epNumber) = epOrNull;
      final url = '$hiAnimationUrl$animeHref?ep=$episodeId';

      await _episodeDao.upsertEpisode(
        EpisodeEntity(
          animeId: animeId,
          title: title,
          url: url,
          episodeNum: epNumber,
        ),
      );
      return LoadSuccess(
          data: Episode(
              '$hiAnimationUrl$animeHref?ep=$episodeId', title, epNumber));
    } on Exception catch (e) {
      logger.e('Exception on searchPlaySourceByKeyword: $e');
      return LoadError(NotFoundEpisodeException(
        message: e.toString(),
        searchUrl: searchWebUrl,
      ));
    } on Error catch (e) {
      logger.e('Error on searchPlaySourceByKeyword: $e');
      return LoadError(NotFoundEpisodeException(
        message: e.toString(),
        searchUrl: searchWebUrl,
      ));
    }
  }
}
