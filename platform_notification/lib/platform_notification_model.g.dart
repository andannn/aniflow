// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      body: json['body'] as String?,
      notificationChannel: json['notification_channel'] == null
          ? null
          : PlatformNotificationChannelModel.fromJson(
              json['notification_channel'] as Map<String, dynamic>),
      pendingIntentUri: json['pending_intent_uri'] as String?,
      pendingIntentClass: json['pending_intent_class'] as String?,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'notification_channel': instance.notificationChannel,
      'pending_intent_uri': instance.pendingIntentUri,
      'pending_intent_class': instance.pendingIntentClass,
    };
