import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';

extension AnimeListItemModelEx on AnimeListItemModel {
  bool get hasNextReleasingEpisode {
    final status = animeModel!.status;
    switch (status) {
      case AnimeStatus.releasing:
        final nextAiringEpisode = animeModel!.nextAiringEpisode ?? 0;
        return progress! < nextAiringEpisode - 1;
      case AnimeStatus.finished:
        return progress! < animeModel!.episodes!;
      case AnimeStatus.notYetReleased:
      case null:
        return false;
    }
  }
}
