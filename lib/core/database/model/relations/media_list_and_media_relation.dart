import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/media_list_entity.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';

class MediaListAndMediaRelation {
  final MediaListEntity mediaListEntity;
  final MediaEntity mediaEntity;

  MediaListAndMediaRelation(
      {required this.mediaListEntity, required this.mediaEntity});

  static MediaListAndMediaRelation fromDto(MediaListDto dto) {
    return MediaListAndMediaRelation(
      mediaListEntity: MediaListEntity.fromNetworkModel(dto),
      mediaEntity: MediaEntity.fromNetworkModel(dto.media!),
    );
  }
}
