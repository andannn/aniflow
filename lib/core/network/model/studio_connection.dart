import 'package:aniflow/core/network/model/page_info.dart';
import 'package:aniflow/core/network/model/studio_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'studio_connection.freezed.dart';

part 'studio_connection.g.dart';

@freezed
class StudioConnection with _$StudioConnection {
  factory StudioConnection({
    @JsonKey(name: 'pageInfo') PageInfo? pageInfo,
    @Default([]) @JsonKey(name: 'nodes') List<StudioDto> nodes,
  }) = _StudioConnection;

  factory StudioConnection.fromJson(Map<String, dynamic> json) =>
      _$$StudioConnectionImplFromJson(json);
}
