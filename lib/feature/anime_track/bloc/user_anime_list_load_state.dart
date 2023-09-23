
import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:equatable/equatable.dart';

sealed class UserAnimeLoadState extends Equatable {
  const UserAnimeLoadState();
  @override
  List<Object?> get props => [];
}

class UserAnimeInitState extends UserAnimeLoadState {
  const UserAnimeInitState();
}

class UserAnimeNoUser extends UserAnimeLoadState {
  const UserAnimeNoUser();
}

class UserAnimeLoaded extends UserAnimeLoadState {
  final List<AnimeListItemModel> watchingAnimeList;

  const UserAnimeLoaded({required this.watchingAnimeList});

  @override
  List<Object?> get props => [watchingAnimeList];
}
