import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/media_sort.dart';
import 'package:aniflow/core/common/model/media_status.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/activity_page_query_graphql.dart';
import 'package:aniflow/core/network/api/airing_schedules_query_graphql.dart.dart';
import 'package:aniflow/core/network/api/media_list_query_graphql.dart';
import 'package:aniflow/core/network/api/media_page_query_graphql.dart';
import 'package:country_code/country_code.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('short_network_anime_model_from_json', () {
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
        ),
      );
    });

    test('get_airing_schedule', () async {
      await AniListDataSource().getAiringSchedules(
        AiringSchedulesQueryParam(
            airingAtGreater: 1696953600, airingAtLesser: 1697039999),
      );
    });

    test('get_characters', () async {
      await AniListDataSource()
          .getCharacterPage(animeId: 140501, page: 1, perPage: 3);
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
    test('get_activities', () async {
      await AniListDataSource().getActivities(
          page: 1, perPage: 10, param: const ActivityPageQueryParam());
    });
  });
}
