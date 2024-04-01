// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aniflow/core/common/definitions/activity_filter_type.dart'
    as _i62;
import 'package:aniflow/core/common/definitions/activity_scope_category.dart'
    as _i61;
import 'package:aniflow/core/common/definitions/anime_category.dart' as _i43;
import 'package:aniflow/core/common/definitions/media_sort.dart' as _i37;
import 'package:aniflow/core/common/definitions/staff_language.dart' as _i46;
import 'package:aniflow/core/data/activity_repository.dart' as _i39;
import 'package:aniflow/core/data/auth_repository.dart' as _i21;
import 'package:aniflow/core/data/favorite_repository.dart' as _i23;
import 'package:aniflow/core/data/media_information_repository.dart' as _i25;
import 'package:aniflow/core/data/media_list_repository.dart' as _i26;
import 'package:aniflow/core/data/notification_repository.dart' as _i27;
import 'package:aniflow/core/data/search_repository.dart' as _i30;
import 'package:aniflow/core/data/settings_repository.dart' as _i12;
import 'package:aniflow/core/data/user_info_repository.dart' as _i16;
import 'package:aniflow/core/data/user_statistics_repository.dart' as _i35;
import 'package:aniflow/core/database/aniflow_database.dart' as _i3;
import 'package:aniflow/core/database/dao/activity_dao.dart' as _i17;
import 'package:aniflow/core/database/dao/airing_schedules_dao.dart' as _i18;
import 'package:aniflow/core/database/dao/character_dao.dart' as _i4;
import 'package:aniflow/core/database/dao/favorite_dao.dart' as _i7;
import 'package:aniflow/core/database/dao/media_dao.dart' as _i9;
import 'package:aniflow/core/database/dao/media_list_dao.dart' as _i10;
import 'package:aniflow/core/database/dao/staff_dao.dart' as _i13;
import 'package:aniflow/core/database/dao/studio_dao.dart' as _i14;
import 'package:aniflow/core/database/dao/user_dao.dart' as _i15;
import 'package:aniflow/core/database/di/database_module.dart' as _i64;
import 'package:aniflow/core/network/ani_list_data_source.dart' as _i19;
import 'package:aniflow/core/network/auth_data_source.dart' as _i20;
import 'package:aniflow/core/network/di/di_network_module.dart' as _i65;
import 'package:aniflow/core/network/hianime_data_source.dart' as _i8;
import 'package:aniflow/feature/airing_schedule/bloc/airing_schedule_bloc.dart'
    as _i41;
import 'package:aniflow/feature/anime_search/bloc/anime_search_bloc.dart'
    as _i56;
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart' as _i44;
import 'package:aniflow/feature/character_page/bloc/character_page_bloc.dart'
    as _i5;
import 'package:aniflow/feature/character_page/bloc/character_paging_bloc.dart'
    as _i45;
import 'package:aniflow/feature/detail_character/bloc/detail_character_bloc.dart'
    as _i47;
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart'
    as _i48;
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_bloc.dart'
    as _i49;
import 'package:aniflow/feature/detail_staff/bloc/voice_actor_contents_paging_bloc.dart'
    as _i36;
import 'package:aniflow/feature/detail_studio/bloc/detail_studio_bloc.dart'
    as _i50;
import 'package:aniflow/feature/detail_studio/bloc/studio_contents_paging_bloc.dart'
    as _i33;
import 'package:aniflow/feature/discover/bloc/discover_bloc.dart' as _i51;
import 'package:aniflow/feature/edit_profile/bloc/edit_profile_bloc.dart'
    as _i22;
import 'package:aniflow/feature/media_page/bloc/media_page_bloc.dart' as _i42;
import 'package:aniflow/feature/media_track/bloc/track_bloc.dart' as _i34;
import 'package:aniflow/feature/notification/bloc/notification_bloc.dart'
    as _i11;
import 'package:aniflow/feature/notification/bloc/notification_paging_bloc.dart'
    as _i55;
import 'package:aniflow/feature/profile/profile_bloc.dart' as _i28;
import 'package:aniflow/feature/profile/sub_activity/user_activity_paging_bloc.dart'
    as _i58;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_anime_paging_bloc.dart'
    as _i52;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_character_paging_bloc.dart'
    as _i53;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_manga_paging_bloc.dart'
    as _i54;
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_staff_paging_bloc.dart'
    as _i24;
import 'package:aniflow/feature/profile/sub_media_list/bloc/anime_list_paging_bloc.dart'
    as _i38;
import 'package:aniflow/feature/profile/sub_media_list/bloc/manga_list_paging_bloc.dart'
    as _i29;
import 'package:aniflow/feature/profile/sub_stats/bloc/stats_bloc.dart' as _i57;
import 'package:aniflow/feature/settings/bloc/settings_bloc.dart' as _i31;
import 'package:aniflow/feature/social/activity/bloc/activity_bloc.dart'
    as _i59;
import 'package:aniflow/feature/social/activity/bloc/activity_item_bloc.dart'
    as _i40;
import 'package:aniflow/feature/social/activity/bloc/activity_paging_bloc.dart'
    as _i60;
import 'package:aniflow/feature/social/activity_replies/bloc/activity_replies_bloc.dart'
    as _i63;
import 'package:aniflow/feature/staff_page/bloc/staff_page_bloc.dart' as _i32;
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
    gh.lazySingleton<_i8.HiAnimationDataSource>(
        () => _i8.HiAnimationDataSource(dio: gh<_i6.Dio>()));
    gh.factory<_i9.MediaDao>(
        () => dIDataBaseModule.geMediaDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i10.MediaListDao>(
        () => dIDataBaseModule.geMediaListDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i11.NotificationBloc>(() => _i11.NotificationBloc());
    gh.lazySingleton<_i12.SettingsRepository>(() => _i12.SettingsRepository());
    gh.factory<_i13.StaffDao>(
        () => dIDataBaseModule.getStaffDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i14.StudioDao>(
        () => dIDataBaseModule.getStudioDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i15.UserDao>(
        () => dIDataBaseModule.getUserDao(gh<_i3.AniflowDatabase>()));
    gh.lazySingleton<_i16.UserInfoRepository>(
        () => _i16.UserInfoRepository(gh<_i15.UserDao>()));
    gh.factory<_i17.ActivityDao>(
        () => dIDataBaseModule.getActivityDao(gh<_i3.AniflowDatabase>()));
    gh.factory<_i18.AiringSchedulesDao>(() =>
        dIDataBaseModule.getAiringSchedulesDao(gh<_i3.AniflowDatabase>()));
    gh.lazySingleton<_i19.AniListDataSource>(
        () => _i19.AniListDataSource(dio: gh<_i6.Dio>()));
    gh.lazySingleton<_i20.AuthDataSource>(
        () => _i20.AuthDataSource(gh<_i6.Dio>()));
    gh.lazySingleton<_i21.AuthRepository>(() => _i21.AuthRepository(
          gh<_i20.AuthDataSource>(),
          gh<_i15.UserDao>(),
          gh<_i10.MediaListDao>(),
        ));
    gh.factory<_i22.EditProfileBloc>(
        () => _i22.EditProfileBloc(gh<_i21.AuthRepository>()));
    gh.lazySingleton<_i23.FavoriteRepository>(() => _i23.FavoriteRepository(
          gh<_i19.AniListDataSource>(),
          gh<_i15.UserDao>(),
          gh<_i9.MediaDao>(),
          gh<_i13.StaffDao>(),
          gh<_i4.CharacterDao>(),
          gh<_i10.MediaListDao>(),
          gh<_i7.FavoriteDao>(),
        ));
    gh.factoryParam<_i24.FavoriteStaffPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i24.FavoriteStaffPagingBloc(
          userId,
          gh<_i23.FavoriteRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i25.MediaInformationRepository>(
        () => _i25.MediaInformationRepository(
              gh<_i19.AniListDataSource>(),
              gh<_i4.CharacterDao>(),
              gh<_i13.StaffDao>(),
              gh<_i14.StudioDao>(),
              gh<_i18.AiringSchedulesDao>(),
              gh<_i9.MediaDao>(),
            ));
    gh.lazySingleton<_i26.MediaListRepository>(() => _i26.MediaListRepository(
          gh<_i20.AuthDataSource>(),
          gh<_i19.AniListDataSource>(),
          gh<_i10.MediaListDao>(),
          gh<_i15.UserDao>(),
          gh<_i9.MediaDao>(),
        ));
    gh.lazySingleton<_i27.NotificationRepository>(
        () => _i27.NotificationRepository(
              gh<_i20.AuthDataSource>(),
              gh<_i15.UserDao>(),
              gh<_i9.MediaDao>(),
            ));
    gh.factoryParam<_i28.ProfileBloc, String?, dynamic>((
      _userId,
      _,
    ) =>
        _i28.ProfileBloc(
          _userId,
          gh<_i16.UserInfoRepository>(),
        ));
    gh.factoryParam<_i29.ReadingMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i29.ReadingMangaListPagingBloc(
          userId,
          gh<_i26.MediaListRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i30.SearchRepository>(() => _i30.SearchRepository(
          gh<_i19.AniListDataSource>(),
          gh<_i9.MediaDao>(),
        ));
    gh.factory<_i31.SettingsBloc>(() => _i31.SettingsBloc(
          gh<_i12.SettingsRepository>(),
          gh<_i21.AuthRepository>(),
        ));
    gh.factoryParam<_i32.StaffPageBloc, String, dynamic>((
      animeId,
      _,
    ) =>
        _i32.StaffPageBloc(
          animeId,
          gh<_i25.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i33.StudioContentsPagingBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i33.StudioContentsPagingBloc(
          studioId,
          gh<_i25.MediaInformationRepository>(),
        ));
    gh.factory<_i34.TrackBloc>(() => _i34.TrackBloc(
          gh<_i26.MediaListRepository>(),
          gh<_i12.SettingsRepository>(),
          gh<_i21.AuthRepository>(),
        ));
    gh.lazySingleton<_i35.UserStatisticsRepository>(
        () => _i35.UserStatisticsRepository(
              gh<_i9.MediaDao>(),
              gh<_i19.AniListDataSource>(),
            ));
    gh.factoryParam<_i36.VoiceActorContentsPagingBloc, String, _i37.MediaSort>((
      staffId,
      mediaSort,
    ) =>
        _i36.VoiceActorContentsPagingBloc(
          staffId,
          gh<_i25.MediaInformationRepository>(),
          mediaSort,
        ));
    gh.factoryParam<_i38.WatchingAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i38.WatchingAnimeListPagingBloc(
          userId,
          gh<_i26.MediaListRepository>(),
          perPageCount,
        ));
    gh.lazySingleton<_i39.ActivityRepository>(() => _i39.ActivityRepository(
          gh<_i17.ActivityDao>(),
          gh<_i19.AniListDataSource>(),
        ));
    gh.factoryParam<_i40.ActivityStatusBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i40.ActivityStatusBloc(
          gh<_i39.ActivityRepository>(),
          activityId,
        ));
    gh.factory<_i41.AiringScheduleBloc>(
        () => _i41.AiringScheduleBloc(gh<_i25.MediaInformationRepository>()));
    gh.factoryParam<_i42.AnimePageBloc, _i43.MediaCategory, dynamic>((
      category,
      _,
    ) =>
        _i42.AnimePageBloc(
          category,
          gh<_i25.MediaInformationRepository>(),
          gh<_i26.MediaListRepository>(),
          gh<_i21.AuthRepository>(),
        ));
    gh.factory<_i44.AuthBloc>(() => _i44.AuthBloc(gh<_i21.AuthRepository>()));
    gh.factoryParam<_i45.CharacterPagingBloc, String, _i46.StaffLanguage>((
      animeId,
      staffLanguage,
    ) =>
        _i45.CharacterPagingBloc(
          animeId,
          staffLanguage,
          gh<_i25.MediaInformationRepository>(),
        ));
    gh.factoryParam<_i38.CompleteAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i38.CompleteAnimeListPagingBloc(
          userId,
          gh<_i26.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i47.DetailCharacterBloc, String, dynamic>((
      _characterId,
      _,
    ) =>
        _i47.DetailCharacterBloc(
          _characterId,
          gh<_i25.MediaInformationRepository>(),
          gh<_i23.FavoriteRepository>(),
        ));
    gh.factoryParam<_i48.DetailMediaBloc, String, dynamic>((
      mediaId,
      _,
    ) =>
        _i48.DetailMediaBloc(
          mediaId,
          gh<_i21.AuthRepository>(),
          gh<_i23.FavoriteRepository>(),
          gh<_i25.MediaInformationRepository>(),
          gh<_i26.MediaListRepository>(),
        ));
    gh.factoryParam<_i49.DetailStaffBloc, String, dynamic>((
      staffId,
      _,
    ) =>
        _i49.DetailStaffBloc(
          staffId,
          gh<_i25.MediaInformationRepository>(),
          gh<_i23.FavoriteRepository>(),
        ));
    gh.factoryParam<_i50.DetailStudioBloc, String, dynamic>((
      studioId,
      _,
    ) =>
        _i50.DetailStudioBloc(
          studioId,
          gh<_i25.MediaInformationRepository>(),
          gh<_i23.FavoriteRepository>(),
        ));
    gh.factory<_i51.DiscoverBloc>(() => _i51.DiscoverBloc(
          gh<_i12.SettingsRepository>(),
          gh<_i21.AuthRepository>(),
          gh<_i25.MediaInformationRepository>(),
          gh<_i26.MediaListRepository>(),
        ));
    gh.factoryParam<_i38.DroppedAnimeListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i38.DroppedAnimeListPagingBloc(
          userId,
          gh<_i26.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i29.DroppedMangaListPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i29.DroppedMangaListPagingBloc(
          userId,
          gh<_i26.MediaListRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i52.FavoriteAnimePagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i52.FavoriteAnimePagingBloc(
          userId,
          perPageCount,
          gh<_i23.FavoriteRepository>(),
        ));
    gh.factoryParam<_i53.FavoriteCharacterPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i53.FavoriteCharacterPagingBloc(
          userId,
          gh<_i23.FavoriteRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i54.FavoriteMangaPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i54.FavoriteMangaPagingBloc(
          userId,
          gh<_i23.FavoriteRepository>(),
          perPageCount,
        ));
    gh.factoryParam<_i55.NotificationPagingBloc, _i27.NotificationCategory,
        dynamic>((
      _category,
      _,
    ) =>
        _i55.NotificationPagingBloc(
          gh<_i27.NotificationRepository>(),
          _category,
        ));
    gh.factory<_i56.SearchPageBloc>(() => _i56.SearchPageBloc(
          gh<_i30.SearchRepository>(),
          gh<_i12.SettingsRepository>(),
        ));
    gh.factoryParam<_i57.StatsBloc, String, dynamic>((
      userId,
      _,
    ) =>
        _i57.StatsBloc(
          gh<_i35.UserStatisticsRepository>(),
          userId,
        ));
    gh.factoryParam<_i58.UserActivityPagingBloc, String, int>((
      userId,
      perPageCount,
    ) =>
        _i58.UserActivityPagingBloc(
          userId,
          gh<_i39.ActivityRepository>(),
          perPageCount,
        ));
    gh.factory<_i59.ActivityBloc>(
        () => _i59.ActivityBloc(gh<_i39.ActivityRepository>()));
    gh.factoryParam<_i60.ActivityPagingBloc, _i61.ActivityScopeCategory,
        _i62.ActivityFilterType>((
      userType,
      filterType,
    ) =>
        _i60.ActivityPagingBloc(
          gh<_i39.ActivityRepository>(),
          userType,
          filterType,
        ));
    gh.factoryParam<_i63.ActivityRepliesBloc, String, dynamic>((
      activityId,
      _,
    ) =>
        _i63.ActivityRepliesBloc(
          gh<_i39.ActivityRepository>(),
          activityId,
        ));
    return this;
  }
}

class _$DIDataBaseModule extends _i64.DIDataBaseModule {}

class _$DINetworkModule extends _i65.DINetworkModule {}
