import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/network/model/fuzzy_date_input_dto.dart';

class MediaListMutationParam {
  MediaListMutationParam({
    required this.mediaId,
    this.progress,
    this.status,
    this.score,
    this.entryId,
    this.progressVolumes,
    this.repeat,
    this.private = false,
    this.notes,
    this.startedAt,
    this.completedAt,
  });

  final int? entryId;
  final int mediaId;
  final int? progress;
  final int? progressVolumes;
  final MediaListStatus? status;
  final int? score;
  final int? repeat;
  final bool private;
  final String? notes;
  final FuzzyDateInputDto? startedAt;
  final FuzzyDateInputDto? completedAt;
}

String get saveMediaListMotionGraphQLString => '''
mutation (\$id: Int, \$mediaId: Int, \$progress: Int, \$status: MediaListStatus, \$score: Float, \$progressVolumes: Int, \$repeat: Int, \$private: Boolean, \$notes: String, \$startedAt: FuzzyDateInput, \$completedAt: FuzzyDateInput) {
  SaveMediaListEntry(id: \$id, mediaId: \$mediaId, progress: \$progress, status: \$status, score: \$score, progressVolumes: \$progressVolumes, repeat: \$repeat, private: \$private, notes: \$notes, startedAt: \$startedAt, completedAt: \$completedAt) {
    id
    status
    score
    progress
    priority
    notes
    userId
    updatedAt
    progressVolumes
    repeat
    private
    notes
    startedAt {
      year
      month
      day
    }
    completedAt {
      year
      month
      day
    }
    media {
      id
    }
  }
}
''';
