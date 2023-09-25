import 'package:anime_tracker/core/data/repository/anime_track_list_repository.dart';

class MediaListMutationParam {
  MediaListMutationParam(
      { required this.mediaId, required this.progress, required this.status, required this.score, this.entryId});

  final int? entryId;
  final int mediaId;
  final int progress;
  final AnimeListStatus status;
  final int score;
}

String createSaveMediaListMotionGraphQLString(MediaListMutationParam param) {
  // final hasEntryId = param.entryId != null;
  return '''
mutation(\$id: Int, \$mediaId: Int, \$progress: Int, \$status: MediaListStatus, \$score: Float) {
  SaveMediaListEntry(id: \$id, mediaId: \$mediaId, progress: \$progress, status: \$status, score: \$score) {
    id
  }
}
  ''';
}
