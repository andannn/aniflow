import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:equatable/equatable.dart';

class MediaWithListModel extends Equatable {
  const MediaWithListModel({required this.mediaModel, this.mediaListModel});

  final MediaModel mediaModel;
  final MediaListItemModel? mediaListModel;

  @override
  List<Object?> get props => [mediaModel, mediaListModel];
}
