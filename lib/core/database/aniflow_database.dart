import 'dart:async';

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
  AniflowDatabase(super.executor);

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
