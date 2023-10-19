import 'dart:async';

import 'package:anime_tracker/core/common/util/load_page_util.dart';
import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/model/media_model.dart';
import 'package:anime_tracker/core/database/aniflow_database.dart';
import 'package:anime_tracker/core/database/dao/media_dao.dart';
import 'package:anime_tracker/core/database/model/media_entity.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/network/model/anime_dto.dart';

abstract class SearchRepository {
  Future<LoadResult<List<MediaModel>>> loadMediaSearchResultByPage(
      {required int page, required int perPage, required String search});
}

class SearchRepositoryImpl implements SearchRepository {
  final AniListDataSource dataSource = AniListDataSource();
  final MediaInformationDao dao = AniflowDatabase().getMediaInformationDaoDao();

  @override
  Future<LoadResult<List<MediaModel>>> loadMediaSearchResultByPage(
      {required int page, required int perPage, required String search}) {
    return LoadPageUtil.loadPageWithoutDBCache<AnimeDto, MediaModel>(
      page: page,
      perPage: perPage,
      onGetNetworkRes: (int page, int perPage) => dataSource.searchAnimePage(
        page: page,
        perPage: perPage,
        search: search,
      ),
      mapDtoToModel: (AnimeDto dto) => MediaModel.fromDto(dto),
      onInsertEntityToDB: (List<AnimeDto> dto) async {
        final entities =
            dto.map((e) => MediaEntity.fromNetworkModel(e)).toList();
        await dao.upsertMediaInformation(entities);
      },
    );
  }
}
