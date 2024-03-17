import 'dart:async';

import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:dio/dio.dart';

abstract class SearchRepository {
  Future<LoadResult<List<MediaModel>>> loadMediaSearchResultByPage({
    required int page,
    required int perPage,
    required String search,
    required MediaType type,
    CancelToken? token,
  });
}

class SearchRepositoryImpl implements SearchRepository {
  final AniListDataSource dataSource = AniListDataSource();
  final dao = AniflowDatabase2().mediaDao;

  @override
  Future<LoadResult<List<MediaModel>>> loadMediaSearchResultByPage({
    required int page,
    required int perPage,
    required String search,
    required MediaType type,
    CancelToken? token,
  }) {
    return LoadPageUtil.loadPageWithoutOrderingCache(
      page: page,
      perPage: perPage,
      onGetNetworkRes: (int page, int perPage) => dataSource.searchAnimePage(
        page: page,
        perPage: perPage,
        type: type,
        search: search,
        token: token,
      ),
      mapDtoToModel: (MediaDto dto) => MediaModel.fromDto(dto),
      onInsertToDB: (List<MediaDto> dto) async {
        final entities = dto.map((e) => e.toEntity()).toList();
        await dao.insertOrIgnoreMedia(entities);
      },
    );
  }
}
