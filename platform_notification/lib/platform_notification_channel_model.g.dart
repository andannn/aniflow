// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_notification_channel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationChannelModelImpl _$$NotificationChannelModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationChannelModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      importance: (json['importance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NotificationChannelModelImplToJson(
        _$NotificationChannelModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'importance': instance.importance,
    };
