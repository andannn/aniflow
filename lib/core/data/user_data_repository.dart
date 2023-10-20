import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/shared_preference/aniflow_prefrences.dart';

abstract class UserDataRepository {
  AnimeSeasonParam getAnimeSeasonParam();

  Future setAnimeSeasonParam(AnimeSeasonParam param);

  DateTime? getLastSuccessSyncTime();

  Future setLastSuccessSync(DateTime time);

  Stream<MediaType> getMediaTypeStream();

  MediaType getMediaType();

  Future setMediaType(MediaType type);
}

class UserDataRepositoryImpl implements UserDataRepository {
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
  DateTime? getLastSuccessSyncTime() => preferences.getLastSuccessSync();

  @override
  Future setLastSuccessSync(DateTime time) =>
      preferences.setLastSuccessSync(time);

  @override
  Stream<MediaType> getMediaTypeStream() =>
      preferences.getCurrentMediaTypeStream();

  @override
  Future setMediaType(MediaType type) => preferences.setCurrentMediaType(type);

  @override
  MediaType getMediaType() => preferences.getCurrentMediaType();
}
