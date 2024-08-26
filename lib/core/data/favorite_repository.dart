import 'dart:async';

import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/definitions/favorite_category.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/common/util/network_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/character_mapper.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/mappers/staff_mapper.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/character_dao.dart';
import 'package:aniflow/core/database/dao/favorite_dao.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/staff_dao.dart';
import 'package:aniflow/core/database/mappers/character_mapper.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
import 'package:aniflow/core/database/mappers/staff_mapper.dart';
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

@LazySingleton(env: [AfEnvironment.impl])
class FavoriteRepository {
  FavoriteRepository(
      this._aniListDataSource,
      this._mediaInfoDao,
      this._staffDao,
      this._characterDao,
      this._favoriteDao,
      this._preferences);

  final AniListDataSource _aniListDataSource;

  final MediaDao _mediaInfoDao;
  final StaffDao _staffDao;
  final CharacterDao _characterDao;
  final FavoriteDao _favoriteDao;
  final UserDataPreferences _preferences;

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
          await _favoriteDao.insertFavoritesCrossRef(
              userId!, FavoriteType.anime, entities.map((e) => e.id).toList());
        } else {
          await _favoriteDao.insertFavoritesCrossRef(
              userId!, FavoriteType.manga, entities.map((e) => e.id).toList());
        }
      },
      onClearDbCache: () => _favoriteDao.clearFavorites(
          userId!, isAnime ? FavoriteType.anime : FavoriteType.manga),
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
        await _favoriteDao.insertFavoritesCrossRef(userId!,
            FavoriteType.character, entities.map((e) => e.id).toList());
      },
      onClearDbCache: () =>
          _favoriteDao.clearFavorites(userId!, FavoriteType.character),
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
        await _favoriteDao.insertFavoritesCrossRef(
            userId!, FavoriteType.staff, entities.map((e) => e.id).toList());
      },
      onClearDbCache: () =>
          _favoriteDao.clearFavorites(userId!, FavoriteType.staff),
      onGetEntityFromDB: (int page, int perPage) =>
          _favoriteDao.getFavoriteStaffs(userId!, page, perPage),
      mapDtoToEntity: (dto) => dto.toEntity(),
      mapEntityToModel: (entity) => entity.toModel(),
    );
  }

  Future<LoadResult> toggleFavoriteAnime(String id, CancelToken token) async {
    final animeEntity = await _mediaInfoDao.getMedia(id);
    final isLiked = animeEntity.isFavourite ?? false;

    final result = await NetworkUtil.postMutationAndRevertWhenException(
      initialModel: animeEntity,
      onModifyModel: (anime) {
        final isFavourite = anime.isFavourite ?? false;
        return anime.copyWith(isFavourite: Value(!isFavourite));
      },
      onSaveLocal: (status) => _mediaInfoDao.insertOrUpdateMedia([status]),
      onSyncWithRemote: (status) async {
        await _aniListDataSource.toggleFavorite(
            ToggleFavoriteMutationParam(animeId: int.parse(id)), token);
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
    final characterEntity = await _characterDao.getCharacter(id);
    final isLiked = characterEntity.isFavourite ?? false;

    final result = await NetworkUtil.postMutationAndRevertWhenException(
      initialModel: characterEntity,
      onModifyModel: (character) {
        final isFavourite = character.isFavourite ?? false;
        return character.copyWith(isFavourite: Value(!isFavourite));
      },
      onSaveLocal: (character) => _characterDao.upsertCharacters([character]),
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

  Future<LoadResult> toggleFavoriteManga(String id, CancelToken token) {
    // TODO: implement toggleFavoriteManga
    throw UnimplementedError();
  }

  Future<LoadResult> toggleFavoriteStaff(String id, CancelToken token) async {
    final staffEntity = await _staffDao.getStaff(id);
    if (staffEntity == null) {
      return LoadError(Exception('Invalid Id'));
    }

    final isLiked = staffEntity.isFavourite ?? false;

    final result = await NetworkUtil.postMutationAndRevertWhenException(
      initialModel: staffEntity,
      onModifyModel: (staff) {
        final isFavourite = staff.isFavourite ?? false;
        return staff.copyWith(isFavourite: Value(!isFavourite));
      },
      onSaveLocal: (staff) => _staffDao.upsertStaffEntities([staff]),
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

  Future<LoadResult> toggleFavoriteStudio(String id, CancelToken cancelToken) {
    // TODO: implement toggleFavoriteStudio
    throw UnimplementedError();
  }
}
