import 'package:aniflow/core/network/model/media_edge.dart';
import 'package:aniflow/core/network/model/page_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_connection.freezed.dart';

part 'media_connection.g.dart';

@freezed
class MediaConnection with _$MediaConnection {
  factory MediaConnection({
    @JsonKey(name: 'pageInfo') PageInfo? pageInfo,
    @Default([]) @JsonKey(name: 'edges') List<MediaEdge> edges,
  }) = _MediaConnection;

  factory MediaConnection.fromJson(Map<String, dynamic> json) =>
      _$$_MediaConnectionFromJson(json);
}
