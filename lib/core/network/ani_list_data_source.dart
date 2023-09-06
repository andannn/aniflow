import 'package:anime_tracker/core/network/client/ani_list_dio.dart';
import 'package:anime_tracker/core/network/model/detail_anime_dto.dart';
import 'package:dio/dio.dart';

import 'api/ani_list_graphql.dart';
import 'model/short_anime_dto.dart';

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
  Future<List<ShortcutAnimeDto>> getNetworkAnimePage({
    required AnimePageQueryParam animeListParam,
  });

  Future<DetailAnimeDto> getNetworkAnime({
    required int id,
  });
}

class _AniListDataSourceImpl implements AniListDataSource {
  @override
  Future<DetailAnimeDto> getNetworkAnime({required int id}) {
    throw UnimplementedError();
  }

  @override
  Future<List<ShortcutAnimeDto>> getNetworkAnimePage({
    required AnimePageQueryParam animeListParam,
  }) async {
    return _getAnimeList(animeListParam: animeListParam);
  }

  Future<List<ShortcutAnimeDto>> _getAnimeList<T>({
    required AnimePageQueryParam animeListParam,
    CancelToken? cancelToken,
  }) async {
    final response = await AniListDio().dio.post(AniListDio.aniListUrl, queryParameters: {
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
    final List<ShortcutAnimeDto> animeList = resultJson.map((e) => ShortcutAnimeDto.fromJson(e)).toList();

    return animeList;
  }
}
