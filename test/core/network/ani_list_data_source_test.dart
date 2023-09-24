import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/data/repository/anime_track_list_repository.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/network/api/ani_list_query_graphql.dart';
import 'package:anime_tracker/core/network/api/user_anime_list_query.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('short_network_anime_model_from_json', () {
    test('get_topics_convert_to_db_model', () async {
      await AniListDataSource().getNetworkAnimePage(
          animeListParam: AnimePageQueryParam(
              page: 1,
              perPage: 10,
              seasonYear: 2023,
              season: AnimeSeason.summer,
              status: AnimeStatus.finished,
              animeSort: [AnimeSort.trending]));
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
          status: [AnimeListStatus.completed, AnimeListStatus.current],
        ),
      );
    });
  });
}
