import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/database/model/short_cut_anime_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shortcut_anime_model.freezed.dart';

@freezed
class ShortcutAnimeModel with _$ShortcutAnimeModel {
  factory ShortcutAnimeModel({
    @Default('') String id,
    AnimeTitle? title,
    @Default('') String coverImage,
    @Default('') String coverImageColor,
  }) = _ShortcutAnimeModel;

  static ShortcutAnimeModel fromDatabaseModel(ShortcutAnimeEntity model) => ShortcutAnimeModel(
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
