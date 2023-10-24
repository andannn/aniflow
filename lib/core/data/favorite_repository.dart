import 'dart:async';

import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/user_data_dao.dart';
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/model/character_dto.dart';
import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';

abstract class FavoriteRepository {
  Future<LoadResult<List<MediaModel>>> loadFavoriteMediaByPage(
      {required MediaType type, required LoadType loadType, String? userId});

  Future<LoadResult<List<CharacterModel>>> loadFavoriteCharacterByPage(
      {required LoadType loadType, String? userId});

  Future<LoadResult<List<StaffModel>>> loadFavoriteStaffByPage(
      {required LoadType loadType, String? userId});
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  final AniListDataSource aniListDataSource = AniListDataSource();
  final UserDataDao userDataDao = AniflowDatabase().getUserDataDao();
  final MediaInformationDao mediaInfoDao =
      AniflowDatabase().getMediaInformationDaoDao();
  final mediaListDao = AniflowDatabase().getMediaListDao();
  final favoriteDao = AniflowDatabase().getFavoriteDao();

  @override
  Future<LoadResult<List<MediaModel>>> loadFavoriteMediaByPage(
      {required MediaType type,
      required LoadType loadType,
      String? userId}) async {
    userId ??= (await _getCurrentAuthUserId());
    if (userId == null) {
      return LoadError(const UnauthorizedException());
    }

    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (int page, int perPage) {
        if (type == MediaType.anime) {
          return aniListDataSource.getFavoriteAnimeMedia(
            userId: userId!,
            page: page,
            perPage: perPage,
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
        await mediaInfoDao.upsertMediaInformation(entities);
        if (type == MediaType.anime) {
          await favoriteDao.insertFavoritesCrossRef(
              userId!, FavoriteType.anime, entities.map((e) => e.id).toList());
        } else {
          await favoriteDao.insertFavoritesCrossRef(
              userId!, FavoriteType.manga, entities.map((e) => e.id).toList());
        }
      },
      onClearDbCache: () async {},
      onGetEntityFromDB: (int page, int perPage) =>
          favoriteDao.getFavoriteMedia(type, userId!, page, perPage),
      mapDtoToEntity: (dto) => MediaEntity.fromNetworkModel(dto),
      mapEntityToModel: (entity) => MediaModel.fromDatabaseModel(entity),
    );
  }

  @override
  Future<LoadResult<List<CharacterModel>>> loadFavoriteCharacterByPage(
      {required LoadType loadType, String? userId}) async {
    userId ??= (await _getCurrentAuthUserId());
    if (userId == null) {
      return LoadError(const UnauthorizedException());
    }

    return LoadPageUtil.loadPage<CharacterDto, CharacterEntity, CharacterModel>(
      type: loadType,
      onGetNetworkRes: (int page, int perPage) {
        return aniListDataSource.getFavoriteCharacter(
          userId: userId!,
          page: page,
          perPage: perPage,
        );
      },
      onInsertEntityToDB: (List<CharacterEntity> entities) async {
        await mediaInfoDao.insertCharacters(entities: entities);
        await favoriteDao.insertFavoritesCrossRef(userId!,
            FavoriteType.character, entities.map((e) => e.id).toList());
      },
      onClearDbCache: () async {},
      onGetEntityFromDB: (int page, int perPage) =>
          favoriteDao.getFavoriteCharacters(userId!, page, perPage),
      mapDtoToEntity: (dto) => CharacterEntity.fromDto(dto),
      mapEntityToModel: (entity) => CharacterModel.fromDatabaseEntity(entity),
    );
  }

  Future<String?> _getCurrentAuthUserId() async {
    return (await userDataDao.getUserData())?.id;
  }

  @override
  Future<LoadResult<List<StaffModel>>> loadFavoriteStaffByPage(
      {required LoadType loadType, String? userId}) async {
    userId ??= (await _getCurrentAuthUserId());
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
        );
      },
      onInsertEntityToDB: (List<StaffEntity> entities) async {
        await mediaInfoDao.insertStaffEntities(entities);
        await favoriteDao.insertFavoritesCrossRef(
            userId!, FavoriteType.staff, entities.map((e) => e.id).toList());
      },
      onClearDbCache: () async {},
      onGetEntityFromDB: (int page, int perPage) =>
          favoriteDao.getFavoriteStaffs(userId!, page, perPage),
      mapDtoToEntity: (dto) => StaffEntity.fromStaffDto(dto),
      mapEntityToModel: (entity) => StaffModel.fromDatabaseEntity(entity),
    );
  }
}
