// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aniflow/core/common/definitions/activity_filter_type.dart'
    as _i50;
import 'package:aniflow/core/common/definitions/activity_scope_category.dart'
    as _i49;
import 'package:aniflow/core/common/definitions/anime_category.dart' as _i31;
import 'package:aniflow/core/common/definitions/media_sort.dart' as _i25;
import 'package:aniflow/core/common/definitions/staff_language.dart' as _i34;
import 'package:aniflow/core/data/activity_repository.dart' as _i27;
import 'package:aniflow/core/data/auth_repository.dart' as _i10;
import 'package:aniflow/core/data/favorite_repository.dart' as _i11;
import 'package:aniflow/core/data/media_information_repository.dart' as _i13;
import 'package:aniflow/core/data/media_list_repository.dart' as _i14;
import 'package:aniflow/core/data/notification_repository.dart' as _i15;
import 'package:aniflow/core/data/search_repository.dart' as _i18;
import 'package:aniflow/core/data/settings_repository.dart' as _i6;
import 'package:aniflow/core/data/user_info_repository.dart' as _i7;
import 'package:aniflow/core/data/user_statistics_repository.dart' as _i23;
import 'package:aniflow/core/network/ani_list_data_source.dart' as _i8;
import 'package:aniflow/core/network/auth_data_source.dart' as _i9;
import 'package:aniflow/core/network/di/di_network_module.dart' as _i52;
import 'package:aniflow/feature/airing_schedule/bloc/airing_schedule_bloc.dart'
    as _i29;
import 'package:aniflow/feature/anime_search/bloc/anime_search_bloc.dart'
    as _i44;
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart' as _i32;
import 'package:aniflow/feature/character_page/bloc/character_page_bloc.dart'
    as _i3;
import 'package:aniflow/feature/character_page/bloc/character_paging_bloc.dart'
    as _i33;
import 'package:aniflow/feature/detail_character/bloc/detail_character_bloc.dart'
    as _i35;
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart'
    as _i36;
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_bloc.dart'
    as _i37;
import 'package:aniflow/feature/detail_staff/bloc/voice_actor_contents_paging_bloc.dart'
    as _i24;
import 'package:aniflow/feature/detail_studio/bloc/detail_studio_bloc.dart'
    as _i38;
import 'package:aniflow/feature/detail_studio/bloc/studio_contents_paging_bloc.dart'
    as _i21;
import 'package:aniflow/feature/discover/bloc/discover_bloc.dart' as _i39;
import 'package:aniflow/feature/media_page/bloc/media_page_bloc.dart' as _i30;
import 'package:aniflow/feature/media_track/bloc/track_bloc.dart' as _i22;
import 'package:aniflow/feature/notification/bloc/notification_bloc.dart'
    as _i5;
import 'package:aniflow/feature/notification/bloc/notification_paging_bloc.dart'
    as _i43;
import 'package:aniflow/feature/profile/profile_bloc.dart' as _i16;
import 'package:aniflow/feature/profile/sub_activity/user_activity_paging_bloc.dart'
    as _i46;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_anime_paging_bloc.dart'
    as _i40;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_character_paging_bloc.dart'
    as _i41;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_manga_paging_bloc.dart'
    as _i42;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_staff_paging_bloc.dart'
    as _i12;
import 'package:aniflow/feature/profile/sub_media_list/bloc/anime_list_paging_bloc.dart'
    as _i26;
import 'package:aniflow/feature/profile/sub_media_list/bloc/manga_list_paging_bloc.dart'
    as _i17;
import 'package:aniflow/feature/profile/sub_stats/bloc/stats_bloc.dart' as _i45;
import 'package:aniflow/feature/settings/bloc/settings_bloc.dart' as _i19;
import 'package:aniflow/feature/social/activity/bloc/activity_bloc.dart'
    as _i47;
import 'package:aniflow/feature/social/activity/bloc/activity_item_bloc.dart'
    as _i28;
import 'package:aniflow/feature/social/activity/bloc/activity_paging_bloc.dart'
    as _i48;
import 'package:aniflow/feature/social/activity_replies/bloc/activity_replies_bloc.dart'
    as _i51;
import 'package:aniflow/feature/staff_page/bloc/staff_page_bloc.dart' as _i20;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dINetworkModule = _$DINetworkModule();
    gh.factory<_i3.CharacterPageBloc>(() => _i3.CharacterPageBloc());
    gh.lazySingleton<_i4.Dio>(() => dINetworkModule.dio);
    gh.factory<_i5.NotificationBloc>(() => _i5.NotificationBloc());
    gh.lazySingleton<_i6.SettingsRepository>(() => _i6.SettingsRepository());
    gh.lazySingleton<_i7.UserInfoRepository>(() => _i7.UserInfoRepository());
    gh.lazySingleton<_i8.AniListDataSource>(
        () => _i8.AniListDataSource(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i9.AuthDataSource>(
        () => _i9.AuthDataSource(gh<_i4.Dio>()));
    gh.lazySingleton<_i10.AuthRepository>(
        () => _i10.AuthRepository(authDataSource: gh<_i9.AuthDataSource>()));
    gh.lazySingleton<_i11.FavoriteRepository>(() => _i11.FavoriteRepository(
        aniListDataSource: gh<_i8.AniListDataSource>()));
    gh.factoryParam<_i12.FavoriteStaffPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i12.FavoriteStaffPagingBloc(
          userId,
          gh<_i11.FavoriteRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i13.MediaInformationRepository>(() =>
        _i13.MediaInformationRepository(
            dataSource: gh<_i8.AniListDataSource>()));
    gh.lazySingleton<_i14.MediaListRepository>(() => _i14.MediaListRepository(
          authDataSource: gh<_i9.AuthDataSource>(),
          aniListDataSource: gh<_i8.AniListDataSource>(),
        ));
    gh.lazySingleton<_i15.NotificationRepository>(
        () => _i15.NotificationRepository(gh<_i9.AuthDataSource>()));
    gh.factoryParam<_i16.ProfileBloc, String?, dynamic>((
      _userId,
      _,
    ) =>
        _i16.ProfileBloc(
          _userId,
          gh<_i7.UserInfoRepository>(),
        ));
    gh.factoryParam<_i17.ReadingMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i17.ReadingMangaListPagingBloc(
          userId,
          gh<_i14.MediaListRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i18.SearchRepository>(
        () => _i18.SearchRepository(dataSource: gh<_i8.AniListDataSource>()));
    gh.factory<_i19.SettingsBloc>(() => _i19.SettingsBloc(
          gh<_i6.SettingsRepository>(),
          gh<_i10.AuthRepository>(),
        ));
    gh.factoryParam<_i20.StaffPageBloc, String, dynamic>((
      animeId,
      _,
    ) =>
        _i20.StaffPageBloc(
          animeId,
          gh<_i13.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i21.StudioContentsPagingBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i21.StudioContentsPagingBloc(
          studioId,
          gh<_i13.MediaInformationRepository>(),
        ));
    gh.factory<_i22.TrackBloc>(() => _i22.TrackBloc(
          gh<_i14.MediaListRepository>(),
          gh<_i6.SettingsRepository>(),
          gh<_i10.AuthRepository>(),
        ));
    gh.lazySingleton<_i23.UserStatisticsRepository>(() =>
        _i23.UserStatisticsRepository(dataSource: gh<_i8.AniListDataSource>()));
    gh.factoryParam<_i24.VoiceActorContentsPagingBloc, String, _i25.MediaSort>((
      staffId,
      mediaSort,
    ) =>
        _i24.VoiceActorContentsPagingBloc(
          staffId,
          gh<_i13.MediaInformationRepository>(),
          mediaSort,
        ));
    gh.factoryParam<_i26.WatchingAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i26.WatchingAnimeListPagingBloc(
          userId,
          gh<_i14.MediaListRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i27.ActivityRepository>(() => _i27.ActivityRepository(
        aniListDataSource: gh<_i8.AniListDataSource>()));
    gh.factoryParam<_i28.ActivityStatusBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i28.ActivityStatusBloc(
          gh<_i27.ActivityRepository>(),
          activityId,
        ));
    gh.factory<_i29.AiringScheduleBloc>(
        () => _i29.AiringScheduleBloc(gh<_i13.MediaInformationRepository>()));
    gh.factoryParam<_i30.AnimePageBloc, _i31.MediaCategory, dynamic>((
      category,
      _,
    ) =>
        _i30.AnimePageBloc(
          category,
          gh<_i13.MediaInformationRepository>(),
          gh<_i14.MediaListRepository>(),
          gh<_i10.AuthRepository>(),
        ));
    gh.factory<_i32.AuthBloc>(() => _i32.AuthBloc(gh<_i10.AuthRepository>()));
    gh.factoryParam<_i33.CharacterPagingBloc, String, _i34.StaffLanguage>((
      animeId,
      staffLanguage,
    ) =>
        _i33.CharacterPagingBloc(
          animeId,
          staffLanguage,
          gh<_i13.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i26.CompleteAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i26.CompleteAnimeListPagingBloc(
          userId,
          gh<_i14.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i35.DetailCharacterBloc, String, dynamic>((
      _characterId,
      _,
    ) =>
        _i35.DetailCharacterBloc(
          _characterId,
          gh<_i13.MediaInformationRepository>(),
          gh<_i11.FavoriteRepository>(),
        ));
    gh.factoryParam<_i36.DetailMediaBloc, String, dynamic>((
      mediaId,
      _,
    ) =>
        _i36.DetailMediaBloc(
          mediaId,
          gh<_i10.AuthRepository>(),
          gh<_i11.FavoriteRepository>(),
          gh<_i13.MediaInformationRepository>(),
          gh<_i14.MediaListRepository>(),
        ));
    gh.factoryParam<_i37.DetailStaffBloc, String, dynamic>((
      staffId,
      _,
    ) =>
        _i37.DetailStaffBloc(
          staffId,
          gh<_i13.MediaInformationRepository>(),
          gh<_i11.FavoriteRepository>(),
        ));
    gh.factoryParam<_i38.DetailStudioBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i38.DetailStudioBloc(
          studioId,
          gh<_i13.MediaInformationRepository>(),
          gh<_i11.FavoriteRepository>(),
        ));
    gh.factory<_i39.DiscoverBloc>(() => _i39.DiscoverBloc(
          gh<_i6.SettingsRepository>(),
          gh<_i10.AuthRepository>(),
          gh<_i13.MediaInformationRepository>(),
          gh<_i14.MediaListRepository>(),
        ));
    gh.factoryParam<_i26.DroppedAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i26.DroppedAnimeListPagingBloc(
          userId,
          gh<_i14.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i17.DroppedMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i17.DroppedMangaListPagingBloc(
          userId,
          gh<_i14.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i40.FavoriteAnimePagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i40.FavoriteAnimePagingBloc(
          userId,
          perPageCount,
          gh<_i11.FavoriteRepository>(),
        ));
    gh.factoryParam<_i41.FavoriteCharacterPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i41.FavoriteCharacterPagingBloc(
          userId,
          gh<_i11.FavoriteRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i42.FavoriteMangaPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i42.FavoriteMangaPagingBloc(
          userId,
          gh<_i11.FavoriteRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i43.NotificationPagingBloc, _i15.NotificationCategory,
        dynamic>((
      _category,
      _,
    ) =>
        _i43.NotificationPagingBloc(
          gh<_i15.NotificationRepository>(),
          _category,
        ));
    gh.factory<_i44.SearchPageBloc>(() => _i44.SearchPageBloc(
          gh<_i18.SearchRepository>(),
          gh<_i6.SettingsRepository>(),
        ));
    gh.factoryParam<_i45.StatsBloc, String, dynamic>((
      userId,
      _,
    ) =>
        _i45.StatsBloc(
          gh<_i23.UserStatisticsRepository>(),
          userId,
        ));
    gh.factoryParam<_i46.UserActivityPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i46.UserActivityPagingBloc(
          userId,
          gh<_i27.ActivityRepository>(),
          perPageCount,
        ));
    gh.factory<_i47.ActivityBloc>(
        () => _i47.ActivityBloc(gh<_i27.ActivityRepository>()));
    gh.factoryParam<_i48.ActivityPagingBloc, _i49.ActivityScopeCategory,
        _i50.ActivityFilterType>((
      userType,
      filterType,
    ) =>
        _i48.ActivityPagingBloc(
          gh<_i27.ActivityRepository>(),
          userType,
          filterType,
        ));
    gh.factoryParam<_i51.ActivityRepliesBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i51.ActivityRepliesBloc(
          gh<_i27.ActivityRepository>(),
          activityId,
        ));
    return this;
  }
}

class _$DINetworkModule extends _i52.DINetworkModule {}
