import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_rank.freezed.dart';

part 'anime_rank.g.dart';

@freezed
class AnimeRank with _$AnimeRank {
  factory AnimeRank({
    @JsonKey(name: 'rank') int? rank,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'allTime') bool? allTime,
  }) = _AnimeRank;

  factory AnimeRank.fromJson(Map<String, dynamic> json) =>
      _$$_AnimeRankFromJson(json);
}
