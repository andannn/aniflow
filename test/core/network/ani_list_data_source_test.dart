import 'package:anime_tracker/core/common/model/anime_season.dart';
import 'package:anime_tracker/core/common/model/media_sort.dart';
import 'package:anime_tracker/core/common/model/media_status.dart';
import 'package:anime_tracker/core/common/model/media_type.dart';
import 'package:anime_tracker/core/data/media_list_repository.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/network/api/airing_schedules_query_graphql.dart.dart';
import 'package:anime_tracker/core/network/api/media_list_query_graphql.dart';
import 'package:anime_tracker/core/network/api/media_page_query_graphql.dart';
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
  });
}
