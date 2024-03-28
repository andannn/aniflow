import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/activity_dao.dart';
import 'package:aniflow/core/database/dao/airing_schedules_dao.dart';
import 'package:aniflow/core/database/dao/character_dao.dart';
import 'package:aniflow/core/database/dao/favorite_dao.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
import 'package:aniflow/core/database/dao/staff_dao.dart';
import 'package:aniflow/core/database/dao/studio_dao.dart';
import 'package:aniflow/core/database/dao/user_dao.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DIDataBaseModule {
  @lazySingleton
  AniflowDatabase get database => AniflowDatabase();

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
}
