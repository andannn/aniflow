import 'dart:convert';

import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/common/definitions/media_format.dart';
import 'package:aniflow/core/common/definitions/media_sort.dart';
import 'package:aniflow/core/common/definitions/staff_language.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/character_mapper.dart';
import 'package:aniflow/core/data/mappers/media_external_link_mapper.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/mappers/staff_mapper.dart';
import 'package:aniflow/core/data/mappers/studio_mapper.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_relation_model.dart';
import 'package:aniflow/core/data/model/staff_and_role_model.dart';
import 'package:aniflow/core/data/model/staff_character_and_media_connection.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/data/model/studio_model.dart';
import 'package:aniflow/core/database/mappers/media_external_link_mapper.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [AfEnvironment.mock], as: MediaInformationRepository)
class MockMediaInformationRepository implements MediaInformationRepository {
  @override
  Future<List<AiringScheduleAndAnimeModel>> getAiringScheduleAndAnimeByDateTime(
      DateTime dateTime) {
    return Future.value([]);
  }

  @override
  Stream<List<AiringScheduleAndAnimeModel>>
      getAiringScheduleAndAnimeByDateTimeStream(DateTime dateTime) {
    return Stream.value([]);
  }

  @override
  Stream<CharacterModel> getDetailCharacterStream(String id) {
    throw UnimplementedError();
  }

  @override
  Stream<MediaModel> getDetailMediaInfoStream(String id) async* {
    final jsonString =
        await rootBundle.loadString('assets/json/detail_media_data.json');
    final mediaDto = MediaDto.fromJson(jsonDecode(jsonString));
    final model = mediaDto.toModel().copyWith(
          staffs: mediaDto.staff!.edges
              .map(
                (e) => StaffAndRoleModel(
                  role: e.role ?? '',
                  staff: e.staffNode!.toModel(),
                ),
              )
              .toList(),
          studios: mediaDto.studios!.nodes.map((e) => e.toModel()).toList(),
          externalLinks: mediaDto.externalLinks
              .map((e) => e.toEntity('1').toModel())
              .toList(),
          relations: mediaDto.relations!.edges
              .map(
                (e) => MediaRelationModel(e.relationType, e.media!.toModel()),
              )
              .toList(),
          characterAndVoiceActors: mediaDto.characters!.edges
              .map(
                (e) => CharacterAndVoiceActorModel(
                  characterModel: e.characterNode!.toModel(),
                  voiceActorModel: e.voiceActors.first.toModel(),
                  role: e.role,
                  staffLanguage: StaffLanguage.japanese,
                ),
              )
              .toList(),
        );
    yield model;
  }

  @override
  Stream<StaffModel?> getDetailStaffStream(String id) {
    return Stream.value(null);
  }

  @override
  Stream<List<MediaModel>> getMediaStreamByAiringTimeRange(
      {required DateTime start,
      required DateTime end,
      required List<MediaFormat> format}) {
    return Stream.value(<MediaModel>[]);
  }

  @override
  Stream<List<MediaModel>> getMediasOfCategory(
      {required MediaCategory category, required int max}) {
    return Stream.value([]);
  }

  @override
  Stream<StudioModel?> getStudioStream(String id) {
    return Stream.value(null);
  }

  @override
  Future<LoadResult<List<CharacterAndVoiceActorModel>>>
      loadCharacterPageByAnimeId(
          {required String animeId,
          required LoadType loadType,
          required StaffLanguage language,
          CancelToken? token}) {
    return Future.value(LoadSuccess(data: []));
  }

  @override
  Future<LoadResult<List<MediaModel>>> loadMediaPageByCategory(
      {required MediaCategory category,
      required bool displayAdultContent,
      required LoadType loadType,
      CancelToken? token}) {
    return Future.value(LoadSuccess(data: []));
  }

  @override
  Future<LoadResult<List<StaffAndRoleModel>>> loadStaffPageByAnimeId(
      {required String animeId,
      required LoadType loadType,
      CancelToken? token}) {
    return Future.value(LoadSuccess(data: []));
  }

  @override
  Future<LoadResult<List<MediaModel>>> loadStudioContentsPage(
      {required int page,
      required int perPage,
      required String studioId,
      CancelToken? token}) {
    return Future.value(LoadSuccess(data: []));
  }

  @override
  Future<LoadResult<List<CharacterAndMediaConnection>>>
      loadVoiceActorContentsPage(
          {required int page,
          required int perPage,
          required String staffId,
          required MediaSort mediaSort,
          CancelToken? token}) {
    return Future.value(LoadSuccess(data: []));
  }

  @override
  Future<LoadResult<List<MediaModel>>> refreshMoviesPage(
      {required DateTime startDateGreater,
      required DateTime endDateLesser,
      required bool isAdult,
      CancelToken? token}) {
    return Future.value(LoadSuccess(data: []));
  }

  @override
  Future<LoadResult<void>> refreshAiringSchedule(DateTime now,
      {int dayAgo = 0, int dayAfter = 0, CancelToken? token}) async {
    return LoadSuccess(data: []);
  }

  @override
  Future<LoadResult<void>> startFetchDetailAnimeInfo(
      {required String id, CancelToken? token}) async {
    return LoadSuccess(data: []);
  }

  @override
  Future<LoadResult<void>> startFetchDetailCharacterInfo(
      {required String id, CancelToken? token}) async {
    return LoadSuccess(data: null);
  }

  @override
  Future<LoadResult<void>> startFetchDetailStaffInfo(
      {required String id, CancelToken? token}) async {
    return LoadSuccess(data: null);
  }

  @override
  Future<LoadResult<void>> startFetchDetailStudioInfo(
      {required String id, required CancelToken token}) async {
    return LoadSuccess(data: null);
  }

  @override
  Future<MediaModel> getMedia(String id) {
    return Future.value(MediaModel());
  }
}
