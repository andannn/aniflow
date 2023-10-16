import 'dart:async';

import 'package:anime_tracker/core/common/util/global_static_constants.dart';
import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/media_information_repository.dart';
import 'package:anime_tracker/core/data/model/character_and_voice_actor_model.dart';
import 'package:anime_tracker/feature/common/page_loading_state.dart';
import 'package:anime_tracker/feature/common/paging_bloc.dart';

class CharacterPageBloc extends PagingBloc<CharacterAndVoiceActorModel> {
  CharacterPageBloc(
    this.animeId, {
    required MediaInformationRepository aniListRepository,
  })  : _mediaInfoRepository = aniListRepository,
        super(const PageLoading(data: [], page: 1));

  final String animeId;
  final MediaInformationRepository _mediaInfoRepository;

  @override
  Future<bool> createLoadPageTask({required int page}) async {
    final LoadResult result =
        await _mediaInfoRepository.loadCharacterPageByAnimeId(
      animeId: animeId,
      loadType: Append(page: page, perPage: Config.defaultPerPageCount),
    );
    switch (result) {
      case LoadSuccess<List<CharacterAndVoiceActorModel>>(data: final data):
        add(OnPageLoadedEvent(data, page));
        return true;
      case LoadError<List<CharacterAndVoiceActorModel>>(
          exception: final exception
        ):
        add(OnPageErrorEvent(exception));
        return false;
      default:
        return false;
    }
  }
}
