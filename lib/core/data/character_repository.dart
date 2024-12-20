import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/character_mapper.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/database/dao/character_dao.dart';
import 'package:aniflow/core/database/mappers/character_mapper.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [AfEnvironment.mobile, AfEnvironment.desktop])
class CharacterRepository {
  const CharacterRepository(
    this.characterDao,
    this.dataSource,
  );

  final CharacterDao characterDao;
  final AniListDataSource dataSource;

  Future<LoadResult<List<CharacterModel>>> loadBirthdayCharacterPage({
    required LoadType loadType,
    CancelToken? token,
  }) {
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (page, perPage) => dataSource.getCharactersOfBirthday(
        page,
        perPage,
        token,
      ),
      onGetEntityFromDB: (page, perPage) =>
          characterDao.getBirthdayCharacters(page, perPage),
      onInsertEntityToDB: (entities) =>
          characterDao.upsertBirthdayCharacters(entities),
      onClearDbCache: () => characterDao.clearBirthdayCharacters(),
      mapDtoToEntity: (dto) => dto.toRelation(),
      mapEntityToModel: (entity) => entity.toModel(),
    );
  }

  Stream<List<CharacterModel>> getBirthdayCharactersStream(int max) {
    return characterDao.getBirthdayCharactersStream(max).map(
          (e) => e.map((e) => e.toModel()).toList(),
        );
  }
}
