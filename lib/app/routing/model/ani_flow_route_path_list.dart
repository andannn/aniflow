
import 'package:aniflow/app/routing/model/ani_flow_route_path.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ani_flow_route_path_list.freezed.dart';
part 'ani_flow_route_path_list.g.dart';

@freezed
class AniFlowRoutePathList with _$AniFlowRoutePathList {
  const factory AniFlowRoutePathList({
    required List<AniFlowRoutePath> list,
  }) = _AniFlowRoutePathList;

  factory AniFlowRoutePathList.fromJson(Map<String, dynamic> json) =>
      _$AniFlowRoutePathListFromJson(json);
}
