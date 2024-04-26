import 'package:drift/drift.dart';

@DataClassName('EpisodeEntity')
class EpisodeTable extends Table {
  IntColumn get id => integer().nullable().autoIncrement().named('episode_id')();

  TextColumn get animeId => text().named('episode_anime_cross_id')();

  TextColumn get title => text().named('episode_title')();

  TextColumn get url =>
      text().named('episode_url')();

  IntColumn get episodeNum =>
      integer().named('episode_number')();
}
