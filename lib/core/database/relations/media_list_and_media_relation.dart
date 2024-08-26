import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:equatable/equatable.dart';

class MediaListAndMediaRelation extends Equatable {
  final MediaListEntity? mediaListEntity;
  final MediaEntity mediaEntity;

  const MediaListAndMediaRelation(
      {required this.mediaListEntity, required this.mediaEntity});

  @override
  List<Object?> get props => [mediaEntity, mediaListEntity];
}
