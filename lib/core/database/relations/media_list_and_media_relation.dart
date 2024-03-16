import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/mappers/media_list_mapper.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';
import 'package:equatable/equatable.dart';

class MediaListAndMedia extends Equatable {
  final MediaListEntity mediaListEntity;
  final MediaEntity mediaEntity;

  const MediaListAndMedia(
      {required this.mediaListEntity, required this.mediaEntity});

  @override
  List<Object?> get props => [mediaEntity, mediaListEntity];

  static MediaListAndMedia fromDto(MediaListDto dto) {
    return MediaListAndMedia(
      mediaListEntity: dto.toEntity(),
      mediaEntity: dto.media!.toEntity(),
    );
  }
}
