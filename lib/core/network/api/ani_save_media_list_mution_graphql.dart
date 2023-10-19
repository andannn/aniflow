import 'package:anime_tracker/core/data/media_list_repository.dart';

class MediaListMutationParam {
  MediaListMutationParam(
      {required this.mediaId,
      this.progress,
      this.status,
      this.score,
      this.entryId});

  final int? entryId;
  final int mediaId;
  final int? progress;
  final MediaListStatus? status;
  final int? score;
}

String get saveMediaListMotionGraphQLString => '''
mutation(\$id: Int, \$mediaId: Int, \$progress: Int, \$status: MediaListStatus, \$score: Float) {
  SaveMediaListEntry(id: \$id, mediaId: \$mediaId, progress: \$progress, status: \$status, score: \$score) {
     id
     status
     score
     progress
     priority
     notes
     userId
     updatedAt
     media {
       id
     }
  }
}
  ''';
