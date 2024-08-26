import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule.dart';
import 'package:aniflow/feature/image_preview/preview_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ani_flow_route_path.freezed.dart';

part 'ani_flow_route_path.g.dart';

@freezed
sealed class AniFlowRoutePath with _$AniFlowRoutePath {
  const factory AniFlowRoutePath.home() = AniFlowHomePath;

  const factory AniFlowRoutePath.search() = SearchRoutePath;

  const factory AniFlowRoutePath.favoriteStaffList({
    required String id,
  }) = FavoriteStaffListPath;

  const factory AniFlowRoutePath.favoriteCharacterList({
    required String id,
  }) = FavoriteCharacterListPath;

  const factory AniFlowRoutePath.favoriteAnimeList({
    required String id,
  }) = FavoriteAnimeListPath;

  const factory AniFlowRoutePath.favoriteMangaList({
    required String id,
  }) = FavoriteMangaListPath;

  const factory AniFlowRoutePath.userProfile({
    required String id,
  }) = UserProfileRoutePath;

  const factory AniFlowRoutePath.categoryAnimeList({
    required MediaCategory category,
  }) = CategoryAnimeListRoutePath;

  const factory AniFlowRoutePath.mediaCharacterList({
    required String id,
  }) = MediaCharacterListRoutePath;

  const factory AniFlowRoutePath.mediaStaffList({
    required String id,
  }) = MediaStaffListRoutePath;

  const factory AniFlowRoutePath.detailMedia({
    required String id,
  }) = DetailMediaRoutePath;

  const factory AniFlowRoutePath.detailCharacter({
    required String id,
  }) = DetailCharacterPath;

  const factory AniFlowRoutePath.detailStaff({
    required String id,
  }) = DetailStaffPath;

  const factory AniFlowRoutePath.airingSchedule({
    required ScheduleType type,
  }) = AiringScheduleRoutePath;

  const factory AniFlowRoutePath.notification() = NotificationRoutePath;

  const factory AniFlowRoutePath.detailStudio({
    required String id,
  }) = DetailStudioRoutePath;

  const factory AniFlowRoutePath.activityReplies({
    required String id,
  }) = ActivityRepliesRoutePath;

  const factory AniFlowRoutePath.imagePreview({
    @PreviewSourceConverter() required PreviewSource source,
  }) = ImagePreviewRoutePath;

  const factory AniFlowRoutePath.mediaListUpdate({
    required String mediaId,
    required String from,
  }) = MediaListUpdateRoutePath;

  const factory AniFlowRoutePath.settings() = SettingsRoutePath;

  const factory AniFlowRoutePath.birthdayCharacterPage() =
      BirthdayCharacterPagePath;

  factory AniFlowRoutePath.fromJson(Map<String, dynamic> json) =>
      _$AniFlowRoutePathFromJson(json);
}
