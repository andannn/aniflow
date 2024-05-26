// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aniflow/core/common/definitions/activity_filter_type.dart'
    as _i74;
import 'package:aniflow/core/common/definitions/activity_scope_category.dart'
    as _i73;
import 'package:aniflow/core/common/definitions/anime_category.dart' as _i53;
import 'package:aniflow/core/common/definitions/media_sort.dart' as _i47;
import 'package:aniflow/core/common/definitions/media_type.dart' as _i67;
import 'package:aniflow/core/common/definitions/staff_language.dart' as _i56;
import 'package:aniflow/core/data/activity_repository.dart' as _i49;
import 'package:aniflow/core/data/auth_repository.dart' as _i25;
import 'package:aniflow/core/data/favorite_repository.dart' as _i28;
import 'package:aniflow/core/data/hi_animation_repository.dart' as _i9;
import 'package:aniflow/core/data/media_information_repository.dart' as _i30;
import 'package:aniflow/core/data/media_list_repository.dart' as _i31;
import 'package:aniflow/core/data/notification_repository.dart' as _i33;
import 'package:aniflow/core/data/search_repository.dart' as _i37;
import 'package:aniflow/core/data/user_data_repository.dart' as _i18;
import 'package:aniflow/core/data/user_info_repository.dart' as _i19;
import 'package:aniflow/core/data/user_statistics_repository.dart' as _i45;
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
import 'package:aniflow/core/database/di/database_module.dart' as _i76;
import 'package:aniflow/core/network/ani_list_data_source.dart' as _i22;
import 'package:aniflow/core/network/auth_data_source.dart' as _i24;
import 'package:aniflow/core/network/di/di_network_module.dart' as _i23;
import 'package:aniflow/core/network/hianime_data_source.dart' as _i8;
import 'package:aniflow/core/shared_preference/di/shared_preferences_module.dart'
    as _i77;
import 'package:aniflow/core/shared_preference/user_data_preferences.dart'
    as _i17;
import 'package:aniflow/feature/airing_schedule/bloc/airing_schedule_bloc.dart'
    as _i51;
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart' as _i54;
import 'package:aniflow/feature/character_page/bloc/character_page_bloc.dart'
    as _i26;
import 'package:aniflow/feature/character_page/bloc/character_paging_bloc.dart'
    as _i55;
import 'package:aniflow/feature/detail_character/bloc/detail_character_bloc.dart'
    as _i58;
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart'
    as _i59;
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_bloc.dart'
    as _i60;
import 'package:aniflow/feature/detail_staff/bloc/voice_actor_contents_paging_bloc.dart'
    as _i46;
import 'package:aniflow/feature/detail_studio/bloc/detail_studio_bloc.dart'
    as _i61;
import 'package:aniflow/feature/detail_studio/bloc/studio_contents_paging_bloc.dart'
    as _i41;
import 'package:aniflow/feature/discover/bloc/discover_bloc.dart' as _i62;
import 'package:aniflow/feature/edit_profile/bloc/edit_profile_bloc.dart'
    as _i27;
import 'package:aniflow/feature/media_page/bloc/media_page_bloc.dart' as _i52;
import 'package:aniflow/feature/media_track/bloc/track_bloc.dart' as _i43;
import 'package:aniflow/feature/notification/bloc/notification_bloc.dart'
    as _i12;
import 'package:aniflow/feature/notification/bloc/notification_paging_bloc.dart'
    as _i68;
import 'package:aniflow/feature/profile/profile_bloc.dart' as _i34;
import 'package:aniflow/feature/profile/sub_activity/user_activity_paging_bloc.dart'
    as _i70;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_anime_paging_bloc.dart'
    as _i63;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_character_paging_bloc.dart'
    as _i64;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_manga_paging_bloc.dart'
    as _i65;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_staff_paging_bloc.dart'
    as _i29;
import 'package:aniflow/feature/profile/sub_media_list/bloc/anime_list_paging_bloc.dart'
    as _i48;
import 'package:aniflow/feature/profile/sub_media_list/bloc/manga_list_paging_bloc.dart'
    as _i35;
import 'package:aniflow/feature/profile/sub_stats/bloc/stats_bloc.dart' as _i69;
import 'package:aniflow/feature/search/bloc/search_bloc.dart' as _i36;
import 'package:aniflow/feature/search/paging/character_search_result_paging_bloc.dart'
    as _i57;
import 'package:aniflow/feature/search/paging/media_search_result_paging_bloc.dart'
    as _i66;
import 'package:aniflow/feature/search/paging/staff_search_result_paging_bloc.dart'
    as _i40;
import 'package:aniflow/feature/search/paging/studio_search_result_paging_bloc.dart'
    as _i42;
import 'package:aniflow/feature/search/paging/user_search_result_paging_bloc.dart'
    as _i44;
import 'package:aniflow/feature/settings/bloc/settings_bloc.dart' as _i38;
import 'package:aniflow/feature/social/activity/bloc/activity_bloc.dart'
    as _i71;
import 'package:aniflow/feature/social/activity/bloc/activity_item_bloc.dart'
    as _i50;
import 'package:aniflow/feature/social/activity/bloc/activity_paging_bloc.dart'
    as _i72;
import 'package:aniflow/feature/social/activity_replies/bloc/activity_replies_bloc.dart'
    as _i75;
import 'package:aniflow/feature/staff_page/bloc/staff_page_bloc.dart' as _i39;
import 'package:aniflow/feature/media_list_update_page/bloc/media_list_update_bloc.dart'
    as _i32;
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
    gh.lazySingleton<_i22.AniListDataSource>(
        () => _i22.AniListDataSource(gh<_i5.Dio>()));
    gh.factory<_i23.AniListTokenHeaderInterceptor>(() =>
        _i23.AniListTokenHeaderInterceptor(gh<_i18.UserDataRepository>()));
    gh.lazySingleton<_i24.AuthDataSource>(
        () => _i24.AuthDataSource(gh<_i5.Dio>()));
    gh.lazySingleton<_i25.AuthRepository>(() => _i25.AuthRepository(
          gh<_i24.AuthDataSource>(),
          gh<_i16.UserDao>(),
          gh<_i11.MediaListDao>(),
          gh<_i17.UserDataPreferences>(),
        ));
    gh.factory<_i26.CharacterPageBloc>(
        () => _i26.CharacterPageBloc(gh<_i18.UserDataRepository>()));
    gh.factory<_i27.EditProfileBloc>(
        () => _i27.EditProfileBloc(gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i28.FavoriteRepository>(() => _i28.FavoriteRepository(
          gh<_i22.AniListDataSource>(),
          gh<_i16.UserDao>(),
          gh<_i10.MediaDao>(),
          gh<_i14.StaffDao>(),
          gh<_i4.CharacterDao>(),
          gh<_i11.MediaListDao>(),
          gh<_i7.FavoriteDao>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i29.FavoriteStaffPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i29.FavoriteStaffPagingBloc(
          userId,
          gh<_i28.FavoriteRepository>(),
          gh<_i18.UserDataRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i30.MediaInformationRepository>(
        () => _i30.MediaInformationRepository(
              gh<_i22.AniListDataSource>(),
              gh<_i4.CharacterDao>(),
              gh<_i14.StaffDao>(),
              gh<_i15.StudioDao>(),
              gh<_i21.AiringSchedulesDao>(),
              gh<_i10.MediaDao>(),
              gh<_i18.UserDataRepository>(),
            ));
    gh.lazySingleton<_i31.MediaListRepository>(() => _i31.MediaListRepository(
          gh<_i24.AuthDataSource>(),
          gh<_i22.AniListDataSource>(),
          gh<_i11.MediaListDao>(),
          gh<_i16.UserDao>(),
          gh<_i10.MediaDao>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i32.MediaListUpdateBloc, String, dynamic>((
      _mediaListId,
      _,
    ) =>
        _i32.MediaListUpdateBloc(
          _mediaListId,
          gh<_i31.MediaListRepository>(),
        ));
    gh.lazySingleton<_i33.NotificationRepository>(
        () => _i33.NotificationRepository(
              gh<_i24.AuthDataSource>(),
              gh<_i16.UserDao>(),
              gh<_i10.MediaDao>(),
            ));
    gh.factoryParam<_i34.ProfileBloc, String?, dynamic>((
      _userId,
      _,
    ) =>
        _i34.ProfileBloc(
          _userId,
          gh<_i19.UserInfoRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i35.ReadingMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i35.ReadingMangaListPagingBloc(
          userId,
          gh<_i31.MediaListRepository>(),
          perPageCount,
        ));
    gh.factory<_i36.SearchBloc>(
        () => _i36.SearchBloc(gh<_i18.UserDataRepository>()));
    gh.lazySingleton<_i37.SearchRepository>(() => _i37.SearchRepository(
          gh<_i22.AniListDataSource>(),
          gh<_i10.MediaDao>(),
          gh<_i4.CharacterDao>(),
          gh<_i14.StaffDao>(),
          gh<_i15.StudioDao>(),
          gh<_i16.UserDao>(),
        ));
    gh.factory<_i38.SettingsBloc>(() => _i38.SettingsBloc(
          gh<_i18.UserDataRepository>(),
          gh<_i25.AuthRepository>(),
        ));
    gh.factoryParam<_i39.StaffPageBloc, String, dynamic>((
      animeId,
      _,
    ) =>
        _i39.StaffPageBloc(
          animeId,
          gh<_i30.MediaInformationRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i40.StaffSearchResultPagingBloc, String, dynamic>((
      _searchString,
      _,
    ) =>
        _i40.StaffSearchResultPagingBloc(
          _searchString,
          gh<_i37.SearchRepository>(),
        ));
    gh.factoryParam<_i41.StudioContentsPagingBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i41.StudioContentsPagingBloc(
          studioId,
          gh<_i30.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i42.StudioSearchResultPagingBloc, String, dynamic>((
      _searchString,
      _,
    ) =>
        _i42.StudioSearchResultPagingBloc(
          _searchString,
          gh<_i37.SearchRepository>(),
        ));
    gh.factory<_i43.TrackBloc>(() => _i43.TrackBloc(
          gh<_i31.MediaListRepository>(),
          gh<_i25.AuthRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i44.UserSearchResultPagingBloc, String, dynamic>((
      _searchString,
      _,
    ) =>
        _i44.UserSearchResultPagingBloc(
          _searchString,
          gh<_i37.SearchRepository>(),
        ));
    gh.lazySingleton<_i45.UserStatisticsRepository>(
        () => _i45.UserStatisticsRepository(
              gh<_i10.MediaDao>(),
              gh<_i22.AniListDataSource>(),
            ));
    gh.factoryParam<_i46.VoiceActorContentsPagingBloc, String, _i47.MediaSort>((
      staffId,
      mediaSort,
    ) =>
        _i46.VoiceActorContentsPagingBloc(
          staffId,
          gh<_i30.MediaInformationRepository>(),
          mediaSort,
        ));
    gh.factoryParam<_i48.WatchingAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i48.WatchingAnimeListPagingBloc(
          userId,
          gh<_i31.MediaListRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i49.ActivityRepository>(() => _i49.ActivityRepository(
          gh<_i20.ActivityDao>(),
          gh<_i22.AniListDataSource>(),
          gh<_i17.UserDataPreferences>(),
        ));
    gh.factoryParam<_i50.ActivityStatusBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i50.ActivityStatusBloc(
          gh<_i49.ActivityRepository>(),
          activityId,
        ));
    gh.factory<_i51.AiringScheduleBloc>(() => _i51.AiringScheduleBloc(
          gh<_i30.MediaInformationRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i52.AnimePageBloc, _i53.MediaCategory, dynamic>((
      category,
      _,
    ) =>
        _i52.AnimePageBloc(
          category,
          gh<_i30.MediaInformationRepository>(),
          gh<_i31.MediaListRepository>(),
          gh<_i25.AuthRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factory<_i54.AuthBloc>(() => _i54.AuthBloc(gh<_i25.AuthRepository>()));
    gh.factoryParam<_i55.CharacterPagingBloc, String, _i56.StaffLanguage>((
      animeId,
      staffLanguage,
    ) =>
        _i55.CharacterPagingBloc(
          animeId,
          staffLanguage,
          gh<_i30.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i57.CharacterSearchResultPagingBloc, String, dynamic>((
      _searchString,
      _,
    ) =>
        _i57.CharacterSearchResultPagingBloc(
          _searchString,
          gh<_i37.SearchRepository>(),
        ));
    gh.factoryParam<_i48.CompleteAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i48.CompleteAnimeListPagingBloc(
          userId,
          gh<_i31.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i58.DetailCharacterBloc, String, dynamic>((
      _characterId,
      _,
    ) =>
        _i58.DetailCharacterBloc(
          _characterId,
          gh<_i30.MediaInformationRepository>(),
          gh<_i28.FavoriteRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i59.DetailMediaBloc, String, dynamic>((
      mediaId,
      _,
    ) =>
        _i59.DetailMediaBloc(
          mediaId,
          gh<_i25.AuthRepository>(),
          gh<_i28.FavoriteRepository>(),
          gh<_i18.UserDataRepository>(),
          gh<_i30.MediaInformationRepository>(),
          gh<_i31.MediaListRepository>(),
          gh<_i9.HiAnimationRepository>(),
        ));
    gh.factoryParam<_i60.DetailStaffBloc, String, dynamic>((
      staffId,
      _,
    ) =>
        _i60.DetailStaffBloc(
          staffId,
          gh<_i30.MediaInformationRepository>(),
          gh<_i28.FavoriteRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i61.DetailStudioBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i61.DetailStudioBloc(
          studioId,
          gh<_i30.MediaInformationRepository>(),
          gh<_i28.FavoriteRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factory<_i62.DiscoverBloc>(() => _i62.DiscoverBloc(
          gh<_i25.AuthRepository>(),
          gh<_i30.MediaInformationRepository>(),
          gh<_i31.MediaListRepository>(),
          gh<_i18.UserDataRepository>(),
        ));
    gh.factoryParam<_i48.DroppedAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i48.DroppedAnimeListPagingBloc(
          userId,
          gh<_i31.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i35.DroppedMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i35.DroppedMangaListPagingBloc(
          userId,
          gh<_i31.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i63.FavoriteAnimePagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i63.FavoriteAnimePagingBloc(
          userId,
          perPageCount,
          gh<_i28.FavoriteRepository>(),
        ));
    gh.factoryParam<_i64.FavoriteCharacterPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i64.FavoriteCharacterPagingBloc(
          userId,
          gh<_i28.FavoriteRepository>(),
          gh<_i18.UserDataRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i65.FavoriteMangaPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i65.FavoriteMangaPagingBloc(
          userId,
          gh<_i28.FavoriteRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i66.MediaSearchResultPagingBloc, _i67.MediaType, String>((
      _mediaType,
      _searchString,
    ) =>
        _i66.MediaSearchResultPagingBloc(
          _mediaType,
          _searchString,
          gh<_i37.SearchRepository>(),
        ));
    gh.factoryParam<_i68.NotificationPagingBloc, _i33.NotificationCategory,
        dynamic>((
      _category,
      _,
    ) =>
        _i68.NotificationPagingBloc(
          gh<_i33.NotificationRepository>(),
          _category,
        ));
    gh.factoryParam<_i69.StatsBloc, String, dynamic>((
      userId,
      _,
    ) =>
        _i69.StatsBloc(
          gh<_i45.UserStatisticsRepository>(),
          gh<_i18.UserDataRepository>(),
          userId,
        ));
    gh.factoryParam<_i70.UserActivityPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i70.UserActivityPagingBloc(
          userId,
          gh<_i49.ActivityRepository>(),
          gh<_i18.UserDataRepository>(),
          perPageCount,
        ));
    gh.factory<_i71.ActivityBloc>(
        () => _i71.ActivityBloc(gh<_i49.ActivityRepository>()));
    gh.factoryParam<_i72.ActivityPagingBloc, _i73.ActivityScopeCategory,
        _i74.ActivityFilterType>((
      userType,
      filterType,
    ) =>
        _i72.ActivityPagingBloc(
          gh<_i49.ActivityRepository>(),
          gh<_i18.UserDataRepository>(),
          userType,
          filterType,
        ));
    gh.factoryParam<_i75.ActivityRepliesBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i75.ActivityRepliesBloc(
          gh<_i49.ActivityRepository>(),
          activityId,
        ));
    return this;
  }
}

class _$DIDataBaseModule extends _i76.DIDataBaseModule {}

class _$DINetworkModule extends _i23.DINetworkModule {}

class _$RegisterModule extends _i77.RegisterModule {}
