import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/database/model/short_cut_anime_entity.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('short_network_anime_model_from_json', () {
    test('get_topics_convert_to_db_model', () async {
      final rest = await AniListDataSource().getNetworkAnimePage(animeListParam: (
        page: 1,
        perPage: 10,
        seasonYear: 2023,
        season: AnimeSeason.summer,
        status: AnimeStatus.finished
      ));
      final dbList =
          rest.map((e) => ShortcutAnimeEntity.fromNetworkModel(e)).toList();
      print(dbList);
    });
  });
}
