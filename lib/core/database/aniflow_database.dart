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
  AniflowDatabase() : super(_openConnection());

  AniflowDatabase.test(super.executor);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: stepByStep(
        from1To2: (m, schema) async {
          await m.createTable(schema.episodeTable);
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
