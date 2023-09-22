import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/user_anime_list_entity.dart';

class UserAnimeListAndAnime {
  final UserAnimeListEntity userAnimeListEntity;
  final AnimeEntity animeEntity;

  UserAnimeListAndAnime(
      {required this.userAnimeListEntity, required this.animeEntity});
}
