// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuzzy_date_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FuzzyDateDtoImpl _$$FuzzyDateDtoImplFromJson(Map<String, dynamic> json) =>
    _$FuzzyDateDtoImpl(
      year: (json['year'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      day: (json['day'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FuzzyDateDtoImplToJson(_$FuzzyDateDtoImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
    };
