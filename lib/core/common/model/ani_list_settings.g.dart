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
      userStaffNameLanguage: $enumDecodeNullable(_$UserStaffNameLanguageEnumMap,
              json['user_staff_name_language_key']) ??
          UserStaffNameLanguage.native,
      scoreFormat: json['score_format_key'] == null
          ? ScoreFormat.point100
          : ScoreFormat.fromJson(json['score_format_key'] as String),
    );

Map<String, dynamic> _$$AniListSettingsImplToJson(
        _$AniListSettingsImpl instance) =>
    <String, dynamic>{
      'display_adult_content_key': instance.displayAdultContent,
      'user_title_language_key': instance.userTitleLanguage,
      'user_staff_name_language_key': instance.userStaffNameLanguage,
      'score_format_key': instance.scoreFormat,
    };

const _$UserStaffNameLanguageEnumMap = {
  UserStaffNameLanguage.romajiWestern: 'ROMAJI_WESTERN',
  UserStaffNameLanguage.romaji: 'ROMAJI',
  UserStaffNameLanguage.native: 'NATIVE',
};
