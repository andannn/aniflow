import 'dart:async';

import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
import 'package:aniflow/core/database/dao/user_data_dao.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';

abstract class FavoriteRepository {
  Future<LoadResult<List<MediaModel>>> loadFavoriteAnimeByPage(
      {required LoadType loadType, String? userId});
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  final AniListDataSource aniListDataSource = AniListDataSource();
  final UserDataDao userDataDao = AniflowDatabase().getUserDataDao();
  final MediaInformationDao mediaInfoDao =
      AniflowDatabase().getMediaInformationDaoDao();
  final MediaListDao mediaListDao = AniflowDatabase().getMediaListDao();

  @override
  Future<LoadResult<List<MediaModel>>> loadFavoriteAnimeByPage(
      {required LoadType loadType, String? userId}) async {
    userId ??= (await _getCurrentAuthUserId());
    if (userId == null) {
      return LoadError(const UnauthorizedException());
    }

    return LoadPageUtil.loadPage<MediaDto, MediaEntity, MediaModel>(
      type: loadType,
      onGetNetworkRes: (int page, int perPage) =>
          aniListDataSource.getFavoriteAnimeMedia(
        userId: userId!,
        page: page,
        perPage: perPage,
      ),
      onInsertEntityToDB: (List<MediaEntity> entities) async {
        await mediaInfoDao.upsertMediaInformation(entities);
        await mediaListDao.insertFavoritesCrossRef(
            userId!, FavoriteType.anime, entities.map((e) => e.id).toList());
      },
      onClearDbCache: () async {},
      onGetEntityFromDB: (int page, int perPage) =>
          mediaListDao.getFavoriteAnime(userId!, page, perPage),
      mapDtoToEntity: (dto) => MediaEntity.fromNetworkModel(dto),
      mapEntityToModel: (entity) => MediaModel.fromDatabaseModel(entity),
    );
  }

  Future<String?> _getCurrentAuthUserId() async {
    return (await userDataDao.getUserData())?.id;
  }
}
