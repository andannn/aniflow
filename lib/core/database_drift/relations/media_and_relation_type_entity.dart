import 'package:aniflow/core/database_drift/aniflow_database.dart';
import 'package:equatable/equatable.dart';

class MediaAndRelationTypeEntity extends Equatable {
  const MediaAndRelationTypeEntity({this.mediaRelation, required this.media});

  final String? mediaRelation;
  final MediaEntity media;

  @override
  List<Object?> get props => [mediaRelation, media];

  // static MediaRelationEntity fromDto(MediaEdge edge) {
  //   return MediaRelationEntity(
  //     edge.relationType,
  //     MediaEntity.fromNetworkModel(edge.media!),
  //   );
  // }
}
