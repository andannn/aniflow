// ignore_for_file: avoid_dynamic_calls

import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/network/api/airing_schedules_query_graphql.dart.dart';
import 'package:aniflow/core/network/api/media_detail_query_graphql.dart';
import 'package:aniflow/core/network/api/media_list_query_graphql.dart';
import 'package:aniflow/core/network/api/media_page_query_graphql.dart';
import 'package:aniflow/core/network/api/query_anime_staff_page_graphql.dart';
import 'package:aniflow/core/network/api/query_media_character_page_graphql.dart';
import 'package:aniflow/core/network/api/search_query_graphql.dart';
import 'package:aniflow/core/network/api/user_favorite_anime_query_graphql.dart';
import 'package:aniflow/core/network/api/user_favorite_character_query_graphql.dart';
import 'package:aniflow/core/network/api/user_favorite_manga_query_graphql.dart';
import 'package:aniflow/core/network/api/user_favorite_staff_query_graphql.dart';
import 'package:aniflow/core/network/client/ani_list_dio.dart';
import 'package:aniflow/core/network/model/airing_schedule_dto.dart';
import 'package:aniflow/core/network/model/character_dto.dart';
import 'package:aniflow/core/network/model/character_edge.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';
import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:aniflow/core/network/model/staff_edge.dart';

/// Anime list data source get from AniList.
class AniListDataSource {
  static AniListDataSource? _instance;

  factory AniListDataSource() => _instance ??= AniListDataSource._();

  AniListDataSource._();

  Future<MediaDto> getNetworkAnime({required int id}) async {
    final queryGraphQL = mediaDetailQueryGraphQLString;
    final variablesMap = {
      'id': id,
    };
    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});

    final resultJson = response.data['data']['Media'];
    final MediaDto detailAnimeDto = MediaDto.fromJson(resultJson);

    return detailAnimeDto;
  }

  Future<List<MediaDto>> getNetworkAnimePage({
    required int page,
    required int perPage,
    required AnimePageQueryParam param,
  }) async {
    final queryGraphQL = animeListQueryGraphQLString;
    final hasSeasonYear = param.seasonYear != null;
    final hasSeason = param.season != null;
    final hasStatus = param.status != null;
    final hasAnimeSort = param.animeSort.isNotEmpty;
    final hasAnimeFormat = param.animeFormat.isNotEmpty;
    final hasCountryCode = param.countryCode != null;
    final variablesMap = <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'type': param.type.jsonString,
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
    if (hasCountryCode) {
      variablesMap['countryCode'] = param.countryCode!.alpha2;
    }

    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});

    final List resultJson = response.data['data']['Page']['media'];
    final List<MediaDto> animeList =
        resultJson.map((e) => MediaDto.fromJson(e)).toList();

    return animeList;
  }

  Future<List<CharacterEdge>> getCharacterPage({
    required int animeId,
    required int page,
    required int perPage,
  }) async {
    final queryGraphQL = characterPageGraphql;
    final variablesMap = <String, dynamic>{
      'id': animeId,
      'page': page,
      'perPage': perPage,
    };
    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});

    final List resultJson =
        response.data['data']['Media']['characters']['edges'];
    final List<CharacterEdge> characters =
        resultJson.map((e) => CharacterEdge.fromJson(e)).toList();

    return characters;
  }

  Future<List<StaffEdge>> getStaffPage({
    required int animeId,
    required int page,
    required int perPage,
  }) async {
    final queryGraphQL = staffPageGraphql;
    final variablesMap = <String, dynamic>{
      'id': animeId,
      'page': page,
      'perPage': perPage,
    };
    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});

    final List resultJson = response.data['data']['Media']['staff']['edges'];
    final List<StaffEdge> staffs =
        resultJson.map((e) => StaffEdge.fromJson(e)).toList();

    return staffs;
  }

  Future<List<MediaListDto>> getUserMediaListPage({
    required UserAnimeListPageQueryParam param,
  }) async {
    final queryGraphQL = userAnimeListGraphQLString;
    final hasStatus = param.status.isNotEmpty;
    final hasPerPage = param.perPage != null;
    final hasMediaType = param.mediaType != null;
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
    if (hasMediaType) {
      variablesMap['type'] = param.mediaType!.jsonString;
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

  Future<List<MediaDto>> searchAnimePage({
    required int page,
    required int perPage,
    required MediaType type,
    required String search,
  }) async {
    final queryGraphQL = searchQueryGraphql;
    final variablesMap = <String, dynamic>{
      'search': search,
      'page': page,
      'perPage': perPage,
      'type': type.jsonString,
    };
    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});
    final List resultJson = response.data['data']['page']['media'];
    final List<MediaDto> mediaList =
        resultJson.map((e) => MediaDto.fromJson(e)).toList();

    return mediaList;
  }

  Future<List<MediaDto>> getFavoriteAnimeMedia(
      {required String userId, required int page, required int perPage}) async {
    final queryGraphQL = userFavoriteAnimeQueryGraphQl;
    final variablesMap = <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'UserId': userId,
    };
    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});
    final List resultJson =
        response.data['data']['User']['favourites']['anime']['nodes'];
    final List<MediaDto> mediaList =
        resultJson.map((e) => MediaDto.fromJson(e)).toList();

    return mediaList;
  }

  Future<List<MediaDto>> getFavoriteMangaMedia(
      {required String userId, required int page, required int perPage}) async {
    final queryGraphQL = userFavoriteMangaQueryGraphQl;
    final variablesMap = <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'UserId': userId,
    };
    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});

    final List resultJson =
        response.data['data']['User']['favourites']['manga']['nodes'];
    final List<MediaDto> mediaList =
        resultJson.map((e) => MediaDto.fromJson(e)).toList();

    return mediaList;
  }

  Future<List<CharacterDto>> getFavoriteCharacter(
      {required String userId, required int page, required int perPage}) async {
    final queryGraphQL = userFavoriteCharacterQueryGraphQl;
    final variablesMap = <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'UserId': userId,
    };
    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});
    final List resultJson =
        response.data['data']['User']['favourites']['characters']['nodes'];
    final List<CharacterDto> characters =
        resultJson.map((e) => CharacterDto.fromJson(e)).toList();

    return characters;
  }

  Future<List<StaffDto>> getFavoriteStaffs(
      {required String userId, required int page, required int perPage}) async {
    final queryGraphQL = userFavoriteStaffQueryGraphQl;
    final variablesMap = <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'UserId': userId,
    };

    final response = await AniListDio().dio.post(AniListDio.aniListUrl,
        data: {'query': queryGraphQL, 'variables': variablesMap});
    final List resultJson =
        response.data['data']['User']['favourites']['staff']['nodes'];
    final List<StaffDto> staff =
        resultJson.map((e) => StaffDto.fromJson(e)).toList();

    return staff;
  }
}
