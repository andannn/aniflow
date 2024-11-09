import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/tables/episode_table.dart';
import 'package:drift/drift.dart';

part 'episode_dao.g.dart';

@DriftAccessor(tables: [EpisodeTable])
class EpisodeDao extends DatabaseAccessor<AniflowDatabase>
    with _$EpisodeDaoMixin {
  EpisodeDao(super.db);

  Future<EpisodeEntity?> findEpisode(String animeId, String episode) async {
    return (select(episodeTable)
          ..where((tbl) =>
              tbl.animeId.equals(animeId) & tbl.episodeNum.equals(episode)))
        .getSingleOrNull();
  }

  Future upsertEpisode(List<EpisodeEntity> episodes) async {
    return attachedDatabase.transaction(() async {
      await batch((batch) {
        batch.insertAll(episodeTable, episodes,
            mode: InsertMode.insertOrReplace);
      });
    });
  }

  Future<String?> findPlayLink(
      String animeId, String episodeNum, String playSourceType) async {
    final entity = await (select(episodeTable)
          ..where((tbl) =>
              tbl.animeId.equals(animeId) &
              tbl.episodeNum.equals(episodeNum) &
              tbl.playSourceType.equals(playSourceType)))
        .getSingleOrNull();
    return entity?.playableLink;
  }

  Future updatePlayableLink(String link, String animeId, String episodeNum,
      String playSourceType) async {
    await (update(episodeTable)
          ..where((t) =>
              t.animeId.equals(animeId) &
              t.episodeNum.equals(episodeNum) &
              t.playSourceType.equals(playSourceType)))
        .write(
      EpisodeTableCompanion(
        playableLink: Value(link),
      ),
    );
  }
}
