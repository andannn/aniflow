import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
import 'package:aniflow/core/network/model/media_edge.dart';
import 'package:equatable/equatable.dart';

class MediaAndRelationTypeEntity extends Equatable {
  const MediaAndRelationTypeEntity({this.mediaRelation, required this.media});

  final String? mediaRelation;
  final MediaEntity media;

  @override
  List<Object?> get props => [mediaRelation, media];

  static MediaAndRelationTypeEntity fromDto(MediaEdge edge) {
    return MediaAndRelationTypeEntity(
      mediaRelation: edge.relationType.toJson(),
      media: edge.media!.toEntity(),
    );
  }
}
