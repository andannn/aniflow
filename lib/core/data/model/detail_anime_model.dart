import 'dart:convert';

import 'package:anime_tracker/core/data/model/anime_source.dart';
import 'package:anime_tracker/core/data/model/trailter_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/data/model/character_and_voice_actor_model.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/relations/anime_and_charaters_and_voice_actors.dart';

part 'detail_anime_model.freezed.dart';

@freezed
class DetailAnimeModel with _$DetailAnimeModel {
  factory DetailAnimeModel({
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
    int? ratedRank,
    int? popularRank,
    @Default([]) List<String> genres,
    int? episodes,
    @Default([]) List<CharacterAndVoiceActorModel> characterAndVoiceActors,
  }) = _DetailAnimeModel;

  static DetailAnimeModel fromDatabaseModel(AnimeEntity model) {
    return DetailAnimeModel(
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
      bannerImage: model.bannerImage,
      averageScore: model.averageScore,
      favourites: model.favourites,
      season: model.season,
      seasonYear: model.seasonYear,
      episodes: model.episodes,
      ratedRank: model.ratedRanking,
      popularRank: model.popularRanking,
      genres: model.genres != null
          ? (jsonDecode(model.genres!) as List<dynamic>?)
                  ?.map((e) => e)
                  .whereType<String>()
                  .toList() ??
              const []
          : const [],
      trailerModel: TrailerModel(
        id: model.trailerId,
        site: model.trailerSite,
        thumbnail: model.trailerThumbnail,
      ),
    );
  }

  static DetailAnimeModel fromAnimeCharactersAndVoiceActors(
    AnimeCharactersAndVoiceActors model,
  ) {
    return DetailAnimeModel.fromDatabaseModel(
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
