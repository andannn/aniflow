import 'package:anime_tracker/core/network/api/ani_detail_query_graphql.dart';
import 'package:anime_tracker/core/network/client/ani_list_dio.dart';
import 'package:anime_tracker/core/network/model/detail_anime_dto.dart';

import 'package:anime_tracker/core/network/api/ani_list_query_graphql.dart';
import 'package:anime_tracker/core/network/model/short_anime_dto.dart';

/// Anime list data source get from AniList.
class AniListDataSource {
  static AniListDataSource? _instance;

  factory AniListDataSource() => _instance ??= AniListDataSource._();

  AniListDataSource._();

  Future<DetailAnimeDto> getNetworkAnime({required int id}) async {
    final queryGraphQL = createDetailAnimeQueryGraphQLString();
    final variablesMap = {
      'id': id,
    };
    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});

    final resultJson = response.data['data']['Media'];
    final DetailAnimeDto detailAnimeDto = DetailAnimeDto.fromJson(resultJson);

    return detailAnimeDto;
  }

  Future<List<ShortcutAnimeDto>> getNetworkAnimePage({
    required AnimePageQueryParam animeListParam,
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
