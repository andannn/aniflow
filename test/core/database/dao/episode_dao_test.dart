import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/episode_dao.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('episode dao test', () {
    late AniflowDatabase db;
    late EpisodeDao dao;

    setUp(() async {
      db = AniflowDatabase(NativeDatabase.memory());
      dao = db.episodeDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('find Episode test', () async {
      const dummy = EpisodeEntity(
        animeId: '1',
        playSourceId: '10',
        title: 'Episode 1-10',
        playSourceSiteUrl: 'url',
        episodeNum: '10',
        playSourceType: "",
      );
      await dao.upsertEpisode([dummy]);

      final result1 = await dao.findEpisode('1', '10');
      expect(result1, equals(dummy.copyWith(id: const Value(1))));
    });

    test('find Playable link', () async {
      const dummy = EpisodeEntity(
          animeId: '1',
          playSourceId: '10',
          title: 'Episode 1-10',
          playSourceSiteUrl: 'url',
          episodeNum: '10',
          playSourceType: "A",
          playableLink: "BB");
      await dao.upsertEpisode([dummy]);

      final result1 = await dao.findPlayLink('1', '10', "A");
      expect(result1, equals("BB"));
    });

    test('update Playable link', () async {
      const dummy = EpisodeEntity(
        animeId: '1',
        playSourceId: '10',
        title: 'Episode 1-10',
        playSourceSiteUrl: 'url',
        episodeNum: '10',
        playSourceType: "A",
      );
      await dao.upsertEpisode([dummy]);
      await dao.updatePlayableLink("BB", '1', '10', "A");

      final result1 = await dao.findPlayLink('1', '10', "A");
      expect(result1, equals("BB"));
    });
  });
}
