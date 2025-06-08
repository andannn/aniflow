import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/home_sector_category.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/definitions/refresh_time_key.dart';
import 'package:aniflow/core/common/definitions/track_list_filter.dart';
import 'package:aniflow/core/common/dialog/dialog_type.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [AfEnvironment.mock], as: UserDataRepository)
class MockUserDataRepository implements UserDataRepository {
  @override
  Future addNotificationId(String id) {
    return Future.value();
  }

  @override
  String? get authedUserId => null;

  @override
  bool canRefresh(RefreshTimeKey key) {
    return true;
  }

  @override
  bool canShowDialog(DialogType key) {
    return true;
  }

  @override
  Future clearNotificationId() {
    return Future.value();
  }

  @override
  bool get displayAdultContent => true;

  @override
  Stream<bool> get displayAdultContentStream => Stream.value(true);

  @override
  AnimeSeasonParam getAnimeSeasonParam() {
    return const AnimeSeasonParam(seasonYear: 2024, season: AnimeSeason.fall);
  }

  @override
  Stream<List<HomeSectorCategory>> get homeSectorsStream => Stream.value([
        HomeSectorCategory.recentMovies,
        HomeSectorCategory.currentSeasonAnime,
        HomeSectorCategory.nextSeasonAnime,
        HomeSectorCategory.trendingAnime,
        HomeSectorCategory.movieAnime,
        HomeSectorCategory.trendingManga,
        HomeSectorCategory.allTimePopularManga,
        HomeSectorCategory.topManhwa,
      ]);

  @override
  bool get isAppUpdateDialogFeatureEnabled => true;

  @override
  Stream<bool> get isSocialFeatureEnabledStream => Stream.value(true);

  @override
  Stream<AppVersion?> get latestAppVersion => Stream.value(null);

  @override
  MediaType get mediaType => MediaType.anime;

  @override
  Stream<MediaType> get mediaTypeStream => Stream.value(MediaType.anime);

  @override
  ScoreFormat get scoreFormat => ScoreFormat.point5;

  @override
  Stream<ScoreFormat> get scoreFormatStream => Stream.value(ScoreFormat.point5);

  @override
  AnimeSeason get season => AnimeSeason.fall;

  @override
  int get seasonYear => 2024;

  @override
  List<String> get sentNotificationIds => ['1', '2', '3'];

  @override
  Future setActivityFilterType(ActivityFilterType category) {
    return Future.value();
  }

  @override
  Future setActivityScopeCategory(ActivityScopeCategory scopeCategory) {
    return Future.value();
  }

  @override
  Future setAnimeSeason(AnimeSeason season) {
    return Future.value();
  }

  @override
  Future setAnimeSeasonParam(AnimeSeasonParam param) {
    return Future.value();
  }

  @override
  Future setAuthExpiredTime(DateTime? dateTime) {
    return Future.value();
  }

  @override
  Future setAuthToken(String? authToken) {
    return Future.value();
  }

  @override
  Future setAuthedUserId(String? userId) {
    return Future.value();
  }

  @override
  Future setDialogClosedTime(DialogType key, DateTime time) {
    return Future.value();
  }

  @override
  Future setLastSuccessRefreshTime(RefreshTimeKey key, DateTime time) {
    return Future.value();
  }

  @override
  Future setMediaType(MediaType mediaType) {
    return Future.value();
  }

  @override
  Future setSeasonYear(int seasonYear) {
    return Future.value();
  }

  @override
  Future setThemeSetting(ThemeSetting setting) {
    return Future.value();
  }

  @override
  Future setTrackListFilter(TrackListFilter trackListFilter) {
    return Future.value();
  }

  @override
  Stream<UserStaffNameLanguage> get staffLanguageStream =>
      Stream.value(UserStaffNameLanguage.native);

  @override
  Stream<ThemeSetting> get themeSettingStream =>
      Stream.value(ThemeSetting.light);

  @override
  Stream<UserTitleLanguage> get titleLanguageStream =>
      Stream.value(UserTitleLanguage.native);

  @override
  Stream<UserDataModel> get userDataStream =>
      Stream.value(const UserDataModel());

  @override
  UserStaffNameLanguage get userStaffNameLanguage =>
      UserStaffNameLanguage.native;

  @override
  UserTitleLanguage get userTitleLanguage => UserTitleLanguage.native;

  @override
  Future setUseInAppPlayer(bool isOn) {
    throw UnimplementedError();
  }

  @override
  Stream<bool> get useInAppPlayerStream => throw UnimplementedError();

  @override
  bool get useInAppPlayer => throw UnimplementedError();
}
