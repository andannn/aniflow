import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_time_key.freezed.dart';

part 'refresh_time_key.g.dart';

@freezed
sealed class RefreshTimeKey with _$RefreshTimeKey {
  static int birthdayCharactersRefreshInterval = 60 * 24;
  static int airingScheduleRefreshInterval = 60 * 24;
  static int recentMoviesRefreshInterval = 60 * 24;
  static int mediaCategoryRefreshInterval = 60 * 24;
  static int mediaListRefreshInterval = 60;

  const factory RefreshTimeKey.birthdayCharacters() = BirthdayCharacters;

  const factory RefreshTimeKey.airingSchedule() = AiringSchedule;

  const factory RefreshTimeKey.recentMovies() = RecentMovies;

  const factory RefreshTimeKey.mediaCategory(
      {required MediaCategory category}) = MediaCategoryKey;

  const factory RefreshTimeKey.mediaList({required String userId}) = MediaList;

  factory RefreshTimeKey.fromJson(Map<String, dynamic> json) =>
      _$RefreshTimeKeyFromJson(json);
}

extension RefreshTimeKeyEx on RefreshTimeKey {
  int get refreshIntervalInMinutes => when(
        birthdayCharacters: () =>
            RefreshTimeKey.birthdayCharactersRefreshInterval,
        airingSchedule: () => RefreshTimeKey.airingScheduleRefreshInterval,
        recentMovies: () => RefreshTimeKey.recentMoviesRefreshInterval,
        mediaCategory: (type) => RefreshTimeKey.mediaCategoryRefreshInterval,
        mediaList: (_) => RefreshTimeKey.mediaListRefreshInterval,
      );
}
