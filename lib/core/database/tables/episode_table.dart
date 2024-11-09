import 'package:drift/drift.dart';

mixin PlaySource {
  static const hiAnimation = 'hi_animation';
}

@DataClassName('EpisodeEntity')
class EpisodeTable extends Table {
  IntColumn get id =>
      integer().nullable().autoIncrement().named('episode_id')();

  TextColumn get animeId => text().named('episode_anime_cross_id')();

  TextColumn get title => text().named('episode_title')();

  TextColumn get episodeNum => text().named('episode_number')();

  TextColumn get playSourceType => text().named('episode_play_source_type')();

  // identifier to find playable link
  TextColumn get playSourceId => text().named('episode_play_source_id')();

  // website of play source
  TextColumn get playSourceSiteUrl =>
      text().named('episode_play_source_site_url')();

  TextColumn get playableLink => text().named('episode_site_url').nullable()();
}
