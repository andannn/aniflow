// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aniflow/core/background_task/executor/send_notification_task_executor.dart'
    as _i47;
import 'package:aniflow/core/background_task/task_factory.dart' as _i29;
import 'package:aniflow/core/common/definitions/activity_filter_type.dart'
    as _i87;
import 'package:aniflow/core/common/definitions/activity_scope_category.dart'
    as _i86;
import 'package:aniflow/core/common/definitions/media_category.dart' as _i64;
import 'package:aniflow/core/common/definitions/media_sort.dart' as _i58;
import 'package:aniflow/core/common/definitions/media_type.dart' as _i40;
import 'package:aniflow/core/common/definitions/staff_language.dart' as _i69;
import 'package:aniflow/core/common/message/message.dart' as _i13;
import 'package:aniflow/core/data/activity_repository.dart' as _i60;
import 'package:aniflow/core/data/auth_repository.dart' as _i28;
import 'package:aniflow/core/data/character_repository.dart' as _i31;
import 'package:aniflow/core/data/favorite_repository.dart' as _i33;
import 'package:aniflow/core/data/hi_animation_repository.dart' as _i10;
import 'package:aniflow/core/data/media_information_repository.dart' as _i35;
import 'package:aniflow/core/data/media_list_repository.dart' as _i36;
import 'package:aniflow/core/data/notification_repository.dart' as _i41;
import 'package:aniflow/core/data/search_repository.dart' as _i46;
import 'package:aniflow/core/data/user_data_repository.dart' as _i21;
import 'package:aniflow/core/data/user_info_repository.dart' as _i22;
import 'package:aniflow/core/data/user_statistics_repository.dart' as _i56;
import 'package:aniflow/core/database/aniflow_database.dart' as _i3;
import 'package:aniflow/core/database/dao/activity_dao.dart' as _i23;
import 'package:aniflow/core/database/dao/airing_schedules_dao.dart' as _i24;
import 'package:aniflow/core/database/dao/character_dao.dart' as _i4;
import 'package:aniflow/core/database/dao/episode_dao.dart' as _i6;
import 'package:aniflow/core/database/dao/favorite_dao.dart' as _i7;
import 'package:aniflow/core/database/dao/media_dao.dart' as _i11;
import 'package:aniflow/core/database/dao/media_list_dao.dart' as _i12;
import 'package:aniflow/core/database/dao/staff_dao.dart' as _i17;
import 'package:aniflow/core/database/dao/studio_dao.dart' as _i18;
import 'package:aniflow/core/database/dao/user_dao.dart' as _i19;
import 'package:aniflow/core/database/di/database_module.dart' as _i89;
import 'package:aniflow/core/firebase/remote_config/di/remote_config_module.dart'
    as _i90;
import 'package:aniflow/core/firebase/remote_config/remote_config_manager.dart'
    as _i15;
import 'package:aniflow/core/network/ani_list_data_source.dart' as _i25;
import 'package:aniflow/core/network/auth_data_source.dart' as _i27;
import 'package:aniflow/core/network/di/di_network_module.dart' as _i26;
import 'package:aniflow/core/network/hianime_data_source.dart' as _i9;
import 'package:aniflow/core/shared_preference/di/shared_preferences_module.dart'
    as _i91;
import 'package:aniflow/core/shared_preference/user_data_preferences.dart'
    as _i20;
import 'package:aniflow/feature/activity_replies/bloc/activity_replies_bloc.dart'
    as _i88;
import 'package:aniflow/feature/airing_schedule/airing_schedule_of_day/airing_schedule_of_day_bloc.dart'
    as _i62;
import 'package:aniflow/feature/airing_schedule/movie_schedule_time_line/movie_schedule_time_line_bloc.dart'
    as _i38;
import 'package:aniflow/feature/aniflow_home/auth/bloc/auth_bloc.dart' as _i65;
import 'package:aniflow/feature/aniflow_home/discover/airing_schedule/today_airing_schedule_bloc.dart'
    as _i53;
import 'package:aniflow/feature/aniflow_home/discover/birthday_characters/birthday_characters_bloc.dart'
    as _i67;
import 'package:aniflow/feature/aniflow_home/discover/discover_bloc.dart'
    as _i75;
import 'package:aniflow/feature/aniflow_home/discover/media_category_preview/media_category_preview_bloc.dart'
    as _i79;
import 'package:aniflow/feature/aniflow_home/discover/next_to_watch/next_to_watch_bloc.dart'
    as _i39;
import 'package:aniflow/feature/aniflow_home/discover/recent_movies/recent_movies_bloc.dart'
    as _i44;
import 'package:aniflow/feature/aniflow_home/media_track/bloc/track_bloc.dart'
    as _i54;
import 'package:aniflow/feature/aniflow_home/social/activity/bloc/activity_bloc.dart'
    as _i84;
import 'package:aniflow/feature/aniflow_home/social/activity/bloc/activity_item_bloc.dart'
    as _i61;
import 'package:aniflow/feature/aniflow_home/social/activity/bloc/activity_paging_bloc.dart'
    as _i85;
import 'package:aniflow/feature/birthday_characters_page/birthday_character_page_bloc.dart'
    as _i66;
import 'package:aniflow/feature/character_page/bloc/character_page_bloc.dart'
    as _i30;
import 'package:aniflow/feature/character_page/bloc/character_paging_bloc.dart'
    as _i68;
import 'package:aniflow/feature/detail_character/bloc/detail_character_bloc.dart'
    as _i71;
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart'
    as _i72;
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_bloc.dart'
    as _i73;
import 'package:aniflow/feature/detail_staff/bloc/voice_actor_contents_paging_bloc.dart'
    as _i57;
import 'package:aniflow/feature/detail_studio/bloc/detail_studio_bloc.dart'
    as _i74;
import 'package:aniflow/feature/detail_studio/bloc/studio_contents_paging_bloc.dart'
    as _i51;
import 'package:aniflow/feature/edit_profile/bloc/edit_profile_bloc.dart'
    as _i32;
import 'package:aniflow/feature/media_list_update_page/bloc/media_list_update_bloc.dart'
    as _i37;
import 'package:aniflow/feature/media_page/bloc/media_page_bloc.dart' as _i63;
import 'package:aniflow/feature/notification/bloc/notification_bloc.dart'
    as _i14;
import 'package:aniflow/feature/notification/bloc/notification_paging_bloc.dart'
    as _i81;
import 'package:aniflow/feature/profile/profile_bloc.dart' as _i42;
import 'package:aniflow/feature/profile/sub_activity/user_activity_paging_bloc.dart'
    as _i83;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_anime_paging_bloc.dart'
    as _i76;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_character_paging_bloc.dart'
    as _i77;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_manga_paging_bloc.dart'
    as _i78;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_staff_paging_bloc.dart'
    as _i34;
import 'package:aniflow/feature/profile/sub_media_list/bloc/anime_list_paging_bloc.dart'
    as _i59;
import 'package:aniflow/feature/profile/sub_media_list/bloc/manga_list_paging_bloc.dart'
    as _i43;
import 'package:aniflow/feature/profile/sub_stats/bloc/stats_bloc.dart' as _i82;
import 'package:aniflow/feature/search/bloc/search_bloc.dart' as _i45;
import 'package:aniflow/feature/search/paging/character_search_result_paging_bloc.dart'
    as _i70;
import 'package:aniflow/feature/search/paging/media_search_result_paging_bloc.dart'
    as _i80;
import 'package:aniflow/feature/search/paging/staff_search_result_paging_bloc.dart'
    as _i50;
import 'package:aniflow/feature/search/paging/studio_search_result_paging_bloc.dart'
    as _i52;
import 'package:aniflow/feature/search/paging/user_search_result_paging_bloc.dart'
    as _i55;
import 'package:aniflow/feature/settings/bloc/settings_bloc.dart' as _i48;
import 'package:aniflow/feature/staff_page/bloc/staff_page_bloc.dart' as _i49;
import 'package:dio/dio.dart' as _i5;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

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
    final dIFirebaseRemoteConfigModule = _$DIFirebaseRemoteConfigModule();
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AniflowDatabase>(() => dIDataBaseModule.database);
    gh.factory<_i4.CharacterDao>(
        () => dIDataBaseModule.geCharacterDao(gh<_i3.AniflowDatabase>()));
    gh.lazySingleton<_i5.Dio>(() => dINetworkModule.dio);
    gh.factory<_i6.EpisodeDao>(
        () => dIDataBaseModule.geEpisodeDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i7.FavoriteDao>(
        () => dIDataBaseModule.geFavoriteDao(gh<_i3.AniflowDatabase>()));
    await gh.lazySingletonAsync<_i8.FirebaseRemoteConfig>(
      () => dIFirebaseRemoteConfigModule.remoteConfig,
      preResolve: true,
    );
    gh.lazySingleton<_i9.HiAnimationDataSource>(
        () => _i9.HiAnimationDataSource(dio: gh<_i5.Dio>()));
    gh.factory<_i10.HiAnimationRepository>(() => _i10.HiAnimationRepository(
          gh<_i9.HiAnimationDataSource>(),
          gh<_i6.EpisodeDao>(),
        ));
    gh.factory<_i11.MediaDao>(
        () => dIDataBaseModule.geMediaDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i12.MediaListDao>(
        () => dIDataBaseModule.geMediaListDao(gh<_i3.AniflowDatabase>()));
    gh.lazySingleton<_i13.MessageRepository>(() => _i13.MessageRepository());
    gh.factory<_i14.NotificationBloc>(() => _i14.NotificationBloc());
    gh.lazySingleton<_i15.RemoteConfigManager>(
        () => _i15.RemoteConfigManager(gh<_i8.FirebaseRemoteConfig>()));
    await gh.factoryAsync<_i16.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i17.StaffDao>(
        () => dIDataBaseModule.getStaffDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i18.StudioDao>(
        () => dIDataBaseModule.getStudioDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i19.UserDao>(
        () => dIDataBaseModule.getUserDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i20.UserDataPreferences>(
        () => _i20.UserDataPreferences(gh<_i16.SharedPreferences>()));
    gh.lazySingleton<_i21.UserDataRepository>(() => _i21.UserDataRepository(
          gh<_i20.UserDataPreferences>(),
          gh<_i15.RemoteConfigManager>(),
        ));
    gh.lazySingleton<_i22.UserInfoRepository>(
        () => _i22.UserInfoRepository(gh<_i19.UserDao>()));
    gh.factory<_i23.ActivityDao>(
        () => dIDataBaseModule.getActivityDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i24.AiringSchedulesDao>(() =>
        dIDataBaseModule.getAiringSchedulesDao(gh<_i3.AniflowDatabase>()));
    gh.lazySingleton<_i25.AniListDataSource>(
        () => _i25.AniListDataSource(gh<_i5.Dio>()));
    gh.factory<_i26.AniListTokenHeaderInterceptor>(() =>
        _i26.AniListTokenHeaderInterceptor(gh<_i21.UserDataRepository>()));
    gh.lazySingleton<_i27.AuthDataSource>(
        () => _i27.AuthDataSource(gh<_i5.Dio>()));
    gh.lazySingleton<_i28.AuthRepository>(() => _i28.AuthRepository(
          gh<_i27.AuthDataSource>(),
          gh<_i19.UserDao>(),
          gh<_i12.MediaListDao>(),
          gh<_i20.UserDataPreferences>(),
        ));
    gh.factory<_i29.BackgroundTaskFactory>(
        () => _i29.BackgroundTaskFactory(gh<_i28.AuthRepository>()));
    gh.factory<_i30.CharacterPageBloc>(
        () => _i30.CharacterPageBloc(gh<_i21.UserDataRepository>()));
    gh.factory<_i31.CharacterRepository>(() => _i31.CharacterRepository(
          gh<_i4.CharacterDao>(),
          gh<_i25.AniListDataSource>(),
        ));
    gh.factory<_i32.EditProfileBloc>(
        () => _i32.EditProfileBloc(gh<_i28.AuthRepository>()));
    gh.lazySingleton<_i33.FavoriteRepository>(() => _i33.FavoriteRepository(
          gh<_i25.AniListDataSource>(),
          gh<_i19.UserDao>(),
          gh<_i11.MediaDao>(),
          gh<_i17.StaffDao>(),
          gh<_i4.CharacterDao>(),
          gh<_i12.MediaListDao>(),
          gh<_i7.FavoriteDao>(),
          gh<_i21.UserDataRepository>(),
        ));
    gh.factoryParam<_i34.FavoriteStaffPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i34.FavoriteStaffPagingBloc(
          userId,
          gh<_i33.FavoriteRepository>(),
          gh<_i21.UserDataRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i35.MediaInformationRepository>(
        () => _i35.MediaInformationRepository(
              gh<_i25.AniListDataSource>(),
              gh<_i4.CharacterDao>(),
              gh<_i17.StaffDao>(),
              gh<_i18.StudioDao>(),
              gh<_i24.AiringSchedulesDao>(),
              gh<_i11.MediaDao>(),
              gh<_i21.UserDataRepository>(),
            ));
    gh.lazySingleton<_i36.MediaListRepository>(() => _i36.MediaListRepository(
          gh<_i27.AuthDataSource>(),
          gh<_i25.AniListDataSource>(),
          gh<_i12.MediaListDao>(),
          gh<_i19.UserDao>(),
          gh<_i11.MediaDao>(),
          gh<_i21.UserDataRepository>(),
        ));
    gh.factoryParam<_i37.MediaListUpdateBloc, String, dynamic>((
      _mediaId,
      _,
    ) =>
        _i37.MediaListUpdateBloc(
          _mediaId,
          gh<_i36.MediaListRepository>(),
        ));
    gh.factory<_i38.MovieScheduleTimeLineBloc>(
        () => _i38.MovieScheduleTimeLineBloc(
              gh<_i35.MediaInformationRepository>(),
              gh<_i13.MessageRepository>(),
            ));
    gh.factoryParam<_i39.NextToWatchBloc, String?, _i40.MediaType>((
      _userId,
      _mediaType,
    ) =>
        _i39.NextToWatchBloc(
          _userId,
          _mediaType,
          gh<_i36.MediaListRepository>(),
        ));
    gh.lazySingleton<_i41.NotificationRepository>(
        () => _i41.NotificationRepository(
              gh<_i27.AuthDataSource>(),
              gh<_i19.UserDao>(),
              gh<_i11.MediaDao>(),
            ));
    gh.factoryParam<_i42.ProfileBloc, String?, dynamic>((
      _userId,
      _,
    ) =>
        _i42.ProfileBloc(
          _userId,
          gh<_i22.UserInfoRepository>(),
          gh<_i21.UserDataRepository>(),
        ));
    gh.factoryParam<_i43.ReadingMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i43.ReadingMangaListPagingBloc(
          userId,
          gh<_i36.MediaListRepository>(),
          perPageCount,
        ));
    gh.factory<_i44.RecentMoviesBloc>(
        () => _i44.RecentMoviesBloc(gh<_i35.MediaInformationRepository>()));
    gh.factory<_i45.SearchBloc>(
        () => _i45.SearchBloc(gh<_i21.UserDataRepository>()));
    gh.lazySingleton<_i46.SearchRepository>(() => _i46.SearchRepository(
          gh<_i25.AniListDataSource>(),
          gh<_i11.MediaDao>(),
          gh<_i4.CharacterDao>(),
          gh<_i17.StaffDao>(),
          gh<_i18.StudioDao>(),
          gh<_i19.UserDao>(),
        ));
    gh.factory<_i47.SendNotificationTaskExecutor>(
        () => _i47.SendNotificationTaskExecutor(
              gh<_i41.NotificationRepository>(),
              gh<_i28.AuthRepository>(),
              gh<_i21.UserDataRepository>(),
            ));
    gh.factory<_i48.SettingsBloc>(() => _i48.SettingsBloc(
          gh<_i21.UserDataRepository>(),
          gh<_i28.AuthRepository>(),
          gh<_i13.MessageRepository>(),
        ));
    gh.factoryParam<_i49.StaffPageBloc, String, dynamic>((
      animeId,
      _,
    ) =>
        _i49.StaffPageBloc(
          animeId,
          gh<_i35.MediaInformationRepository>(),
          gh<_i21.UserDataRepository>(),
        ));
    gh.factoryParam<_i50.StaffSearchResultPagingBloc, String, dynamic>((
      _searchString,
      _,
    ) =>
        _i50.StaffSearchResultPagingBloc(
          _searchString,
          gh<_i46.SearchRepository>(),
        ));
    gh.factoryParam<_i51.StudioContentsPagingBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i51.StudioContentsPagingBloc(
          studioId,
          gh<_i35.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i52.StudioSearchResultPagingBloc, String, dynamic>((
      _searchString,
      _,
    ) =>
        _i52.StudioSearchResultPagingBloc(
          _searchString,
          gh<_i46.SearchRepository>(),
        ));
    gh.factory<_i53.TodayAiringScheduleBloc>(() =>
        _i53.TodayAiringScheduleBloc(gh<_i35.MediaInformationRepository>()));
    gh.factory<_i54.TrackBloc>(() => _i54.TrackBloc(
          gh<_i36.MediaListRepository>(),
          gh<_i28.AuthRepository>(),
          gh<_i21.UserDataRepository>(),
          gh<_i13.MessageRepository>(),
        ));
    gh.factoryParam<_i55.UserSearchResultPagingBloc, String, dynamic>((
      _searchString,
      _,
    ) =>
        _i55.UserSearchResultPagingBloc(
          _searchString,
          gh<_i46.SearchRepository>(),
        ));
    gh.lazySingleton<_i56.UserStatisticsRepository>(
        () => _i56.UserStatisticsRepository(
              gh<_i11.MediaDao>(),
              gh<_i25.AniListDataSource>(),
            ));
    gh.factoryParam<_i57.VoiceActorContentsPagingBloc, String, _i58.MediaSort>((
      staffId,
      mediaSort,
    ) =>
        _i57.VoiceActorContentsPagingBloc(
          staffId,
          gh<_i35.MediaInformationRepository>(),
          mediaSort,
        ));
    gh.factoryParam<_i59.WatchingAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i59.WatchingAnimeListPagingBloc(
          userId,
          gh<_i36.MediaListRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i60.ActivityRepository>(() => _i60.ActivityRepository(
          gh<_i23.ActivityDao>(),
          gh<_i25.AniListDataSource>(),
          gh<_i20.UserDataPreferences>(),
        ));
    gh.factoryParam<_i61.ActivityStatusBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i61.ActivityStatusBloc(
          gh<_i60.ActivityRepository>(),
          gh<_i13.MessageRepository>(),
          activityId,
        ));
    gh.factoryParam<_i62.AiringScheduleOfDayBloc, DateTime, dynamic>((
      _dateTime,
      _,
    ) =>
        _i62.AiringScheduleOfDayBloc(
          _dateTime,
          gh<_i35.MediaInformationRepository>(),
          gh<_i13.MessageRepository>(),
        ));
    gh.factoryParam<_i63.AnimePageBloc, _i64.MediaCategory, dynamic>((
      category,
      _,
    ) =>
        _i63.AnimePageBloc(
          category,
          gh<_i35.MediaInformationRepository>(),
          gh<_i36.MediaListRepository>(),
          gh<_i28.AuthRepository>(),
          gh<_i21.UserDataRepository>(),
        ));
    gh.factory<_i65.AuthBloc>(() => _i65.AuthBloc(
          gh<_i28.AuthRepository>(),
          gh<_i13.MessageRepository>(),
        ));
    gh.factory<_i66.BirthdayCharacterPageBloc>(
        () => _i66.BirthdayCharacterPageBloc(gh<_i31.CharacterRepository>()));
    gh.factory<_i67.BirthdayCharactersBloc>(
        () => _i67.BirthdayCharactersBloc(gh<_i31.CharacterRepository>()));
    gh.factoryParam<_i68.CharacterPagingBloc, String, _i69.StaffLanguage>((
      animeId,
      staffLanguage,
    ) =>
        _i68.CharacterPagingBloc(
          animeId,
          staffLanguage,
          gh<_i35.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i70.CharacterSearchResultPagingBloc, String, dynamic>((
      _searchString,
      _,
    ) =>
        _i70.CharacterSearchResultPagingBloc(
          _searchString,
          gh<_i46.SearchRepository>(),
        ));
    gh.factoryParam<_i59.CompleteAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i59.CompleteAnimeListPagingBloc(
          userId,
          gh<_i36.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i71.DetailCharacterBloc, String, dynamic>((
      _characterId,
      _,
    ) =>
        _i71.DetailCharacterBloc(
          _characterId,
          gh<_i35.MediaInformationRepository>(),
          gh<_i13.MessageRepository>(),
          gh<_i33.FavoriteRepository>(),
          gh<_i21.UserDataRepository>(),
        ));
    gh.factoryParam<_i72.DetailMediaBloc, String, dynamic>((
      mediaId,
      _,
    ) =>
        _i72.DetailMediaBloc(
          mediaId,
          gh<_i28.AuthRepository>(),
          gh<_i33.FavoriteRepository>(),
          gh<_i21.UserDataRepository>(),
          gh<_i35.MediaInformationRepository>(),
          gh<_i36.MediaListRepository>(),
          gh<_i10.HiAnimationRepository>(),
          gh<_i13.MessageRepository>(),
        ));
    gh.factoryParam<_i73.DetailStaffBloc, String, dynamic>((
      staffId,
      _,
    ) =>
        _i73.DetailStaffBloc(
          staffId,
          gh<_i35.MediaInformationRepository>(),
          gh<_i13.MessageRepository>(),
          gh<_i33.FavoriteRepository>(),
          gh<_i21.UserDataRepository>(),
        ));
    gh.factoryParam<_i74.DetailStudioBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i74.DetailStudioBloc(
          studioId,
          gh<_i35.MediaInformationRepository>(),
          gh<_i33.FavoriteRepository>(),
          gh<_i21.UserDataRepository>(),
          gh<_i13.MessageRepository>(),
        ));
    gh.factory<_i75.DiscoverBloc>(() => _i75.DiscoverBloc(
          gh<_i28.AuthRepository>(),
          gh<_i35.MediaInformationRepository>(),
          gh<_i36.MediaListRepository>(),
          gh<_i21.UserDataRepository>(),
          gh<_i13.MessageRepository>(),
          gh<_i31.CharacterRepository>(),
        ));
    gh.factoryParam<_i59.DroppedAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i59.DroppedAnimeListPagingBloc(
          userId,
          gh<_i36.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i43.DroppedMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i43.DroppedMangaListPagingBloc(
          userId,
          gh<_i36.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i76.FavoriteAnimePagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i76.FavoriteAnimePagingBloc(
          userId,
          perPageCount,
          gh<_i33.FavoriteRepository>(),
        ));
    gh.factoryParam<_i77.FavoriteCharacterPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i77.FavoriteCharacterPagingBloc(
          userId,
          gh<_i33.FavoriteRepository>(),
          gh<_i21.UserDataRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i78.FavoriteMangaPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i78.FavoriteMangaPagingBloc(
          userId,
          gh<_i33.FavoriteRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i79.MediaCategoryPreviewBloc,
        _i79.MediaCategoryPreviewParams, dynamic>((
      _params,
      _,
    ) =>
        _i79.MediaCategoryPreviewBloc(
          _params,
          gh<_i35.MediaInformationRepository>(),
          gh<_i36.MediaListRepository>(),
        ));
    gh.factoryParam<_i80.MediaSearchResultPagingBloc, _i40.MediaType, String>((
      _mediaType,
      _searchString,
    ) =>
        _i80.MediaSearchResultPagingBloc(
          _mediaType,
          _searchString,
          gh<_i46.SearchRepository>(),
        ));
    gh.factoryParam<_i81.NotificationPagingBloc, _i41.NotificationCategory,
        dynamic>((
      _category,
      _,
    ) =>
        _i81.NotificationPagingBloc(
          gh<_i41.NotificationRepository>(),
          _category,
        ));
    gh.factoryParam<_i82.StatsBloc, String, dynamic>((
      userId,
      _,
    ) =>
        _i82.StatsBloc(
          gh<_i56.UserStatisticsRepository>(),
          gh<_i13.MessageRepository>(),
          gh<_i21.UserDataRepository>(),
          userId,
        ));
    gh.factoryParam<_i83.UserActivityPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i83.UserActivityPagingBloc(
          userId,
          gh<_i60.ActivityRepository>(),
          gh<_i21.UserDataRepository>(),
          perPageCount,
        ));
    gh.factory<_i84.ActivityBloc>(
        () => _i84.ActivityBloc(gh<_i60.ActivityRepository>()));
    gh.factoryParam<_i85.ActivityPagingBloc, _i86.ActivityScopeCategory,
        _i87.ActivityFilterType>((
      userType,
      filterType,
    ) =>
        _i85.ActivityPagingBloc(
          gh<_i60.ActivityRepository>(),
          gh<_i21.UserDataRepository>(),
          userType,
          filterType,
        ));
    gh.factoryParam<_i88.ActivityRepliesBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i88.ActivityRepliesBloc(
          gh<_i60.ActivityRepository>(),
          gh<_i13.MessageRepository>(),
          activityId,
        ));
    return this;
  }
}

class _$DIDataBaseModule extends _i89.DIDataBaseModule {}

class _$DINetworkModule extends _i26.DINetworkModule {}

class _$DIFirebaseRemoteConfigModule
    extends _i90.DIFirebaseRemoteConfigModule {}

class _$RegisterModule extends _i91.RegisterModule {}
