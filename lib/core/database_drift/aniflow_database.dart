import 'dart:io';

import 'package:aniflow/core/database_drift/dao/activity_dao.dart';
import 'package:aniflow/core/database_drift/dao/airing_schedules_dao.dart';
import 'package:aniflow/core/database_drift/dao/character_dao.dart';
import 'package:aniflow/core/database_drift/dao/media_dao.dart';
import 'package:aniflow/core/database_drift/dao/media_list_dao.dart';
import 'package:aniflow/core/database_drift/dao/staff_dao.dart';
import 'package:aniflow/core/database_drift/dao/studio_dao.dart';
import 'package:aniflow/core/database_drift/dao/user_dao.dart';
import 'package:aniflow/core/database_drift/tables/activity_filter_type_paging_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/activity_table.dart';
import 'package:aniflow/core/database_drift/tables/airing_schedule_table.dart';
import 'package:aniflow/core/database_drift/tables/category_media_paging_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/character_media_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/character_table.dart';
import 'package:aniflow/core/database_drift/tables/character_voice_actor_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/media_character_paging_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/media_external_link_table.dart';
import 'package:aniflow/core/database_drift/tables/media_list_table.dart';
import 'package:aniflow/core/database_drift/tables/media_relation_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/media_staff_paging_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/media_table.dart';
import 'package:aniflow/core/database_drift/tables/staff_table.dart';
import 'package:aniflow/core/database_drift/tables/studio_media_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/studio_table.dart';
import 'package:aniflow/core/database_drift/tables/user_table.dart';
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
  ],
)
class AniflowDatabase2 extends _$AniflowDatabase2 {
  static AniflowDatabase2? _instance;

  factory AniflowDatabase2() => _instance ??= AniflowDatabase2._();

  AniflowDatabase2._() : super(_openConnection());

  AniflowDatabase2.test(super.executor);

  @override
  int get schemaVersion => 1;
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

    return NativeDatabase.createInBackground(file);
  });
}
