// ignore_for_file: avoid_dynamic_calls

import 'package:aniflow/core/common/definitions/media_sort.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/definitions/staff_language.dart';
import 'package:aniflow/core/common/definitions/user_statics_sort.dart';
import 'package:aniflow/core/common/definitions/user_stats_type.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/network/api/activity_detail_query_graphql.dart';
import 'package:aniflow/core/network/api/activity_like_mution_graphql.dart';
import 'package:aniflow/core/network/api/activity_page_query_graphql.dart';
import 'package:aniflow/core/network/api/airing_schedules_query_graphql.dart.dart';
import 'package:aniflow/core/network/api/character_detail_query_graphql.dart';
import 'package:aniflow/core/network/api/media_detail_query_graphql.dart';
import 'package:aniflow/core/network/api/media_list_query_graphql.dart';
import 'package:aniflow/core/network/api/media_page_query_graphql.dart';
import 'package:aniflow/core/network/api/medias_query_graphql.dart';
import 'package:aniflow/core/network/api/query_anime_staff_page_graphql.dart';
import 'package:aniflow/core/network/api/query_media_character_page_graphql.dart';
import 'package:aniflow/core/network/api/search_query_graphql.dart';
import 'package:aniflow/core/network/api/staff_detail_query_graphql.dart';
import 'package:aniflow/core/network/api/studio_detail_query_graphql.dart';
import 'package:aniflow/core/network/api/toggle_favorite_mutation_graphql.dart';
import 'package:aniflow/core/network/api/user_favorite_anime_query_graphql.dart';
import 'package:aniflow/core/network/api/user_favorite_character_query_graphql.dart';
import 'package:aniflow/core/network/api/user_favorite_manga_query_graphql.dart';
import 'package:aniflow/core/network/api/user_favorite_query_graphql.dart';
import 'package:aniflow/core/network/api/user_favorite_staff_query_graphql.dart';
import 'package:aniflow/core/network/api/user_stats_query_graphql.dart';
import 'package:aniflow/core/network/model/airing_schedule_dto.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/character_dto.dart';
import 'package:aniflow/core/network/model/character_edge.dart';
import 'package:aniflow/core/network/model/likeable_type.dart';
import 'package:aniflow/core/network/model/media_connection.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';
import 'package:aniflow/core/network/model/page_info.dart';
import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:aniflow/core/network/model/staff_edge.dart';
import 'package:aniflow/core/network/model/studio_dto.dart';
import 'package:aniflow/core/network/model/user_dto.dart';
import 'package:aniflow/core/network/model/user_favourites_dto.dart';
import 'package:aniflow/core/network/model/user_statistics_dto.dart';
import 'package:aniflow/core/network/util/anilist_page_util.dart';
import 'package:aniflow/core/network/util/date_time_util.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

String aniListUrl = "https://graphql.anilist.co";

@lazySingleton
class AniListDataSource {
  AniListDataSource(this.dio);

  final Dio dio;

  Future<MediaDto> getNetworkAnime(
      {required int id, CancelToken? token}) async {
    final queryGraphQL = mediaDetailQueryGraphQLString;
    final variablesMap = {
      'id': id,
    };
    final response = await dio.post(
      aniListUrl,
      data: {'query': queryGraphQL, 'variables': variablesMap},
      cancelToken: token,
    );

    final resultJson = response.data['data']['Media'];
    final MediaDto detailAnimeDto = MediaDto.fromJson(resultJson);

    return detailAnimeDto;
  }

  Future<List<MediaDto>> getNetworkMediaPage({
    required int page,
    required int perPage,
    required AnimePageQueryParam param,
    CancelToken? token,
  }) async {
    final queryGraphQL = mediaListQueryGraphQLString;
    final variablesMap = <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'type': param.type.toJson(),
    };

    if (param.seasonYear != null) {
      variablesMap['seasonYear'] = param.seasonYear;
    }
    if (param.season != null) {
      variablesMap['season'] = param.season?.sqlTypeString;
    }
    if (param.status != null) {
      variablesMap['status'] = param.status?.sqlTypeString;
    }
    if (param.mediaSort.isNotEmpty) {
      variablesMap['sort'] = param.mediaSort.map((e) => e.toJson()).toList();
    }
    if (param.mediaFormat.isNotEmpty) {
      variablesMap['format_in'] =
          param.mediaFormat.map((e) => e.toJson()).toList();
    }
    if (param.countryCode != null) {
      variablesMap['countryCode'] = param.countryCode!.alpha2;
    }
    if (param.isAdult != null) {
      variablesMap['isAdult'] = param.isAdult;
    }
    if (param.startDateGreater != null) {
      variablesMap['startDate_greater'] =
          param.startDateGreater!.toFuzzyDateInt();
    }
    if (param.endDateGreater != null) {
      variablesMap['endDate_lesser'] = param.endDateGreater!.toFuzzyDateInt();
    }

    return dio.post(
      aniListUrl,
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
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
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
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
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

    if (param.isRequestAllItem) {
      return AniListPageUtil.getAllPageItem(
        onGetPage: (page) async {
          final variablesMap = <String, dynamic>{
            'page': page,
            'userId': param.userId,
            'format': param.format,
          };
          if (param.status.isNotEmpty) {
            variablesMap['status_in'] =
                param.status.map((e) => e.sqlTypeString).toList();
          }
          if (param.mediaType != null) {
            variablesMap['type'] = param.mediaType!.toJson();
          }

          final response = await dio.post(
            aniListUrl,
            cancelToken: token,
            data: {'query': queryGraphQL, 'variables': variablesMap},
          );
          return response.data;
        },
        getPageInfoFromResult: (result) {
          return PageInfo.fromJson(result['data']['Page']['pageInfo']);
        },
        getItemListFromResult: (result) {
          final List resultJson = result['data']['Page']['mediaList'];
          return resultJson.map((e) => MediaListDto.fromJson(e)).toList();
        },
      );
    } else {
      final variablesMap = <String, dynamic>{
        'page': param.page,
        'userId': param.userId,
        'format': param.format,
      };
      if (param.status.isNotEmpty) {
        variablesMap['status_in'] =
            param.status.map((e) => e.sqlTypeString).toList();
      }
      if (param.perPage != null) {
        variablesMap['perPage'] = param.perPage;
      }
      if (param.mediaType != null) {
        variablesMap['type'] = param.mediaType!.toJson();
      }

      final response = await dio.post(
        aniListUrl,
        cancelToken: token,
        data: {'query': queryGraphQL, 'variables': variablesMap},
      );

      final List resultJson = response.data['data']['Page']['mediaList'];
      final List<MediaListDto> animeList =
          resultJson.map((e) => MediaListDto.fromJson(e)).toList();

      return animeList;
    }
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

    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
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

    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {
        'query': queryGraphQL,
        'variables': variablesMap,
      },
    );
    final List resultJson = response.data['data']['Page']['airingSchedules'];
    final airingSchedules =
        resultJson.map((e) => AiringScheduleDto.fromJson(e)).toList();

    return airingSchedules;
  }

  Future<List<MediaDto>> searchMediaPage({
    required int page,
    required int perPage,
    required MediaType type,
    required String search,
    required bool isAdult,
    CancelToken? token,
  }) async {
    final queryGraphQL = searchMediaQueryGraphql;
    final variablesMap = <String, dynamic>{
      'search': search,
      'page': page,
      'perPage': perPage,
      'type': type.toJson(),
      'isAdult': isAdult,
    };
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
    );
    final List resultJson = response.data['data']['page']['media'];
    final List<MediaDto> mediaList =
        resultJson.map((e) => MediaDto.fromJson(e)).toList();

    return mediaList;
  }

  Future<List<CharacterDto>> searchCharacterPage({
    required int page,
    required int perPage,
    required String search,
    CancelToken? token,
  }) async {
    final queryGraphQL = searchCharacterQueryGraphql;
    final variablesMap = <String, dynamic>{
      'search': search,
      'page': page,
      'perPage': perPage,
    };
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
    );
    final List resultJson = response.data['data']['page']['characters'];
    final List<CharacterDto> characterList =
        resultJson.map((e) => CharacterDto.fromJson(e)).toList();

    return characterList;
  }

  Future<List<StudioDto>> searchStudioPage({
    required int page,
    required int perPage,
    required String search,
    CancelToken? token,
  }) async {
    final queryGraphQL = searchStudioQueryGraphql;
    final variablesMap = <String, dynamic>{
      'search': search,
      'page': page,
      'perPage': perPage,
    };
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
    );
    final List resultJson = response.data['data']['page']['studios'];
    final List<StudioDto> studioList =
        resultJson.map((e) => StudioDto.fromJson(e)).toList();

    return studioList;
  }

  Future<List<UserDto>> searchUserPage({
    required int page,
    required int perPage,
    required String search,
    CancelToken? token,
  }) async {
    final queryGraphQL = searchUserQueryGraphql;
    final variablesMap = <String, dynamic>{
      'search': search,
      'page': page,
      'perPage': perPage,
    };
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
    );
    final List resultJson = response.data['data']['page']['users'];
    final List<UserDto> userList =
        resultJson.map((e) => UserDto.fromJson(e)).toList();

    return userList;
  }

  Future<List<StaffDto>> searchStaffPage({
    required int page,
    required int perPage,
    required String search,
    CancelToken? token,
  }) async {
    final queryGraphQL = searchStaffQueryGraphql;
    final variablesMap = <String, dynamic>{
      'search': search,
      'page': page,
      'perPage': perPage,
    };
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
    );
    final List resultJson = response.data['data']['page']['staff'];
    final List<StaffDto> staffList =
        resultJson.map((e) => StaffDto.fromJson(e)).toList();

    return staffList;
  }

  Future<UserFavouritesDto> getFavoriteInfo({
    required String userId,
    CancelToken? token,
  }) async {
    final queryGraphQL = userFavoriteQueryGraphQl;
    final variablesMap = <String, dynamic>{
      'UserId': userId,
    };
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
    );
    final Map<String, dynamic> resultJson =
        response.data['data']['User']['favourites'];
    final UserFavouritesDto userFavourites =
        UserFavouritesDto.fromJson(resultJson);
    return userFavourites;
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
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
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
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
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
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
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

    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
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

    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {
        'query': queryGraphQL,
        'variables': variablesMap,
      },
    );
    final List resultJson = response.data['data']['Page']['activities'];
    final activities = resultJson
        .map((e) => AniActivity.mapToAniActivity(e))
        .nonNulls
        .toList();

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
    await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {
        'query': queryGraphQL,
        'variables': variablesMap,
      },
    );
  }

  Future toggleSocialContentLike(
      String id, LikeableType type, CancelToken token) async {
    final queryGraphQL = activityLikeMutationGraphql;
    final variablesMap = <String, dynamic>{'id': id, 'type': type};
    await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {
        'query': queryGraphQL,
        'variables': variablesMap,
      },
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

    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
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

    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
    );
    final Map<String, dynamic> resultJson = response.data['data']['Staff'];
    final staffDto = StaffDto.fromJson(resultJson);

    return staffDto;
  }

  Future<MediaConnection> getMediaConnectionByStaffId(
      String id, int page, int perPage, MediaSort mediaSort,
      [CancelToken? token]) async {
    final queryGraphQL = staffRelatedCharacterQueryGraphQl;
    final variablesMap = <String, dynamic>{
      'id': id,
      'page': page,
      'perPage': perPage,
      'sort': [mediaSort.toJson()],
    };
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
    );

    final Map<String, dynamic> resultJson =
        response.data['data']['Staff']['characterMedia'];
    final mediaConnections = MediaConnection.fromJson(resultJson);

    return mediaConnections;
  }

  Future<StudioDto> getStudioById({
    required String studioId,
    CancelToken? token,
  }) async {
    final queryGraphQL = studioDetailQueryGraphQLString;
    final variablesMap = <String, dynamic>{
      'id': studioId,
    };

    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
    );
    final Map<String, dynamic> resultJson = response.data['data']['Studio'];
    final studioDto = StudioDto.fromJson(resultJson);

    return studioDto;
  }

  Future<MediaConnection> getMediaConnectionByStudioId(
      String id, int page, int perPage,
      [CancelToken? token]) async {
    final queryGraphQL = studioRelatedMediaQueryGraphQl;
    final variablesMap = <String, dynamic>{
      'id': id,
      'page': page,
      'perPage': perPage,
    };
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
    );

    final Map<String, dynamic> resultJson =
        response.data['data']['Studio']['media'];
    final mediaConnections = MediaConnection.fromJson(resultJson);

    return mediaConnections;
  }

  Future<List<dynamic>> getUserStatistic(
      String id, UserStatisticType type, UserStaticsSort sort,
      [CancelToken? token]) async {
    final queryGraphQL = switch (type) {
      UserStatisticType.aimeGenres => userAnimeGenresStatsQueryGraphQl,
      UserStatisticType.animeTags => userAnimeTagStatsQueryGraphQl,
      UserStatisticType.animeVoiceActors =>
        userAnimeVoiceActorStatsQueryGraphQl,
      UserStatisticType.animeStudios => userAnimeStudiosStatsQueryGraphQl,
      UserStatisticType.animeStaff => userAnimeStaffStatsQueryGraphQl,
      UserStatisticType.mangaGenres => userMangaGenresStatsQueryGraphQl,
      UserStatisticType.mangaTags => userMangaTagStatsQueryGraphQl,
      UserStatisticType.mangaStaff => userMangaStaffStatsQueryGraphQl,
    };
    final variablesMap = <String, dynamic>{
      'id': id,
      'sort': [sort.toJson()],
    };
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
    );

    final Map<String, dynamic> resultJson = type.isManga
        ? response.data['data']['User']['statistics']['manga']
        : response.data['data']['User']['statistics']['anime'];
    final userStatics = UserStaticsDto.fromJson(resultJson);

    return switch (type) {
      UserStatisticType.aimeGenres => userStatics.genres,
      UserStatisticType.animeTags => userStatics.tags,
      UserStatisticType.animeVoiceActors => userStatics.voiceActors,
      UserStatisticType.animeStudios => userStatics.studios,
      UserStatisticType.animeStaff => userStatics.staff,
      UserStatisticType.mangaGenres => userStatics.genres,
      UserStatisticType.mangaTags => userStatics.tags,
      UserStatisticType.mangaStaff => userStatics.staff,
    };
  }

  Future<List<MediaDto>> getMediasById(List<String> ids,
      [CancelToken? token]) async {
    final queryGraphQL = mediasQueryGraphql;
    final variablesMap = <String, dynamic>{
      'id_in': ids,
    };
    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {'query': queryGraphQL, 'variables': variablesMap},
    );

    final List resultList = response.data['data']['Page']['media'];
    final mediaList = resultList.map((e) => MediaDto.fromJson(e)).toList();

    return mediaList;
  }

  Future<AniActivity> getActivityDetail(String activityId,
      [CancelToken? token]) async {
    final queryGraphQL = activitiesDetailGraphQLString;
    final variablesMap = <String, dynamic>{
      'id': activityId,
    };

    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {
        'query': queryGraphQL,
        'variables': variablesMap,
      },
    );
    final Map<String, dynamic> resultJson = response.data['data']['Activity'];

    return AniActivity.mapToAniActivity(resultJson)!;
  }

  Future<List<CharacterDto>> getCharactersOfBirthday(int page, int perPage,
      [CancelToken? token]) async {
    final queryGraphQL = birthdayCharacterPageQueryGraphQLString;
    final variablesMap = <String, dynamic>{
      'page': page,
      'perPage': perPage,
    };

    final response = await dio.post(
      aniListUrl,
      cancelToken: token,
      data: {
        'query': queryGraphQL,
        'variables': variablesMap,
      },
    );
    final List resultList = response.data['data']['page']['characters'];
    return resultList.map((e) => CharacterDto.fromJson(e)).toList();
  }
}
