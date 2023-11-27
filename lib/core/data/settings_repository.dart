import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/model/setting/theme_setting.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';

abstract class SettingsRepository {
  AnimeSeasonParam getAnimeSeasonParam();

  Future setAnimeSeasonParam(AnimeSeasonParam param);

  Stream<MediaType> getMediaTypeStream();

  MediaType getMediaType();

  Future setMediaType(MediaType type);

  Stream<ThemeSetting> getThemeSettingStream();

  Future setThemeSetting(ThemeSetting setting);
}

class SettingsRepositoryImpl implements SettingsRepository {
  final AniFlowPreferences preferences = AniFlowPreferences();

  @override
  AnimeSeasonParam getAnimeSeasonParam() {
    final seasonYear = preferences.getCurrentSeasonYear();
    final season = preferences.getCurrentSeason();

    return AnimeSeasonParam(seasonYear: seasonYear, season: season);
  }

  @override
  Future setAnimeSeasonParam(AnimeSeasonParam param) async {
    await preferences.setCurrentSeason(param.season);
    await preferences.setCurrentSeasonYear(param.seasonYear);
  }

  @override
  Stream<MediaType> getMediaTypeStream() =>
      preferences.getCurrentMediaTypeStream();

  @override
  Future setMediaType(MediaType type) => preferences.setCurrentMediaType(type);

  @override
  MediaType getMediaType() => preferences.getCurrentMediaType();

  @override
  Stream<ThemeSetting> getThemeSettingStream() =>
      preferences.getThemeSettingStream();

  @override
  Future setThemeSetting(ThemeSetting setting) =>
      preferences.setThemeSetting(setting);
}
