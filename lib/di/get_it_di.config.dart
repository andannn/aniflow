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
import 'package:aniflow/core/common/definitions/anime_category.dart' as _i47;
import 'package:aniflow/core/common/definitions/media_sort.dart' as _i41;
import 'package:aniflow/core/common/definitions/staff_language.dart' as _i50;
import 'package:aniflow/core/data/activity_repository.dart' as _i43;
import 'package:aniflow/core/data/auth_repository.dart' as _i24;
import 'package:aniflow/core/data/favorite_repository.dart' as _i27;
import 'package:aniflow/core/data/hi_animation_repository.dart' as _i9;
import 'package:aniflow/core/data/media_information_repository.dart' as _i29;
import 'package:aniflow/core/data/media_list_repository.dart' as _i30;
import 'package:aniflow/core/data/notification_repository.dart' as _i31;
import 'package:aniflow/core/data/search_repository.dart' as _i34;
import 'package:aniflow/core/data/user_data_repository.dart' as _i18;
import 'package:aniflow/core/data/user_info_repository.dart' as _i19;
import 'package:aniflow/core/data/user_statistics_repository.dart' as _i39;
import 'package:aniflow/core/database/aniflow_database.dart' as _i3;
import 'package:aniflow/core/database/dao/activity_dao.dart' as _i20;
import 'package:aniflow/core/database/dao/airing_schedules_dao.dart' as _i21;
import 'package:aniflow/core/database/dao/character_dao.dart' as _i4;
import 'package:aniflow/core/database/dao/episode_dao.dart' as _i6;
import 'package:aniflow/core/database/dao/favorite_dao.dart' as _i7;
import 'package:aniflow/core/database/dao/media_dao.dart' as _i10;
import 'package:aniflow/core/database/dao/media_list_dao.dart' as _i11;
import 'package:aniflow/core/database/dao/staff_dao.dart' as _i14;
import 'package:aniflow/core/database/dao/studio_dao.dart' as _i15;
import 'package:aniflow/core/database/dao/user_dao.dart' as _i16;
import 'package:aniflow/core/database/di/database_module.dart' as _i68;
import 'package:aniflow/core/network/ani_list_data_source.dart' as _i22;
import 'package:aniflow/core/network/auth_data_source.dart' as _i23;
import 'package:aniflow/core/network/di/di_network_module.dart' as _i69;
import 'package:aniflow/core/network/hianime_data_source.dart' as _i8;
import 'package:aniflow/core/shared_preference/di/shared_preferences_module.dart'
    as _i70;
import 'package:aniflow/core/shared_preference/user_data_preferences.dart'
    as _i17;
import 'package:aniflow/feature/airing_schedule/bloc/airing_schedule_bloc.dart'
    as _i45;
import 'package:aniflow/feature/anime_search/bloc/anime_search_bloc.dart'
    as _i60;
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart' as _i48;
import 'package:aniflow/feature/character_page/bloc/character_page_bloc.dart'
    as _i25;
import 'package:aniflow/feature/character_page/bloc/character_paging_bloc.dart'
    as _i49;
import 'package:aniflow/feature/detail_character/bloc/detail_character_bloc.dart'
    as _i51;
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart'
    as _i52;
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_bloc.dart'
    as _i53;
import 'package:aniflow/feature/detail_staff/bloc/voice_actor_contents_paging_bloc.dart'
    as _i40;
import 'package:aniflow/feature/detail_studio/bloc/detail_studio_bloc.dart'
    as _i54;
import 'package:aniflow/feature/detail_studio/bloc/studio_contents_paging_bloc.dart'
    as _i37;
import 'package:aniflow/feature/discover/bloc/discover_bloc.dart' as _i55;
import 'package:aniflow/feature/edit_profile/bloc/edit_profile_bloc.dart'
    as _i26;
import 'package:aniflow/feature/media_page/bloc/media_page_bloc.dart' as _i46;
import 'package:aniflow/feature/media_track/bloc/track_bloc.dart' as _i38;
import 'package:aniflow/feature/notification/bloc/notification_bloc.dart'
    as _i12;
import 'package:aniflow/feature/notification/bloc/notification_paging_bloc.dart'
    as _i59;
import 'package:aniflow/feature/profile/profile_bloc.dart' as _i32;
import 'package:aniflow/feature/profile/sub_activity/user_activity_paging_bloc.dart'
    as _i62;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_anime_paging_bloc.dart'
    as _i56;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_character_paging_bloc.dart'
    as _i57;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_manga_paging_bloc.dart'
    as _i58;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_staff_paging_bloc.dart'
    as _i28;
import 'package:aniflow/feature/profile/sub_media_list/bloc/anime_list_paging_bloc.dart'
    as _i42;
import 'package:aniflow/feature/profile/sub_media_list/bloc/manga_list_paging_bloc.dart'
    as _i33;
import 'package:aniflow/feature/profile/sub_stats/bloc/stats_bloc.dart' as _i61;
import 'package:aniflow/feature/settings/bloc/settings_bloc.dart' as _i35;
import 'package:aniflow/feature/social/activity/bloc/activity_bloc.dart'
    as _i63;
import 'package:aniflow/feature/social/activity/bloc/activity_item_bloc.dart'
    as _i44;
import 'package:aniflow/feature/social/activity/bloc/activity_paging_bloc.dart'
    as _i64;
import 'package:aniflow/feature/social/activity_replies/bloc/activity_replies_bloc.dart'
    as _i67;
import 'package:aniflow/feature/staff_page/bloc/staff_page_bloc.dart' as _i36;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

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
    gh.factory<_i6.EpisodeDao>(
        () => dIDataBaseModule.geEpisodeDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i7.FavoriteDao>(
        () => dIDataBaseModule.geFavoriteDao(gh<_i3.AniflowDatabase>()));
    gh.lazySingleton<_i8.HiAnimationDataSource>(
        () => _i8.HiAnimationDataSource(dio: gh<_i5.Dio>()));
    gh.factory<_i9.HiAnimationRepository>(() => _i9.HiAnimationRepository(
          gh<_i8.HiAnimationDataSource>(),
          gh<_i6.EpisodeDao>(),
        ));
    gh.factory<_i10.MediaDao>(
        () => dIDataBaseModule.geMediaDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i11.MediaListDao>(
        () => dIDataBaseModule.geMediaListDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i12.NotificationBloc>(() => _i12.NotificationBloc());
    await gh.factoryAsync<_i13.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i14.StaffDao>(
        () => dIDataBaseModule.getStaffDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i15.StudioDao>(
        () => dIDataBaseModule.getStudioDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i16.UserDao>(
        () => dIDataBaseModule.getUserDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i17.UserDataPreferences>(
        () => _i17.UserDataPreferences(gh<_i13.SharedPreferences>()));
    gh.lazySingleton<_i18.UserDataRepository>(
        () => _i18.UserDataRepository(gh<_i17.UserDataPreferences>()));
    gh.lazySingleton<_i19.UserInfoRepository>(
        () => _i19.UserInfoRepository(gh<_i16.UserDao>()));
    gh.factory<_i20.ActivityDao>(
        () => dIDataBaseModule.getActivityDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i21.AiringSchedulesDao>(() =>
        dIDataBaseModule.getAiringSchedulesDao(gh<_i3.AniflowDatabase>()));
    gh.lazySingleton<_i22.AniListDataSource>(() => _i22.AniListDataSource(
          gh<_i18.UserDataRepository>(),
          gh<_i5.Dio>(),
        ));
    gh.lazySingleton<_i23.AuthDataSource>(() => _i23.AuthDataSource(
          gh<_i5.Dio>(),
          gh<_i17.UserDataPreferences>(),
        ));
    gh.lazySingleton<_i24.AuthRepository>(() => _i24.AuthRepository(
          gh<_i23.AuthDataSource>(),
          gh<_i16.UserDao>(),
          gh<_i11.MediaListDao>(),
          gh<_i17.UserDataPreferences>(),
        ));
    gh.factory<_i25.CharacterPageBloc>(
        () => _i25.CharacterPageBloc(gh<_i18.UserDataRepository>()));
    gh.factory<_i26.EditProfileBloc>(
        () => _i26.EditProfileBloc(gh<_i24.AuthRepository>()));
    gh.lazySingleton<_i27.FavoriteRepository>(() => _i27.FavoriteRepository(
          gh<_i22.AniListDataSource>(),
          gh<_i16.UserDao>(),
          gh<_i10.MediaDao>(),
          gh<_i14.StaffDao>(),
          gh<_i4.CharacterDao>(),
          gh<_i11.MediaListDao>(),
          gh<_i7.FavoriteDao>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i28.FavoriteStaffPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i28.FavoriteStaffPagingBloc(
          userId,
          gh<_i27.FavoriteRepository>(),
          gh<_i18.UserDataRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i29.MediaInformationRepository>(
        () => _i29.MediaInformationRepository(
              gh<_i22.AniListDataSource>(),
              gh<_i4.CharacterDao>(),
              gh<_i14.StaffDao>(),
              gh<_i15.StudioDao>(),
              gh<_i21.AiringSchedulesDao>(),
              gh<_i10.MediaDao>(),
              gh<_i18.UserDataRepository>(),
            ));
    gh.lazySingleton<_i30.MediaListRepository>(() => _i30.MediaListRepository(
          gh<_i23.AuthDataSource>(),
          gh<_i22.AniListDataSource>(),
          gh<_i11.MediaListDao>(),
          gh<_i16.UserDao>(),
          gh<_i10.MediaDao>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.lazySingleton<_i31.NotificationRepository>(
        () => _i31.NotificationRepository(
              gh<_i23.AuthDataSource>(),
              gh<_i16.UserDao>(),
              gh<_i10.MediaDao>(),
            ));
    gh.factoryParam<_i32.ProfileBloc, String?, dynamic>((
      _userId,
      _,
    ) =>
        _i32.ProfileBloc(
          _userId,
          gh<_i19.UserInfoRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i33.ReadingMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i33.ReadingMangaListPagingBloc(
          userId,
          gh<_i30.MediaListRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i34.SearchRepository>(() => _i34.SearchRepository(
          gh<_i22.AniListDataSource>(),
          gh<_i10.MediaDao>(),
        ));
    gh.factory<_i35.SettingsBloc>(() => _i35.SettingsBloc(
          gh<_i18.UserDataRepository>(),
          gh<_i24.AuthRepository>(),
        ));
    gh.factoryParam<_i36.StaffPageBloc, String, dynamic>((
      animeId,
      _,
    ) =>
        _i36.StaffPageBloc(
          animeId,
          gh<_i29.MediaInformationRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i37.StudioContentsPagingBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i37.StudioContentsPagingBloc(
          studioId,
          gh<_i29.MediaInformationRepository>(),
        ));
    gh.factory<_i38.TrackBloc>(() => _i38.TrackBloc(
          gh<_i30.MediaListRepository>(),
          gh<_i24.AuthRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.lazySingleton<_i39.UserStatisticsRepository>(
        () => _i39.UserStatisticsRepository(
              gh<_i10.MediaDao>(),
              gh<_i22.AniListDataSource>(),
            ));
    gh.factoryParam<_i40.VoiceActorContentsPagingBloc, String, _i41.MediaSort>((
      staffId,
      mediaSort,
    ) =>
        _i40.VoiceActorContentsPagingBloc(
          staffId,
          gh<_i29.MediaInformationRepository>(),
          mediaSort,
        ));
    gh.factoryParam<_i42.WatchingAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i42.WatchingAnimeListPagingBloc(
          userId,
          gh<_i30.MediaListRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i43.ActivityRepository>(() => _i43.ActivityRepository(
          gh<_i20.ActivityDao>(),
          gh<_i22.AniListDataSource>(),
          gh<_i17.UserDataPreferences>(),
        ));
    gh.factoryParam<_i44.ActivityStatusBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i44.ActivityStatusBloc(
          gh<_i43.ActivityRepository>(),
          activityId,
        ));
    gh.factory<_i45.AiringScheduleBloc>(() => _i45.AiringScheduleBloc(
          gh<_i29.MediaInformationRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i46.AnimePageBloc, _i47.MediaCategory, dynamic>((
      category,
      _,
    ) =>
        _i46.AnimePageBloc(
          category,
          gh<_i29.MediaInformationRepository>(),
          gh<_i30.MediaListRepository>(),
          gh<_i24.AuthRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factory<_i48.AuthBloc>(() => _i48.AuthBloc(gh<_i24.AuthRepository>()));
    gh.factoryParam<_i49.CharacterPagingBloc, String, _i50.StaffLanguage>((
      animeId,
      staffLanguage,
    ) =>
        _i49.CharacterPagingBloc(
          animeId,
          staffLanguage,
          gh<_i29.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i42.CompleteAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i42.CompleteAnimeListPagingBloc(
          userId,
          gh<_i30.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i51.DetailCharacterBloc, String, dynamic>((
      _characterId,
      _,
    ) =>
        _i51.DetailCharacterBloc(
          _characterId,
          gh<_i29.MediaInformationRepository>(),
          gh<_i27.FavoriteRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i52.DetailMediaBloc, String, dynamic>((
      mediaId,
      _,
    ) =>
        _i52.DetailMediaBloc(
          mediaId,
          gh<_i24.AuthRepository>(),
          gh<_i27.FavoriteRepository>(),
          gh<_i18.UserDataRepository>(),
          gh<_i29.MediaInformationRepository>(),
          gh<_i30.MediaListRepository>(),
          gh<_i9.HiAnimationRepository>(),
        ));
    gh.factoryParam<_i53.DetailStaffBloc, String, dynamic>((
      staffId,
      _,
    ) =>
        _i53.DetailStaffBloc(
          staffId,
          gh<_i29.MediaInformationRepository>(),
          gh<_i27.FavoriteRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i54.DetailStudioBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i54.DetailStudioBloc(
          studioId,
          gh<_i29.MediaInformationRepository>(),
          gh<_i27.FavoriteRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factory<_i55.DiscoverBloc>(() => _i55.DiscoverBloc(
          gh<_i24.AuthRepository>(),
          gh<_i29.MediaInformationRepository>(),
          gh<_i30.MediaListRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i42.DroppedAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i42.DroppedAnimeListPagingBloc(
          userId,
          gh<_i30.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i33.DroppedMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i33.DroppedMangaListPagingBloc(
          userId,
          gh<_i30.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i56.FavoriteAnimePagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i56.FavoriteAnimePagingBloc(
          userId,
          perPageCount,
          gh<_i27.FavoriteRepository>(),
        ));
    gh.factoryParam<_i57.FavoriteCharacterPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i57.FavoriteCharacterPagingBloc(
          userId,
          gh<_i27.FavoriteRepository>(),
          gh<_i18.UserDataRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i58.FavoriteMangaPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i58.FavoriteMangaPagingBloc(
          userId,
          gh<_i27.FavoriteRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i59.NotificationPagingBloc, _i31.NotificationCategory,
        dynamic>((
      _category,
      _,
    ) =>
        _i59.NotificationPagingBloc(
          gh<_i31.NotificationRepository>(),
          _category,
        ));
    gh.factory<_i60.SearchPageBloc>(() => _i60.SearchPageBloc(
          gh<_i34.SearchRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i61.StatsBloc, String, dynamic>((
      userId,
      _,
    ) =>
        _i61.StatsBloc(
          gh<_i39.UserStatisticsRepository>(),
          gh<_i18.UserDataRepository>(),
          userId,
        ));
    gh.factoryParam<_i62.UserActivityPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i62.UserActivityPagingBloc(
          userId,
          gh<_i43.ActivityRepository>(),
          gh<_i18.UserDataRepository>(),
          perPageCount,
        ));
    gh.factory<_i63.ActivityBloc>(
        () => _i63.ActivityBloc(gh<_i43.ActivityRepository>()));
    gh.factoryParam<_i64.ActivityPagingBloc, _i65.ActivityScopeCategory,
        _i66.ActivityFilterType>((
      userType,
      filterType,
    ) =>
        _i64.ActivityPagingBloc(
          gh<_i43.ActivityRepository>(),
          gh<_i18.UserDataRepository>(),
          userType,
          filterType,
        ));
    gh.factoryParam<_i67.ActivityRepliesBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i67.ActivityRepliesBloc(
          gh<_i43.ActivityRepository>(),
          activityId,
        ));
    return this;
  }
}

class _$DIDataBaseModule extends _i68.DIDataBaseModule {}

class _$DINetworkModule extends _i69.DINetworkModule {}

class _$RegisterModule extends _i70.RegisterModule {}
