// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_staff_statics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserStaffStaticsDto _$UserStaffStaticsDtoFromJson(Map<String, dynamic> json) {
  return _UserStaffStaticsDto.fromJson(json);
}

/// @nodoc
mixin _$UserStaffStaticsDto {
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'meanScore')
  double? get meanScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'minutesWatched')
  int? get minutesWatched => throw _privateConstructorUsedError;
  @JsonKey(name: 'chaptersRead')
  int? get chaptersRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'mediaIds')
  List<int> get mediaIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'staff')
  StaffDto? get staff => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStaffStaticsDtoCopyWith<UserStaffStaticsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStaffStaticsDtoCopyWith<$Res> {
  factory $UserStaffStaticsDtoCopyWith(
          UserStaffStaticsDto value, $Res Function(UserStaffStaticsDto) then) =
      _$UserStaffStaticsDtoCopyWithImpl<$Res, UserStaffStaticsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'mediaIds') List<int> mediaIds,
      @JsonKey(name: 'staff') StaffDto? staff});

  $StaffDtoCopyWith<$Res>? get staff;
}

/// @nodoc
class _$UserStaffStaticsDtoCopyWithImpl<$Res, $Val extends UserStaffStaticsDto>
    implements $UserStaffStaticsDtoCopyWith<$Res> {
  _$UserStaffStaticsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? meanScore = freezed,
    Object? minutesWatched = freezed,
    Object? chaptersRead = freezed,
    Object? mediaIds = null,
    Object? staff = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      meanScore: freezed == meanScore
          ? _value.meanScore
          : meanScore // ignore: cast_nullable_to_non_nullable
              as double?,
      minutesWatched: freezed == minutesWatched
          ? _value.minutesWatched
          : minutesWatched // ignore: cast_nullable_to_non_nullable
              as int?,
      chaptersRead: freezed == chaptersRead
          ? _value.chaptersRead
          : chaptersRead // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaIds: null == mediaIds
          ? _value.mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      staff: freezed == staff
          ? _value.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as StaffDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StaffDtoCopyWith<$Res>? get staff {
    if (_value.staff == null) {
      return null;
    }

    return $StaffDtoCopyWith<$Res>(_value.staff!, (value) {
      return _then(_value.copyWith(staff: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserStaffStaticsDtoImplCopyWith<$Res>
    implements $UserStaffStaticsDtoCopyWith<$Res> {
  factory _$$UserStaffStaticsDtoImplCopyWith(_$UserStaffStaticsDtoImpl value,
          $Res Function(_$UserStaffStaticsDtoImpl) then) =
      __$$UserStaffStaticsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'meanScore') double? meanScore,
      @JsonKey(name: 'minutesWatched') int? minutesWatched,
      @JsonKey(name: 'chaptersRead') int? chaptersRead,
      @JsonKey(name: 'mediaIds') List<int> mediaIds,
      @JsonKey(name: 'staff') StaffDto? staff});

  @override
  $StaffDtoCopyWith<$Res>? get staff;
}

/// @nodoc
class __$$UserStaffStaticsDtoImplCopyWithImpl<$Res>
    extends _$UserStaffStaticsDtoCopyWithImpl<$Res, _$UserStaffStaticsDtoImpl>
    implements _$$UserStaffStaticsDtoImplCopyWith<$Res> {
  __$$UserStaffStaticsDtoImplCopyWithImpl(_$UserStaffStaticsDtoImpl _value,
      $Res Function(_$UserStaffStaticsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? meanScore = freezed,
    Object? minutesWatched = freezed,
    Object? chaptersRead = freezed,
    Object? mediaIds = null,
    Object? staff = freezed,
  }) {
    return _then(_$UserStaffStaticsDtoImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      meanScore: freezed == meanScore
          ? _value.meanScore
          : meanScore // ignore: cast_nullable_to_non_nullable
              as double?,
      minutesWatched: freezed == minutesWatched
          ? _value.minutesWatched
          : minutesWatched // ignore: cast_nullable_to_non_nullable
              as int?,
      chaptersRead: freezed == chaptersRead
          ? _value.chaptersRead
          : chaptersRead // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaIds: null == mediaIds
          ? _value._mediaIds
          : mediaIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      staff: freezed == staff
          ? _value.staff
          : staff // ignore: cast_nullable_to_non_nullable
              as StaffDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStaffStaticsDtoImpl implements _UserStaffStaticsDto {
  const _$UserStaffStaticsDtoImpl(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'meanScore') this.meanScore,
      @JsonKey(name: 'minutesWatched') this.minutesWatched,
      @JsonKey(name: 'chaptersRead') this.chaptersRead,
      @JsonKey(name: 'mediaIds') final List<int> mediaIds = const [],
      @JsonKey(name: 'staff') this.staff})
      : _mediaIds = mediaIds;

  factory _$UserStaffStaticsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStaffStaticsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int? count;
  @override
  @JsonKey(name: 'meanScore')
  final double? meanScore;
  @override
  @JsonKey(name: 'minutesWatched')
  final int? minutesWatched;
  @override
  @JsonKey(name: 'chaptersRead')
  final int? chaptersRead;
  final List<int> _mediaIds;
  @override
  @JsonKey(name: 'mediaIds')
  List<int> get mediaIds {
    if (_mediaIds is EqualUnmodifiableListView) return _mediaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaIds);
  }

  @override
  @JsonKey(name: 'staff')
  final StaffDto? staff;

  @override
  String toString() {
    return 'UserStaffStaticsDto(count: $count, meanScore: $meanScore, minutesWatched: $minutesWatched, chaptersRead: $chaptersRead, mediaIds: $mediaIds, staff: $staff)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStaffStaticsDtoImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.meanScore, meanScore) ||
                other.meanScore == meanScore) &&
            (identical(other.minutesWatched, minutesWatched) ||
                other.minutesWatched == minutesWatched) &&
            (identical(other.chaptersRead, chaptersRead) ||
                other.chaptersRead == chaptersRead) &&
            const DeepCollectionEquality().equals(other._mediaIds, _mediaIds) &&
            (identical(other.staff, staff) || other.staff == staff));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, meanScore, minutesWatched,
      chaptersRead, const DeepCollectionEquality().hash(_mediaIds), staff);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStaffStaticsDtoImplCopyWith<_$UserStaffStaticsDtoImpl> get copyWith =>
      __$$UserStaffStaticsDtoImplCopyWithImpl<_$UserStaffStaticsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStaffStaticsDtoImplToJson(
      this,
    );
  }
}

abstract class _UserStaffStaticsDto implements UserStaffStaticsDto {
  const factory _UserStaffStaticsDto(
          {@JsonKey(name: 'count') final int? count,
          @JsonKey(name: 'meanScore') final double? meanScore,
          @JsonKey(name: 'minutesWatched') final int? minutesWatched,
          @JsonKey(name: 'chaptersRead') final int? chaptersRead,
          @JsonKey(name: 'mediaIds') final List<int> mediaIds,
          @JsonKey(name: 'staff') final StaffDto? staff}) =
      _$UserStaffStaticsDtoImpl;

  factory _UserStaffStaticsDto.fromJson(Map<String, dynamic> json) =
      _$UserStaffStaticsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(name: 'meanScore')
  double? get meanScore;
  @override
  @JsonKey(name: 'minutesWatched')
  int? get minutesWatched;
  @override
  @JsonKey(name: 'chaptersRead')
  int? get chaptersRead;
  @override
  @JsonKey(name: 'mediaIds')
  List<int> get mediaIds;
  @override
  @JsonKey(name: 'staff')
  StaffDto? get staff;
  @override
  @JsonKey(ignore: true)
  _$$UserStaffStaticsDtoImplCopyWith<_$UserStaffStaticsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
