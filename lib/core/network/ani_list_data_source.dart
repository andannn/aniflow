import 'package:anime_tracker/core/network/client/ani_list_dio.dart';
import 'package:anime_tracker/core/network/model/detail_network_anime_model.dart';
import 'package:dio/dio.dart';

import 'api/ani_list_graphql.dart';
import 'model/short_network_anime_model.dart';

/// Bangumi releasing season.
enum AnimeSeason {
  winter('WINTER'),
  spring('SPRING'),
  summer('SUMMER'),
  fall('FALL');

  final String sqlTypeString;

  const AnimeSeason(this.sqlTypeString);
}

/// Bangumi status.
enum AnimeStatus {
  releasing('RELEASING'),
  finished('FINISHED'),
  notYetReleased('NOT_YET_RELEASED');

  final String sqlTypeString;

  const AnimeStatus(this.sqlTypeString);
}

final AniListDataSource aniListDataSource = _AniListDataSourceImpl();

/// Anime list data source get from AniList.
abstract class AniListDataSource {
  /// throw [DioException]
  Future<List<ShortNetworkAnime>> getNetworkAnimePage({
    required int page,
    required int perPage,
    required int seasonYear,
    required AnimeSeason season,
    required AnimeStatus status,
  });

  Future<DetailNetworkAnime> getNetworkAnime({
    required int id,
  });
}

class _AniListDataSourceImpl implements AniListDataSource {
  @override
  Future<DetailNetworkAnime> getNetworkAnime({required int id}) {
    throw UnimplementedError();
  }

  @override
  Future<List<ShortNetworkAnime>> getNetworkAnimePage(
      {required int page,
      required int perPage,
      required int seasonYear,
      required AnimeSeason season,
      required AnimeStatus status}) async {
    AnimeListQueryParam param = (
      page: page,
      perPage: perPage,
      seasonYear: seasonYear,
      season: season,
      status: status,
    );
    return _getAnimeList(animeListParam: param);
  }

  Future<List<ShortNetworkAnime>> _getAnimeList<T>({
    required AnimeListQueryParam animeListParam,
    CancelToken? cancelToken,
  }) async {
    final response =
        await AniListDio().dio.post(AniListDio.aniListUrl, queryParameters: {
      'query': animeListQueryGraphQL,
      'variables': {
        'page': animeListParam.page,
        'perPage': animeListParam.perPage,
        'seasonYear': animeListParam.seasonYear,
        'season': animeListParam.season.sqlTypeString,
        'status': animeListParam.status.sqlTypeString,
      }
    });

    final List resultJson = response.data['data']['Page']['media'];
    final List<ShortNetworkAnime> animeList =
        resultJson.map((e) => ShortNetworkAnime.fromJson(e)).toList();

    return animeList;
  }
}
