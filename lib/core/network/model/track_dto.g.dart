// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackDtoImpl _$$TrackDtoImplFromJson(Map<String, dynamic> json) =>
    _$TrackDtoImpl(
      file: json['file'] as String? ?? "",
      label: json['label'] as String? ?? "",
      kind: json['kind'] as String? ?? "",
      isDefault: json['default'] as bool? ?? false,
    );

Map<String, dynamic> _$$TrackDtoImplToJson(_$TrackDtoImpl instance) =>
    <String, dynamic>{
      'file': instance.file,
      'label': instance.label,
      'kind': instance.kind,
      'default': instance.isDefault,
    };
