import 'package:aniflow/core/common/definitions/media_list_status.dart';

class MediaListModifyResult {
  MediaListModifyResult({
    required this.score,
    required this.progress,
    required this.progressVolumes,
    required this.repeat,
    required this.status,
    required this.notes,
    required this.startedAt,
    required this.completedAt,
    this.private = false,
  });

  final double? score;
  final int? progress;
  final int? progressVolumes;
  final int? repeat;
  final MediaListStatus? status;
  final String? notes;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final bool private;
}
