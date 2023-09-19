import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:anime_tracker/core/network/model/short_info_node.dart';

part 'character_edge.freezed.dart';
part 'character_edge.g.dart';

@freezed
class CharacterEdge with _$CharacterEdge {
  factory CharacterEdge({
    @JsonKey(name: 'role') CharacterRole? role,
    @JsonKey(name: 'node') ShortInfoNode? characterEdge,
    @Default([]) @JsonKey(name: 'voiceActors') List<ShortInfoNode> voiceActors,
  }) = _CharacterEdge;

  factory CharacterEdge.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterEdgeFromJson(json);
}
