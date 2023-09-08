import 'package:anime_tracker/core/data/model/shortcut_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/data/repository/load_type.dart';
import 'package:anime_tracker/feature/discover/bloc/discover_page_event.dart';
import 'package:anime_tracker/feature/discover/bloc/discover_ui_state.dart';
import 'package:bloc/bloc.dart';

import '../../../core/data/repository/userDataRepository.dart';
import '../../../util/anime_season_util.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverUiState> {
  DiscoverBloc(UserDataRepository userDataRepository, this._userDataRepository,
      this._aniListRepository)
      : super(DiscoverUiState()) {
    _init();
  }

  final UserDataRepository _userDataRepository;
  final AniListRepository _aniListRepository;

  void _init() async {
    /// calculate the current anime season.
    final AnimeSeasonParam currentAnimeSeasonParam =
        AnimeSeasonUtil.getAnimeSeasonByDataTime(DateTime.now());

    /// get the saved anime season.
    final savedAnimeSeasonParam = _userDataRepository.getAnimeSeasonParam();

    if (currentAnimeSeasonParam != savedAnimeSeasonParam) {
      // season changed.
      await _userDataRepository.setAnimeSeasonParam(currentAnimeSeasonParam);
    }

    /// request first page of Anime to show in home.
    final result = await Future.wait([
      createInitialLoadAnimePageTask(AnimeCategory.currentSeason),
      createInitialLoadAnimePageTask(AnimeCategory.nextSeason),
      createInitialLoadAnimePageTask(AnimeCategory.trending),
    ]);
  }

  Future createInitialLoadAnimePageTask(AnimeCategory category) async {
    _aniListRepository
        .getAnimePageByCategory(category: AnimeCategory.currentSeason, page: 1)
        .then((result) {
          switch (result) {
            case LoadSuccess<ShortcutAnimeModel>(data: final data):
            case LoadError<ShortcutAnimeModel>(exception: final exception):
          }
    });
  }
}
