import 'dart:async';

import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/common/util/network_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
import 'package:aniflow/core/firebase/fa_event.dart';
import 'package:aniflow/core/firebase/firebase_analytics_util.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/toggle_favorite_mutation_graphql.dart';
import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:sqflite/sqflite.dart';

abstract class FavoriteRepository {
  Future<LoadResult<List<MediaModel>>> loadFavoriteMediaByPage({
    required MediaType type,
    required LoadType loadType,
    String? userId,
    CancelToken? token,
  });

  Future<LoadResult<List<CharacterModel>>> loadFavoriteCharacterByPage({
    required LoadType loadType,
    String? userId,
    CancelToken? token,
  });

  Future<LoadResult<List<StaffModel>>> loadFavoriteStaffByPage({
    required LoadType loadType,
    String? userId,
    CancelToken? token,
  });

  Future<LoadResult> toggleFavoriteManga(String id, CancelToken token);

  Future<LoadResult> toggleFavoriteAnime(String id, CancelToken token);

  Future<LoadResult> toggleFavoriteCharacter(String id, CancelToken token);

  Future<LoadResult> toggleFavoriteStaff(String id, CancelToken token);

  Future<LoadResult> toggleFavoriteStudio(String id, CancelToken cancelToken);
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  final AniListDataSource aniListDataSource = AniListDataSource();
  final userDataDao = AniflowDatabase().getUserDataDao();
  final mediaInfoDao = AniflowDatabase().getMediaDao();
  final staffDao = AniflowDatabase().getStaffDao();
  final characterDao = AniflowDatabase().getCharacterDao();
  final mediaListDao = AniflowDatabase().getMediaListDao();
  final favoriteDao = AniflowDatabase().getFavoriteDao();
  final preferences = AniFlowPreferences();

  @override
  Future<LoadResult<List<MediaModel>>> loadFavoriteMediaByPage({
    required MediaType type,
    required LoadType loadType,
    String? userId,
    CancelToken? token,
  }) async {
    userId ??= preferences.authedUserId.value;
    if (userId == null) {
      return LoadError(const UnauthorizedException());
    }

    final isAnime = type == MediaType.anime;
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (int page, int perPage) {
        if (isAnime) {
          return aniListDataSource.getFavoriteAnimeMedia(
            userId: userId!,
            page: page,
            perPage: perPage,
            token: token,
          );
        } else {
          return aniListDataSource.getFavoriteMangaMedia(
            userId: userId!,
            page: page,
            perPage: perPage,
          );
        }
      },
      onInsertEntityToDB: (List<MediaEntity> entities) async {
        await mediaInfoDao.insertMedia(entities);
        if (type == MediaType.anime) {
          await favoriteDao.insertFavoritesCrossRef(
              userId!, FavoriteType.anime, entities.map((e) => e.id).toList());
        } else {
          await favoriteDao.insertFavoritesCrossRef(
              userId!, FavoriteType.manga, entities.map((e) => e.id).toList());
        }
      },
      onClearDbCache: () => favoriteDao.clearFavorites(
          userId!, isAnime ? FavoriteType.anime : FavoriteType.manga),
      onGetEntityFromDB: (int page, int perPage) =>
          favoriteDao.getFavoriteMedia(type, userId!, page, perPage),
      mapDtoToEntity: (dto) => MediaEntity.fromNetworkModel(dto),
      mapEntityToModel: (entity) => MediaModel.fromDatabaseModel(entity),
    );
  }

  @override
  Future<LoadResult<List<CharacterModel>>> loadFavoriteCharacterByPage({
    required LoadType loadType,
    String? userId,
    CancelToken? token,
  }) async {
    userId ??= preferences.authedUserId.value;
    if (userId == null) {
      return LoadError(const UnauthorizedException());
    }

    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (int page, int perPage) {
        return aniListDataSource.getFavoriteCharacter(
          userId: userId!,
          page: page,
          perPage: perPage,
          token: token,
        );
      },
      onInsertEntityToDB: (List<CharacterEntity> entities) async {
        await characterDao.insertCharacters(
            entities: entities, conflictAlgorithm: ConflictAlgorithm.ignore);
        await favoriteDao.insertFavoritesCrossRef(userId!,
            FavoriteType.character, entities.map((e) => e.id).toList());
      },
      onClearDbCache: () =>
          favoriteDao.clearFavorites(userId!, FavoriteType.character),
      onGetEntityFromDB: (int page, int perPage) =>
          favoriteDao.getFavoriteCharacters(userId!, page, perPage),
      mapDtoToEntity: (dto) => CharacterEntity.fromDto(dto),
      mapEntityToModel: (entity) => CharacterModel.fromDatabaseEntity(entity),
    );
  }

  @override
  Future<LoadResult<List<StaffModel>>> loadFavoriteStaffByPage({
    required LoadType loadType,
    String? userId,
    CancelToken? token,
  }) async {
    userId ??= preferences.authedUserId.value;
    if (userId == null) {
      return LoadError(const UnauthorizedException());
    }

    return LoadPageUtil.loadPage<StaffDto, StaffEntity, StaffModel>(
      type: loadType,
      onGetNetworkRes: (int page, int perPage) {
        return aniListDataSource.getFavoriteStaffs(
          userId: userId!,
          page: page,
          perPage: perPage,
          token: token,
        );
      },
      onInsertEntityToDB: (List<StaffEntity> entities) async {
        await staffDao.insertStaffEntities(entities, ConflictAlgorithm.ignore);
        await favoriteDao.insertFavoritesCrossRef(
            userId!, FavoriteType.staff, entities.map((e) => e.id).toList());
      },
      onClearDbCache: () =>
          favoriteDao.clearFavorites(userId!, FavoriteType.staff),
      onGetEntityFromDB: (int page, int perPage) =>
          favoriteDao.getFavoriteStaffs(userId!, page, perPage),
      mapDtoToEntity: (dto) => StaffEntity.fromStaffDto(dto),
      mapEntityToModel: (entity) => StaffModel.fromEntity(entity),
    );
  }

  @override
  Future<LoadResult> toggleFavoriteAnime(String id, CancelToken token) async {
    final animeEntity = await mediaInfoDao.getMedia(id);
    final isLiked = animeEntity.isFavourite.toBoolean();

    final result = await NetworkUtil.postMutationAndRevertWhenException(
      initialModel: animeEntity,
      onModifyModel: (anime) {
        final isFavourite = anime.isFavourite.toBoolean();
        return anime.copyWith(isFavourite: (!isFavourite).toInteger());
      },
      onSaveLocal: (status) => mediaInfoDao.insertMedia(
        [status],
        conflictAlgorithm: ConflictAlgorithm.replace,
      ),
      onSyncWithRemote: (status) async {
        await aniListDataSource.toggleFavorite(
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

  @override
  Future<LoadResult> toggleFavoriteCharacter(
      String id, CancelToken token) async {
    final characterEntity = await characterDao.getCharacter(id);
    final isLiked = characterEntity.isFavourite.toBoolean();

    final result = await NetworkUtil.postMutationAndRevertWhenException(
      initialModel: characterEntity,
      onModifyModel: (character) {
        final isFavourite = character.isFavourite.toBoolean();
        return character.copyWith(isFavourite: (!isFavourite).toInteger());
      },
      onSaveLocal: (character) => characterDao.insertCharacters(
        entities: [character],
        conflictAlgorithm: ConflictAlgorithm.replace,
      ),
      onSyncWithRemote: (status) async {
        await aniListDataSource.toggleFavorite(
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

  @override
  Future<LoadResult> toggleFavoriteManga(String id, CancelToken token) {
    // TODO: implement toggleFavoriteManga
    throw UnimplementedError();
  }

  @override
  Future<LoadResult> toggleFavoriteStaff(String id, CancelToken token) async {
    final staffEntity = await staffDao.getStaffById(id);
    if (staffEntity == null) {
      return LoadError(Exception('Invalid Id'));
    }

    final isLiked = staffEntity.isFavourite.toBoolean();

    final result = await NetworkUtil.postMutationAndRevertWhenException(
      initialModel: staffEntity,
      onModifyModel: (staff) {
        final isFavourite = staff.isFavourite.toBoolean();
        return staff.copyWith(isFavourite: (!isFavourite).toInteger());
      },
      onSaveLocal: (staff) => staffDao.insertStaffEntities(
        [staff],
        ConflictAlgorithm.replace,
      ),
      onSyncWithRemote: (status) async {
        await aniListDataSource.toggleFavorite(
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

  @override
  Future<LoadResult> toggleFavoriteStudio(String id, CancelToken cancelToken) {
    // TODO: implement toggleFavoriteStudio
    throw UnimplementedError();
  }
}
