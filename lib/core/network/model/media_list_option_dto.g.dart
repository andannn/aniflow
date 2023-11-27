// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_list_option_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaListOptionDtoImpl _$$MediaListOptionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaListOptionDtoImpl(
      scoreFormat: json['scoreFormat'] == null
          ? null
          : ScoreFormat.fromJson(json['scoreFormat'] as String),
    );

Map<String, dynamic> _$$MediaListOptionDtoImplToJson(
        _$MediaListOptionDtoImpl instance) =>
    <String, dynamic>{
      'scoreFormat': instance.scoreFormat,
    };
