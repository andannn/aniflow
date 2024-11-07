// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
//@dart=2.12
import 'package:drift/drift.dart';

class UserTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'user_data_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'user_data_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> avatarImage = GeneratedColumn<String>(
      'user_data_avatar_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> bannerImage = GeneratedColumn<String>(
      'user_data_banner_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> profileColor = GeneratedColumn<String>(
      'user_data_profile_color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> siteUrl = GeneratedColumn<String>(
      'user_data_site_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<int> unreadNotificationCount =
      GeneratedColumn<int>(
          'user_data_unread_notification_count', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        avatarImage,
        bannerImage,
        profileColor,
        siteUrl,
        unreadNotificationCount
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  UserTable createAlias(String alias) {
    return UserTable(attachedDatabase, alias);
  }
}

class StudioTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  StudioTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'studio_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'studio_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> siteUrl = GeneratedColumn<String>(
      'studio_site_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<bool> isAnimationStudio = GeneratedColumn<bool>(
      'studio_is_animation_studio', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("studio_is_animation_studio" IN (0, 1))'));
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
      'studio_is_favourite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("studio_is_favourite" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, siteUrl, isAnimationStudio, isFavourite];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'studio_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  StudioTable createAlias(String alias) {
    return StudioTable(attachedDatabase, alias);
  }
}

class StaffTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  StaffTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'staff_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> largeImage = GeneratedColumn<String>(
      'staff_large_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> mediumImage = GeneratedColumn<String>(
      'staff_medium_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'staff_first_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> middleName = GeneratedColumn<String>(
      'staff_middle_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'staff_last_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'staff_full_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> nativeName = GeneratedColumn<String>(
      'staff_native_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'staff_description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'staff_gender', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> siteUrl = GeneratedColumn<String>(
      'staff_site_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<int> dateOfBirth = GeneratedColumn<int>(
      'staff_date_of_birth', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> dateOfDeath = GeneratedColumn<int>(
      'staff_date_of_death', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'staff_age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
      'staff_is_favourite', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("staff_is_favourite" IN (0, 1))'));
  late final GeneratedColumn<String> yearsActive = GeneratedColumn<String>(
      'staff_years_active', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> homeTown = GeneratedColumn<String>(
      'staff_home_town', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> bloodType = GeneratedColumn<String>(
      'staff_blood_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        largeImage,
        mediumImage,
        firstName,
        middleName,
        lastName,
        fullName,
        nativeName,
        description,
        gender,
        siteUrl,
        dateOfBirth,
        dateOfDeath,
        age,
        isFavourite,
        yearsActive,
        homeTown,
        bloodType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'staff_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  StaffTable createAlias(String alias) {
    return StaffTable(attachedDatabase, alias);
  }
}

class ActivityTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ActivityTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'activity_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'activity_userId', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'activity_mediaId', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> textContent = GeneratedColumn<String>(
      'activity_text', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'activity_status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> progress = GeneratedColumn<String>(
      'activity_progress', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'activity_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> siteUrl = GeneratedColumn<String>(
      'activity_siteUrl', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<int> replyCount = GeneratedColumn<int>(
      'activity_replyCount', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  late final GeneratedColumn<int> likeCount = GeneratedColumn<int>(
      'activity_likeCount', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'activity_createdAt', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<bool> isLocked = GeneratedColumn<bool>(
      'activity_isLocked', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("activity_isLocked" IN (0, 1))'));
  late final GeneratedColumn<bool> isLiked = GeneratedColumn<bool>(
      'activity_isLiked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("activity_isLiked" IN (0, 1))'),
      defaultValue: const Constant(false));
  late final GeneratedColumn<bool> isPinned = GeneratedColumn<bool>(
      'activity_isPinned', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("activity_isPinned" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        mediaId,
        textContent,
        status,
        progress,
        type,
        siteUrl,
        replyCount,
        likeCount,
        createdAt,
        isLocked,
        isLiked,
        isPinned
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  ActivityTable createAlias(String alias) {
    return ActivityTable(attachedDatabase, alias);
  }
}

class AiringScheduleTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  AiringScheduleTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'airing_schedules_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'airing_schedules_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> airingAt = GeneratedColumn<int>(
      'airing_schedules_airing_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> timeUntilAiring = GeneratedColumn<int>(
      'airing_schedules_time_until_airing', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> episode = GeneratedColumn<int>(
      'airing_schedules_episode', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, mediaId, airingAt, timeUntilAiring, episode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'airing_schedule_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  AiringScheduleTable createAlias(String alias) {
    return AiringScheduleTable(attachedDatabase, alias);
  }
}

class CharacterTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CharacterTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'character_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> largeImage = GeneratedColumn<String>(
      'character_large_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> mediumImage = GeneratedColumn<String>(
      'character_medium_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'character_first_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> middleName = GeneratedColumn<String>(
      'character_middle_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'character_last_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'character_full_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> nativeName = GeneratedColumn<String>(
      'character_native_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'character_description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'character_gender', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> age = GeneratedColumn<String>(
      'character_age', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> bloodType = GeneratedColumn<String>(
      'character_blood_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> siteUrl = GeneratedColumn<String>(
      'character_site_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
      'character_dateOfBirth', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<int> favourites = GeneratedColumn<int>(
      'character_favourites', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
      'character_is_favourite', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("character_is_favourite" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        largeImage,
        mediumImage,
        firstName,
        middleName,
        lastName,
        fullName,
        nativeName,
        description,
        gender,
        age,
        bloodType,
        siteUrl,
        dateOfBirth,
        favourites,
        isFavourite
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  CharacterTable createAlias(String alias) {
    return CharacterTable(attachedDatabase, alias);
  }
}

class MediaListTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MediaListTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'media_list_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'media_list_user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'media_list_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'media_list_status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'media_list_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
      'media_list_progress', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> progressVolumes = GeneratedColumn<int>(
      'media_list_progress_volumes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> startedAt = GeneratedColumn<int>(
      'media_list_started_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> completedAt = GeneratedColumn<int>(
      'media_list_completed_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'media_list_updatedAt', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> repeat = GeneratedColumn<int>(
      'media_list_repeat', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
      'media_list_score', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  late final GeneratedColumn<bool> private = GeneratedColumn<bool>(
      'media_list_private', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("media_list_private" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        mediaId,
        status,
        notes,
        progress,
        progressVolumes,
        startedAt,
        completedAt,
        updatedAt,
        repeat,
        score,
        private
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_list_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  MediaListTable createAlias(String alias) {
    return MediaListTable(attachedDatabase, alias);
  }
}

class MediaTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MediaTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'media_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> englishTitle = GeneratedColumn<String>(
      'english_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> romajiTitle = GeneratedColumn<String>(
      'romaji_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> nativeTitle = GeneratedColumn<String>(
      'native_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> coverImageExtraLarge =
      GeneratedColumn<String>('cover_image_extra_large', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> coverImageLarge = GeneratedColumn<String>(
      'cover_image_large', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> coverImageMedium = GeneratedColumn<String>(
      'cover_image_medium', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> coverImageColor = GeneratedColumn<String>(
      'cover_image_color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<int> episodes = GeneratedColumn<int>(
      'episodes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> seasonYear = GeneratedColumn<int>(
      'season_year', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<String> season = GeneratedColumn<String>(
      'season', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> hashtag = GeneratedColumn<String>(
      'hashtag', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> bannerImage = GeneratedColumn<String>(
      'banner_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<int> averageScore = GeneratedColumn<int>(
      'average_score', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<String> trailerId = GeneratedColumn<String>(
      'trailer_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> trailerSite = GeneratedColumn<String>(
      'trailer_site', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> trailerThumbnail = GeneratedColumn<String>(
      'trailer_thumbnail', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> genres = GeneratedColumn<String>(
      'genres', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> format = GeneratedColumn<String>(
      'format', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<int> trending = GeneratedColumn<int>(
      'trending', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> favourites = GeneratedColumn<int>(
      'favourites', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> popularRanking = GeneratedColumn<int>(
      'popular_ranking', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> ratedRanking = GeneratedColumn<int>(
      'rated_ranking', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> nextAiringEpisode = GeneratedColumn<int>(
      'next_airing_episode', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<int> timeUntilAiring = GeneratedColumn<int>(
      'time_until_airing', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
      'is_favourite', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_favourite" IN (0, 1))'));
  late final GeneratedColumn<DateTime> nextAiringEpisodeUpdateTime =
      GeneratedColumn<DateTime>(
          'next_airing_episode_update_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  late final GeneratedColumn<String> siteUrl = GeneratedColumn<String>(
      'user_data_site_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        englishTitle,
        romajiTitle,
        nativeTitle,
        coverImageExtraLarge,
        coverImageLarge,
        coverImageMedium,
        coverImageColor,
        description,
        episodes,
        seasonYear,
        season,
        source,
        status,
        hashtag,
        bannerImage,
        averageScore,
        trailerId,
        trailerSite,
        trailerThumbnail,
        genres,
        format,
        trending,
        favourites,
        popularRanking,
        ratedRanking,
        nextAiringEpisode,
        timeUntilAiring,
        startDate,
        endDate,
        isFavourite,
        nextAiringEpisodeUpdateTime,
        siteUrl
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  MediaTable createAlias(String alias) {
    return MediaTable(attachedDatabase, alias);
  }
}

class StudioMediaCrossRefTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  StudioMediaCrossRefTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> studioId = GeneratedColumn<String>(
      'studio_media_cross_ref_studio_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'studio_media_cross_ref_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [studioId, mediaId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'studio_media_cross_ref_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {studioId, mediaId};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  StudioMediaCrossRefTable createAlias(String alias) {
    return StudioMediaCrossRefTable(attachedDatabase, alias);
  }
}

class CharacterRelatedMediaCrossRefTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CharacterRelatedMediaCrossRefTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'character_and_media_relation_cross_ref_character_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'character_and_media_relation_cross_ref_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [characterId, mediaId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_related_media_cross_ref_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {characterId, mediaId};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  CharacterRelatedMediaCrossRefTable createAlias(String alias) {
    return CharacterRelatedMediaCrossRefTable(attachedDatabase, alias);
  }
}

class ActivityFilterTypePagingCrossRefTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ActivityFilterTypePagingCrossRefTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'activity_filter_type_cross_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> activityId = GeneratedColumn<String>(
      'activity_filter_type_cross_activity_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'activity_filter_type_cross_filter_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, activityId, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_filter_type_paging_cross_ref_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {activityId, category},
      ];
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  ActivityFilterTypePagingCrossRefTable createAlias(String alias) {
    return ActivityFilterTypePagingCrossRefTable(attachedDatabase, alias);
  }
}

class MediaCharacterPagingCrossRefTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MediaCharacterPagingCrossRefTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'media_character_cross_anime_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'media_character_cross_character_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> timeStamp = GeneratedColumn<int>(
      'media_character_cross_time_stamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [characterId, mediaId, timeStamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_character_paging_cross_ref_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {characterId, mediaId};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  MediaCharacterPagingCrossRefTable createAlias(String alias) {
    return MediaCharacterPagingCrossRefTable(attachedDatabase, alias);
  }
}

class CharacterVoiceActorCrossRefTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CharacterVoiceActorCrossRefTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'character_voice_actor_cross_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'character_voice_actor_cross_character_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> staffId = GeneratedColumn<String>(
      'character_voice_actor_cross_staff_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'character_voice_actor_cross_role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'character_voice_actor_cross_language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, characterId, staffId, role, language];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_voice_actor_cross_ref_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {characterId, staffId},
      ];
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  CharacterVoiceActorCrossRefTable createAlias(String alias) {
    return CharacterVoiceActorCrossRefTable(attachedDatabase, alias);
  }
}

class MediaRelationCrossRefTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MediaRelationCrossRefTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
      'media_relation_cross_ref_owner_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> relationId = GeneratedColumn<String>(
      'media_relation_cross_ref_relation_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> relationType = GeneratedColumn<String>(
      'media_staff_cross_ref_relation_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [ownerId, relationId, relationType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_relation_cross_ref_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {ownerId, relationId};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  MediaRelationCrossRefTable createAlias(String alias) {
    return MediaRelationCrossRefTable(attachedDatabase, alias);
  }
}

class MediaStaffPagingCrossRefTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MediaStaffPagingCrossRefTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> staffId = GeneratedColumn<String>(
      'media_staff_cross_staff_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'media_staff_cross_anime_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> staffRole = GeneratedColumn<String>(
      'media_staff_cross_staff_role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> timeStamp = GeneratedColumn<int>(
      'media_staff_cross_timeStamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [staffId, mediaId, staffRole, timeStamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_staff_paging_cross_ref_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {staffId, mediaId};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  MediaStaffPagingCrossRefTable createAlias(String alias) {
    return MediaStaffPagingCrossRefTable(attachedDatabase, alias);
  }
}

class MediaExternalLinkTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MediaExternalLinkTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'external_link_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'external_link_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'external_link_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> site = GeneratedColumn<String>(
      'external_link_site', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'external_link_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<int> siteId = GeneratedColumn<int>(
      'external_link_siteId', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'external_link_color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'external_link_icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, mediaId, url, site, type, siteId, color, icon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_external_link_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  MediaExternalLinkTable createAlias(String alias) {
    return MediaExternalLinkTable(attachedDatabase, alias);
  }
}

class CategoryMediaPagingCrossRefTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CategoryMediaPagingCrossRefTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'anime_category_cross_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'anime_category_cross_category_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> timeStamp = GeneratedColumn<int>(
      'anime_category_cross_time_stamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [mediaId, category, timeStamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_media_paging_cross_ref_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {category, mediaId};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  CategoryMediaPagingCrossRefTable createAlias(String alias) {
    return CategoryMediaPagingCrossRefTable(attachedDatabase, alias);
  }
}

class FavoriteInfoTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  FavoriteInfoTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'favorite_info_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> favoriteType = GeneratedColumn<String>(
      'favorite_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> infoId = GeneratedColumn<String>(
      'favorite_info_foreign_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'favorite_user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, favoriteType, infoId, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_info_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  FavoriteInfoTable createAlias(String alias) {
    return FavoriteInfoTable(attachedDatabase, alias);
  }
}

class EpisodeTable extends Table with TableInfo {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  EpisodeTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'episode_id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> animeId = GeneratedColumn<String>(
      'episode_anime_cross_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> episodeId = GeneratedColumn<String>(
      'episode_source_episode_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'episode_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'episode_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> episodeNum = GeneratedColumn<String>(
      'episode_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, animeId, episodeId, title, url, episodeNum];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'episode_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Never map(Map<String, dynamic> data, {String? tablePrefix}) {
    throw UnsupportedError('TableInfo.map in schema verification code');
  }

  @override
  EpisodeTable createAlias(String alias) {
    return EpisodeTable(attachedDatabase, alias);
  }
}

class DatabaseAtV7 extends GeneratedDatabase {
  DatabaseAtV7(QueryExecutor e) : super(e);
  late final UserTable userTable = UserTable(this);
  late final StudioTable studioTable = StudioTable(this);
  late final StaffTable staffTable = StaffTable(this);
  late final ActivityTable activityTable = ActivityTable(this);
  late final AiringScheduleTable airingScheduleTable =
      AiringScheduleTable(this);
  late final CharacterTable characterTable = CharacterTable(this);
  late final MediaListTable mediaListTable = MediaListTable(this);
  late final MediaTable mediaTable = MediaTable(this);
  late final StudioMediaCrossRefTable studioMediaCrossRefTable =
      StudioMediaCrossRefTable(this);
  late final CharacterRelatedMediaCrossRefTable
      characterRelatedMediaCrossRefTable =
      CharacterRelatedMediaCrossRefTable(this);
  late final ActivityFilterTypePagingCrossRefTable
      activityFilterTypePagingCrossRefTable =
      ActivityFilterTypePagingCrossRefTable(this);
  late final MediaCharacterPagingCrossRefTable
      mediaCharacterPagingCrossRefTable =
      MediaCharacterPagingCrossRefTable(this);
  late final CharacterVoiceActorCrossRefTable characterVoiceActorCrossRefTable =
      CharacterVoiceActorCrossRefTable(this);
  late final MediaRelationCrossRefTable mediaRelationCrossRefTable =
      MediaRelationCrossRefTable(this);
  late final MediaStaffPagingCrossRefTable mediaStaffPagingCrossRefTable =
      MediaStaffPagingCrossRefTable(this);
  late final MediaExternalLinkTable mediaExternalLinkTable =
      MediaExternalLinkTable(this);
  late final CategoryMediaPagingCrossRefTable categoryMediaPagingCrossRefTable =
      CategoryMediaPagingCrossRefTable(this);
  late final FavoriteInfoTable favoriteInfoTable = FavoriteInfoTable(this);
  late final EpisodeTable episodeTable = EpisodeTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userTable,
        studioTable,
        staffTable,
        activityTable,
        airingScheduleTable,
        characterTable,
        mediaListTable,
        mediaTable,
        studioMediaCrossRefTable,
        characterRelatedMediaCrossRefTable,
        activityFilterTypePagingCrossRefTable,
        mediaCharacterPagingCrossRefTable,
        characterVoiceActorCrossRefTable,
        mediaRelationCrossRefTable,
        mediaStaffPagingCrossRefTable,
        mediaExternalLinkTable,
        categoryMediaPagingCrossRefTable,
        favoriteInfoTable,
        episodeTable
      ];
  @override
  int get schemaVersion => 7;
}
