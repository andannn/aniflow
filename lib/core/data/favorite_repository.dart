import 'dart:async';

import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/user_data_dao.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';

abstract class FavoriteRepository {
  Future<LoadResult<List<MediaModel>>> loadFavoriteAnimeByPage(
      {required int page, required int perPage, String? userId});
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  final AniListDataSource aniListDataSource = AniListDataSource();
  final UserDataDao userDataDao = AniflowDatabase().getUserDataDao();
  final MediaInformationDao mediaInfoDao =
      AniflowDatabase().getMediaInformationDaoDao();

  @override
  Future<LoadResult<List<MediaModel>>> loadFavoriteAnimeByPage(
      {required int page, required int perPage, String? userId}) async {
    userId ??= (await _getCurrentAuthUserId());
    if (userId == null) {
      return LoadError(const UnauthorizedException());
    }

    return LoadPageUtil.loadPageWithoutDBCache<MediaDto, MediaModel>(
      page: page,
      perPage: perPage,
      onGetNetworkRes: (int page, int perPage) =>
          aniListDataSource.getFavoriteAnimeMedia(
        userId: userId!,
        page: page,
        perPage: perPage,
      ),
      mapDtoToModel: (MediaDto dto) => MediaModel.fromDto(dto),
      onInsertEntityToDB: (List<MediaDto> dto) async {
        final entities =
            dto.map((e) => MediaEntity.fromNetworkModel(e)).toList();
        await mediaInfoDao.upsertMediaInformation(entities);
      },
    );
  }

  Future<String?> _getCurrentAuthUserId() async {
    return (await userDataDao.getUserData())?.id;
  }
}
