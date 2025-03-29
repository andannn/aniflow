// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchResultModelImpl _$$SearchResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchResultModelImpl(
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) =>
              SubjectWithEpisodesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: SearchTitle.fromJson(json['title'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchResultModelImplToJson(
        _$SearchResultModelImpl instance) =>
    <String, dynamic>{
      'subjects': instance.subjects,
      'title': instance.title,
    };
