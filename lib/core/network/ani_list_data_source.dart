import 'package:anime_tracker/core/network/client/ani_list_dio.dart';
import 'package:anime_tracker/core/network/model/detail_anime_dto.dart';
import 'package:dio/dio.dart';

import 'api/ani_list_query_graphql.dart';
import 'model/short_anime_dto.dart';

/// Anime list data source get from AniList.
class AniListDataSource {
  static AniListDataSource? _instance;

  factory AniListDataSource() => _instance ??= AniListDataSource._();

  AniListDataSource._();

  /// throw [DioException]
  Future<DetailAnimeDto> getNetworkAnime({required int id}) {
    throw UnimplementedError();
  }

  Future<List<ShortcutAnimeDto>> getNetworkAnimePage({
    required AnimePageQueryParam animeListParam,
  }) async {
    return _getAnimeList(animeListParam: animeListParam);
  }

  Future<List<ShortcutAnimeDto>> _getAnimeList<T>({
    required AnimePageQueryParam animeListParam,
    CancelToken? cancelToken,
  }) async {
    final queryGraphQL = createAnimeListQueryGraphQLString(animeListParam);
    final variablesMap = {
      'page': animeListParam.page,
      'perPage': animeListParam.perPage,
      'seasonYear': animeListParam.seasonYear,
      'season': animeListParam.season?.sqlTypeString,
      'status': animeListParam.status?.sqlTypeString,
      'sort' : animeListParam.animeSort.map((e) => e.sqlTypeString).toList(),
      'format_in' : animeListParam.animeFormat?.sqlTypeString.toList(),
    };
    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});

    final List resultJson = response.data['data']['Page']['media'];
    final List<ShortcutAnimeDto> animeList =
        resultJson.map((e) => ShortcutAnimeDto.fromJson(e)).toList();

    return animeList;
  }
}
