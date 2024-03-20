import 'dart:async';

import 'package:aniflow/core/common/definitions/staff_language.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/refresh_paging_bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class CharacterPagingBloc
    extends RefreshPagingBloc<CharacterAndVoiceActorModel> {
  CharacterPagingBloc(
    @factoryParam this.animeId,
    @factoryParam this.staffLanguage,
    this._mediaInfoRepository,
  ) : super(const PageInit(data: []));

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
          : Append(page: page, perPage: AfConfig.defaultPerPageCount),
      token: cancelToken,
    );
  }
}
