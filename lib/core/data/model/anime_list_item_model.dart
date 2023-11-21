import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/database/model/media_list_entity.dart';
import 'package:aniflow/core/database/model/relations/media_list_and_media_relation.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_list_item_model.freezed.dart';

@freezed
class MediaListItemModel with _$MediaListItemModel {
  factory MediaListItemModel({
    @Default('') String id,
    MediaListStatus? status,
    int? score,
    int? updatedAt,
    int? progress,
    MediaModel? animeModel,
  }) = _MediaListItemModel;

  static MediaListItemModel fromRelation(MediaListAndMediaRelation model) {
    return MediaListItemModel.fromEntity(model.mediaListEntity).copyWith(
      animeModel: MediaModel.fromDatabaseModel(model.mediaEntity),
    );
  }

  static MediaListItemModel fromEntity(MediaListEntity entity) {
    return MediaListItemModel(
      id: entity.id,
      status: entity.status,
      score: entity.score,
      progress: entity.progress,
      updatedAt: entity.updatedAt,
    );
  }

  static MediaListItemModel fromDto(MediaListDto dto) {
    final entity = MediaListAndMediaRelation.fromDto(dto);
    return MediaListItemModel.fromRelation(entity);
  }
}

extension MediaListItemModelState on MediaListItemModel? {
  String get stateString {
    if (this == null) {
      return '';
    }

    switch (this!.status!) {
      case MediaListStatus.current:
        return 'Tracking';
      case MediaListStatus.completed:
        return 'Completed';
      case MediaListStatus.dropped:
        return 'Dropped';
      case MediaListStatus.paused:
        return 'Paused';
      case MediaListStatus.planning:
        return 'Planning';
    }
  }

  IconData get statusIcon {
    if (this == null) {
      return Icons.add;
    }

    switch (this!.status!) {
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