import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
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
import 'package:aniflow/core/database/intercepters/log_interceptor.dart';
import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

String _driftServerName = 'drift_server';
String _tag = 'DIDataBaseModule';

@module
abstract class DIDataBaseModule {
  @preResolve
  Future<AniflowDatabase> get database async {
    return AniflowDatabase(
      kDebugMode ? _openDatabaseConnection() : await _openIsolateConnection(),
    );
  }

  UserDao getUserDao(AniflowDatabase db) => db.userDao;

  StudioDao getStudioDao(AniflowDatabase db) => db.studioDao;

  StaffDao getStaffDao(AniflowDatabase db) => db.staffDao;

  ActivityDao getActivityDao(AniflowDatabase db) => db.activityDao;

  AiringSchedulesDao getAiringSchedulesDao(AniflowDatabase db) =>
      db.airingSchedulesDao;

  CharacterDao geCharacterDao(AniflowDatabase db) => db.characterDao;

  MediaListDao geMediaListDao(AniflowDatabase db) => db.mediaListDao;

  MediaDao geMediaDao(AniflowDatabase db) => db.mediaDao;

  FavoriteDao geFavoriteDao(AniflowDatabase db) => db.favoriteDao;

  EpisodeDao geEpisodeDao(AniflowDatabase db) => db.episodeDao;
}

FutureOr<DatabaseConnection> _openIsolateConnection() async {
  return DatabaseConnection.delayed(
    Future(
      () async {
        DriftIsolate isolate;
        final token = RootIsolateToken.instance!;
        SendPort? sendPort =
            IsolateNameServer.lookupPortByName(_driftServerName);

        if (sendPort != null) {
          logger.d('$_tag Connecting to existing isolate');
          isolate = DriftIsolate.fromConnectPort(sendPort);
        } else {
          logger.d('$_tag Creating new isolate');
          isolate = await DriftIsolate.spawn(() {
            BackgroundIsolateBinaryMessenger.ensureInitialized(token);

            return _openDatabaseConnection();
          });
          IsolateNameServer.registerPortWithName(
            isolate.connectPort,
            _driftServerName,
          );
        }

        return isolate.connect();
      },
    ),
  );
}

LazyDatabase _openDatabaseConnection() {
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
