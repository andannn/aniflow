import 'package:anime_tracker/core/database/model/media_entity.dart';
import 'package:anime_tracker/core/database/model/media_list_entity.dart';

class MediaListAndMediaRelation {
  final MediaListEntity mediaListEntity;
  final MediaEntity mediaEntity;

  MediaListAndMediaRelation(
      {required this.mediaListEntity, required this.mediaEntity});
}