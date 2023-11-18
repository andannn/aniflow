import 'dart:async';

import 'package:aniflow/core/common/model/staff_language.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/refresh_paging_bloc.dart';
import 'package:dio/dio.dart';

class CharacterPagingBloc extends RefreshPagingBloc<CharacterAndVoiceActorModel> {
  CharacterPagingBloc(
    this.animeId, this.staffLanguage, {
    required MediaInformationRepository aniListRepository,
  })  : _mediaInfoRepository = aniListRepository,
        super(const PageInit(data: []));

  final String animeId;
  final StaffLanguage staffLanguage;
  final MediaInformationRepository _mediaInfoRepository;

  @override
  Future<LoadResult<List<CharacterAndVoiceActorModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _mediaInfoRepository.loadCharacterPageByAnimeId(
      animeId: animeId,
      language: staffLanguage,
      loadType: isRefresh
          ? const Refresh()
          : Append(page: page, perPage: Config.defaultPerPageCount),
      token: cancelToken,
    );
  }
}
