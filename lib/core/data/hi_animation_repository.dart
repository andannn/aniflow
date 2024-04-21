import 'package:aniflow/core/data/load_result.dart';
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
  HiAnimationRepository(this.datasource);

  final HiAnimationDataSource datasource;

  Future<LoadResult<Episode>> searchPlaySourceByKeyword(
      List<String> keywords, String episode,
      [CancelToken? cancelToken]) async {
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
