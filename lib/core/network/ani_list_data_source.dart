import 'package:anime_tracker/core/network/api/airing_schedules_query_graphql.dart.dart';
import 'package:anime_tracker/core/network/api/ani_detail_query_graphql.dart';
import 'package:anime_tracker/core/network/api/user_anime_list_query_graphql.dart';
import 'package:anime_tracker/core/network/client/ani_list_dio.dart';
import 'package:anime_tracker/core/network/model/airing_schedule_dto.dart';
import 'package:anime_tracker/core/network/model/detail_anime_dto.dart';

import 'package:anime_tracker/core/network/api/ani_list_query_graphql.dart';
import 'package:anime_tracker/core/network/model/media_list_dto.dart';
import 'package:anime_tracker/core/network/model/short_anime_dto.dart';

/// Anime list data source get from AniList.
class AniListDataSource {
  static AniListDataSource? _instance;

  factory AniListDataSource() => _instance ??= AniListDataSource._();

  AniListDataSource._();

  Future<DetailAnimeDto> getNetworkAnime({required int id}) async {
    final queryGraphQL = detailAnimeQueryGraphQLString;
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
    required AnimePageQueryParam param,
  }) async {
    final queryGraphQL = animeListQueryGraphQLString;
    final hasSeasonYear = param.seasonYear != null;
    final hasSeason = param.season != null;
    final hasStatus = param.status != null;
    final hasAnimeSort = param.animeSort.isNotEmpty;
    final hasAnimeFormat = param.animeFormat.isNotEmpty;
    final variablesMap = <String, dynamic>{
      'page': param.page,
      'perPage': param.perPage,
    };

    if (hasSeasonYear) {
      variablesMap['seasonYear'] = param.seasonYear;
    }
    if (hasSeason) {
      variablesMap['season'] = param.season?.sqlTypeString;
    }
    if (hasStatus) {
      variablesMap['status'] = param.status?.sqlTypeString;
    }
    if (hasAnimeSort) {
      variablesMap['sort'] =
          param.animeSort.map((e) => e.sqlTypeString).toList();
    }
    if (hasAnimeFormat) {
      variablesMap['format_in'] =
          param.animeFormat.expand((list) => list.sqlTypeString).toList();
    }

    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});

    final List resultJson = response.data['data']['Page']['media'];
    final List<ShortcutAnimeDto> animeList =
        resultJson.map((e) => ShortcutAnimeDto.fromJson(e)).toList();

    return animeList;
  }

  Future<List<MediaListDto>> getUserMediaListPage({
    required UserAnimeListPageQueryParam param,
  }) async {
    final queryGraphQL = userAnimeListGraphQLString;
    final hasStatus = param.status.isNotEmpty;
    final hasPerPage = param.perPage != null;
    final variablesMap = <String, dynamic>{
      'page': param.page,
      'userId': param.userId,
    };
    if (hasStatus) {
      variablesMap['status_in'] =
          param.status.map((e) => e.sqlTypeString).toList();
    }
    if (hasPerPage) {
      variablesMap['perPage'] = param.perPage;
    }

    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});

    final List resultJson = response.data['data']['Page']['mediaList'];
    final List<MediaListDto> animeList =
        resultJson.map((e) => MediaListDto.fromJson(e)).toList();

    return animeList;
  }

  Future<List<AiringScheduleDto>> getAiringSchedules(
      AiringSchedulesQueryParam param) async {
    final queryGraphQL = airingSchedulesQueryGraphQLString;
    final variablesMap = <String, dynamic>{
      'airingAt_greater': param.airingAtGreater,
      'airingAt_lesser': param.airingAtLesser,
    };

    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});
    final List resultJson = response.data['data']['Page']['airingSchedules'];
    final airingSchedules =
        resultJson.map((e) => AiringScheduleDto.fromJson(e)).toList();

    return airingSchedules;
  }
}
