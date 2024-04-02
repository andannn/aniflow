import 'package:aniflow/core/common/definitions/media_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';

extension MediaListItemModelEx on MediaListItemModel {
  bool get hasNextReleasingEpisode {
    if (animeModel?.type == MediaType.manga) {
      /// manga has no nextAiringEpisode information.
      /// simply we can regard that manga always have next episode, even if
      /// the reading episode large than current episode.
      return true;
    }

    final status = animeModel?.status;
    switch (status) {
      case MediaStatus.cancelled:
      case MediaStatus.hiatus:
      case MediaStatus.releasing:
        final nextAiringEpisode = animeModel!.nextAiringEpisode;
        if (nextAiringEpisode == null) {
          // ignore: lines_longer_than_80_chars
          /// sometimes, there is no nextAiringEpisode in server but status is still releasing.
          /// just return true if have next episode to watch.
          return progress! < (animeModel!.episodes ?? 1);
        } else {
          return progress! < nextAiringEpisode - 1;
        }
      case MediaStatus.finished:
        return progress! < (animeModel!.episodes ?? 1);
      case MediaStatus.notYetReleased:
      case null:
        return false;
    }
  }
}
