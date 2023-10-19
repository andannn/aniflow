import 'package:aniflow/core/network/model/character_edge.dart';
import 'package:aniflow/core/network/model/page_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_connection.freezed.dart';
part 'character_connection.g.dart';

@freezed
class CharacterConnection with _$CharacterConnection {
  factory CharacterConnection({
    @JsonKey(name: 'pageInfo') PageInfo? pageInfo,
    @Default([]) @JsonKey(name: 'edges') List<CharacterEdge> edges,
  }) = _CharacterConnection;

  factory CharacterConnection.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterConnectionFromJson(json);
}
