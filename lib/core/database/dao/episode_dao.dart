import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/tables/episode_table.dart';
import 'package:drift/drift.dart';

part 'episode_dao.g.dart';

@DriftAccessor(tables: [EpisodeTable])
class EpisodeDao extends DatabaseAccessor<AniflowDatabase>
    with _$EpisodeDaoMixin {
  EpisodeDao(super.db);

  Future<EpisodeEntity?> findEpisode(String animeId, int episode) async {
    return (select(episodeTable)
          ..where((tbl) =>
              tbl.animeId.equals(animeId) & tbl.episodeNum.equals(episode)))
        .getSingleOrNull();
  }

  Future upsertEpisode(EpisodeEntity episode) async {
    await batch((batch) {
      batch.insert(episodeTable, episode, mode: InsertMode.insertOrReplace);
    });
  }
}
