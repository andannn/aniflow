// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ani_list_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AniListSettingsImpl _$$AniListSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$AniListSettingsImpl(
      displayAdultContent: json['display_adult_content_key'] as bool? ?? false,
      userTitleLanguage: json['user_title_language_key'] == null
          ? UserTitleLanguage.native
          : UserTitleLanguage.fromJson(
              json['user_title_language_key'] as String),
      userStaffNameLanguage: $enumDecodeNullable(
              _$UserStaffNameLanguageEnumMap, json['userStaffNameLanguage']) ??
          UserStaffNameLanguage.native,
    );

Map<String, dynamic> _$$AniListSettingsImplToJson(
        _$AniListSettingsImpl instance) =>
    <String, dynamic>{
      'display_adult_content_key': instance.displayAdultContent,
      'user_title_language_key': instance.userTitleLanguage,
      'userStaffNameLanguage': instance.userStaffNameLanguage,
    };

const _$UserStaffNameLanguageEnumMap = {
  UserStaffNameLanguage.romajiWestern: 'ROMAJI_WESTERN',
  UserStaffNameLanguage.romaji: 'ROMAJI',
  UserStaffNameLanguage.native: 'NATIVE',
};
