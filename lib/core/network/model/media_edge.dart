import 'package:aniflow/core/common/model/media_relation.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_edge.freezed.dart';

part 'media_edge.g.dart';

@freezed
class MediaEdge with _$MediaEdge {
  factory MediaEdge({
    @Default(MediaRelation.other)
    @JsonKey(name: 'relationType')
    MediaRelation relationType,
    @JsonKey(name: 'node') MediaDto? media,
  }) = _MediaEdge;

  factory MediaEdge.fromJson(Map<String, dynamic> json) =>
      _$$MediaEdgeImplFromJson(json);
}
