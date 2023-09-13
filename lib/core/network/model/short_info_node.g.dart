// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_info_node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterNode _$$_CharacterNodeFromJson(Map<String, dynamic> json) =>
    _$_CharacterNode(
      id: json['id'] as int? ?? -1,
      image: (json['image'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      name: (json['name'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_CharacterNodeToJson(_$_CharacterNode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
    };
