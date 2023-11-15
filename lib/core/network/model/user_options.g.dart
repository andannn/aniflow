// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserOptions _$$_UserOptionsFromJson(Map<String, dynamic> json) =>
    _$_UserOptions(
      titleLanguage: json['titleLanguage'] == null
          ? null
          : UserTitleLanguage.fromJson(json['titleLanguage'] as String),
      displayAdultContent: json['displayAdultContent'] as bool? ?? false,
      airingNotifications: json['airingNotifications'] as bool? ?? false,
      profileColor: json['profileColor'] as String?,
      activityMergeTime: json['activityMergeTime'] as int?,
    );

Map<String, dynamic> _$$_UserOptionsToJson(_$_UserOptions instance) =>
    <String, dynamic>{
      'titleLanguage': instance.titleLanguage,
      'displayAdultContent': instance.displayAdultContent,
      'airingNotifications': instance.airingNotifications,
      'profileColor': instance.profileColor,
      'activityMergeTime': instance.activityMergeTime,
    };
