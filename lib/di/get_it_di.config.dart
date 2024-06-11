// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aniflow/core/common/definitions/activity_filter_type.dart'
    as _i80;
import 'package:aniflow/core/common/definitions/activity_scope_category.dart'
    as _i79;
import 'package:aniflow/core/common/definitions/media_category.dart' as _i57;
import 'package:aniflow/core/common/definitions/media_sort.dart' as _i51;
import 'package:aniflow/core/common/definitions/media_type.dart' as _i36;
import 'package:aniflow/core/common/definitions/staff_language.dart' as _i62;
import 'package:aniflow/core/common/message/message.dart' as _i12;
import 'package:aniflow/core/data/activity_repository.dart' as _i53;
import 'package:aniflow/core/data/auth_repository.dart' as _i26;
import 'package:aniflow/core/data/character_repository.dart' as _i28;
import 'package:aniflow/core/data/favorite_repository.dart' as _i30;
import 'package:aniflow/core/data/hi_animation_repository.dart' as _i9;
import 'package:aniflow/core/data/media_information_repository.dart' as _i32;
import 'package:aniflow/core/data/media_list_repository.dart' as _i33;
import 'package:aniflow/core/data/notification_repository.dart' as _i37;
import 'package:aniflow/core/data/search_repository.dart' as _i41;
import 'package:aniflow/core/data/user_data_repository.dart' as _i19;
import 'package:aniflow/core/data/user_info_repository.dart' as _i20;
import 'package:aniflow/core/data/user_statistics_repository.dart' as _i49;
import 'package:aniflow/core/database/aniflow_database.dart' as _i3;
import 'package:aniflow/core/database/dao/activity_dao.dart' as _i21;
import 'package:aniflow/core/database/dao/airing_schedules_dao.dart' as _i22;
import 'package:aniflow/core/database/dao/character_dao.dart' as _i4;
import 'package:aniflow/core/database/dao/episode_dao.dart' as _i6;
import 'package:aniflow/core/database/dao/favorite_dao.dart' as _i7;
import 'package:aniflow/core/database/dao/media_dao.dart' as _i10;
import 'package:aniflow/core/database/dao/media_list_dao.dart' as _i11;
import 'package:aniflow/core/database/dao/staff_dao.dart' as _i15;
import 'package:aniflow/core/database/dao/studio_dao.dart' as _i16;
import 'package:aniflow/core/database/dao/user_dao.dart' as _i17;
import 'package:aniflow/core/database/di/database_module.dart' as _i82;
import 'package:aniflow/core/network/ani_list_data_source.dart' as _i23;
import 'package:aniflow/core/network/auth_data_source.dart' as _i25;
import 'package:aniflow/core/network/di/di_network_module.dart' as _i24;
import 'package:aniflow/core/network/hianime_data_source.dart' as _i8;
import 'package:aniflow/core/shared_preference/di/shared_preferences_module.dart'
    as _i83;
import 'package:aniflow/core/shared_preference/user_data_preferences.dart'
    as _i18;
import 'package:aniflow/feature/activity_replies/bloc/activity_replies_bloc.dart'
    as _i81;
import 'package:aniflow/feature/airing_schedule/airing_schedule_of_day_bloc.dart'
    as _i55;
import 'package:aniflow/feature/aniflow_home/auth/bloc/auth_bloc.dart' as _i58;
import 'package:aniflow/feature/aniflow_home/discover/birthday_characters/birthday_characters_bloc.dart'
    as _i60;
import 'package:aniflow/feature/aniflow_home/discover/discover_bloc.dart'
    as _i68;
import 'package:aniflow/feature/aniflow_home/discover/media_category_preview/media_category_preview_bloc.dart'
    as _i72;
import 'package:aniflow/feature/aniflow_home/discover/next_to_watch/next_to_watch_bloc.dart'
    as _i35;
import 'package:aniflow/feature/aniflow_home/media_track/bloc/track_bloc.dart'
    as _i47;
import 'package:aniflow/feature/aniflow_home/social/activity/bloc/activity_bloc.dart'
    as _i77;
import 'package:aniflow/feature/aniflow_home/social/activity/bloc/activity_item_bloc.dart'
    as _i54;
import 'package:aniflow/feature/aniflow_home/social/activity/bloc/activity_paging_bloc.dart'
    as _i78;
import 'package:aniflow/feature/birthday_characters_page/birthday_character_page_bloc.dart'
    as _i59;
import 'package:aniflow/feature/character_page/bloc/character_page_bloc.dart'
    as _i27;
import 'package:aniflow/feature/character_page/bloc/character_paging_bloc.dart'
    as _i61;
import 'package:aniflow/feature/detail_character/bloc/detail_character_bloc.dart'
    as _i64;
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart'
    as _i65;
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_bloc.dart'
    as _i66;
import 'package:aniflow/feature/detail_staff/bloc/voice_actor_contents_paging_bloc.dart'
    as _i50;
import 'package:aniflow/feature/detail_studio/bloc/detail_studio_bloc.dart'
    as _i67;
import 'package:aniflow/feature/detail_studio/bloc/studio_contents_paging_bloc.dart'
    as _i45;
import 'package:aniflow/feature/edit_profile/bloc/edit_profile_bloc.dart'
    as _i29;
import 'package:aniflow/feature/media_list_update_page/bloc/media_list_update_bloc.dart'
    as _i34;
import 'package:aniflow/feature/media_page/bloc/media_page_bloc.dart' as _i56;
import 'package:aniflow/feature/notification/bloc/notification_bloc.dart'
    as _i13;
import 'package:aniflow/feature/notification/bloc/notification_paging_bloc.dart'
    as _i74;
import 'package:aniflow/feature/profile/profile_bloc.dart' as _i38;
import 'package:aniflow/feature/profile/sub_activity/user_activity_paging_bloc.dart'
    as _i76;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_anime_paging_bloc.dart'
    as _i69;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_character_paging_bloc.dart'
    as _i70;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_manga_paging_bloc.dart'
    as _i71;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_staff_paging_bloc.dart'
    as _i31;
import 'package:aniflow/feature/profile/sub_media_list/bloc/anime_list_paging_bloc.dart'
    as _i52;
import 'package:aniflow/feature/profile/sub_media_list/bloc/manga_list_paging_bloc.dart'
    as _i39;
import 'package:aniflow/feature/profile/sub_stats/bloc/stats_bloc.dart' as _i75;
import 'package:aniflow/feature/search/bloc/search_bloc.dart' as _i40;
import 'package:aniflow/feature/search/paging/character_search_result_paging_bloc.dart'
    as _i63;
import 'package:aniflow/feature/search/paging/media_search_result_paging_bloc.dart'
    as _i73;
import 'package:aniflow/feature/search/paging/staff_search_result_paging_bloc.dart'
    as _i44;
import 'package:aniflow/feature/search/paging/studio_search_result_paging_bloc.dart'
    as _i46;
import 'package:aniflow/feature/search/paging/user_search_result_paging_bloc.dart'
    as _i48;
import 'package:aniflow/feature/settings/bloc/settings_bloc.dart' as _i42;
import 'package:aniflow/feature/staff_page/bloc/staff_page_bloc.dart' as _i43;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

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
    gh.lazySingleton<_i12.MessageRepository>(() => _i12.MessageRepository());
    gh.factory<_i13.NotificationBloc>(() => _i13.NotificationBloc());
    await gh.factoryAsync<_i14.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i15.StaffDao>(
        () => dIDataBaseModule.getStaffDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i16.StudioDao>(
        () => dIDataBaseModule.getStudioDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i17.UserDao>(
        () => dIDataBaseModule.getUserDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i18.UserDataPreferences>(
        () => _i18.UserDataPreferences(gh<_i14.SharedPreferences>()));
    gh.lazySingleton<_i19.UserDataRepository>(
        () => _i19.UserDataRepository(gh<_i18.UserDataPreferences>()));
    gh.lazySingleton<_i20.UserInfoRepository>(
        () => _i20.UserInfoRepository(gh<_i17.UserDao>()));
    gh.factory<_i21.ActivityDao>(
        () => dIDataBaseModule.getActivityDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i22.AiringSchedulesDao>(() =>
        dIDataBaseModule.getAiringSchedulesDao(gh<_i3.AniflowDatabase>()));
    gh.lazySingleton<_i23.AniListDataSource>(
        () => _i23.AniListDataSource(gh<_i5.Dio>()));
    gh.factory<_i24.AniListTokenHeaderInterceptor>(() =>
        _i24.AniListTokenHeaderInterceptor(gh<_i19.UserDataRepository>()));
    gh.lazySingleton<_i25.AuthDataSource>(
        () => _i25.AuthDataSource(gh<_i5.Dio>()));
    gh.lazySingleton<_i26.AuthRepository>(() => _i26.AuthRepository(
          gh<_i25.AuthDataSource>(),
          gh<_i17.UserDao>(),
          gh<_i11.MediaListDao>(),
          gh<_i18.UserDataPreferences>(),
        ));
    gh.factory<_i27.CharacterPageBloc>(
        () => _i27.CharacterPageBloc(gh<_i19.UserDataRepository>()));
    gh.factory<_i28.CharacterRepository>(() => _i28.CharacterRepository(
          gh<_i4.CharacterDao>(),
          gh<_i23.AniListDataSource>(),
        ));
    gh.factory<_i29.EditProfileBloc>(
        () => _i29.EditProfileBloc(gh<_i26.AuthRepository>()));
    gh.lazySingleton<_i30.FavoriteRepository>(() => _i30.FavoriteRepository(
          gh<_i23.AniListDataSource>(),
          gh<_i17.UserDao>(),
          gh<_i10.MediaDao>(),
          gh<_i15.StaffDao>(),
          gh<_i4.CharacterDao>(),
          gh<_i11.MediaListDao>(),
          gh<_i7.FavoriteDao>(),
          gh<_i19.UserDataRepository>(),
        ));
    gh.factoryParam<_i31.FavoriteStaffPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i31.FavoriteStaffPagingBloc(
          userId,
          gh<_i30.FavoriteRepository>(),
          gh<_i19.UserDataRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i32.MediaInformationRepository>(
        () => _i32.MediaInformationRepository(
              gh<_i23.AniListDataSource>(),
              gh<_i4.CharacterDao>(),
              gh<_i15.StaffDao>(),
              gh<_i16.StudioDao>(),
              gh<_i22.AiringSchedulesDao>(),
              gh<_i10.MediaDao>(),
              gh<_i19.UserDataRepository>(),
            ));
    gh.lazySingleton<_i33.MediaListRepository>(() => _i33.MediaListRepository(
          gh<_i25.AuthDataSource>(),
          gh<_i23.AniListDataSource>(),
          gh<_i11.MediaListDao>(),
          gh<_i17.UserDao>(),
          gh<_i10.MediaDao>(),
          gh<_i19.UserDataRepository>(),
        ));
    gh.factoryParam<_i34.MediaListUpdateBloc, String, dynamic>((
      _mediaListId,
      _,
    ) =>
        _i34.MediaListUpdateBloc(
          _mediaListId,
          gh<_i33.MediaListRepository>(),
        ));
    gh.factoryParam<_i35.NextToWatchBloc, String?, _i36.MediaType>((
      _userId,
      _mediaType,
    ) =>
        _i35.NextToWatchBloc(
          _userId,
          _mediaType,
          gh<_i33.MediaListRepository>(),
        ));
    gh.lazySingleton<_i37.NotificationRepository>(
        () => _i37.NotificationRepository(
              gh<_i25.AuthDataSource>(),
              gh<_i17.UserDao>(),
              gh<_i10.MediaDao>(),
            ));
    gh.factoryParam<_i38.ProfileBloc, String?, dynamic>((
      _userId,
      _,
    ) =>
        _i38.ProfileBloc(
          _userId,
          gh<_i20.UserInfoRepository>(),
          gh<_i19.UserDataRepository>(),
        ));
    gh.factoryParam<_i39.ReadingMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i39.ReadingMangaListPagingBloc(
          userId,
          gh<_i33.MediaListRepository>(),
          perPageCount,
        ));
    gh.factory<_i40.SearchBloc>(
        () => _i40.SearchBloc(gh<_i19.UserDataRepository>()));
    gh.lazySingleton<_i41.SearchRepository>(() => _i41.SearchRepository(
          gh<_i23.AniListDataSource>(),
          gh<_i10.MediaDao>(),
          gh<_i4.CharacterDao>(),
          gh<_i15.StaffDao>(),
          gh<_i16.StudioDao>(),
          gh<_i17.UserDao>(),
        ));
    gh.factory<_i42.SettingsBloc>(() => _i42.SettingsBloc(
          gh<_i19.UserDataRepository>(),
          gh<_i26.AuthRepository>(),
          gh<_i12.MessageRepository>(),
        ));
    gh.factoryParam<_i43.StaffPageBloc, String, dynamic>((
      animeId,
      _,
    ) =>
        _i43.StaffPageBloc(
          animeId,
          gh<_i32.MediaInformationRepository>(),
          gh<_i19.UserDataRepository>(),
        ));
    gh.factoryParam<_i44.StaffSearchResultPagingBloc, String, dynamic>((
      _searchString,
      _,
    ) =>
        _i44.StaffSearchResultPagingBloc(
          _searchString,
          gh<_i41.SearchRepository>(),
        ));
    gh.factoryParam<_i45.StudioContentsPagingBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i45.StudioContentsPagingBloc(
          studioId,
          gh<_i32.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i46.StudioSearchResultPagingBloc, String, dynamic>((
      _searchString,
      _,
    ) =>
        _i46.StudioSearchResultPagingBloc(
          _searchString,
          gh<_i41.SearchRepository>(),
        ));
    gh.factory<_i47.TrackBloc>(() => _i47.TrackBloc(
          gh<_i33.MediaListRepository>(),
          gh<_i26.AuthRepository>(),
          gh<_i19.UserDataRepository>(),
          gh<_i12.MessageRepository>(),
        ));
    gh.factoryParam<_i48.UserSearchResultPagingBloc, String, dynamic>((
      _searchString,
      _,
    ) =>
        _i48.UserSearchResultPagingBloc(
          _searchString,
          gh<_i41.SearchRepository>(),
        ));
    gh.lazySingleton<_i49.UserStatisticsRepository>(
        () => _i49.UserStatisticsRepository(
              gh<_i10.MediaDao>(),
              gh<_i23.AniListDataSource>(),
            ));
    gh.factoryParam<_i50.VoiceActorContentsPagingBloc, String, _i51.MediaSort>((
      staffId,
      mediaSort,
    ) =>
        _i50.VoiceActorContentsPagingBloc(
          staffId,
          gh<_i32.MediaInformationRepository>(),
          mediaSort,
        ));
    gh.factoryParam<_i52.WatchingAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i52.WatchingAnimeListPagingBloc(
          userId,
          gh<_i33.MediaListRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i53.ActivityRepository>(() => _i53.ActivityRepository(
          gh<_i21.ActivityDao>(),
          gh<_i23.AniListDataSource>(),
          gh<_i18.UserDataPreferences>(),
        ));
    gh.factoryParam<_i54.ActivityStatusBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i54.ActivityStatusBloc(
          gh<_i53.ActivityRepository>(),
          gh<_i12.MessageRepository>(),
          activityId,
        ));
    gh.factoryParam<_i55.AiringScheduleOfDayBloc, DateTime, dynamic>((
      _dateTime,
      _,
    ) =>
        _i55.AiringScheduleOfDayBloc(
          _dateTime,
          gh<_i32.MediaInformationRepository>(),
          gh<_i12.MessageRepository>(),
        ));
    gh.factoryParam<_i56.AnimePageBloc, _i57.MediaCategory, dynamic>((
      category,
      _,
    ) =>
        _i56.AnimePageBloc(
          category,
          gh<_i32.MediaInformationRepository>(),
          gh<_i33.MediaListRepository>(),
          gh<_i26.AuthRepository>(),
          gh<_i19.UserDataRepository>(),
        ));
    gh.factory<_i58.AuthBloc>(() => _i58.AuthBloc(
          gh<_i26.AuthRepository>(),
          gh<_i12.MessageRepository>(),
        ));
    gh.factory<_i59.BirthdayCharacterPageBloc>(
        () => _i59.BirthdayCharacterPageBloc(gh<_i28.CharacterRepository>()));
    gh.factory<_i60.BirthdayCharactersBloc>(
        () => _i60.BirthdayCharactersBloc(gh<_i28.CharacterRepository>()));
    gh.factoryParam<_i61.CharacterPagingBloc, String, _i62.StaffLanguage>((
      animeId,
      staffLanguage,
    ) =>
        _i61.CharacterPagingBloc(
          animeId,
          staffLanguage,
          gh<_i32.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i63.CharacterSearchResultPagingBloc, String, dynamic>((
      _searchString,
      _,
    ) =>
        _i63.CharacterSearchResultPagingBloc(
          _searchString,
          gh<_i41.SearchRepository>(),
        ));
    gh.factoryParam<_i52.CompleteAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i52.CompleteAnimeListPagingBloc(
          userId,
          gh<_i33.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i64.DetailCharacterBloc, String, dynamic>((
      _characterId,
      _,
    ) =>
        _i64.DetailCharacterBloc(
          _characterId,
          gh<_i32.MediaInformationRepository>(),
          gh<_i12.MessageRepository>(),
          gh<_i30.FavoriteRepository>(),
          gh<_i19.UserDataRepository>(),
        ));
    gh.factoryParam<_i65.DetailMediaBloc, String, dynamic>((
      mediaId,
      _,
    ) =>
        _i65.DetailMediaBloc(
          mediaId,
          gh<_i26.AuthRepository>(),
          gh<_i30.FavoriteRepository>(),
          gh<_i19.UserDataRepository>(),
          gh<_i32.MediaInformationRepository>(),
          gh<_i33.MediaListRepository>(),
          gh<_i9.HiAnimationRepository>(),
          gh<_i12.MessageRepository>(),
        ));
    gh.factoryParam<_i66.DetailStaffBloc, String, dynamic>((
      staffId,
      _,
    ) =>
        _i66.DetailStaffBloc(
          staffId,
          gh<_i32.MediaInformationRepository>(),
          gh<_i12.MessageRepository>(),
          gh<_i30.FavoriteRepository>(),
          gh<_i19.UserDataRepository>(),
        ));
    gh.factoryParam<_i67.DetailStudioBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i67.DetailStudioBloc(
          studioId,
          gh<_i32.MediaInformationRepository>(),
          gh<_i30.FavoriteRepository>(),
          gh<_i19.UserDataRepository>(),
          gh<_i12.MessageRepository>(),
        ));
    gh.factory<_i68.DiscoverBloc>(() => _i68.DiscoverBloc(
          gh<_i26.AuthRepository>(),
          gh<_i32.MediaInformationRepository>(),
          gh<_i33.MediaListRepository>(),
          gh<_i19.UserDataRepository>(),
          gh<_i12.MessageRepository>(),
          gh<_i28.CharacterRepository>(),
        ));
    gh.factoryParam<_i52.DroppedAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i52.DroppedAnimeListPagingBloc(
          userId,
          gh<_i33.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i39.DroppedMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i39.DroppedMangaListPagingBloc(
          userId,
          gh<_i33.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i69.FavoriteAnimePagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i69.FavoriteAnimePagingBloc(
          userId,
          perPageCount,
          gh<_i30.FavoriteRepository>(),
        ));
    gh.factoryParam<_i70.FavoriteCharacterPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i70.FavoriteCharacterPagingBloc(
          userId,
          gh<_i30.FavoriteRepository>(),
          gh<_i19.UserDataRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i71.FavoriteMangaPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i71.FavoriteMangaPagingBloc(
          userId,
          gh<_i30.FavoriteRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i72.MediaCategoryPreviewBloc,
        _i72.MediaCategoryPreviewParams, dynamic>((
      _params,
      _,
    ) =>
        _i72.MediaCategoryPreviewBloc(
          _params,
          gh<_i32.MediaInformationRepository>(),
          gh<_i33.MediaListRepository>(),
        ));
    gh.factoryParam<_i73.MediaSearchResultPagingBloc, _i36.MediaType, String>((
      _mediaType,
      _searchString,
    ) =>
        _i73.MediaSearchResultPagingBloc(
          _mediaType,
          _searchString,
          gh<_i41.SearchRepository>(),
        ));
    gh.factoryParam<_i74.NotificationPagingBloc, _i37.NotificationCategory,
        dynamic>((
      _category,
      _,
    ) =>
        _i74.NotificationPagingBloc(
          gh<_i37.NotificationRepository>(),
          _category,
        ));
    gh.factoryParam<_i75.StatsBloc, String, dynamic>((
      userId,
      _,
    ) =>
        _i75.StatsBloc(
          gh<_i49.UserStatisticsRepository>(),
          gh<_i12.MessageRepository>(),
          gh<_i19.UserDataRepository>(),
          userId,
        ));
    gh.factoryParam<_i76.UserActivityPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i76.UserActivityPagingBloc(
          userId,
          gh<_i53.ActivityRepository>(),
          gh<_i19.UserDataRepository>(),
          perPageCount,
        ));
    gh.factory<_i77.ActivityBloc>(
        () => _i77.ActivityBloc(gh<_i53.ActivityRepository>()));
    gh.factoryParam<_i78.ActivityPagingBloc, _i79.ActivityScopeCategory,
        _i80.ActivityFilterType>((
      userType,
      filterType,
    ) =>
        _i78.ActivityPagingBloc(
          gh<_i53.ActivityRepository>(),
          gh<_i19.UserDataRepository>(),
          userType,
          filterType,
        ));
    gh.factoryParam<_i81.ActivityRepliesBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i81.ActivityRepliesBloc(
          gh<_i53.ActivityRepository>(),
          gh<_i12.MessageRepository>(),
          activityId,
        ));
    return this;
  }
}

class _$DIDataBaseModule extends _i82.DIDataBaseModule {}

class _$DINetworkModule extends _i24.DINetworkModule {}

class _$RegisterModule extends _i83.RegisterModule {}
