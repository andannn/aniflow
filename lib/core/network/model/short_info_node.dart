import 'package:freezed_annotation/freezed_annotation.dart';

part 'short_info_node.freezed.dart';

part 'short_info_node.g.dart';

@freezed
class ShortInfoNode with _$ShortInfoNode {
  factory ShortInfoNode({
    @Default(-1) @JsonKey(name: 'id') int id,
    @Default({}) @JsonKey(name: 'image') Map<String, String> image,
    @Default({}) @JsonKey(name: 'name') Map<String, String> name,
  }) = _CharacterNode;

  factory ShortInfoNode.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterNodeFromJson(json);
}
