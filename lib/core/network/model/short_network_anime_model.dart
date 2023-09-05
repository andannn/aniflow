import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/anime_title_modle.dart';

part 'short_network_anime_model.g.dart';

part 'short_network_anime_model.freezed.dart';

@freezed
class ShortNetworkAnime with _$ShortNetworkAnime {
  factory ShortNetworkAnime({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'title') AnimeTitle? title,
    @Default({}) @JsonKey(name: 'coverImage') Map<String, String> coverImage,
  }) = _ShortNetworkAnime;

  factory ShortNetworkAnime.fromJson(Map<String, dynamic> json) =>
      _$$_ShortNetworkAnimeFromJson(json);
}
