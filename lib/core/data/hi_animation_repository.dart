import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/episode_dao.dart';
import 'package:aniflow/core/network/hianime_data_source.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:platform_extractor/platform_extractor.dart';

class NotFoundEpisodeException implements Exception {
  final String message;
  final String searchUrl;

  NotFoundEpisodeException({required this.message, required this.searchUrl});
}

class Episode extends Equatable {
  final String url;
  final String title;

  const Episode(this.url, this.title);

  @override
  List<Object?> get props => [url, title];
}

@LazySingleton(env: [AfEnvironment.impl])
class HiAnimationRepository {
  HiAnimationRepository(
    this._datasource,
    this._episodeDao,
    this._preferences,
    this._extractor,
  );

  final HiAnimationDataSource _datasource;
  final EpisodeDao _episodeDao;
  final UserDataPreferences _preferences;
  final PlatformExtractor _extractor;

  Future<LoadResult<Episode>> searchPlaySourceByKeyword(
      String animeId, List<String> keywords, String episode,
      [CancelToken? cancelToken]) async {
    EpisodeEntity? episodeEntity;
    try {
      episodeEntity = await _getEpisodeWithoutWebPageLink(
          animeId, keywords, episode, cancelToken);
    } on Exception catch (e) {
      return LoadError(e);
    }

    final useInAppPlayer = _preferences.userData.useInAppPlayer;
    if (!useInAppPlayer) {
      return LoadSuccess(
        data: Episode(
          episodeEntity.url,
          episodeEntity.title,
        ),
      );
    }

    try {
      final link = await _datasource.getPlayLink(episodeEntity.episodeId);
      final playableLink = await _extractor.extract(link);
      return LoadSuccess(
        data: Episode(
          playableLink,
          episodeEntity.title,
        ),
      );
    } on Exception catch (e) {
      return LoadError(e);
    }
  }

  Future<EpisodeEntity> _getEpisodeWithoutWebPageLink(
      String animeId, List<String> keywords, String episodeNum,
      [CancelToken? cancelToken]) async {
    final episode = await _episodeDao.findEpisode(animeId, episodeNum);

    if (episode != null) {
      return episode;
    }

    final searchWebUrl =
        Uri.http(hiAnimationDomain, '/search', {'keyword': keywords[0]})
            .toString();

    try {
      final animeHref =
          await _datasource.searchAnimationByKeyword(keywords, cancelToken);

      if (animeHref == null) {
        throw NotFoundEpisodeException(
          message: 'not find animation id.',
          searchUrl: searchWebUrl,
        );
      }

      final episodes =
          await _datasource.getEpisodesById(animeHref, cancelToken);

      await _episodeDao.upsertEpisode(
        episodes.map((e) {
          final (episodeId, title, epNumber) = e;
          final url = '$hiAnimationUrl$animeHref?ep=$episodeId';
          return EpisodeEntity(
            animeId: animeId,
            episodeId: episodeId,
            title: title,
            url: url,
            episodeNum: epNumber,
          );
        }).toList(),
      );

      final savedEpisode = await _episodeDao.findEpisode(animeId, episodeNum);

      if (savedEpisode == null) {
        return throw NotFoundEpisodeException(
          message: 'not find episode: $episode',
          searchUrl: searchWebUrl,
        );
      }

      return savedEpisode;
    } catch (e) {
      throw NotFoundEpisodeException(
        message: e.toString(),
        searchUrl: searchWebUrl,
      );
    }
  }
}
