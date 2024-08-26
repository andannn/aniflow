import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [AfEnvironment.mock], as: FavoriteRepository)
class MockFavoriteRepository implements FavoriteRepository {
  @override
  Future<LoadResult<List<CharacterModel>>> loadFavoriteCharacterByPage(
      {required LoadType loadType, String? userId, CancelToken? token}) async {
    return LoadSuccess(data: []);
  }

  @override
  Future<LoadResult<List<MediaModel>>> loadFavoriteMediaByPage(
      {required MediaType type,
      required LoadType loadType,
      String? userId,
      CancelToken? token}) async {
    return LoadSuccess(data: []);
  }

  @override
  Future<LoadResult<List<StaffModel>>> loadFavoriteStaffByPage(
      {required LoadType loadType, String? userId, CancelToken? token}) async {
    return LoadSuccess(data: []);
  }

  @override
  Future<LoadResult> toggleFavoriteAnime(String id, CancelToken token) async {
    return LoadSuccess(data: []);
  }

  @override
  Future<LoadResult> toggleFavoriteCharacter(
      String id, CancelToken token) async {
    return LoadSuccess(data: []);
  }

  @override
  Future<LoadResult> toggleFavoriteManga(String id, CancelToken token) async {
    return LoadSuccess(data: []);
  }

  @override
  Future<LoadResult> toggleFavoriteStaff(String id, CancelToken token) async {
    return LoadSuccess(data: []);
  }

  @override
  Future<LoadResult> toggleFavoriteStudio(
      String id, CancelToken cancelToken) async {
    return LoadSuccess(data: []);
  }
}
