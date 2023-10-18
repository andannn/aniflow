import 'dart:async';

import 'package:anime_tracker/core/common/util/load_page_util.dart';
import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/dao/anime_dao.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/network/model/anime_dto.dart';

abstract class SearchRepository {
  Future<LoadResult<List<AnimeModel>>> loadMediaSearchResultByPage(
      {required int page, required int perPage, required String search});
}

class SearchRepositoryImpl implements SearchRepository {
  final AniListDataSource dataSource = AniListDataSource();
  final AnimeListDao dao = AnimeDatabase().getAnimeDao();

  @override
  Future<LoadResult<List<AnimeModel>>> loadMediaSearchResultByPage(
      {required int page, required int perPage, required String search}) {
    return LoadPageUtil.loadPageWithoutDBCache<AnimeDto, AnimeModel>(
      page: page,
      perPage: perPage,
      onGetNetworkRes: (int page, int perPage) => dataSource.searchAnimePage(
        page: page,
        perPage: perPage,
        search: search,
      ),
      mapDtoToModel: (AnimeDto dto) => AnimeModel.fromDto(dto),
      onInsertEntityToDB: (List<AnimeDto> dto) async {
        final entities = dto.map((e) => AnimeEntity.fromNetworkModel(e)).toList();
        await dao.upsertAnimeInformation(entities);
      },
    );
  }
}
