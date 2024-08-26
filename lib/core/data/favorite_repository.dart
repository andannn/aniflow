import 'dart:async';

import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/definitions/favorite_category.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/common/util/network_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/character_mapper.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/mappers/staff_mapper.dart';
import 'package:aniflow/core/data/mappers/studio_mapper.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/favorite_item_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/character_dao.dart';
import 'package:aniflow/core/database/dao/favorite_dao.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/staff_dao.dart';
import 'package:aniflow/core/database/dao/studio_dao.dart';
import 'package:aniflow/core/database/mappers/character_mapper.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
import 'package:aniflow/core/database/mappers/staff_mapper.dart';
import 'package:aniflow/core/database/mappers/studio_mapper.dart';
import 'package:aniflow/core/firebase/analytics/fa_event.dart';
import 'package:aniflow/core/firebase/analytics/firebase_analytics_util.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/toggle_favorite_mutation_graphql.dart';
import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(env: [AfEnvironment.impl])
class FavoriteRepository {
  FavoriteRepository(
    this._aniListDataSource,
    this._mediaInfoDao,
    this._staffDao,
    this._characterDao,
    this._favoriteDao,
    this._preferences,
    this._studioDao,
  );

  final AniListDataSource _aniListDataSource;

  final MediaDao _mediaInfoDao;
  final StaffDao _staffDao;
  final CharacterDao _characterDao;
  final FavoriteDao _favoriteDao;
  final StudioDao _studioDao;
  final UserDataPreferences _preferences;

  Future<LoadResult> refreshFavoriteInfo(
      {required String? userId, CancelToken? token}) async {
    try {
      userId ??= _preferences.userData.authedUserId;
      if (userId == null) {
        return LoadError(const UnauthorizedException());
      }

      final favoriteDto = await _aniListDataSource.getFavoriteInfo(
          userId: userId, token: token);
      final anime =
          favoriteDto.anime?.nodes.map((e) => e.toEntity()).toList() ?? [];
      final manga =
          favoriteDto.manga?.nodes.map((e) => e.toEntity()).toList() ?? [];
      final characters =
          favoriteDto.characters?.nodes.map((e) => e.toEntity()).toList() ?? [];
      final staffs =
          favoriteDto.staff?.nodes.map((e) => e.toEntity()).toList() ?? [];
      final studios =
          favoriteDto.studios?.nodes.map((e) => e.toEntity()).toList() ?? [];

      await _favoriteDao.clearFavorites(userId, FavoriteType.values);

      await _mediaInfoDao.insertOrIgnoreMedia(anime);
      await _favoriteDao.insertOrIgnoreFavoritesCrossRef(
          userId, FavoriteType.anime, anime.map((e) => e.id).toList());

      await _mediaInfoDao.insertOrIgnoreMedia(manga);
      await _favoriteDao.insertOrIgnoreFavoritesCrossRef(
          userId, FavoriteType.manga, manga.map((e) => e.id).toList());

      await _characterDao.insertOrIgnoreCharacters(characters);
      await _favoriteDao.insertOrIgnoreFavoritesCrossRef(userId,
          FavoriteType.character, characters.map((e) => e.id).toList());

      await _staffDao.insertOrIgnoreStaffEntities(staffs);
      await _favoriteDao.insertOrIgnoreFavoritesCrossRef(userId,
          FavoriteType.staff, staffs.map((e) => e.id).toList());

      await _studioDao.insertOrIgnoreEntities(studios);
      await _favoriteDao.insertOrIgnoreFavoritesCrossRef(userId,
          FavoriteType.studio, studios.map((e) => e.id).toList());

      return LoadSuccess(data: null);
    } on Exception catch (e) {
      return LoadError(e);
    }
  }

  Future<LoadResult<List<MediaModel>>> loadFavoriteMediaByPage({
    required MediaType type,
    required LoadType loadType,
    String? userId,
    CancelToken? token,
  }) async {
    userId ??= _preferences.userData.authedUserId;
    if (userId == null) {
      return LoadError(const UnauthorizedException());
    }

    final isAnime = type == MediaType.anime;
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (int page, int perPage) {
        if (isAnime) {
          return _aniListDataSource.getFavoriteAnimeMedia(
            userId: userId!,
            page: page,
            perPage: perPage,
            token: token,
          );
        } else {
          return _aniListDataSource.getFavoriteMangaMedia(
            userId: userId!,
            page: page,
            perPage: perPage,
          );
        }
      },
      onInsertEntityToDB: (List<MediaEntity> entities) async {
        await _mediaInfoDao.insertOrIgnoreMedia(entities);
        if (type == MediaType.anime) {
          await _favoriteDao.insertOrIgnoreFavoritesCrossRef(
              userId!, FavoriteType.anime, entities.map((e) => e.id).toList());
        } else {
          await _favoriteDao.insertOrIgnoreFavoritesCrossRef(
              userId!, FavoriteType.manga, entities.map((e) => e.id).toList());
        }
      },
      onClearDbCache: () => _favoriteDao.clearFavorites(
          userId!, [isAnime ? FavoriteType.anime : FavoriteType.manga]),
      onGetEntityFromDB: (int page, int perPage) =>
          _favoriteDao.getFavoriteMediaByPage(type, userId!, page, perPage),
      mapDtoToEntity: (dto) => dto.toEntity(),
      mapEntityToModel: (entity) => entity.toModel(),
    );
  }

  Future<LoadResult<List<CharacterModel>>> loadFavoriteCharacterByPage({
    required LoadType loadType,
    String? userId,
    CancelToken? token,
  }) async {
    userId ??= _preferences.userData.authedUserId;
    if (userId == null) {
      return LoadError(const UnauthorizedException());
    }

    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (int page, int perPage) {
        return _aniListDataSource.getFavoriteCharacter(
          userId: userId!,
          page: page,
          perPage: perPage,
          token: token,
        );
      },
      onInsertEntityToDB: (List<CharacterEntity> entities) async {
        await _characterDao.insertOrIgnoreCharacters(entities);
        await _favoriteDao.insertOrIgnoreFavoritesCrossRef(userId!,
            FavoriteType.character, entities.map((e) => e.id).toList());
      },
      onClearDbCache: () =>
          _favoriteDao.clearFavorites(userId!, [FavoriteType.character]),
      onGetEntityFromDB: (int page, int perPage) =>
          _favoriteDao.getFavoriteCharacters(userId!, page, perPage),
      mapDtoToEntity: (dto) => dto.toEntity(),
      mapEntityToModel: (entity) => entity.toModel(),
    );
  }

  Future<LoadResult<List<StaffModel>>> loadFavoriteStaffByPage({
    required LoadType loadType,
    String? userId,
    CancelToken? token,
  }) async {
    userId ??= _preferences.userData.authedUserId;
    if (userId == null) {
      return LoadError(const UnauthorizedException());
    }

    return LoadPageUtil.loadPage<StaffDto, StaffEntity, StaffModel>(
      type: loadType,
      onGetNetworkRes: (int page, int perPage) {
        return _aniListDataSource.getFavoriteStaffs(
          userId: userId!,
          page: page,
          perPage: perPage,
          token: token,
        );
      },
      onInsertEntityToDB: (List<StaffEntity> entities) async {
        await _staffDao.insertOrIgnoreStaffEntities(entities);
        await _favoriteDao.insertOrIgnoreFavoritesCrossRef(
            userId!, FavoriteType.staff, entities.map((e) => e.id).toList());
      },
      onClearDbCache: () =>
          _favoriteDao.clearFavorites(userId!, [FavoriteType.staff]),
      onGetEntityFromDB: (int page, int perPage) =>
          _favoriteDao.getFavoriteStaffs(userId!, page, perPage),
      mapDtoToEntity: (dto) => dto.toEntity(),
      mapEntityToModel: (entity) => entity.toModel(),
    );
  }

  Future<LoadResult> toggleFavoriteMedia(String id, CancelToken token) async {
    final mediaEntity = await _mediaInfoDao.getMedia(id);

    final userId = _preferences.userData.authedUserId;

    if (userId == null) return LoadError(const UnauthorizedException());
    final isAnime = mediaEntity.type == MediaType.anime.toJson();

    final isLiked = mediaEntity.isFavourite ?? false;

    final result = await NetworkUtil.postMutationAndRevertWhenException(
      initialModel: mediaEntity,
      onModifyModel: (media) {
        final isFavourite = media.isFavourite ?? false;
        return media.copyWith(isFavourite: Value(!isFavourite));
      },
      onSaveLocal: (status) async {
        final isFavorite = status.isFavourite ?? false;
        await _updateFavoriteList(
            id: id,
            isFavorite: isFavorite,
            type: isAnime ? FavoriteType.anime : FavoriteType.manga,
            userId: userId);
        await _mediaInfoDao.insertOrUpdateMedia([status]);
      },
      onSyncWithRemote: (status) async {
        if (isAnime) {
          await _aniListDataSource.toggleFavorite(
              ToggleFavoriteMutationParam(animeId: int.parse(id)), token);
        } else {
          await _aniListDataSource.toggleFavorite(
              ToggleFavoriteMutationParam(mangaId: int.parse(id)), token);
        }
        return null;
      },
    );

    if (result is LoadSuccess) {
      unawaited(FirebaseAnalytics.instance.logLikeActionEvent(
        metrics: LikeContentMetrics.anime,
        id: id,
        isLiked: !isLiked,
      ));
    }
    return result;
  }

  Future<LoadResult> toggleFavoriteCharacter(
      String id, CancelToken token) async {
    final userId = _preferences.userData.authedUserId;

    if (userId == null) return LoadError(const UnauthorizedException());

    final characterEntity = await _characterDao.getCharacter(id);
    final isLiked = characterEntity.isFavourite ?? false;

    final result = await NetworkUtil.postMutationAndRevertWhenException(
      initialModel: characterEntity,
      onModifyModel: (character) {
        final isFavourite = character.isFavourite ?? false;
        return character.copyWith(isFavourite: Value(!isFavourite));
      },
      onSaveLocal: (character) async {
        final isFavorite = character.isFavourite ?? false;
        await _updateFavoriteList(
          id: id,
          isFavorite: isFavorite,
          userId: userId,
          type: FavoriteType.character,
        );
        await _characterDao.upsertCharacters([character]);
      },
      onSyncWithRemote: (status) async {
        await _aniListDataSource.toggleFavorite(
            ToggleFavoriteMutationParam(characterId: int.parse(id)), token);
        return null;
      },
    );

    if (result is LoadSuccess) {
      unawaited(FirebaseAnalytics.instance.logLikeActionEvent(
        metrics: LikeContentMetrics.character,
        id: id,
        isLiked: !isLiked,
      ));
    }
    return result;
  }

  Future<LoadResult> toggleFavoriteStaff(String id, CancelToken token) async {
    final staffEntity = await _staffDao.getStaff(id);
    if (staffEntity == null) {
      return LoadError(Exception('Invalid Id'));
    }
    final userId = _preferences.userData.authedUserId;

    if (userId == null) return LoadError(const UnauthorizedException());

    final isLiked = staffEntity.isFavourite ?? false;

    final result = await NetworkUtil.postMutationAndRevertWhenException(
      initialModel: staffEntity,
      onModifyModel: (staff) {
        final isFavourite = staff.isFavourite ?? false;
        return staff.copyWith(isFavourite: Value(!isFavourite));
      },
      onSaveLocal: (staff) async {
        final isFavorite = staff.isFavourite ?? false;
        await _updateFavoriteList(
          id: id,
          type: FavoriteType.staff,
          isFavorite: isFavorite,
          userId: userId,
        );
        await _staffDao.upsertStaffEntities([staff]);
      },
      onSyncWithRemote: (status) async {
        await _aniListDataSource.toggleFavorite(
            ToggleFavoriteMutationParam(staffId: int.parse(id)), token);
        return null;
      },
    );

    if (result is LoadSuccess) {
      unawaited(FirebaseAnalytics.instance.logLikeActionEvent(
        metrics: LikeContentMetrics.staff,
        id: id,
        isLiked: !isLiked,
      ));
    }
    return result;
  }

  Future<LoadResult> toggleFavoriteStudio(String id, CancelToken token) async {
    final studioEntity = await _studioDao.getStudio(id);
    if (studioEntity == null) {
      return LoadError(Exception('Invalid Id'));
    }
    final userId = _preferences.userData.authedUserId;

    if (userId == null) return LoadError(const UnauthorizedException());

    final isLiked = studioEntity.isFavourite;

    final result = await NetworkUtil.postMutationAndRevertWhenException(
      initialModel: studioEntity,
      onModifyModel: (studio) {
        return studio.copyWith(isFavourite: !studio.isFavourite);
      },
      onSaveLocal: (studio) async {
        await _updateFavoriteList(
          id: id,
          type: FavoriteType.studio,
          isFavorite: studio.isFavourite,
          userId: userId,
        );
        await _studioDao.insertOrIgnoreEntities([studio]);
      },
      onSyncWithRemote: (status) async {
        await _aniListDataSource.toggleFavorite(
            ToggleFavoriteMutationParam(staffId: int.parse(id)), token);
        return null;
      },
    );

    if (result is LoadSuccess) {
      unawaited(FirebaseAnalytics.instance.logLikeActionEvent(
        metrics: LikeContentMetrics.studio,
        id: id,
        isLiked: !isLiked,
      ));
    }
    return result;
  }

  Stream<List<FavoriteItemModel>> getFavoriteItemsByCategory({
    required FavoriteType type,
    required String userId,
    required int limit,
  }) {
    List<FavoriteItemModel> combineStaffModel(
      List<StaffEntity> staffs,
      UserStaffNameLanguage language,
    ) =>
        staffs
            .map((staff) => staff.toModel().toFavoriteItemModel(language))
            .toList();

    List<FavoriteItemModel> combineCharacterModel(
      List<CharacterEntity> characters,
      UserStaffNameLanguage language,
    ) =>
        characters
            .map((character) =>
                character.toModel().toFavoriteItemModel(language))
            .toList();

    List<FavoriteItemModel> combineMediaModel(
      List<MediaEntity> media,
      UserTitleLanguage language,
    ) =>
        media
            .map((media) => media.toModel().toFavoriteItemModel(language))
            .toList();

    final titleLanguageStream = _preferences.userDataStream
        .map((userData) => userData.userTitleLanguage)
        .distinct();
    final nameLanguageStream = _preferences.userDataStream
        .map((userData) => userData.userStaffNameLanguage)
        .distinct();

    switch (type) {
      case FavoriteType.anime:
        return CombineLatestStream.combine2(
          _favoriteDao.getFavoriteMediaStream(MediaType.anime, userId, limit),
          titleLanguageStream,
          combineMediaModel,
        );
      case FavoriteType.manga:
        return CombineLatestStream.combine2(
          _favoriteDao.getFavoriteMediaStream(MediaType.manga, userId, limit),
          titleLanguageStream,
          combineMediaModel,
        );
      case FavoriteType.character:
        return CombineLatestStream.combine2(
          _favoriteDao.getFavoriteCharactersStream(userId, limit),
          nameLanguageStream,
          combineCharacterModel,
        );
      case FavoriteType.staff:
        return CombineLatestStream.combine2(
          _favoriteDao.getFavoriteStaffsStream(userId, limit),
          nameLanguageStream,
          combineStaffModel,
        );
      case FavoriteType.studio:
        List<FavoriteItemModel> mapToFavoriteItemModel(
            List<StudioEntity> event) {
          return event.map((e) => e.toModel().toFavoriteItemModel()).toList();
        }
        return _favoriteDao
            .getFavoriteStudiosStream(userId, limit)
            .map(mapToFavoriteItemModel);
    }
  }

  Future _updateFavoriteList({
    required String id,
    required bool isFavorite,
    required FavoriteType type,
    required String userId,
  }) async {
    if (isFavorite) {
      await _favoriteDao.insertOrIgnoreFavoritesCrossRef(
        userId,
        type,
        [id],
      );
    } else {
      await _favoriteDao.deleteFavoriteCrossRef(
        userId,
        type,
        id,
      );
    }
  }
}
