
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:equatable/equatable.dart';

sealed class MediaListLoadState extends Equatable {
  const MediaListLoadState();
  @override
  List<Object?> get props => [];
}

class MediaStateInitState extends MediaListLoadState {
  const MediaStateInitState();
}

class MediaStateNoUser extends MediaListLoadState {
  const MediaStateNoUser();
}

class MediaStateLoaded extends MediaListLoadState {
  final List<MediaListItemModel> followingMediaList;

  const MediaStateLoaded({required this.followingMediaList});

  @override
  List<Object?> get props => [followingMediaList];
}
