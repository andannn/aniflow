// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_title.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchTitleImpl _$$SearchTitleImplFromJson(Map<String, dynamic> json) =>
    _$SearchTitleImpl(
      fullText: json['fullText'] as String,
      keyword:
          (json['keyword'] as List<dynamic>).map((e) => e as String).toSet(),
      locale: const LocaleConverter().fromJson(json['locale'] as String),
    );

Map<String, dynamic> _$$SearchTitleImplToJson(_$SearchTitleImpl instance) =>
    <String, dynamic>{
      'fullText': instance.fullText,
      'keyword': instance.keyword.toList(),
      'locale': const LocaleConverter().toJson(instance.locale),
    };
