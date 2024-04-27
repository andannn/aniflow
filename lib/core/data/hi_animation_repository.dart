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

@Injectable()
class HiAnimationRepository {
  HiAnimationRepository(this.datasource, this.episodeDao);

  final HiAnimationDataSource datasource;
  final EpisodeDao episodeDao;

  Future<LoadResult<Episode>> searchPlaySourceByKeyword(
      String animeId, List<String> keywords, String episode,
      [CancelToken? cancelToken]) async {
    final episodeOrNull = await episodeDao.findEpisode(animeId, episode);

    if (episodeOrNull != null) {
      return LoadSuccess(
        data: Episode(
          episodeOrNull.url,
          episodeOrNull.title,
          episodeOrNull.episodeNum.toString(),
        ),
      );
    }

    try {
      final animeHref =
          await datasource.searchAnimationByKeyword(keywords, cancelToken);

      if (animeHref == null) {
        return LoadError(NotFoundEpisodeException(
          message: 'not find animation id.',
          searchUrl:
              Uri.http(hiAnimationDomain, '/search', {'keyword': keywords[0]})
                  .toString(),
        ));
      }

      final episodes = await datasource.getEpisodesById(animeHref, cancelToken);

      final epOrNull = episodes.firstWhereOrNull((e) => e.$3 == episode);

      if (epOrNull == null) {
        return LoadError(NotFoundEpisodeException(
          message: 'not find episode: $episode',
          searchUrl:
              Uri.http(hiAnimationDomain, '/search', {'keyword': keywords[0]})
                  .toString(),
        ));
      }

      final (episodeId, title, epNumber) = epOrNull;
      final url = '$hiAnimationUrl$animeHref?ep=$episodeId';

      await episodeDao.upsertEpisode(
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
      return LoadError(e);
    } on Error catch (e) {
      return LoadError(Exception(e));
    }
  }
}
