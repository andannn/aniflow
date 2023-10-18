import 'dart:async';

import 'package:anime_tracker/core/common/util/global_static_constants.dart';
import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/media_information_repository.dart';
import 'package:anime_tracker/core/data/model/character_and_voice_actor_model.dart';
import 'package:anime_tracker/feature/common/page_loading_state.dart';
import 'package:anime_tracker/feature/common/paging_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterPageBloc extends PagingBloc<CharacterAndVoiceActorModel> {
  CharacterPageBloc(
    this.animeId, {
    required MediaInformationRepository aniListRepository,
  })  : _mediaInfoRepository = aniListRepository,
        super(const PageInit(data: []));

  final String animeId;
  final MediaInformationRepository _mediaInfoRepository;

  @override
  Future<LoadResult<List<CharacterAndVoiceActorModel>>> loadPage(
      {required int page}) {
    return _mediaInfoRepository.loadCharacterPageByAnimeId(
      animeId: animeId,
      loadType: Append(page: page, perPage: Config.defaultPerPageCount),
    );
  }

  @override
  FutureOr<void> onInit(OnInit<CharacterAndVoiceActorModel> event,
      Emitter<PagingState<List<CharacterAndVoiceActorModel>>> emit) {
    emit(const PageLoading(data: [], page: 1));

    /// launch event to get first page data.
    unawaited(createLoadPageTask(page: 1));
  }
}
