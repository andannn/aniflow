import 'package:aniflow/core/common/definitions/media_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/core/database/relations/media_list_and_media_relation.dart';

extension MediaWithListModelEx on MediaWithListModel {
  bool get hasNextReleasedEpisode {
    return _haveNextReleasingEpisode(
      type: mediaModel.type.toJson(),
      status: (mediaModel.status ?? MediaStatus.finished).toJson(),
      progress: mediaListModel?.progress ?? 0,
      nextAiringEpisode: mediaModel.nextAiringEpisode,
      episodes: mediaModel.episodes,
    );
  }
}

extension MediaListAndMediaRelationEx on MediaListAndMediaRelation {
  bool get hasNextReleasingEpisode {
    return _haveNextReleasingEpisode(
      type: mediaEntity.type ?? '',
      status: mediaEntity.status ?? '',
      progress: mediaListEntity?.progress ?? 0,
      nextAiringEpisode: mediaEntity.nextAiringEpisode,
      episodes: mediaEntity.episodes,
    );
  }
}

bool haveNextEpisode(
  MediaModel? mediaModel,
  MediaListItemModel? mediaListModel,
) {
  if (mediaModel == null) {
    return false;
  }
  return _haveNextReleasingEpisode(
    type: mediaModel.type.toJson(),
    status: (mediaModel.status ?? MediaStatus.finished).toJson(),
    progress: mediaListModel?.progress ?? 0,
    nextAiringEpisode: mediaModel.nextAiringEpisode,
    episodes: mediaModel.episodes,
  );
}

bool _haveNextReleasingEpisode(
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
