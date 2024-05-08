import 'dart:async';

import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/character_mapper.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/database/dao/character_dao.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/mappers/character_mapper.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/model/character_dto.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchRepository {
  SearchRepository(this.dataSource, this.mediaDao, this.characterDao);

  final AniListDataSource dataSource;
  final MediaDao mediaDao;
  final CharacterDao characterDao;

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
      onGetNetworkRes: (int page, int perPage) => dataSource.searchMediaPage(
        page: page,
        perPage: perPage,
        type: type,
        search: search,
        token: token,
      ),
      mapDtoToModel: (MediaDto dto) => dto.toModel(),
      onInsertToDB: (List<MediaDto> dto) async {
        final entities = dto.map((e) => e.toEntity()).toList();
        await mediaDao.insertOrIgnoreMedia(entities);
      },
    );
  }

  Future<LoadResult<List<CharacterModel>>> loadCharacterSearchResultByPage({
    required int page,
    required int perPage,
    required String search,
    CancelToken? token,
  }) {
    return LoadPageUtil.loadPageWithoutOrderingCache(
      page: page,
      perPage: perPage,
      onGetNetworkRes: (int page, int perPage) =>
          dataSource.searchCharacterPage(
        page: page,
        perPage: perPage,
        search: search,
        token: token,
      ),
      mapDtoToModel: (CharacterDto dto) => dto.toModel(),
      onInsertToDB: (List<CharacterDto> dto) async {
        final entities = dto.map((e) => e.toEntity()).toList();
        await characterDao.insertOrIgnoreCharacters(entities);
      },
    );
  }
}
