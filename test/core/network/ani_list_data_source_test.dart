import 'package:anime_tracker/core/database/model/anime_model.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('short_network_anime_model_from_json', () {
    test('get_topics_convert_to_db_model', () async {
      final rest = await aniListDataSource.getNetworkAnimePage(
          page: 1,
          perPage: 3,
          seasonYear: 2012,
          season: AnimeSeason.winter,
          status: AnimeStatus.finished);
      final dbList = rest.map((e) => AnimeModel.fromNetworkModel(e)).toList();
      print(dbList);
    });
  });
}
