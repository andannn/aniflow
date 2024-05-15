// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_staff_statics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStaffStaticsDtoImpl _$$UserStaffStaticsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserStaffStaticsDtoImpl(
      count: (json['count'] as num?)?.toInt(),
      meanScore: (json['meanScore'] as num?)?.toDouble(),
      minutesWatched: (json['minutesWatched'] as num?)?.toInt(),
      chaptersRead: (json['chaptersRead'] as num?)?.toInt(),
      mediaIds: (json['mediaIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      staff: json['staff'] == null
          ? null
          : StaffDto.fromJson(json['staff'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserStaffStaticsDtoImplToJson(
        _$UserStaffStaticsDtoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'meanScore': instance.meanScore,
      'minutesWatched': instance.minutesWatched,
      'chaptersRead': instance.chaptersRead,
      'mediaIds': instance.mediaIds,
      'staff': instance.staff,
    };
