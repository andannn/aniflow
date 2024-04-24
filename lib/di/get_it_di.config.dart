// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aniflow/core/common/definitions/activity_filter_type.dart'
    as _i66;
import 'package:aniflow/core/common/definitions/activity_scope_category.dart'
    as _i65;
import 'package:aniflow/core/common/definitions/anime_category.dart' as _i46;
import 'package:aniflow/core/common/definitions/media_sort.dart' as _i40;
import 'package:aniflow/core/common/definitions/staff_language.dart' as _i49;
import 'package:aniflow/core/data/activity_repository.dart' as _i42;
import 'package:aniflow/core/data/auth_repository.dart' as _i23;
import 'package:aniflow/core/data/favorite_repository.dart' as _i26;
import 'package:aniflow/core/data/hi_animation_repository.dart' as _i8;
import 'package:aniflow/core/data/media_information_repository.dart' as _i28;
import 'package:aniflow/core/data/media_list_repository.dart' as _i29;
import 'package:aniflow/core/data/notification_repository.dart' as _i30;
import 'package:aniflow/core/data/search_repository.dart' as _i33;
import 'package:aniflow/core/data/settings_repository.dart' as _i34;
import 'package:aniflow/core/data/user_data_repository.dart' as _i17;
import 'package:aniflow/core/data/user_info_repository.dart' as _i18;
import 'package:aniflow/core/data/user_statistics_repository.dart' as _i38;
import 'package:aniflow/core/database/aniflow_database.dart' as _i3;
import 'package:aniflow/core/database/dao/activity_dao.dart' as _i19;
import 'package:aniflow/core/database/dao/airing_schedules_dao.dart' as _i20;
import 'package:aniflow/core/database/dao/character_dao.dart' as _i4;
import 'package:aniflow/core/database/dao/favorite_dao.dart' as _i6;
import 'package:aniflow/core/database/dao/media_dao.dart' as _i9;
import 'package:aniflow/core/database/dao/media_list_dao.dart' as _i10;
import 'package:aniflow/core/database/dao/staff_dao.dart' as _i13;
import 'package:aniflow/core/database/dao/studio_dao.dart' as _i14;
import 'package:aniflow/core/database/dao/user_dao.dart' as _i15;
import 'package:aniflow/core/database/di/database_module.dart' as _i68;
import 'package:aniflow/core/network/ani_list_data_source.dart' as _i21;
import 'package:aniflow/core/network/auth_data_source.dart' as _i22;
import 'package:aniflow/core/network/di/di_network_module.dart' as _i69;
import 'package:aniflow/core/network/hianime_data_source.dart' as _i7;
import 'package:aniflow/core/shared_preference/di/shared_preferences_module.dart'
    as _i70;
import 'package:aniflow/core/shared_preference/user_data_preferences.dart'
    as _i16;
import 'package:aniflow/feature/airing_schedule/bloc/airing_schedule_bloc.dart'
    as _i44;
import 'package:aniflow/feature/anime_search/bloc/anime_search_bloc.dart'
    as _i59;
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart' as _i47;
import 'package:aniflow/feature/character_page/bloc/character_page_bloc.dart'
    as _i24;
import 'package:aniflow/feature/character_page/bloc/character_paging_bloc.dart'
    as _i48;
import 'package:aniflow/feature/detail_character/bloc/detail_character_bloc.dart'
    as _i50;
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart'
    as _i51;
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_bloc.dart'
    as _i52;
import 'package:aniflow/feature/detail_staff/bloc/voice_actor_contents_paging_bloc.dart'
    as _i39;
import 'package:aniflow/feature/detail_studio/bloc/detail_studio_bloc.dart'
    as _i53;
import 'package:aniflow/feature/detail_studio/bloc/studio_contents_paging_bloc.dart'
    as _i36;
import 'package:aniflow/feature/discover/bloc/discover_bloc.dart' as _i54;
import 'package:aniflow/feature/edit_profile/bloc/edit_profile_bloc.dart'
    as _i25;
import 'package:aniflow/feature/media_page/bloc/media_page_bloc.dart' as _i45;
import 'package:aniflow/feature/media_track/bloc/track_bloc.dart' as _i37;
import 'package:aniflow/feature/notification/bloc/notification_bloc.dart'
    as _i11;
import 'package:aniflow/feature/notification/bloc/notification_paging_bloc.dart'
    as _i58;
import 'package:aniflow/feature/profile/profile_bloc.dart' as _i31;
import 'package:aniflow/feature/profile/sub_activity/user_activity_paging_bloc.dart'
    as _i62;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_anime_paging_bloc.dart'
    as _i55;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_character_paging_bloc.dart'
    as _i56;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_manga_paging_bloc.dart'
    as _i57;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_staff_paging_bloc.dart'
    as _i27;
import 'package:aniflow/feature/profile/sub_media_list/bloc/anime_list_paging_bloc.dart'
    as _i41;
import 'package:aniflow/feature/profile/sub_media_list/bloc/manga_list_paging_bloc.dart'
    as _i32;
import 'package:aniflow/feature/profile/sub_stats/bloc/stats_bloc.dart' as _i61;
import 'package:aniflow/feature/settings/bloc/settings_bloc.dart' as _i60;
import 'package:aniflow/feature/social/activity/bloc/activity_bloc.dart'
    as _i63;
import 'package:aniflow/feature/social/activity/bloc/activity_item_bloc.dart'
    as _i43;
import 'package:aniflow/feature/social/activity/bloc/activity_paging_bloc.dart'
    as _i64;
import 'package:aniflow/feature/social/activity_replies/bloc/activity_replies_bloc.dart'
    as _i67;
import 'package:aniflow/feature/staff_page/bloc/staff_page_bloc.dart' as _i35;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dIDataBaseModule = _$DIDataBaseModule();
    final dINetworkModule = _$DINetworkModule();
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AniflowDatabase>(() => dIDataBaseModule.database);
    gh.factory<_i4.CharacterDao>(
        () => dIDataBaseModule.geCharacterDao(gh<_i3.AniflowDatabase>()));
    gh.lazySingleton<_i5.Dio>(() => dINetworkModule.dio);
    gh.factory<_i6.FavoriteDao>(
        () => dIDataBaseModule.geFavoriteDao(gh<_i3.AniflowDatabase>()));
    gh.lazySingleton<_i7.HiAnimationDataSource>(
        () => _i7.HiAnimationDataSource(dio: gh<_i5.Dio>()));
    gh.factory<_i8.HiAnimationRepository>(
        () => _i8.HiAnimationRepository(gh<_i7.HiAnimationDataSource>()));
    gh.factory<_i9.MediaDao>(
        () => dIDataBaseModule.geMediaDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i10.MediaListDao>(
        () => dIDataBaseModule.geMediaListDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i11.NotificationBloc>(() => _i11.NotificationBloc());
    await gh.factoryAsync<_i12.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i13.StaffDao>(
        () => dIDataBaseModule.getStaffDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i14.StudioDao>(
        () => dIDataBaseModule.getStudioDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i15.UserDao>(
        () => dIDataBaseModule.getUserDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i16.UserDataPreferences>(
        () => _i16.UserDataPreferences(gh<_i12.SharedPreferences>()));
    gh.lazySingleton<_i17.UserDataRepository>(
        () => _i17.UserDataRepository(gh<_i16.UserDataPreferences>()));
    gh.lazySingleton<_i18.UserInfoRepository>(
        () => _i18.UserInfoRepository(gh<_i15.UserDao>()));
    gh.factory<_i19.ActivityDao>(
        () => dIDataBaseModule.getActivityDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i20.AiringSchedulesDao>(() =>
        dIDataBaseModule.getAiringSchedulesDao(gh<_i3.AniflowDatabase>()));
    gh.lazySingleton<_i21.AniListDataSource>(() => _i21.AniListDataSource(
          gh<_i17.UserDataRepository>(),
          gh<_i5.Dio>(),
        ));
    gh.lazySingleton<_i22.AuthDataSource>(() => _i22.AuthDataSource(
          gh<_i5.Dio>(),
          gh<_i16.UserDataPreferences>(),
        ));
    gh.lazySingleton<_i23.AuthRepository>(() => _i23.AuthRepository(
          gh<_i22.AuthDataSource>(),
          gh<_i15.UserDao>(),
          gh<_i10.MediaListDao>(),
          gh<_i16.UserDataPreferences>(),
        ));
    gh.factory<_i24.CharacterPageBloc>(
        () => _i24.CharacterPageBloc(gh<_i17.UserDataRepository>()));
    gh.factory<_i25.EditProfileBloc>(
        () => _i25.EditProfileBloc(gh<_i23.AuthRepository>()));
    gh.lazySingleton<_i26.FavoriteRepository>(() => _i26.FavoriteRepository(
          gh<_i21.AniListDataSource>(),
          gh<_i15.UserDao>(),
          gh<_i9.MediaDao>(),
          gh<_i13.StaffDao>(),
          gh<_i4.CharacterDao>(),
          gh<_i10.MediaListDao>(),
          gh<_i6.FavoriteDao>(),
          gh<_i17.UserDataRepository>(),
        ));
    gh.factoryParam<_i27.FavoriteStaffPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i27.FavoriteStaffPagingBloc(
          userId,
          gh<_i26.FavoriteRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i28.MediaInformationRepository>(
        () => _i28.MediaInformationRepository(
              gh<_i21.AniListDataSource>(),
              gh<_i4.CharacterDao>(),
              gh<_i13.StaffDao>(),
              gh<_i14.StudioDao>(),
              gh<_i20.AiringSchedulesDao>(),
              gh<_i9.MediaDao>(),
              gh<_i17.UserDataRepository>(),
            ));
    gh.lazySingleton<_i29.MediaListRepository>(() => _i29.MediaListRepository(
          gh<_i22.AuthDataSource>(),
          gh<_i21.AniListDataSource>(),
          gh<_i10.MediaListDao>(),
          gh<_i15.UserDao>(),
          gh<_i9.MediaDao>(),
          gh<_i17.UserDataRepository>(),
        ));
    gh.lazySingleton<_i30.NotificationRepository>(
        () => _i30.NotificationRepository(
              gh<_i22.AuthDataSource>(),
              gh<_i15.UserDao>(),
              gh<_i9.MediaDao>(),
            ));
    gh.factoryParam<_i31.ProfileBloc, String?, dynamic>((
      _userId,
      _,
    ) =>
        _i31.ProfileBloc(
          _userId,
          gh<_i18.UserInfoRepository>(),
          gh<_i17.UserDataRepository>(),
        ));
    gh.factoryParam<_i32.ReadingMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i32.ReadingMangaListPagingBloc(
          userId,
          gh<_i29.MediaListRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i33.SearchRepository>(() => _i33.SearchRepository(
          gh<_i21.AniListDataSource>(),
          gh<_i9.MediaDao>(),
        ));
    gh.lazySingleton<_i34.SettingsRepository>(
        () => _i34.SettingsRepository(gh<_i16.UserDataPreferences>()));
    gh.factoryParam<_i35.StaffPageBloc, String, dynamic>((
      animeId,
      _,
    ) =>
        _i35.StaffPageBloc(
          animeId,
          gh<_i28.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i36.StudioContentsPagingBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i36.StudioContentsPagingBloc(
          studioId,
          gh<_i28.MediaInformationRepository>(),
        ));
    gh.factory<_i37.TrackBloc>(() => _i37.TrackBloc(
          gh<_i29.MediaListRepository>(),
          gh<_i34.SettingsRepository>(),
          gh<_i23.AuthRepository>(),
          gh<_i17.UserDataRepository>(),
        ));
    gh.lazySingleton<_i38.UserStatisticsRepository>(
        () => _i38.UserStatisticsRepository(
              gh<_i9.MediaDao>(),
              gh<_i21.AniListDataSource>(),
            ));
    gh.factoryParam<_i39.VoiceActorContentsPagingBloc, String, _i40.MediaSort>((
      staffId,
      mediaSort,
    ) =>
        _i39.VoiceActorContentsPagingBloc(
          staffId,
          gh<_i28.MediaInformationRepository>(),
          mediaSort,
        ));
    gh.factoryParam<_i41.WatchingAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i41.WatchingAnimeListPagingBloc(
          userId,
          gh<_i29.MediaListRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i42.ActivityRepository>(() => _i42.ActivityRepository(
          gh<_i19.ActivityDao>(),
          gh<_i21.AniListDataSource>(),
          gh<_i16.UserDataPreferences>(),
        ));
    gh.factoryParam<_i43.ActivityStatusBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i43.ActivityStatusBloc(
          gh<_i42.ActivityRepository>(),
          activityId,
        ));
    gh.factory<_i44.AiringScheduleBloc>(() => _i44.AiringScheduleBloc(
          gh<_i28.MediaInformationRepository>(),
          gh<_i17.UserDataRepository>(),
        ));
    gh.factoryParam<_i45.AnimePageBloc, _i46.MediaCategory, dynamic>((
      category,
      _,
    ) =>
        _i45.AnimePageBloc(
          category,
          gh<_i28.MediaInformationRepository>(),
          gh<_i29.MediaListRepository>(),
          gh<_i23.AuthRepository>(),
          gh<_i17.UserDataRepository>(),
        ));
    gh.factory<_i47.AuthBloc>(() => _i47.AuthBloc(gh<_i23.AuthRepository>()));
    gh.factoryParam<_i48.CharacterPagingBloc, String, _i49.StaffLanguage>((
      animeId,
      staffLanguage,
    ) =>
        _i48.CharacterPagingBloc(
          animeId,
          staffLanguage,
          gh<_i28.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i41.CompleteAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i41.CompleteAnimeListPagingBloc(
          userId,
          gh<_i29.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i50.DetailCharacterBloc, String, dynamic>((
      _characterId,
      _,
    ) =>
        _i50.DetailCharacterBloc(
          _characterId,
          gh<_i28.MediaInformationRepository>(),
          gh<_i26.FavoriteRepository>(),
          gh<_i17.UserDataRepository>(),
        ));
    gh.factoryParam<_i51.DetailMediaBloc, String, dynamic>((
      mediaId,
      _,
    ) =>
        _i51.DetailMediaBloc(
          mediaId,
          gh<_i23.AuthRepository>(),
          gh<_i26.FavoriteRepository>(),
          gh<_i17.UserDataRepository>(),
          gh<_i28.MediaInformationRepository>(),
          gh<_i29.MediaListRepository>(),
          gh<_i8.HiAnimationRepository>(),
          gh<_i17.UserDataRepository>(),
        ));
    gh.factoryParam<_i52.DetailStaffBloc, String, dynamic>((
      staffId,
      _,
    ) =>
        _i52.DetailStaffBloc(
          staffId,
          gh<_i28.MediaInformationRepository>(),
          gh<_i26.FavoriteRepository>(),
          gh<_i17.UserDataRepository>(),
        ));
    gh.factoryParam<_i53.DetailStudioBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i53.DetailStudioBloc(
          studioId,
          gh<_i28.MediaInformationRepository>(),
          gh<_i26.FavoriteRepository>(),
          gh<_i17.UserDataRepository>(),
        ));
    gh.factory<_i54.DiscoverBloc>(() => _i54.DiscoverBloc(
          gh<_i34.SettingsRepository>(),
          gh<_i23.AuthRepository>(),
          gh<_i28.MediaInformationRepository>(),
          gh<_i29.MediaListRepository>(),
          gh<_i17.UserDataRepository>(),
        ));
    gh.factoryParam<_i41.DroppedAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i41.DroppedAnimeListPagingBloc(
          userId,
          gh<_i29.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i32.DroppedMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i32.DroppedMangaListPagingBloc(
          userId,
          gh<_i29.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i55.FavoriteAnimePagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i55.FavoriteAnimePagingBloc(
          userId,
          perPageCount,
          gh<_i26.FavoriteRepository>(),
        ));
    gh.factoryParam<_i56.FavoriteCharacterPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i56.FavoriteCharacterPagingBloc(
          userId,
          gh<_i26.FavoriteRepository>(),
          gh<_i17.UserDataRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i57.FavoriteMangaPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i57.FavoriteMangaPagingBloc(
          userId,
          gh<_i26.FavoriteRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i58.NotificationPagingBloc, _i30.NotificationCategory,
        dynamic>((
      _category,
      _,
    ) =>
        _i58.NotificationPagingBloc(
          gh<_i30.NotificationRepository>(),
          _category,
        ));
    gh.factory<_i59.SearchPageBloc>(() => _i59.SearchPageBloc(
          gh<_i33.SearchRepository>(),
          gh<_i34.SettingsRepository>(),
          gh<_i17.UserDataRepository>(),
        ));
    gh.factory<_i60.SettingsBloc>(() => _i60.SettingsBloc(
          gh<_i34.SettingsRepository>(),
          gh<_i23.AuthRepository>(),
        ));
    gh.factoryParam<_i61.StatsBloc, String, dynamic>((
      userId,
      _,
    ) =>
        _i61.StatsBloc(
          gh<_i38.UserStatisticsRepository>(),
          userId,
        ));
    gh.factoryParam<_i62.UserActivityPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i62.UserActivityPagingBloc(
          userId,
          gh<_i42.ActivityRepository>(),
          perPageCount,
        ));
    gh.factory<_i63.ActivityBloc>(
        () => _i63.ActivityBloc(gh<_i42.ActivityRepository>()));
    gh.factoryParam<_i64.ActivityPagingBloc, _i65.ActivityScopeCategory,
        _i66.ActivityFilterType>((
      userType,
      filterType,
    ) =>
        _i64.ActivityPagingBloc(
          gh<_i42.ActivityRepository>(),
          userType,
          filterType,
        ));
    gh.factoryParam<_i67.ActivityRepliesBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i67.ActivityRepliesBloc(
          gh<_i42.ActivityRepository>(),
          activityId,
        ));
    return this;
  }
}

class _$DIDataBaseModule extends _i68.DIDataBaseModule {}

class _$DINetworkModule extends _i69.DINetworkModule {}

class _$RegisterModule extends _i70.RegisterModule {}
