import 'dart:convert';

import 'package:anime_tracker/core/data/model/anime_source.dart';
import 'package:anime_tracker/core/data/model/trailter_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/data/model/character_and_voice_actor_model.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/relations/anime_and_charaters_and_voice_actors.dart';

part 'anime_model.freezed.dart';

@freezed
class AnimeModel with _$AnimeModel {
  factory AnimeModel({
    @Default('') String id,
    AnimeTitle? title,
    @Default('') String coverImage,
    @Default('') String coverImageColor,
    String? description,
    AnimeSource? source,
    String? bannerImage,
    int? averageScore,
    int? favourites,
    TrailerModel? trailerModel,
    int? seasonYear,
    AnimeSeason? season,
    AnimeStatus? status,
    int? ratedRank,
    int? popularRank,
    @Default([]) List<String> genres,
    int? episodes,
    int? timeUntilAiring,
    int? nextAiringEpisode,
    @Default(false) bool isFollowing,
    @Default([]) List<CharacterAndVoiceActorModel> characterAndVoiceActors,
  }) = _DetailAnimeModel;

  static AnimeModel fromDatabaseModel(AnimeEntity model) {
    return AnimeModel(
      id: model.id,
      title: AnimeTitle(
        english: model.englishTitle,
        romaji: model.romajiTitle,
        native: model.nativeTitle,
      ),
      coverImage: model.coverImage,
      coverImageColor: model.coverImageColor,
      description: model.description,
      source: model.source,
      status: model.status,
      bannerImage: model.bannerImage,
      averageScore: model.averageScore,
      favourites: model.favourites,
      season: model.season,
      seasonYear: model.seasonYear,
      episodes: model.episodes,
      ratedRank: model.ratedRanking,
      popularRank: model.popularRanking,
      nextAiringEpisode: model.nextAiringEpisode,
      timeUntilAiring: model.timeUntilAiring,
      genres: model.genres != null
          ? (jsonDecode(model.genres!) as List<dynamic>?)
                  ?.map((e) => e)
                  .whereType<String>()
                  .toList() ??
              const []
          : const [],
      trailerModel: model.trailerId != null
          ? TrailerModel(
              id: model.trailerId,
              site: model.trailerSite,
              thumbnail: model.trailerThumbnail,
            )
          : null,
    );
  }

  static AnimeModel fromAnimeCharactersAndVoiceActors(
    AnimeCharactersAndVoiceActors model,
  ) {
    return AnimeModel.fromDatabaseModel(
      model.animeEntity,
    ).copyWith(
      characterAndVoiceActors: model.characterAndVoiceActors
          .map(
            (e) => CharacterAndVoiceActorModel.fromDatabaseEntity(e),
          )
          .toList(),
    );
  }
}
