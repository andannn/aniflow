// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aniflow/core/common/definitions/activity_filter_type.dart'
    as _i60;
import 'package:aniflow/core/common/definitions/activity_scope_category.dart'
    as _i59;
import 'package:aniflow/core/common/definitions/anime_category.dart' as _i41;
import 'package:aniflow/core/common/definitions/media_sort.dart' as _i35;
import 'package:aniflow/core/common/definitions/staff_language.dart' as _i44;
import 'package:aniflow/core/data/activity_repository.dart' as _i37;
import 'package:aniflow/core/data/auth_repository.dart' as _i20;
import 'package:aniflow/core/data/favorite_repository.dart' as _i21;
import 'package:aniflow/core/data/media_information_repository.dart' as _i23;
import 'package:aniflow/core/data/media_list_repository.dart' as _i24;
import 'package:aniflow/core/data/notification_repository.dart' as _i25;
import 'package:aniflow/core/data/search_repository.dart' as _i28;
import 'package:aniflow/core/data/settings_repository.dart' as _i11;
import 'package:aniflow/core/data/user_info_repository.dart' as _i15;
import 'package:aniflow/core/data/user_statistics_repository.dart' as _i33;
import 'package:aniflow/core/database/aniflow_database.dart' as _i3;
import 'package:aniflow/core/database/dao/activity_dao.dart' as _i16;
import 'package:aniflow/core/database/dao/airing_schedules_dao.dart' as _i17;
import 'package:aniflow/core/database/dao/character_dao.dart' as _i4;
import 'package:aniflow/core/database/dao/favorite_dao.dart' as _i7;
import 'package:aniflow/core/database/dao/media_dao.dart' as _i8;
import 'package:aniflow/core/database/dao/media_list_dao.dart' as _i9;
import 'package:aniflow/core/database/dao/staff_dao.dart' as _i12;
import 'package:aniflow/core/database/dao/studio_dao.dart' as _i13;
import 'package:aniflow/core/database/dao/user_dao.dart' as _i14;
import 'package:aniflow/core/database/di/database_module.dart' as _i62;
import 'package:aniflow/core/network/ani_list_data_source.dart' as _i18;
import 'package:aniflow/core/network/auth_data_source.dart' as _i19;
import 'package:aniflow/core/network/di/di_network_module.dart' as _i63;
import 'package:aniflow/feature/airing_schedule/bloc/airing_schedule_bloc.dart'
    as _i39;
import 'package:aniflow/feature/anime_search/bloc/anime_search_bloc.dart'
    as _i54;
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart' as _i42;
import 'package:aniflow/feature/character_page/bloc/character_page_bloc.dart'
    as _i5;
import 'package:aniflow/feature/character_page/bloc/character_paging_bloc.dart'
    as _i43;
import 'package:aniflow/feature/detail_character/bloc/detail_character_bloc.dart'
    as _i45;
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart'
    as _i46;
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_bloc.dart'
    as _i47;
import 'package:aniflow/feature/detail_staff/bloc/voice_actor_contents_paging_bloc.dart'
    as _i34;
import 'package:aniflow/feature/detail_studio/bloc/detail_studio_bloc.dart'
    as _i48;
import 'package:aniflow/feature/detail_studio/bloc/studio_contents_paging_bloc.dart'
    as _i31;
import 'package:aniflow/feature/discover/bloc/discover_bloc.dart' as _i49;
import 'package:aniflow/feature/media_page/bloc/media_page_bloc.dart' as _i40;
import 'package:aniflow/feature/media_track/bloc/track_bloc.dart' as _i32;
import 'package:aniflow/feature/notification/bloc/notification_bloc.dart'
    as _i10;
import 'package:aniflow/feature/notification/bloc/notification_paging_bloc.dart'
    as _i53;
import 'package:aniflow/feature/profile/profile_bloc.dart' as _i26;
import 'package:aniflow/feature/profile/sub_activity/user_activity_paging_bloc.dart'
    as _i56;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_anime_paging_bloc.dart'
    as _i50;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_character_paging_bloc.dart'
    as _i51;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_manga_paging_bloc.dart'
    as _i52;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_staff_paging_bloc.dart'
    as _i22;
import 'package:aniflow/feature/profile/sub_media_list/bloc/anime_list_paging_bloc.dart'
    as _i36;
import 'package:aniflow/feature/profile/sub_media_list/bloc/manga_list_paging_bloc.dart'
    as _i27;
import 'package:aniflow/feature/profile/sub_stats/bloc/stats_bloc.dart' as _i55;
import 'package:aniflow/feature/settings/bloc/settings_bloc.dart' as _i29;
import 'package:aniflow/feature/social/activity/bloc/activity_bloc.dart'
    as _i57;
import 'package:aniflow/feature/social/activity/bloc/activity_item_bloc.dart'
    as _i38;
import 'package:aniflow/feature/social/activity/bloc/activity_paging_bloc.dart'
    as _i58;
import 'package:aniflow/feature/social/activity_replies/bloc/activity_replies_bloc.dart'
    as _i61;
import 'package:aniflow/feature/staff_page/bloc/staff_page_bloc.dart' as _i30;
import 'package:dio/dio.dart' as _i6;
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
    final dIDataBaseModule = _$DIDataBaseModule();
    final dINetworkModule = _$DINetworkModule();
    gh.lazySingleton<_i3.AniflowDatabase>(() => dIDataBaseModule.database);
    gh.factory<_i4.CharacterDao>(
        () => dIDataBaseModule.geCharacterDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i5.CharacterPageBloc>(() => _i5.CharacterPageBloc());
    gh.lazySingleton<_i6.Dio>(() => dINetworkModule.dio);
    gh.factory<_i7.FavoriteDao>(
        () => dIDataBaseModule.geFavoriteDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i8.MediaDao>(
        () => dIDataBaseModule.geMediaDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i9.MediaListDao>(
        () => dIDataBaseModule.geMediaListDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i10.NotificationBloc>(() => _i10.NotificationBloc());
    gh.lazySingleton<_i11.SettingsRepository>(() => _i11.SettingsRepository());
    gh.factory<_i12.StaffDao>(
        () => dIDataBaseModule.getStaffDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i13.StudioDao>(
        () => dIDataBaseModule.getStudioDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i14.UserDao>(
        () => dIDataBaseModule.getUserDao(gh<_i3.AniflowDatabase>()));
    gh.lazySingleton<_i15.UserInfoRepository>(
        () => _i15.UserInfoRepository(gh<_i14.UserDao>()));
    gh.factory<_i16.ActivityDao>(
        () => dIDataBaseModule.getActivityDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i17.AiringSchedulesDao>(() =>
        dIDataBaseModule.getAiringSchedulesDao(gh<_i3.AniflowDatabase>()));
    gh.lazySingleton<_i18.AniListDataSource>(
        () => _i18.AniListDataSource(dio: gh<_i6.Dio>()));
    gh.lazySingleton<_i19.AuthDataSource>(
        () => _i19.AuthDataSource(gh<_i6.Dio>()));
    gh.lazySingleton<_i20.AuthRepository>(() => _i20.AuthRepository(
          gh<_i19.AuthDataSource>(),
          gh<_i14.UserDao>(),
          gh<_i9.MediaListDao>(),
        ));
    gh.lazySingleton<_i21.FavoriteRepository>(() => _i21.FavoriteRepository(
          gh<_i18.AniListDataSource>(),
          gh<_i14.UserDao>(),
          gh<_i8.MediaDao>(),
          gh<_i12.StaffDao>(),
          gh<_i4.CharacterDao>(),
          gh<_i9.MediaListDao>(),
          gh<_i7.FavoriteDao>(),
        ));
    gh.factoryParam<_i22.FavoriteStaffPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i22.FavoriteStaffPagingBloc(
          userId,
          gh<_i21.FavoriteRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i23.MediaInformationRepository>(
        () => _i23.MediaInformationRepository(
              gh<_i18.AniListDataSource>(),
              gh<_i4.CharacterDao>(),
              gh<_i12.StaffDao>(),
              gh<_i13.StudioDao>(),
              gh<_i17.AiringSchedulesDao>(),
              gh<_i8.MediaDao>(),
            ));
    gh.lazySingleton<_i24.MediaListRepository>(() => _i24.MediaListRepository(
          gh<_i19.AuthDataSource>(),
          gh<_i18.AniListDataSource>(),
          gh<_i9.MediaListDao>(),
          gh<_i14.UserDao>(),
          gh<_i8.MediaDao>(),
        ));
    gh.lazySingleton<_i25.NotificationRepository>(
        () => _i25.NotificationRepository(
              gh<_i19.AuthDataSource>(),
              gh<_i14.UserDao>(),
              gh<_i8.MediaDao>(),
            ));
    gh.factoryParam<_i26.ProfileBloc, String?, dynamic>((
      _userId,
      _,
    ) =>
        _i26.ProfileBloc(
          _userId,
          gh<_i15.UserInfoRepository>(),
        ));
    gh.factoryParam<_i27.ReadingMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i27.ReadingMangaListPagingBloc(
          userId,
          gh<_i24.MediaListRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i28.SearchRepository>(() => _i28.SearchRepository(
          gh<_i18.AniListDataSource>(),
          gh<_i8.MediaDao>(),
        ));
    gh.factory<_i29.SettingsBloc>(() => _i29.SettingsBloc(
          gh<_i11.SettingsRepository>(),
          gh<_i20.AuthRepository>(),
        ));
    gh.factoryParam<_i30.StaffPageBloc, String, dynamic>((
      animeId,
      _,
    ) =>
        _i30.StaffPageBloc(
          animeId,
          gh<_i23.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i31.StudioContentsPagingBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i31.StudioContentsPagingBloc(
          studioId,
          gh<_i23.MediaInformationRepository>(),
        ));
    gh.factory<_i32.TrackBloc>(() => _i32.TrackBloc(
          gh<_i24.MediaListRepository>(),
          gh<_i11.SettingsRepository>(),
          gh<_i20.AuthRepository>(),
        ));
    gh.lazySingleton<_i33.UserStatisticsRepository>(
        () => _i33.UserStatisticsRepository(
              gh<_i8.MediaDao>(),
              gh<_i18.AniListDataSource>(),
            ));
    gh.factoryParam<_i34.VoiceActorContentsPagingBloc, String, _i35.MediaSort>((
      staffId,
      mediaSort,
    ) =>
        _i34.VoiceActorContentsPagingBloc(
          staffId,
          gh<_i23.MediaInformationRepository>(),
          mediaSort,
        ));
    gh.factoryParam<_i36.WatchingAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i36.WatchingAnimeListPagingBloc(
          userId,
          gh<_i24.MediaListRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i37.ActivityRepository>(() => _i37.ActivityRepository(
          gh<_i16.ActivityDao>(),
          gh<_i18.AniListDataSource>(),
        ));
    gh.factoryParam<_i38.ActivityStatusBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i38.ActivityStatusBloc(
          gh<_i37.ActivityRepository>(),
          activityId,
        ));
    gh.factory<_i39.AiringScheduleBloc>(
        () => _i39.AiringScheduleBloc(gh<_i23.MediaInformationRepository>()));
    gh.factoryParam<_i40.AnimePageBloc, _i41.MediaCategory, dynamic>((
      category,
      _,
    ) =>
        _i40.AnimePageBloc(
          category,
          gh<_i23.MediaInformationRepository>(),
          gh<_i24.MediaListRepository>(),
          gh<_i20.AuthRepository>(),
        ));
    gh.factory<_i42.AuthBloc>(() => _i42.AuthBloc(gh<_i20.AuthRepository>()));
    gh.factoryParam<_i43.CharacterPagingBloc, String, _i44.StaffLanguage>((
      animeId,
      staffLanguage,
    ) =>
        _i43.CharacterPagingBloc(
          animeId,
          staffLanguage,
          gh<_i23.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i36.CompleteAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i36.CompleteAnimeListPagingBloc(
          userId,
          gh<_i24.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i45.DetailCharacterBloc, String, dynamic>((
      _characterId,
      _,
    ) =>
        _i45.DetailCharacterBloc(
          _characterId,
          gh<_i23.MediaInformationRepository>(),
          gh<_i21.FavoriteRepository>(),
        ));
    gh.factoryParam<_i46.DetailMediaBloc, String, dynamic>((
      mediaId,
      _,
    ) =>
        _i46.DetailMediaBloc(
          mediaId,
          gh<_i20.AuthRepository>(),
          gh<_i21.FavoriteRepository>(),
          gh<_i23.MediaInformationRepository>(),
          gh<_i24.MediaListRepository>(),
        ));
    gh.factoryParam<_i47.DetailStaffBloc, String, dynamic>((
      staffId,
      _,
    ) =>
        _i47.DetailStaffBloc(
          staffId,
          gh<_i23.MediaInformationRepository>(),
          gh<_i21.FavoriteRepository>(),
        ));
    gh.factoryParam<_i48.DetailStudioBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i48.DetailStudioBloc(
          studioId,
          gh<_i23.MediaInformationRepository>(),
          gh<_i21.FavoriteRepository>(),
        ));
    gh.factory<_i49.DiscoverBloc>(() => _i49.DiscoverBloc(
          gh<_i11.SettingsRepository>(),
          gh<_i20.AuthRepository>(),
          gh<_i23.MediaInformationRepository>(),
          gh<_i24.MediaListRepository>(),
        ));
    gh.factoryParam<_i36.DroppedAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i36.DroppedAnimeListPagingBloc(
          userId,
          gh<_i24.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i27.DroppedMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i27.DroppedMangaListPagingBloc(
          userId,
          gh<_i24.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i50.FavoriteAnimePagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i50.FavoriteAnimePagingBloc(
          userId,
          perPageCount,
          gh<_i21.FavoriteRepository>(),
        ));
    gh.factoryParam<_i51.FavoriteCharacterPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i51.FavoriteCharacterPagingBloc(
          userId,
          gh<_i21.FavoriteRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i52.FavoriteMangaPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i52.FavoriteMangaPagingBloc(
          userId,
          gh<_i21.FavoriteRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i53.NotificationPagingBloc, _i25.NotificationCategory,
        dynamic>((
      _category,
      _,
    ) =>
        _i53.NotificationPagingBloc(
          gh<_i25.NotificationRepository>(),
          _category,
        ));
    gh.factory<_i54.SearchPageBloc>(() => _i54.SearchPageBloc(
          gh<_i28.SearchRepository>(),
          gh<_i11.SettingsRepository>(),
        ));
    gh.factoryParam<_i55.StatsBloc, String, dynamic>((
      userId,
      _,
    ) =>
        _i55.StatsBloc(
          gh<_i33.UserStatisticsRepository>(),
          userId,
        ));
    gh.factoryParam<_i56.UserActivityPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i56.UserActivityPagingBloc(
          userId,
          gh<_i37.ActivityRepository>(),
          perPageCount,
        ));
    gh.factory<_i57.ActivityBloc>(
        () => _i57.ActivityBloc(gh<_i37.ActivityRepository>()));
    gh.factoryParam<_i58.ActivityPagingBloc, _i59.ActivityScopeCategory,
        _i60.ActivityFilterType>((
      userType,
      filterType,
    ) =>
        _i58.ActivityPagingBloc(
          gh<_i37.ActivityRepository>(),
          userType,
          filterType,
        ));
    gh.factoryParam<_i61.ActivityRepliesBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i61.ActivityRepliesBloc(
          gh<_i37.ActivityRepository>(),
          activityId,
        ));
    return this;
  }
}

class _$DIDataBaseModule extends _i62.DIDataBaseModule {}

class _$DINetworkModule extends _i63.DINetworkModule {}
