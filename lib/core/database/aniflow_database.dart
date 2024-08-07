import 'dart:async';
import 'dart:io';

import 'package:aniflow/core/database/dao/activity_dao.dart';
import 'package:aniflow/core/database/dao/airing_schedules_dao.dart';
import 'package:aniflow/core/database/dao/character_dao.dart';
import 'package:aniflow/core/database/dao/episode_dao.dart';
import 'package:aniflow/core/database/dao/favorite_dao.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
import 'package:aniflow/core/database/dao/staff_dao.dart';
import 'package:aniflow/core/database/dao/studio_dao.dart';
import 'package:aniflow/core/database/dao/user_dao.dart';
import 'package:aniflow/core/database/drift_schemas/schema_versions.dart';
import 'package:aniflow/core/database/intercepters/log_interceptor.dart';
import 'package:aniflow/core/database/tables/activity_filter_type_paging_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/activity_table.dart';
import 'package:aniflow/core/database/tables/airing_schedule_table.dart';
import 'package:aniflow/core/database/tables/category_media_paging_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/character_media_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/character_table.dart';
import 'package:aniflow/core/database/tables/character_voice_actor_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/episode_table.dart';
import 'package:aniflow/core/database/tables/favorite_info_table.dart';
import 'package:aniflow/core/database/tables/media_character_paging_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/media_external_link_table.dart';
import 'package:aniflow/core/database/tables/media_list_table.dart';
import 'package:aniflow/core/database/tables/media_relation_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/media_staff_paging_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/media_table.dart';
import 'package:aniflow/core/database/tables/staff_table.dart';
import 'package:aniflow/core/database/tables/studio_media_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/studio_table.dart';
import 'package:aniflow/core/database/tables/user_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'aniflow_database.g.dart';

@DriftDatabase(
  tables: [
    UserTable,
    StudioTable,
    StaffTable,
    ActivityTable,
    AiringScheduleTable,
    CharacterTable,
    MediaListTable,
    MediaTable,
    StudioMediaCrossRefTable,
    CharacterRelatedMediaCrossRefTable,
    ActivityFilterTypePagingCrossRefTable,
    MediaCharacterPagingCrossRefTable,
    CharacterVoiceActorCrossRefTable,
    MediaRelationCrossRefTable,
    MediaStaffPagingCrossRefTable,
    MediaExternalLinkTable,
    CategoryMediaPagingCrossRefTable,
    FavoriteInfoTable,
    EpisodeTable,
  ],
  daos: [
    UserDao,
    StudioDao,
    StaffDao,
    ActivityDao,
    AiringSchedulesDao,
    CharacterDao,
    MediaListDao,
    MediaDao,
    FavoriteDao,
    EpisodeDao,
  ],
)
class AniflowDatabase extends _$AniflowDatabase {
  AniflowDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection());

  AniflowDatabase.test(super.executor);

  @override
  int get schemaVersion => 6;

  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);

  @override
  MigrationStrategy get migration {
    Future updateNextEpisodeUpdateTimeTrigger() => customStatement('''
          CREATE TRIGGER IF NOT EXISTS update_next_airing_episode_update_time_trigger
          AFTER UPDATE OF next_airing_episode ON media_table
          WHEN (
              (OLD.next_airing_episode IS NOT NULL AND NEW.next_airing_episode IS NULL)
              OR OLD.next_airing_episode != NEW.next_airing_episode
          )
          BEGIN
            UPDATE media_table
            SET next_airing_episode_update_time = DATETIME('now')
            WHERE id = OLD.id;
          END;
        ''');
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();

        await updateNextEpisodeUpdateTimeTrigger();
      },
      onUpgrade: stepByStep(
        from1To2: (m, schema) async {
          await m.createTable(schema.episodeTable);
        },
        from2To3: (Migrator m, Schema3 schema) async {
          await m.addColumn(
            schema.mediaTable,
            schema.mediaTable.nextAiringEpisodeUpdateTime,
          );

          await updateNextEpisodeUpdateTimeTrigger();
        },
        from3To4: (Migrator m, Schema4 schema) async {
          await delete(characterTable).go();
          await m.alterTable(
            TableMigration(
              characterTable,
              columnTransformer: {
                characterTable.dateOfBirth:
                    characterTable.dateOfBirth.cast<DateTime>(),
              },
            ),
          );
        },
        from4To5: (Migrator m, Schema5 schema) async {
          await delete(mediaTable).go();
          await m.addColumn(
            schema.mediaTable,
            schema.mediaTable.format,
          );
          await m.alterTable(
            TableMigration(
              mediaTable,
              columnTransformer: {
                mediaTable.startDate: mediaTable.startDate.cast<DateTime>(),
                mediaTable.endDate: mediaTable.endDate.cast<DateTime>(),
              },
            ),
          );
        },
        from5To6: (Migrator m, Schema6 schema) async {
          await m.addColumn(
            schema.mediaTable,
            schema.mediaTable.siteUrl,
          );
          await m.addColumn(
            schema.userTable,
            schema.userTable.siteUrl,
          );
        },
      ),
    );
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db1.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file)
        .interceptWith(LogInterceptor());
  });
}
