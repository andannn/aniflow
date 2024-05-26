// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ani_flow_route_path_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AniFlowRoutePathListImpl _$$AniFlowRoutePathListImplFromJson(
        Map<String, dynamic> json) =>
    _$AniFlowRoutePathListImpl(
      list: (json['list'] as List<dynamic>)
          .map((e) => AniFlowRoutePath.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AniFlowRoutePathListImplToJson(
        _$AniFlowRoutePathListImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
