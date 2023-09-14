import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/network/model/detail_anime_dto.dart';
import 'package:anime_tracker/core/network/model/short_anime_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_entity.freezed.dart';

part 'anime_entity.g.dart';

@freezed
class AnimeEntity with _$AnimeEntity {
  factory AnimeEntity({
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
    @Default('')
    @JsonKey(name: AnimeTableColumns.description)
    String description,
    @Default('') @JsonKey(name: AnimeTableColumns.source) String source,
    @Default('')
    @JsonKey(name: AnimeTableColumns.bannerImage)
    String bannerImage,
    @Default(-1)
    @JsonKey(name: AnimeTableColumns.averageScore)
    int averageScore,
    @Default(-1) @JsonKey(name: AnimeTableColumns.trending) int trending,
    @Default(-1) @JsonKey(name: AnimeTableColumns.favourites) int favourites,
  }) = _AnimeEntity;

  factory AnimeEntity.fromJson(Map<String, dynamic> json) =>
      _$$_AnimeEntityFromJson(json);

  static AnimeEntity fromShortNetworkModel(ShortcutAnimeDto model) =>
      AnimeEntity(
        id: model.id.toString(),
        englishTitle: model.title?.english ?? '',
        romajiTitle: model.title?.romaji ?? '',
        nativeTitle: model.title?.native ?? '',
        coverImage: model.coverImage['large'] ?? '',
        coverImageColor: model.coverImage['color'] ?? '',
      );

  static AnimeEntity fromDetailNetworkModel(DetailAnimeDto model) =>
      AnimeEntity(
        id: model.id.toString(),
        englishTitle: model.title?.english ?? '',
        romajiTitle: model.title?.romaji ?? '',
        nativeTitle: model.title?.native ?? '',
        coverImage: model.coverImage['large'] ?? '',
        coverImageColor: model.coverImage['color'] ?? '',
        description: model.description,
        source: model.source,
        bannerImage: model.bannerImage,
        averageScore: model.averageScore,
        trending: model.trending,
        favourites: model.favourites,
      );
}
