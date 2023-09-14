import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_anime_model.freezed.dart';

@freezed
class DetailAnimeModel with _$DetailAnimeModel {
  factory DetailAnimeModel({
    @Default('') String id,
    AnimeTitle? title,
    @Default('') String coverImage,
    @Default('') String coverImageColor,
    @Default('') String description,
    @Default('') String source,
    @Default('') String bannerImage,
    @Default(-1) int averageScore,
    @Default(-1) int trending,
    @Default(-1) int favourites,
  }) = _DetailAnimeModel;

  static DetailAnimeModel fromDatabaseModel(AnimeEntity model) =>
      DetailAnimeModel(
        id: model.id,
        title: AnimeTitle(
            english: model.englishTitle,
            romaji: model.romajiTitle,
            native: model.nativeTitle),
        coverImage: model.coverImage,
        coverImageColor: model.coverImageColor,
      );
}
