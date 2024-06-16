import 'package:drift/drift.dart';

@DataClassName('MediaEntity')
class MediaTable extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text().named('id')();

  TextColumn get type => text().named('media_type').nullable()();

  TextColumn get englishTitle => text().named('english_title').nullable()();

  TextColumn get romajiTitle => text().named('romaji_title').nullable()();

  TextColumn get nativeTitle => text().named('native_title').nullable()();

  TextColumn get coverImageExtraLarge =>
      text().named('cover_image_extra_large').nullable()();

  TextColumn get coverImageLarge =>
      text().named('cover_image_large').nullable()();

  TextColumn get coverImageMedium =>
      text().named('cover_image_medium').nullable()();

  TextColumn get coverImageColor =>
      text().named('cover_image_color').nullable()();

  TextColumn get description => text().named('description').nullable()();

  IntColumn get episodes => integer().named('episodes').nullable()();

  IntColumn get seasonYear => integer().named('season_year').nullable()();

  TextColumn get season => text().named('season').nullable()();

  TextColumn get source => text().named('source').nullable()();

  TextColumn get status => text().named('status').nullable()();

  TextColumn get hashtag => text().named('hashtag').nullable()();

  TextColumn get bannerImage => text().named('banner_image').nullable()();

  IntColumn get averageScore => integer().named('average_score').nullable()();

  TextColumn get trailerId => text().named('trailer_id').nullable()();

  TextColumn get trailerSite => text().named('trailer_site').nullable()();

  TextColumn get trailerThumbnail =>
      text().named('trailer_thumbnail').nullable()();

  TextColumn get genres => text().named('genres').nullable()();

  TextColumn get format => text().named('format').nullable()();

  IntColumn get trending => integer().named('trending').nullable()();

  IntColumn get favourites => integer().named('favourites').nullable()();

  IntColumn get popularRanking =>
      integer().named('popular_ranking').nullable()();

  IntColumn get ratedRanking => integer().named('rated_ranking').nullable()();

  IntColumn get nextAiringEpisode =>
      integer().named('next_airing_episode').nullable()();

  IntColumn get timeUntilAiring =>
      integer().named('time_until_airing').nullable()();

  DateTimeColumn get startDate => dateTime().named('start_date').nullable()();

  DateTimeColumn get endDate => dateTime().named('end_date').nullable()();

  BoolColumn get isFavourite => boolean().named('is_favourite').nullable()();

  DateTimeColumn get nextAiringEpisodeUpdateTime =>
      dateTime().named('next_airing_episode_update_time').nullable()();
}
