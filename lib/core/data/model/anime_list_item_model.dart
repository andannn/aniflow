import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_list_item_model.freezed.dart';

@freezed
class MediaListItemModel with _$MediaListItemModel {
  factory MediaListItemModel({
    @Default('') String id,
    MediaListStatus? status,
    double? score,
    int? updatedAt,
    int? progress,
    int? progressVolumes,
    DateTime? startedAt,
    DateTime? completedAt,
    String? notes,
    int? repeat,
    @Default(false) bool private,
    MediaModel? animeModel,
  }) = _MediaListItemModel;

}

extension MediaListItemModelState on MediaListStatus {
  IconData get statusIcon {
    switch (this) {
      case MediaListStatus.current:
        return Icons.incomplete_circle;
      case MediaListStatus.completed:
        return Icons.task_alt_outlined;
      case MediaListStatus.dropped:
        return Icons.delete_forever_sharp;
      case MediaListStatus.paused:
        return Icons.connected_tv_sharp;
      case MediaListStatus.planning:
        return Icons.watch_later;
    }
  }
}
