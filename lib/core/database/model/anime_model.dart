import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/network/model/short_network_anime_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_model.freezed.dart';

part 'anime_model.g.dart';

@freezed
class AnimeModel with _$AnimeModel {
  factory AnimeModel({
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
  }) = _AnimeModel;

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$$_AnimeModelFromJson(json);

  static AnimeModel fromNetworkModel(ShortNetworkAnime model) => AnimeModel(
        id: model.id.toString(),
        englishTitle: model.title?.english ?? '',
        romajiTitle: model.title?.romaji ?? '',
        nativeTitle: model.title?.native ?? '',
        coverImage: model.coverImage['medium'] ?? '',
        coverImageColor: model.coverImage['color'] ?? '',
      );
}
