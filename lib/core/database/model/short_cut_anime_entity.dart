import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/network/model/short_anime_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'short_cut_anime_entity.g.dart';

part 'short_cut_anime_entity.freezed.dart';

@freezed
class ShortcutAnimeEntity with _$ShortcutAnimeEntity {
  factory ShortcutAnimeEntity({
    @Default('') @JsonKey(name: AnimeTableColumns.id) String id,
    @Default('')
    @JsonKey(name: AnimeTableColumns.englishTitle)
    String englishTitle,
    @Default('')
    @JsonKey(name: AnimeTableColumns.romajiTitle)
    String romajiTitle,
    @Default('')
    @JsonKey(name: AnimeTableColumns.nativeTitle)
    String nativeTitle,
    @Default('') @JsonKey(name: AnimeTableColumns.coverImage) String coverImage,
    @Default('')
    @JsonKey(name: AnimeTableColumns.coverImageColor)
    String coverImageColor,
  }) = _ShortcutAnimeEntity;

  factory ShortcutAnimeEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ShortcutAnimeEntityFromJson(json);

  static ShortcutAnimeEntity fromNetworkModel(ShortcutAnimeDto model) =>
      ShortcutAnimeEntity(
        id: model.id.toString(),
        englishTitle: model.title?.english ?? '',
        romajiTitle: model.title?.romaji ?? '',
        nativeTitle: model.title?.native ?? '',
        coverImage: model.coverImage['large'] ?? '',
        coverImageColor: model.coverImage['color'] ?? '',
      );
}
