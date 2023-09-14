import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'short_anime_model.freezed.dart';

@freezed
class ShortAnimeModel with _$ShortAnimeModel {
  factory ShortAnimeModel({
    @Default('') String id,
    AnimeTitle? title,
    @Default('') String coverImage,
    @Default('') String coverImageColor,
  }) = _ShortAnimeModel;

  static ShortAnimeModel fromDatabaseModel(AnimeEntity model) => ShortAnimeModel(
    id: model.id,
    title: AnimeTitle(
      english: model.englishTitle,
      romaji: model.romajiTitle,
      native: model.nativeTitle
    ),
    coverImage: model.coverImage,
    coverImageColor: model.coverImageColor
  );
}
