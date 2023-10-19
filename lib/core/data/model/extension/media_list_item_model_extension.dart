import 'package:anime_tracker/core/common/model/media_status.dart';
import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';

extension MediaListItemModelEx on MediaListItemModel {
  bool get hasNextReleasingEpisode {
    final status = animeModel!.status;
    switch (status) {
      case MediaStatus.releasing:
        final nextAiringEpisode = animeModel!.nextAiringEpisode;
        if (nextAiringEpisode == null) {
          // ignore: lines_longer_than_80_chars
          /// sometimes, there is no nextAiringEpisode in server but status is still releasing.
          /// just return true if have next episode to watch.
          return progress! < animeModel!.episodes!;
        } else {
          return progress! < nextAiringEpisode - 1;
        }
      case MediaStatus.finished:
        return progress! < animeModel!.episodes!;
      case MediaStatus.notYetReleased:
      case null:
        return false;
    }
  }
}
