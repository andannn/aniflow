import 'package:aniflow/core/common/definitions/media_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/database/relations/media_list_and_media_relation.dart';

extension MediaListItemModelEx on MediaListItemModel {
  bool get hasNextReleasingEpisode {
    return _hasNextReleasingEpisode(
      type: animeModel!.type.toJson(),
      status: (animeModel!.status ?? MediaStatus.finished).toJson(),
      progress: progress!,
      nextAiringEpisode: animeModel!.nextAiringEpisode,
      episodes: animeModel!.episodes,
    );
  }
}

extension MediaListAndMediaRelationEx on MediaListAndMediaRelation {
  bool get hasNextReleasingEpisode {
    return _hasNextReleasingEpisode(
      type: mediaEntity.type ?? '',
      status: mediaEntity.status ?? '',
      progress: mediaListEntity.progress ?? 0,
      nextAiringEpisode: mediaEntity.nextAiringEpisode,
      episodes: mediaEntity.episodes,
    );
  }
}

bool _hasNextReleasingEpisode(
    {required String type,
    required String status,
    int? nextAiringEpisode,
    required int progress,
    int? episodes}) {
  if (type == MediaType.manga.toJson()) {
    /// manga has no nextAiringEpisode information.
    /// simply we can regard that manga always have next episode, even if
    /// the reading episode large than current episode.
    return true;
  }

  final mediaStatus = MediaStatus.fromJson(status);
  switch (mediaStatus) {
    case MediaStatus.cancelled:
    case MediaStatus.hiatus:
    case MediaStatus.releasing:
      if (nextAiringEpisode == null) {
        // ignore: lines_longer_than_80_chars
        /// sometimes, there is no nextAiringEpisode in server but status is still releasing.
        /// just return true if have next episode to watch.
        return progress < (episodes ?? 1);
      } else {
        return progress < nextAiringEpisode - 1;
      }
    case MediaStatus.finished:
      return progress < (episodes ?? 1);
    case MediaStatus.notYetReleased:
    case null:
      return false;
  }
}
