import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/anime_track_item_entity.dart';

class UserAnimeListAndAnime {
  final AnimeTrackItemEntity userAnimeListEntity;
  final AnimeEntity animeEntity;

  UserAnimeListAndAnime(
      {required this.userAnimeListEntity, required this.animeEntity});
}
