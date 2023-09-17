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
    String? source,
    String? bannerImage,
    int? averageScore,
    int? trending,
    int? favourites,
    @Default([]) List<CharacterAndVoiceActorModel> characterAndVoiceActors,
  }) = _DetailAnimeModel;

  static DetailAnimeModel fromDatabaseModel(AnimeEntity model) =>
      DetailAnimeModel(
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
        trending: model.trending,
        favourites: model.favourites,
      );

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
