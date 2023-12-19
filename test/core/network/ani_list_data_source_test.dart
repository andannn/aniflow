import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/media_sort.dart';
import 'package:aniflow/core/common/model/media_status.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/model/setting/score_format.dart';
import 'package:aniflow/core/common/model/staff_language.dart';
import 'package:aniflow/core/common/model/user_statics_sort.dart';
import 'package:aniflow/core/common/model/user_stats_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/airing_schedules_query_graphql.dart.dart';
import 'package:aniflow/core/network/api/media_list_query_graphql.dart';
import 'package:aniflow/core/network/api/media_page_query_graphql.dart';
import 'package:aniflow/core/network/api/toggle_favorite_mutation_graphql.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:country_code/country_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ani_list_data_source_api_test', () {
    setUp(() async {
      isUnitTest = true;
      SharedPreferences.setMockInitialValues({});
      await AniFlowPreferences().init();
    });

    test('get_topics_convert_to_db_model', () async {
      await AniListDataSource().getNetworkAnimePage(
          page: 1,
          perPage: 10,
          param: AnimePageQueryParam(
              seasonYear: 2023,
              season: AnimeSeason.summer,
              type: MediaType.anime,
              status: MediaStatus.finished,
              animeSort: [MediaSort.trending]));
    });
    test('test_network_cancel', () async {
      DioException? exception;
      try {
        final cancelToken = CancelToken();
        await Future.wait([
          AniListDataSource().getNetworkAnimePage(
              page: 1,
              perPage: 10,
              token: cancelToken,
              param: AnimePageQueryParam(
                  seasonYear: 2023,
                  season: AnimeSeason.summer,
                  type: MediaType.anime,
                  status: MediaStatus.finished,
                  animeSort: [MediaSort.trending])),
          Future(() => cancelToken.cancel())
        ]);
      } on DioException catch (e) {
        exception = e;
      }
      expect(exception!.type, equals(DioExceptionType.cancel));
    });
    test('get_media_with_countryCode', () async {
      await AniListDataSource().getNetworkAnimePage(
          page: 1,
          perPage: 10,
          param: AnimePageQueryParam(
              countryCode: CountryCode.KR,
              type: MediaType.manga,
              animeSort: [MediaSort.trending]));
    });
    test('get_detail_anime', () async {
      await AniListDataSource().getNetworkAnime(id: 1);
    });
    test('get_anime_list', () async {
      await AniListDataSource().getUserMediaListPage(
        param: UserAnimeListPageQueryParam(
          page: 1,
          perPage: 12,
          userId: 1,
          status: [MediaListStatus.completed, MediaListStatus.current],
          format: ScoreFormat.point3,
        ),
      );
    });

    test('get_airing_schedule', () async {
      await AniListDataSource().getAiringSchedules(
        param: AiringSchedulesQueryParam(
            airingAtGreater: 1696953600, airingAtLesser: 1697039999),
      );
    });

    test('get_characters', () async {
      await AniListDataSource().getCharacterPage(
          animeId: 140501,
          page: 1,
          perPage: 3,
          language: StaffLanguage.japanese);
    });

    test('get_staffs', () async {
      await AniListDataSource()
          .getStaffPage(animeId: 140501, page: 1, perPage: 3);
    });

    test('get_favorite_anime', () async {
      await AniListDataSource()
          .getFavoriteAnimeMedia(userId: '6378393', page: 1, perPage: 10);
    });
    test('get_favorite_manga', () async {
      await AniListDataSource()
          .getFavoriteAnimeMedia(userId: '6378393', page: 1, perPage: 10);
    });
    test('get_favorite_character', () async {
      await AniListDataSource()
          .getFavoriteAnimeMedia(userId: '6378393', page: 1, perPage: 10);
    });
    test('get_favorite_staff', () async {
      await AniListDataSource()
          .getFavoriteAnimeMedia(userId: '6378393', page: 1, perPage: 10);
    });

    test('toggle_favorite_', () async {
      await AniListDataSource().toggleFavorite(
          ToggleFavoriteMutationParam(animeId: 162694), CancelToken());
    });

    test('get_character_dto_by_id', () async {
      final res = await AniListDataSource()
          .getCharacterById(characterId: '136837', token: CancelToken());

      expect(res.id, equals(136837));
    });

    test('get_staff_dto_by_id', () async {
      final res = await AniListDataSource()
          .getStaffById(staffId: '119672', token: CancelToken());

      expect(res.id, equals(119672));
    });

    test('get_staff_related_media_by_id', () async {
      await AniListDataSource().getMediaConnectionByStaffId('119672', 1, 10);
    });

    test('get_studio_related_media_by_id', () async {
      await AniListDataSource().getMediaConnectionByStudioId('290', 1, 10);
    });

    test('get_user_statics_by_id', () async {
      await AniListDataSource().getUserStatistic(
          '6378393', UserStatisticType.aimeGenres, UserStaticsSort.meanScore);
    });

    test('get_medias_by_id', () async {
      await AniListDataSource().getMediasById(['151970', '162694']);
    });
  });
}
