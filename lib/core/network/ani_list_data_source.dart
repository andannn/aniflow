// ignore_for_file: avoid_dynamic_calls

import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/model/setting/score_format.dart';
import 'package:aniflow/core/common/model/staff_language.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/network/api/activity_like_mution_graphql.dart';
import 'package:aniflow/core/network/api/activity_page_query_graphql.dart';
import 'package:aniflow/core/network/api/airing_schedules_query_graphql.dart.dart';
import 'package:aniflow/core/network/api/character_detail_query_graphql.dart';
import 'package:aniflow/core/network/api/media_detail_query_graphql.dart';
import 'package:aniflow/core/network/api/media_list_query_graphql.dart';
import 'package:aniflow/core/network/api/media_page_query_graphql.dart';
import 'package:aniflow/core/network/api/query_anime_staff_page_graphql.dart';
import 'package:aniflow/core/network/api/query_media_character_page_graphql.dart';
import 'package:aniflow/core/network/api/search_query_graphql.dart';
import 'package:aniflow/core/network/api/staff_detail_query_graphql.dart';
import 'package:aniflow/core/network/api/toggle_favorite_mution_graphql.dart';
import 'package:aniflow/core/network/api/user_favorite_anime_query_graphql.dart';
import 'package:aniflow/core/network/api/user_favorite_character_query_graphql.dart';
import 'package:aniflow/core/network/api/user_favorite_manga_query_graphql.dart';
import 'package:aniflow/core/network/api/user_favorite_staff_query_graphql.dart';
import 'package:aniflow/core/network/client/ani_list_dio.dart';
import 'package:aniflow/core/network/model/airing_schedule_dto.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/character_dto.dart';
import 'package:aniflow/core/network/model/character_edge.dart';
import 'package:aniflow/core/network/model/likeable_type.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';
import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:aniflow/core/network/model/staff_edge.dart';
import 'package:aniflow/core/network/util/auth_request_util.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:dio/dio.dart';

/// Anime list data source get from AniList.
class AniListDataSource {
  static AniListDataSource? _instance;

  factory AniListDataSource() => _instance ??= AniListDataSource._();

  AniListDataSource._();

  String get _token =>
      isUnitTest ? testToken : AniFlowPreferences().getAuthToken();

  Future<MediaDto> getNetworkAnime(
      {required int id, CancelToken? token}) async {
    final queryGraphQL = mediaDetailQueryGraphQLString;
    final variablesMap = {
      'id': id,
    };
    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          data: {'query': queryGraphQL, 'variables': variablesMap},
          cancelToken: token,
          options: createQueryOptions(_token),
        );

    final resultJson = response.data['data']['Media'];
    final MediaDto detailAnimeDto = MediaDto.fromJson(resultJson);

    return detailAnimeDto;
  }

  Future<List<MediaDto>> getNetworkAnimePage({
    required int page,
    required int perPage,
    required AnimePageQueryParam param,
    CancelToken? token,
  }) async {
    final queryGraphQL = animeListQueryGraphQLString;
    final hasSeasonYear = param.seasonYear != null;
    final hasSeason = param.season != null;
    final hasStatus = param.status != null;
    final hasAnimeSort = param.animeSort.isNotEmpty;
    final hasAnimeFormat = param.animeFormat.isNotEmpty;
    final hasCountryCode = param.countryCode != null;
    final hasIsAdult = param.isAdult != null;
    final variablesMap = <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'type': param.type.toJson(),
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
    if (hasIsAdult) {
      variablesMap['isAdult'] = param.isAdult;
    }

    return AniListDio().dio.post(
      AniListDio.aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
    ).then((response) {
      final List resultJson = response.data['data']['Page']['media'];
      return resultJson.map((e) => MediaDto.fromJson(e)).toList();
    });
  }

  Future<List<CharacterEdge>> getCharacterPage({
    required int animeId,
    required StaffLanguage language,
    required int page,
    required int perPage,
    CancelToken? token,
  }) async {
    final queryGraphQL = characterPageGraphql;
    final variablesMap = <String, dynamic>{
      'id': animeId,
      'page': page,
      'perPage': perPage,
      'staffLanguage': language.toJson(),
    };
    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {'query': queryGraphQL, 'variables': variablesMap},
          options: createQueryOptions(_token),
        );

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
    CancelToken? token,
  }) async {
    final queryGraphQL = staffPageGraphql;
    final variablesMap = <String, dynamic>{
      'id': animeId,
      'page': page,
      'perPage': perPage,
    };
    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {'query': queryGraphQL, 'variables': variablesMap},
          options: createQueryOptions(_token),
        );

    final List resultJson = response.data['data']['Media']['staff']['edges'];
    final List<StaffEdge> staffs =
        resultJson.map((e) => StaffEdge.fromJson(e)).toList();

    return staffs;
  }

  Future<List<MediaListDto>> getUserMediaListPage({
    required UserAnimeListPageQueryParam param,
    CancelToken? token,
  }) async {
    final queryGraphQL = userMediaListGraphQLString;
    final hasStatus = param.status.isNotEmpty;
    final hasPerPage = param.perPage != null;
    final hasMediaType = param.mediaType != null;
    final variablesMap = <String, dynamic>{
      'page': param.page,
      'userId': param.userId,
      'format': param.format,
    };
    if (hasStatus) {
      variablesMap['status_in'] =
          param.status.map((e) => e.sqlTypeString).toList();
    }
    if (hasPerPage) {
      variablesMap['perPage'] = param.perPage;
    }
    if (hasMediaType) {
      variablesMap['type'] = param.mediaType!.toJson();
    }

    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {'query': queryGraphQL, 'variables': variablesMap},
          options: createQueryOptions(_token),
        );

    final List resultJson = response.data['data']['Page']['mediaList'];
    final List<MediaListDto> animeList =
        resultJson.map((e) => MediaListDto.fromJson(e)).toList();

    return animeList;
  }

  Future<MediaListDto?> getSingleMediaListItem({
    required String userId,
    required String mediaId,
    required ScoreFormat format,
    CancelToken? token,
  }) async {
    final queryGraphQL = singleMediaListGraphQLString;
    final variablesMap = <String, dynamic>{
      'mediaId': mediaId,
      'userId': userId,
      'format': format.toJson(),
    };

    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {'query': queryGraphQL, 'variables': variablesMap},
          options: createQueryOptions(_token),
        );

    final Map<String, dynamic> resultJson = response.data['data']['MediaList'];
    final mediaList = MediaListDto.fromJson(resultJson);

    if (mediaList.id == -1) {
      return null;
    } else {
      return MediaListDto.fromJson(resultJson);
    }
  }

  Future<List<AiringScheduleDto>> getAiringSchedules({
    required AiringSchedulesQueryParam param,
    CancelToken? token,
  }) async {
    final queryGraphQL = airingSchedulesQueryGraphQLString;
    final variablesMap = <String, dynamic>{
      'airingAt_greater': param.airingAtGreater,
      'airingAt_lesser': param.airingAtLesser,
    };

    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {
            'query': queryGraphQL,
            'variables': variablesMap,
          },
          options: createQueryOptions(_token),
        );
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
    CancelToken? token,
  }) async {
    final queryGraphQL = searchQueryGraphql;
    final variablesMap = <String, dynamic>{
      'search': search,
      'page': page,
      'perPage': perPage,
      'type': type.toJson(),
    };
    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {'query': queryGraphQL, 'variables': variablesMap},
          options: createQueryOptions(_token),
        );
    final List resultJson = response.data['data']['page']['media'];
    final List<MediaDto> mediaList =
        resultJson.map((e) => MediaDto.fromJson(e)).toList();

    return mediaList;
  }

  Future<List<MediaDto>> getFavoriteAnimeMedia({
    required String userId,
    required int page,
    required int perPage,
    CancelToken? token,
  }) async {
    final queryGraphQL = userFavoriteAnimeQueryGraphQl;
    final variablesMap = <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'UserId': userId,
    };
    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {'query': queryGraphQL, 'variables': variablesMap},
          options: createQueryOptions(_token),
        );
    final List resultJson =
        response.data['data']['User']['favourites']['anime']['nodes'];
    final List<MediaDto> mediaList =
        resultJson.map((e) => MediaDto.fromJson(e)).toList();

    return mediaList;
  }

  Future<List<MediaDto>> getFavoriteMangaMedia({
    required String userId,
    required int page,
    required int perPage,
    CancelToken? token,
  }) async {
    final queryGraphQL = userFavoriteMangaQueryGraphQl;
    final variablesMap = <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'UserId': userId,
    };
    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {'query': queryGraphQL, 'variables': variablesMap},
          options: createQueryOptions(_token),
        );

    final List resultJson =
        response.data['data']['User']['favourites']['manga']['nodes'];
    final List<MediaDto> mediaList =
        resultJson.map((e) => MediaDto.fromJson(e)).toList();

    return mediaList;
  }

  Future<List<CharacterDto>> getFavoriteCharacter({
    required String userId,
    required int page,
    required int perPage,
    CancelToken? token,
  }) async {
    final queryGraphQL = userFavoriteCharacterQueryGraphQl;
    final variablesMap = <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'UserId': userId,
    };
    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {'query': queryGraphQL, 'variables': variablesMap},
          options: createQueryOptions(_token),
        );
    final List resultJson =
        response.data['data']['User']['favourites']['characters']['nodes'];
    final List<CharacterDto> characters =
        resultJson.map((e) => CharacterDto.fromJson(e)).toList();

    return characters;
  }

  Future<List<StaffDto>> getFavoriteStaffs({
    required String userId,
    required int page,
    required int perPage,
    CancelToken? token,
  }) async {
    final queryGraphQL = userFavoriteStaffQueryGraphQl;
    final variablesMap = <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'UserId': userId,
    };

    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {'query': queryGraphQL, 'variables': variablesMap},
          options: createQueryOptions(_token),
        );
    final List resultJson =
        response.data['data']['User']['favourites']['staff']['nodes'];
    final List<StaffDto> staff =
        resultJson.map((e) => StaffDto.fromJson(e)).toList();

    return staff;
  }

  Future<List<AniActivity>> getActivities({
    required int page,
    required int perPage,
    required ActivityPageQueryParam param,
    CancelToken? token,
  }) async {
    final queryGraphQL = activitiesGraphQLString;
    final variablesMap = <String, dynamic>{
      'page': page,
      'perPage': perPage,
    };
    if (param.userId != null) {
      variablesMap['userId'] = param.userId;
    }
    if (param.type.isNotEmpty) {
      variablesMap['type_in'] = param.type.map((e) => e.toJson()).toList();
    }
    if (param.mediaId != null) {
      variablesMap['mediaId'] = param.mediaId;
    }
    if (param.isFollowing != null) {
      variablesMap['isFollowing'] = param.isFollowing;
    }
    if (param.hasRepliesOrTypeText != null) {
      variablesMap['hasRepliesOrTypeText'] = param.hasRepliesOrTypeText;
    }

    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {
            'query': queryGraphQL,
            'variables': variablesMap,
          },
          options: createQueryOptions(_token),
        );
    final List resultJson = response.data['data']['Page']['activities'];
    final activities =
        resultJson.map((e) => AniActivity.mapToAniActivity(e)).toList();

    return activities;
  }

  Future toggleFavorite(
      ToggleFavoriteMutationParam param, CancelToken token) async {
    final queryGraphQL = toggleFavoriteMutationGraphQl;
    final variablesMap = <String, dynamic>{};
    if (param.animeId != null) {
      variablesMap['animeId'] = param.animeId;
    }
    if (param.mangaId != null) {
      variablesMap['mangaId'] = param.mangaId;
    }
    if (param.characterId != null) {
      variablesMap['characterId'] = param.characterId;
    }
    if (param.staffId != null) {
      variablesMap['staffId'] = param.staffId;
    }
    if (param.studioId != null) {
      variablesMap['studioId'] = param.studioId;
    }
    await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {
            'query': queryGraphQL,
            'variables': variablesMap,
          },
          options: createQueryOptions(_token),
        );
  }

  Future toggleSocialContentLike(
      String id, LikeableType type, CancelToken token) async {
    final queryGraphQL = activityLikeMutationGraphql;
    final variablesMap = <String, dynamic>{'id': id, 'type': type};
    await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {
            'query': queryGraphQL,
            'variables': variablesMap,
          },
          options: createQueryOptions(_token),
        );
  }

  Future<CharacterDto> getCharacterById({
    required String characterId,
    CancelToken? token,
  }) async {
    final queryGraphQL = characterDetailQueryGraphQLString;
    final variablesMap = <String, dynamic>{
      'id': characterId,
    };

    final response = await AniListDio().dio.post(
          AniListDio.aniListUrl,
          cancelToken: token,
          data: {'query': queryGraphQL, 'variables': variablesMap},
          options: createQueryOptions(_token),
        );
    final Map<String, dynamic> resultJson = response.data['data']['Character'];
    final characterDto = CharacterDto.fromJson(resultJson);

    return characterDto;
  }

  Future<StaffDto> getStaffById({
    required String staffId,
    CancelToken? token,
  }) async {
    final queryGraphQL = staffDetailQueryGraphQLString;
    final variablesMap = <String, dynamic>{
      'id': staffId,
    };

    final response = await AniListDio().dio.post(
      AniListDio.aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
      options: createQueryOptions(_token),
    );
    final Map<String, dynamic> resultJson = response.data['data']['Staff'];
    final staffDto = StaffDto.fromJson(resultJson);

    return staffDto;
  }
}
