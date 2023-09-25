import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';

extension AnimeListItemModelEx on AnimeListItemModel {
  bool get hasNextReleasingEpisode {
    final status = animeModel!.status;
    switch (status) {
      case AnimeStatus.releasing:
        final nextAiringEpisode = animeModel!.nextAiringEpisode;
        if (nextAiringEpisode == null) {
          /// sometimes, there is no nextAiringEpisode in server but status is still releasing.
          /// just return true if have next episode to watch.
          return progress! < animeModel!.episodes!;
        } else {
          return progress! < nextAiringEpisode - 1;
        }
      case AnimeStatus.finished:
        return progress! < animeModel!.episodes!;
      case AnimeStatus.notYetReleased:
      case null:
        return false;
    }
  }
}
