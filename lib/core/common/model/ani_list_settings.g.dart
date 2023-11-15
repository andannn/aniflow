// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ani_list_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AniListSettings _$$_AniListSettingsFromJson(Map<String, dynamic> json) =>
    _$_AniListSettings(
      displayAdultContent: json['display_adult_content_key'] as bool? ?? false,
      userTitleLanguage: json['user_title_language_key'] == null
          ? UserTitleLanguage.native
          : UserTitleLanguage.fromJson(
              json['user_title_language_key'] as String),
    );

Map<String, dynamic> _$$_AniListSettingsToJson(_$_AniListSettings instance) =>
    <String, dynamic>{
      'display_adult_content_key': instance.displayAdultContent,
      'user_title_language_key': instance.userTitleLanguage,
    };
