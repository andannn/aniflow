import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

class MockMediaInformationRepository extends Fake
    implements MediaInformationRepository {
  @override
  Future<LoadResult<void>> refreshAiringSchedule(DateTime now,
      {int dayAgo = 0, int dayAfter = 0, CancelToken? token}) async {
    return LoadSuccess(data: null);
  }

  @override
  Future<List<AiringScheduleAndAnimeModel>> getAiringScheduleAndAnimeByDateTime(
      DateTime dateTime) async {
    return [];
  }

  @override
  Stream<CharacterModel> getDetailCharacterStream(String id) async* {
    yield CharacterModel();
  }

  @override
  Future<LoadResult<void>> startFetchDetailCharacterInfo(
      {required String id, CancelToken? token}) async {
    return LoadSuccess(data: null);
  }

  @override
  Stream<MediaModel> getDetailMediaInfoStream(String id) async* {
    yield MediaModel();
  }
}
