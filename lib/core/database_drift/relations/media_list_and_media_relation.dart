import 'package:aniflow/core/database_drift/aniflow_database.dart';
import 'package:equatable/equatable.dart';

class MediaListAndMedia extends Equatable {
  final MediaListEntity mediaListEntity;
  final MediaEntity mediaEntity;

  const MediaListAndMedia(
      {required this.mediaListEntity, required this.mediaEntity});

  @override
  List<Object?> get props => [mediaEntity, mediaListEntity];

// static MediaListAndMediaRelation fromDto(MediaListDto dto) {
//   return MediaListAndMediaRelation(
//     mediaListEntity: MediaListEntity.fromNetworkModel(dto),
//     mediaEntity: MediaEntity.fromNetworkModel(dto.media!),
//   );
// }
}
