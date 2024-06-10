// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuzzy_date_input_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FuzzyDateInputDtoImpl _$$FuzzyDateInputDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FuzzyDateInputDtoImpl(
      year: (json['year'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      day: (json['day'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FuzzyDateInputDtoImplToJson(
        _$FuzzyDateInputDtoImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
    };
